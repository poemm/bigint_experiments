
#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef unsigned __int128 uint128_t;


// these consts can be defined here or as arguments to the compiler, or hard-code them here before including bignum.h
/*
#define BIGINT_BITS=256
#define LIMB_BITS=uint32_t
#define LIMB_BITS_OVERFLOW=uint64_t
*/

#include "bigint.h"

#define NUM_LIMBS (BIGINT_BITS/LIMB_BITS)


// hex string to byte array conversion
// input is string of hex characters, without 0x prefix
// also converts to little endian (ie least significant nibble first)
void hexstr_to_bytearray(char* in, uint8_t* out){
  //printf("hexstr_to_intarray(%s)\n",in);
  size_t len = strlen(in);
  uint8_t byte = 0;
  uint8_t nibble = 0;
  int i;
  for (i=len-1; i>=0 ;i--){
    nibble = in[i];
    if (nibble >= '0' && nibble <= '9') nibble = nibble - '0';
    else if (nibble >= 'a' && nibble <='f') nibble = nibble - 'a' + 10;
    else if (nibble >= 'A' && nibble <='F') nibble = nibble - 'A' + 10;
    else printf("ERROR: %s is not hex string.\n",in);
    if (!((i+len%2)%2)) {
      byte = (nibble<<4) + byte;
      *(out+(len-i)/2-1) = byte;
      byte=0;
    }
    else byte = nibble;
  }
  if (byte) 
    *(out+(len-i)/2-1) = byte;
}



void montgomery_multiplication_256(uint64_t* x, uint64_t* y, uint64_t* m, uint64_t* inv, uint64_t* out){
   uint64_t A[] = {0,0,0,0,0,0,0,0};
   for (int i=0; i<4; i++){
     uint64_t ui = (A[i]+x[i]*y[0])*inv[0];
     uint64_t carry = 0;
     //uint64_t overcarry = 0;
     for (int j=0; j<4; j++){
       uint128_t xiyj = (uint128_t)x[i]*y[j];
       uint128_t uimj = (uint128_t)ui*m[j];
       uint128_t partial_sum = xiyj+carry+A[i+j];
       uint128_t sum = uimj+partial_sum;
       A[i+j] = (uint64_t)sum;
       carry = sum>>64;
       // if there was overflow in the sum beyond the carry bits
       if (sum<partial_sum){
         int k=2;
         while ( i+j+k<8 && A[i+j+k]==0xffffffffffffffff ){
           A[i+j+k]=0;
           k++;
         }
         if (i+j+k<8)
           A[i+j+k]+=1;
       }
     }
     A[i+4]+=carry;
   }

   // instead of right shift, we just get the correct values
   out[0] = A[4];
   out[1] = A[5];
   out[2] = A[6];
   out[3] = A[7];

   // final subtraction, first see if necessary
   // this out <= m check is untested
   int out_ge_m = 1;
   for (int i=3;i>=0;i--){
     if (out[i] < m[i]){
       out_ge_m=0;
       break;
     }
     else if (out[i]>m[i])
       break;
   }

   if (out_ge_m){
      // subtract 256 for x>=y, this is algorithm 14.9
      // this subtraction is untested
      uint64_t carry=0;
      for (int i=0; i<4;i++){
        uint64_t temp = out[i]-carry;
        carry = (temp<m[i] || out[i]<carry) ? 1:0;
        out[i] = temp-m[i];
      }
    }
}


// algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void montgomery_multiplication_384(uint64_t* restrict x, uint64_t* restrict y, uint64_t* restrict m, uint64_t* restrict inv, uint64_t* restrict out){
  uint64_t A[12] = {0};
  //#pragma unroll      // this unroll increases binary size by a lot
  for (int i=0; i<6; i++){
    uint64_t ui = (A[i]+x[i]*y[0])*inv[0];
    uint64_t carry = 0;
    #pragma unroll
    for (int j=0; j<6; j++){
      uint128_t xiyj = (uint128_t)x[i]*y[j];
      uint128_t uimj = (uint128_t)ui*m[j];
      uint128_t partial_sum = xiyj+carry+A[i+j];
      uint128_t sum = uimj+partial_sum;
      A[i+j] = (uint64_t)sum;
      carry = sum>>LIMB_BITS;
      // if there was overflow in the sum beyond the carry:
      if (sum<partial_sum){
        int k=2;
        while ( i+j+k<12 && A[i+j+k]==(uint64_t)0-1 ){ // note 0-1 is 0xffffffff
          A[i+j+k]=0;
          k++;
        }
        if (i+j+k<12)
          A[i+j+k]+=1;
      }
      //printf("%d %d %llu %llu %llu %llu %llu %llu %llu %llu %llu\n",i,j,x[i],x[i]*y[0],ui,xiyj,uimj,partial_sum,sum,A[i+j],carry);
    }
    A[i+6]+=carry;
  }

  // instead of right shift, we just get the correct values
  #pragma unroll
  for (int i=0; i<6;i++)
    out[i] = A[i+6];

  // final subtraction, first see if necessary
  int out_ge_m = 1;
  for (int i=5;i>=0;i--){
    if (out[i] < m[i]){
      out_ge_m=0;
      break;
    }
    else if (out[i]>m[i])
      break;
  }

  if (out_ge_m){
    // subtract 256 for x>=y, this is algorithm 14.9
    // this subtraction is untested
    uint64_t carry=0;
    for (int i=0; i<6;i++){
      uint64_t temp = out[i]-carry;
      carry = (temp<m[i] || out[i]<carry) ? 1:0;
      out[i] = temp-m[i];
    }
  }
}


/* this is the original code
void montgomery_multiplication_256_orig(uint64_t* x, uint64_t* y, uint64_t* m, uint64_t* inv, uint64_t* out){
   uint64_t A[] = {0,0,0,0,0,0,0,0};
   for (int i=0; i<4; i++){
     uint64_t ui = (A[i]+x[i]*y[0])*inv[0];
     uint64_t carry = 0;
     //uint64_t overcarry = 0;
     for (int j=0; j<4; j++){
       uint128_t xiyj = (uint128_t)x[i]*y[j];
       uint128_t uimj = (uint128_t)ui*m[j];
       uint128_t partial_sum = xiyj+carry;
       uint128_t sum = uimj+A[i+j]+partial_sum;
       A[i+j] = (uint64_t)sum;
       carry = sum>>64;
       // if there was overflow in the sum beyond the carry bits
       if (sum<partial_sum){
         int k=2;
         while ( i+j+k<8 && A[i+j+k]==0xffffffffffffffff ){
           A[i+j+k]=0;
           k++;
         }
         if (i+j+k<8)
           A[i+j+k]+=1;
       }
     }
     A[i+4]+=carry;
   }

   // instead of right shift, we just get the correct values
   out[0] = A[4];
   out[1] = A[5];
   out[2] = A[6];
   out[3] = A[7];

   // final subtraction, first see if necessary
   // this out <= m check is untested
   int out_ge_m = 1;
   for (int i=0;i<4;i++){
     if (out[4-i-1] < m[4-i-1]){
       out_ge_m=0;
       break;
     }
     else if (out[4-i-1]>m[4-i-1])
       break;
   }

   if (out_ge_m){
      // subtract 256 for x>=y, this is algorithm 14.9
      // this subtraction is untested
      uint64_t c=0;
      for (int i=0; i<4;i++){
        uint64_t temp = out[i]-c;
        out[i] = temp-m[i];
        c = (temp<m[i] || out[i]<c) ? 1:0;
	// bad, bug here is fixed above
        //uint64_t temp = out[i]-m[i]-c;
        //if (out[i]>=m[i]+c)
        //  c=0;
        //else
        //  c=1;
        //out[i]=temp;
      }
    }
    //std::cout << "montgomery_multiplication_256 end." << std::endl;
}
*/

int main(int argc, char** argv){

  if (argc!=6){
    printf("ERROR: args must be as follows\n");
    printf("./a.out 0x<hex of x> 0x<hex of y> 0x<hex of mod> 0x<hex of modinv>\n");
    return -1;
  }

  UINT x[NUM_LIMBS], y[NUM_LIMBS], m[NUM_LIMBS], inv[NUM_LIMBS], expected[NUM_LIMBS], out[NUM_LIMBS], out_expected[NUM_LIMBS];

  // parse limbs from command line args
  hexstr_to_bytearray(argv[1]+2,(uint8_t*)x);
  hexstr_to_bytearray(argv[2]+2,(uint8_t*)y);
  hexstr_to_bytearray(argv[3]+2,(uint8_t*)m);
  hexstr_to_bytearray(argv[4]+2,(uint8_t*)inv);
  hexstr_to_bytearray(argv[5]+2,(uint8_t*)out_expected);

// flip this to do testing or benching
#if 1
  montgomery_multiplication_256(x, y, m, inv, out);
  for (int i=0; i<NUM_LIMBS; i++){
    if (out[i]!=out_expected[i]){
      printf("ERROR: expected vs actual output:\n");
      for (int i=0; i<NUM_LIMBS; i++)
        printf("0x%x, ",out_expected[i]);
      printf("\n");
      for (int i=0; i<NUM_LIMBS; i++)
        printf("0x%x, ",out[i]);
      printf("\n");
      break;
    }
  }
  // the tester
  FUNCNAME(montmul)(x,y,m,inv,out);
  for (int i=0; i<NUM_LIMBS; i++){
    if (out[i]!=out_expected[i]){
      printf("FAILED\n");
    }
  }
  for (int i=0; i<NUM_LIMBS; i++){
    if (out[i]!=out_expected[i]){
      printf("ERROR: expected vs actual output:\n");
      for (int i=0; i<NUM_LIMBS; i++)
        printf("%x ",out_expected[i]);
      printf("\n");
      for (int i=0; i<NUM_LIMBS; i++)
        printf("%x ",out[i]);
      printf("\n");
      break;
    }
  }
#else
  // the bencher, this will take a while
  for (int i=0;i<20000;i++){
    FUNCNAME(montmul)(x,y,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);

    FUNCNAME(montmul)(x,y,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);

    FUNCNAME(montmul)(x,y,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);

    FUNCNAME(montmul)(x,y,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
    FUNCNAME(montmul)(x,out,m,inv,out);
    FUNCNAME(montmul)(out,y,m,inv,out);
  }
#endif

  return 0;
}
