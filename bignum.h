
#if !WASM
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#endif

/*
This library requires two parameters:
BIGINT_BITS - the number of bits of the big integer
LIMB_BITS - the number of bits in each limb

To use this library, define a limb size and include it:
  #define BIGINT_BITS 256
  #define LIMB_BITS 64
  #define LIMB_BITS_OVERFLOW 128
  #include "bignum.h"
  #undef BIGINT_BITS
  #undef LIMB_BITS
  #undef LIMB_BITS_OVERFLOW

  #define BIGINT_BITS 512
  #define LIMB_BITS 32
  #define LIMB_BITS_OVERFLOW 64
  #include "bignum.h"
  #undef BIGINT_BITS
  #undef LIMB_BITS
  #undef LIMB_BITS_OVERFLOW

Now you can use functions like:
  montmul256_64bitlimbs(x,y,m,inv,out);
  subtract512_32bitlimbs(a,b,out);

Warning: LIMB_BITS corresponds to the uint*_t type, and multiplication requires double the bits, for example 64 bit limbs require type uint128_t.

*/


// Define constants used in this file:

// define types UINT and UNT2, where UINT2 is for overflow of operations on UINT; for multiplication should be double the number of bits
// UINT is the limb type, uint*_t where * is the number of bits per limb
// UINT2 is also needed for multiplication UINTxUINT->UINT2, e.g. uint32_txuint32_t->uint64_t or uint64_txuint64_t->uint128_t
#define TYPE_(num) uint##num##_t
#define TYPE(num) TYPE_(num)
#define UINT TYPE(LIMB_BITS)
#define UINT2 TYPE(LIMB_BITS_OVERFLOW)

// define N to be the number of limbs
// eg UINT=uint32_t with N=8 limbs is for 256-bit
// eg UINT=uint64_t with N=8 limbs is for 512-bit
#define N BIGINT_BITS/LIMB_BITS

// define the function name, use concatenation
// eg BIGINT_BITS=256, LIMB_BITS=64: FUNCNAME(myname) is replaced with myname256_64bitlimbs
#define FUNCNAME__(name,A,B) name##A##_##B##bitlimbs
#define FUNCNAME_(name,A,B) FUNCNAME__(name,A,B)
#define FUNCNAME(name) FUNCNAME_(name,BIGINT_BITS,LIMB_BITS)


// add two numbers modulo the precision of N limbs
// algorithm 14.7, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
//   except we ignore the final carry in step 3 since we assume that there is no extra limb
void FUNCNAME(add)(UINT* restrict x, UINT* restrict y, UINT* restrict out){
  UINT carry=0;
  #pragma unroll
  for (int i=0; i<N;i++){
    UINT temp = x[i]+y[i]+carry;
    carry = x[i]>=temp ? 1:0;
    out[i]=temp;
  }
}

// compute x-y for x>=y
// algorithm 14.9, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void FUNCNAME(subtract)(UINT* restrict x, UINT* restrict y, UINT* restrict out){
  //printf("subtract()\n");
  UINT carry=0;
  #pragma unroll
  for (int i=0; i<N;i++){
    UINT temp = x[i]-carry-y[i];
    carry = temp>x[i] ? 1:0;
    out[i]=temp;
  }
}

// checks whether x<y
// TODO: reference spec of this algorithm
UINT FUNCNAME(less_than)(UINT* restrict x, UINT* restrict y){
  for (int i=N-1;i>=0;i--){
    if (x[i]>y[i])
      return 0;
    else if (x[i]<y[i])
      return 1;
  }
  // they are equal
  return 0;
}

// checks whether x<=y
// N is number of limbs
// TODO: reference spec of this algorithm
UINT FUNCNAME(less_than_or_equal)(UINT* restrict x, UINT* restrict y){
  for (int i=N-1;i>=0;i--){
    if (x[i]>y[i])
      return 0;
    else if (x[i]<y[i])
      return 1;
  }
  // they are equal
  return 1;
}


// algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void FUNCNAME(montmul)(UINT* restrict x, UINT* restrict y, UINT* restrict m, UINT* restrict inv, UINT* restrict out){
  UINT A[N*2] = {0};
  //#pragma unroll	// this unroll increases binary size by a lot
  for (int i=0; i<N; i++){
    UINT ui = (A[i]+x[i]*y[0])*inv[0];
    UINT carry = 0;
    #pragma unroll
    for (int j=0; j<N; j++){
      UINT2 xiyj = (UINT2)x[i]*y[j];
      UINT2 uimj = (UINT2)ui*m[j];
      UINT2 partial_sum = xiyj+carry+A[i+j];
      UINT2 sum = uimj+partial_sum;
      A[i+j] = (UINT)sum;
      carry = sum>>LIMB_BITS;
      // if there was overflow in the sum beyond the carry:
      if (sum<partial_sum){
        int k=2;
        while ( i+j+k<N*2 && A[i+j+k]==(UINT)0-1 ){ // note 0-1 is 0xffffffff
          A[i+j+k]=0;
          k++;
        }
        if (i+j+k<N*2)
          A[i+j+k]+=1;
      }
      //printf("%d %d %llu %llu %llu %llu %llu %llu %llu %llu %llu\n",i,j,x[i],x[i]*y[0],ui,xiyj,uimj,partial_sum,sum,A[i+j],carry);
    }
    A[i+N]+=carry;
  }

  // instead of right shift, we just get the correct values
  //#pragma unroll
  for (int i=0; i<N;i++)
    out[i] = A[i+N];

  // final subtraction, first see if necessary
  if (FUNCNAME(less_than_or_equal)(m,out)){
    FUNCNAME(subtract)(out, m, out);
  }
}

