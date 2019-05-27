
#include <cstdint>
#include <cstdio>
#include <cstring>


typedef unsigned __int128 uint128_t;

// add two numbers modulo the precision of N limbs
// algorithm 14.7, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
//   except we ignore the final carry in step 3 since we assume that there is no extra limb
template <typename UINT, int N>
inline void add(UINT* x, UINT* y, UINT* out){
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
template <typename UINT, int N>
inline void subtract(UINT* x, UINT* y, UINT* out){
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
template <typename UINT, int N>
inline bool less_than(UINT* x, UINT* y){
  for (int i=N-1;i>=0;i--){
    if (x[i]>y[i])
      return false;
    else if (x[i]<y[i])
      return true;
  }
  // they are equal
  return false;
}

// checks whether x<=y
// N is number of limbs
// TODO: reference spec of this algorithm
template <typename UINT, int N>
inline bool less_than_or_equal(UINT* x, UINT* y){
  for (int i=N-1;i>=0;i--){
    if (x[i]>y[i])
      return false;
    else if (x[i]<y[i])
      return true;
  }
  // they are equal
  return true;
}


// algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// N is number of limbs
// UINT1 is the limb type
// UINT2 allows multiplication carry UINT1xUINT1->UINT2, e.g. uint32_txuint32_t->uint64_t or uint64_txuint64_t->uint128_t
// eg UINT1=uint32_t with N=8 limbs is for 256-bit
// eg UINT1=uint64_t with N=8 limbs is for 512-bit
template <typename UINT1, typename UINT2, int N>
void montgomery_multiplication(UINT1* x, UINT1* y, UINT1* m, UINT1* inv, UINT1* out){
  UINT1 A[N*2] = {0};
  #pragma unroll
  for (int i=0; i<N; i++){
    UINT1 ui = (A[i]+x[i]*y[0])*inv[0];
    UINT1 carry = 0;
    #pragma unroll
    for (int j=0; j<N; j++){
      UINT2 xiyj = (UINT2)x[i]*y[j];
      UINT2 uimj = (UINT2)ui*m[j];
      UINT2 partial_sum = xiyj+carry+A[i+j];
      UINT2 sum = uimj+partial_sum;
      A[i+j] = (UINT1)sum;
      carry = sum>>32;
      // if there was overflow in the sum beyond the carry:
      if (sum<partial_sum){
        int k=2;
        while ( i+j+k<N*2 && A[i+j+k]==(UINT1)0-1 ){ // note 0-1 is 0xffffffff
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
  #pragma unroll
  for (int i=0; i<N;i++)
    out[i] = A[i+N];

  // final subtraction, first see if necessary
  if (less_than_or_equal<UINT1,N>(m,out)){
    subtract<UINT1,N>(out, m, out);
  }
}

