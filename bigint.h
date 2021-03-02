#ifndef BIGINT_H
#define BIGINT_H

/*
This header-only library has one optional parameters:
NUM_LIMBS - optional, the number of limbs in the big integer

Note: we use uint64_t for limbs and uint128_t for overflow, can change below.

eg NUM_LIMBS 8 limbs is for 256-bit
eg NUM_LIMBS 8 limbs is for 512-bit

To hard-code a bitlength (useful for compiler optimizations like loop unrolling):
  #define NUM_LIMBS 4
  #include "bigint.h"
  #undef NUM_LIMBS 
Now you can call functions like: mulmodmont256_64bitlimbs(out,x,y,m,inv);
You can repeat the above for other hard-coded sizes.
 
Otherwise, `#include "bigint.h"` creates a global variable NUM_LIMBS which must be set by the user, eg NUM_LIMBS=4 for 256-bit values and 64-bit limbs


Warning: LIMB_BITS corresponds to the uint*_t type, and multiplication requires double the bits, for example 64-bit limbs require type uint128_t, which may be unavailable on some targets like Wasm.
*/



//////////////////////
// macros an variables based on whether we have hard-coded number of limbs
#ifdef NUM_LIMBS
#else
extern int NUM_LIMBS;
#endif



////////////////
// integer types
// e.g. uint64_t and uint128_t
// flip this flag to 0 if you don't want to include stdint.h
#if 1
  #include <stdint.h>
#else
  typedef unsigned char uint8_t;
  typedef unsigned short uint16_t;
  typedef unsigned int uint32_t;
  typedef unsigned long long uint64_t;
  typedef unsigned __int128 uint128_t;
#endif
#define uint128_t __uint128_t







// add two numbers using two's complement for overflow, returning an overflow bit
// algorithm 14.7, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
//   except we ignore the final carry in step 3 since we assume that there is no extra limb
uint64_t biginth_add(uint64_t* const out, const uint64_t* const x, const uint64_t* const y){
  uint64_t c=0;
  #ifdef UNROLL
    #pragma unroll
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t temp = x[i]+c;
    out[i] = temp+y[i];
    c = (temp<c || out[i]<temp) ? 1:0;
  }
  return c;
}

// algorithm 14.9, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// the book says it computes x-y for x>=y, but actually it computes the 2's complement for x<y
// note: algorithm 14.9 allow adding c=-1, but we just subtract c=1 instead
uint64_t biginth_sub(uint64_t* const out, const uint64_t* const x, const uint64_t* const y){
  uint64_t c=0;
  #ifdef UNROLL
    #pragma unroll
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t temp = x[i]-c;
    c = (temp<y[i] || x[i]<c) ? 1:0;
    out[i] = temp-y[i];
  }
  return c;
}


// checks whether x<y
uint8_t biginth_less_than(const uint64_t* const x, const uint64_t* const y){
  for (int i=NUM_LIMBS-1;i>=0;i--){
    if (x[i]>y[i])
      return 0;
    else if (x[i]<y[i])
      return 1;
  }
  // they are equal
  return 0;
}


// checks whether x<=y
uint8_t biginth_less_than_or_equal(const uint64_t* const x, const uint64_t* const y){
  for (int i=NUM_LIMBS-1;i>=0;i--){
    if (x[i]>y[i])
      return 0;
    else if (x[i]<y[i])
      return 1;
  }
  // they are equal
  return 1;
}


// checks whether x!=0
uint64_t biginth_is_nonzero(uint64_t* x){
  uint64_t temp = 0;
  #ifdef UNROLL
    #pragma unroll
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    temp |= x[i];
  }
  return temp;
}


// shifts a bigint number right by 1, preserving two's comlement signedness
int biginth_right_shift_arithmetic_1(uint64_t* a){
  // first limb gets arithmetic shift, so save it
  uint64_t bottom_bit_to_top_bit = (a[NUM_LIMBS-1]>>63)<<63;
  #ifdef UNROLL
    #pragma unroll
  #endif
  for (int i=NUM_LIMBS-1;i>=0;i--){
    uint64_t temp = a[i];
    a[i]>>=1;
    a[i]^=bottom_bit_to_top_bit;
    bottom_bit_to_top_bit = temp<<63;
  }
}


// computes quotient x/y and remainder x%y
// algorithm 14.20, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// it works, but the implementation is naive, see notes
// y = q*x + r
void biginth_div(uint64_t* const q, uint64_t* const r, const uint64_t* const x, const uint64_t* const y){

  for (int i=0; i<NUM_LIMBS; i++){
    q[i]=0;
  }

  // book has n and t given, we compute these
  int n = 0;  // idx of first significant("nonzero") limbs of x
  int t = 0;  // n minus the idx of first significant limb of y
  for (int i=NUM_LIMBS-1;i>=0;i--){
    if (x[i] != 0) { n=i; break; }
  }
  for (int i=n;i>=0;i--){
    if (y[i] != 0) { t=n-i; break; }
  }

  // not in the textbook
  // special case for y=1, this hack is needed for now
  if( n-t==0 && y[0]==1 ){
    for (int i=0;i<NUM_LIMBS;i++){
      r[i]=0;
      q[i]=x[i];
    }
    return;
  }

  // save input x from getting clobbered below
  // note that x_ it will end up as remainder
  uint64_t *x_ = r;
  for (int i=0; i<NUM_LIMBS; i++){
    x_[i]=x[i];
  }

  /* WIP
  // step 1 in book
  for (int j=0;j<n-t;j++)
    q[i]=0;

  // step 2 in book
  // first get y*b^{n-t} by shifting y up by n-t limbs
  uint64_t y_n_t[NUM_LIMBS];
  for (int i=NUM_LIMBS;i>t;i--)
    y_n_t[i] = 0;
  for (int i=t;i>n-t;i--)
    y_n_t[i] = y[i+n-t];
  for (int i=n-t;i>=0;i--)
    y_n_t[i] = 0;
  // now the while subtract loop
  while (biginth_less_than_or_equal(y_n_t,x)){
    q[n-t]+=1;
    biginth_sub(x_,x,y_n_t);
  }

  // step 3 in book
  // TODO
  */



  // THIS IS A NAIVE IMPLEMENTATION OF WHAT IS IN THE BOOK
  // naive loop: while( y<x_ ) { q++; x_=x_-y }

  // leq = (y<x_)
  uint64_t leq = 1;
  for (int i=n;i>=0;i--){
    if (y[i]>x_[i]){ leq = 0; break;}
    else if (y[i]<x_[i]){ leq = 1; break;}
  }

  while (leq){

    // q = q + 1
    for(int i=0;i<=n;i++){
      q[i]+=1;
      if(q[i]!=0)
	break;
    }

    // x_ = x_ - y
    uint64_t c=0;
    for (int i=0; i<=n; i++){
      uint64_t temp = x_[i]-c;
      c = (temp<y[i] || x_[i]<c) ? 1:0;
      x_[i] = temp-y[i];
    }

    // leq = (y<x_)
    for (int i=n;i>=0;i--){
      if (y[i]>x_[i]){ leq = 0; break;}
      else if (y[i]<x_[i]){ leq = 1; break;}
    }

  }

}




// algorithm 14.12, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// but assume they both have the same number of limbs, this can be changed
// out should have double the number of limbs as the inputs
// num_limbs corresponds to n+1 in the book
void biginth_mul(uint64_t* const out, const uint64_t* const x, const uint64_t* const y){
  uint64_t w[NUM_LIMBS*2];
  for (int i=0; i<2*NUM_LIMBS; i++)
    w[i]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t c = 0;
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=0; j<NUM_LIMBS; j++){
      uint128_t uv = (uint128_t)w[i+j] + (uint128_t)x[j]*y[i];
      uv += c;
      uint128_t u = uv >> 64;
      uint64_t v = (uint64_t)uv;
      w[i+j] = v;
      c = (uint64_t)u;
    }
    w[i+NUM_LIMBS] = c;
  }
  for (int i=0; i< 2*NUM_LIMBS; i++)
    out[i]=w[i];
}


// algorithm 14.16, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// NUM_LIMBS is t (number of limbs) in the book, and the base is uint64_t*, usually uint32_t or uint64_t
// output out should have double the limbs of input x
void biginth_square(uint64_t* const out, const uint64_t* const x){
  uint64_t w[NUM_LIMBS*2];
  for (int i=0; i< 2*NUM_LIMBS; i++)
    w[i]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint128_t uv = (uint128_t)(x[i])*x[i] + w[2*i];
    uint64_t u = (uint64_t)(uv >> 64);	// / base
    uint64_t v = (uint64_t)uv;			// % base
    w[2*i] = v;
    uint64_t c = u;
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=i+1; j<NUM_LIMBS; j++){
      uint128_t xixj = (uint128_t)(x[i])*x[j];
      uint128_t partial_sum = xixj + c + w[i+j];
      uv = xixj + partial_sum;
      u = (uint64_t)(uv >> 64);	// / base
      v = (uint64_t)uv;			// % base
      w[i+j] = v;
      c = u;
      // may have more overflow, so keep carrying
      // this passes sume tests, but needs review
      if (uv<partial_sum){
        int k=2;
        while ( i+j+k<NUM_LIMBS*2 && w[i+j+k]==(uint64_t)0-1 ){ // note 0-1 is 0xffffffff
          w[i+j+k]=0;
          k++;
        }
        if (i+j+k<NUM_LIMBS*2)
          w[i+j+k]+=1;
      }
    }
    // this passes some tests, but not sure if += is correct
    w[i+NUM_LIMBS] += u;
  }
  for (int i=0; i< 2*NUM_LIMBS; i++)
    out[i]=w[i];
}



////////////////////////
// Modular arithmetic //
////////////////////////


// compute a+b (mod m), where x,y < m
// algorithm 14.27, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void biginth_addmod(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m){
  uint64_t carry = biginth_add(out,x,y);
  // In textbook 14.27, says addmod is add and an extra step: subtract m iff x+y>=m
  if (carry || biginth_less_than_or_equal(m,out)){
    biginth_sub(out, out, m);
  }
  // note: we don't consider the case x+y-m>m. Because, for our crypto application, we assume x,y<m.
}

// compute x-y (mod m) for x,y < m
// uses fact 14.27, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void biginth_submod(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m){
  uint64_t c = biginth_sub(out,x,y);
  // if c, then x<y, so result is negative, need to get it's magnitude and subtract it from m 
  if (c){
    biginth_add(out, m, out);		// add m to overflow back
  }
  // note: we don't consider the case x-y>m. Because, for our crypto application, we assume x,y<m.
}


// returns (aR * bR) % m, where aR and bR are in Montgomery form
// algorithm 14.32, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// T has 2*NUM_LIMBS limbs, otherwise pad most significant bits with zeros
void biginth_montreduce(uint64_t* const out, const uint64_t* const T, const uint64_t* const m, const uint64_t inv){

  uint64_t A[NUM_LIMBS*2+1];
  for (int i=0; i<2*NUM_LIMBS; i++)
    A[i] = T[i];
  A[NUM_LIMBS*2]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t ui = A[i]*inv;
    uint64_t carry=0;
    int j;
    // add ui*m*b^i to A in a loop, since m is NUM_LIMBS long
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (j=0; j<NUM_LIMBS; j++){
      uint128_t sum = (uint128_t)ui*m[j] + A[i+j] + carry;
      A[i+j] = (uint64_t)sum;		// % b;
      carry = (uint64_t)(sum >> 64);	// / b
    }
    // carry may be nonzero, so keep carrying
    int k=0;
    while (carry && i+j+k<2*NUM_LIMBS+1){
      uint128_t sum = (uint128_t)(A[i+j+k])+carry;
      A[i+j+k] = (uint64_t)sum;		// % b
      carry = (uint64_t)(sum >> 64);	// / b
      k+=1;
    }
  }

  // instead of right shift, we just get the correct values
  for (int i=0; i<NUM_LIMBS; i++)
    out[i] = A[i+NUM_LIMBS];

  // final subtraction, first see if necessary
  if (A[NUM_LIMBS*2] || biginth_less_than_or_equal(m,out)){
    biginth_sub(out, out, m);
  }
}

// algorithm 14.16 followed by 14.32
// this might be faster than algorithm 14.36, as described in remark 14.40
void biginth_montsquare(uint64_t* const out, const uint64_t* const x, const uint64_t* const m, const uint64_t inv){
  uint64_t out_internal[NUM_LIMBS*2];
  biginth_square(out_internal, x);
  biginth_montreduce(out, out_internal, m, inv);
}

// algorithm 14.12 followed by 14.32
// this might be slower than algorithm 14.36, which interleaves these steps
// Known as the Separated Operand Scanning (SOS) Method
void biginth_mulmodmontSOS(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m, const uint64_t inv){
  uint64_t out_internal[NUM_LIMBS*2];
  biginth_mul(out_internal, x, y);
  biginth_montreduce(out, out_internal, m, inv);
}

// algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
void biginth_mulmodmontHAC(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m, const uint64_t inv){
  uint64_t A[NUM_LIMBS*2+1];
  for (int i=0;i<NUM_LIMBS*2+1;i++)
    A[i]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t ui = (A[i]+x[i]*y[0])*inv;
    uint64_t carry = 0;
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=0; j<NUM_LIMBS; j++){
      uint128_t xiyj = (uint128_t)x[i]*y[j];
      uint128_t uimj = (uint128_t)ui*m[j];
      uint128_t partial_sum = xiyj+carry;
      uint128_t sum = uimj+A[i+j]+partial_sum;
      A[i+j] = (uint64_t)sum;
      carry = (uint64_t)(sum>>64);
      // if there was overflow in the sum beyond the carry:
      if (sum<partial_sum){
        int k=2;
        while ( i+j+k<NUM_LIMBS*2 && A[i+j+k]==(uint64_t)0-1 ){ // note 0-1 is 0xffffffff
	  // this is rare, need limb to be all 1's
          A[i+j+k]=0;
          k++;
        }
        if (i+j+k<NUM_LIMBS*2+1){
          A[i+j+k]+=1;
	}
      }
      //printf("%d %d %llu %llu %llu %llu %llu %llu %llu %llu %llu\n",i,j,x[i],x[i]*y[0],ui,xiyj,uimj,partial_sum,sum,A[i+j],carry);
    }
    A[i+NUM_LIMBS]+=carry;
  }

  // instead of right shift, we just get the correct values
  for (int i=0; i<NUM_LIMBS;i++)
    out[i] = A[i+NUM_LIMBS];

  // final subtraction, first see if necessary
  if (A[NUM_LIMBS*2]>0 || biginth_less_than_or_equal(m,out))
    biginth_sub(out, out, m);
}

// From paper Çetin K. Koç; Tolga Acar; Burton S. Kaliski, Jr. (June 1996). "Analyzing and Comparing Montgomery Multiplication Algorithms". IEEE Micro. 16 (3): 26–33.
void biginth_mulmodmontFIOS(uint64_t* const out, const uint64_t* const a, const uint64_t* const b, const uint64_t* const mod, const uint64_t inv){
  uint64_t t[NUM_LIMBS+2];
  for (int i=0;i<NUM_LIMBS+2;i++)
    t[i]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t carry = 0;
    uint128_t sum = 0;
    sum = (uint128_t)(t[0])+(uint128_t)(a[0])*b[i];
    carry = (uint64_t)(sum>>64);
    int k=1;
    while (carry && k<=NUM_LIMBS+1){
      uint128_t temp = (uint128_t)t[k] + carry;
      t[k]=(uint64_t)temp;
      carry = (uint64_t)(temp >> 64);
      k++;
    }
    uint64_t m = ((uint64_t)sum)*inv;
    sum = (uint64_t)sum + (uint128_t)m*mod[0]; // lower limb of sum should be zero
    carry = (uint64_t)(sum >> 64);
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=1; j<NUM_LIMBS; j++){
      sum = (uint128_t)t[j] + (uint128_t)a[j]*b[i] + carry;
      carry = (uint64_t)(sum >> 64);
      k=j+1;
      while (carry && k<=NUM_LIMBS+1){
        uint128_t temp = (uint128_t)t[k] + carry;
        t[k]=(uint64_t)temp;
        carry = (uint64_t)(temp >> 64);
        k++;
      }
      sum = (uint64_t)sum + (uint128_t)m*mod[j];
      carry = (uint64_t)(sum>>64);
      t[j-1] = (uint64_t)sum;
    }
    sum = (uint128_t)t[NUM_LIMBS] + carry;
    carry = (uint64_t)(sum >> 64);
    t[NUM_LIMBS-1] = (uint64_t)sum;
    t[NUM_LIMBS] = t[NUM_LIMBS+1]+carry;
    t[NUM_LIMBS+1] = 0;
  }

  // output correct values
  for (int i=0; i<NUM_LIMBS;i++)
    out[i] = t[i];

  // final subtraction, first see if necessary
  if (t[NUM_LIMBS]>0 || biginth_less_than_or_equal(mod,out))
    biginth_sub(out, out, mod);
}

// Uses CIOS method for montgomery multiplication, based on algorithm from (but using notation of above mulmodmont) Çetin K. Koç; Tolga Acar; Burton S. Kaliski, Jr. (June 1996). "Analyzing and Comparing Montgomery Multiplication Algorithms". IEEE Micro. 16 (3): 26–33.
// Known as the Coarsely Integrated Operand Scanning (CIOS)
void biginth_mulmodmontCIOS(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m, const uint64_t inv){
  uint64_t A[NUM_LIMBS+2];
  for (int i=0;i<NUM_LIMBS+2;i++)
    A[i]=0;
  #ifdef UNROLL_OUTER
    #pragma unroll	// this unroll increases binary size by a lot
  #endif
  for (int i=0; i<NUM_LIMBS; i++){
    uint64_t carry = 0;
    uint128_t sum = 0;
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=0; j<NUM_LIMBS; j++){
      sum = (uint128_t)A[j] + (uint128_t)x[i]*y[j] + carry;
      carry = (uint64_t)(sum>>64);
      A[j] = (uint64_t)sum;
    }
    sum = (uint128_t)(A[NUM_LIMBS]) + carry;
    carry = (uint64_t)(sum>>64);
    A[NUM_LIMBS] = (uint64_t) sum;
    A[NUM_LIMBS+1] = carry;
    uint64_t A0inv = A[0]*inv;
    sum = (uint128_t)(A[0]) + (uint128_t)A0inv*m[0];
    carry = (uint64_t)(sum>>64);
    #ifdef UNROLL
      #pragma unroll
    #endif
    for (int j=1; j<NUM_LIMBS; j++){
      sum = (uint128_t)(A[j]) + (uint128_t)A0inv*m[j] + carry;
      carry = (uint64_t)(sum>>64);
      A[j-1] = (uint64_t)sum;
    }
    sum = (uint128_t)(A[NUM_LIMBS])+carry;
    carry = (uint64_t)(sum>>64);
    A[NUM_LIMBS-1]=(uint64_t)sum;
    A[NUM_LIMBS]=A[NUM_LIMBS+1]+carry;
  }

  // copy to out
  for (int i=0; i<NUM_LIMBS;i++)
    out[i] = A[i];

  // final subtraction, first see if necessary
  if (A[NUM_LIMBS]>0 || biginth_less_than_or_equal(m,out))
    biginth_sub(out, out, m);
}


void biginth_mulmodmont(uint64_t* const out, const uint64_t* const x, const uint64_t* const y, const uint64_t* const m, const uint64_t inv){
  biginth_mulmodmontCIOS(out, x, y, m, inv);
}


// the folloiwng functions can't have NUM_LIMBS hardcoded since they set it as a variable
#ifdef NUM_LIMBS
#else

// algorithm 14.61, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// note: the last step is not implemented yet, but this is still useful for finding modular inverse
void biginth_extended_gcd_binary_HAC(uint64_t* a, uint64_t* b, uint64_t* v, uint64_t* x, uint64_t* y, uint64_t n){
  NUM_LIMBS = n;
  uint64_t g = 0;       // book uses a bigint g, but we just keep track of number of doublings
  while(biginth_is_nonzero(x) &&
        biginth_is_nonzero(y) &&
        x[0]%2==0 &&
        y[0]%2==0){
    biginth_right_shift_arithmetic_1(x);
    biginth_right_shift_arithmetic_1(y);
    g++;        // just keep track of number of doublings, will left shift v at end
  }
  uint64_t u[n];
  for (int i=0; i<n; i++){
    u[i]=x[i];
    v[i]=y[i];
  }
  uint64_t A[n], B[n], C[n], D[n];
  for (int i=0;i<n;i++) {
    A[i]=0; B[i]=0; C[i]=0; D[i]=0;
  }
  A[0]=1; D[0]=1;
  int iter=0;
  int iter2=0;
  int iter3=0;
  int prev=0;
  while (1){
    while(u[0]%2==0){
      biginth_right_shift_arithmetic_1(u);
      if (A[0]%2==0 && B[0]%2==0){
        biginth_right_shift_arithmetic_1(A);
        biginth_right_shift_arithmetic_1(B);
      }
      else {
        biginth_add(A,A,y);
        biginth_right_shift_arithmetic_1(A);
        biginth_sub(B,B,x);
        biginth_right_shift_arithmetic_1(B);
      }
    }
    while(v[0]%2==0){
      biginth_right_shift_arithmetic_1(v);
      if (C[0]%2==0 && D[0]%2==0){
        biginth_right_shift_arithmetic_1(C);
        biginth_right_shift_arithmetic_1(D);
      }
      else {
        biginth_add(C,C,y);
        biginth_right_shift_arithmetic_1(C);
        biginth_sub(D,D,x);
        biginth_right_shift_arithmetic_1(D);
      }
    }
    if (biginth_less_than_or_equal(v,u)){
      biginth_sub(u,u,v);
      biginth_sub(A,A,C);
      biginth_sub(B,B,D);
    }
    else{
      biginth_sub(v,v,u);
      biginth_sub(C,C,A);
      biginth_sub(D,D,B);
    }
    if (!biginth_is_nonzero(u)){
      for (int i=0;i<n;i++){
        a[i] = C[i];
        b[i] = D[i];
      }
      //left_shift(v,g,n);  // left_shift is not implemented yet, could do this as a bigint mul too
      return;
    }
  }
}


// algorithm 14.64, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
// multiplicative inverse z st az=1 mod m
// inverse exists iff gcd(a,mod)=1
// note: this function doesn't work with NUM_LIMBS hard-coded, since 
void biginth_multiplicative_inverse(uint64_t* out, uint64_t* a, uint64_t* m, uint64_t n){
  uint64_t a_[n],v[n];
  biginth_extended_gcd_binary_HAC(a_,out,v,m,a,n);
  // if result is negative, add modulus
  if (out[n-1]>>63==1){
    biginth_add(out,out,m);
  }
}


// Compute N' for montgomery multiplication
// Recall montgomery multiplication uses identity RR^{-1} - NN' = 1, where N is an odd modulus and R is 2^{64*num_limbs_in_N}.
// This function computes N' := (-N)^{-1} mod R.
// Note: Need a source for this algorithm. Not sure if it works in all cases. But passed all tests I tried so far.
void biginth_compute_Nprime_experimental(uint64_t* out, uint64_t* m, uint64_t num_limbs){
  uint64_t old_NUM_LIMBS = NUM_LIMBS;
  NUM_LIMBS=num_limbs;
  // mod may have fewer limbs than n, so find most significant limb index
  uint64_t i;
  for (i=num_limbs-1;i>=0;i--){
    if (m[i]!=0)
      break;
  }
  num_limbs=i+1;
  uint64_t x[2*num_limbs];
  for (int i=0;i<2*num_limbs;i++)
    x[i]=0;
  x[0]=1;
  uint64_t two[num_limbs];
  for (int i=0;i<num_limbs;i++)
    two[i]=0;
  two[0]=2;
  uint64_t num_bits = num_limbs*64;
  uint64_t num_iters = 1;
  while ( num_bits>>= 1) { num_iters++; }
  uint64_t x_tmp[num_limbs];
  for (int i=0;i<num_iters;i++){
    for (int i=0;i<num_limbs;i++)
      x_tmp[i]=x[i];
    biginth_mul(x,x,m);
    biginth_add(x,x,two);
    biginth_mul(x,x,x_tmp);
  }
  for (int i=0;i<num_limbs;i++){
    out[i]=x[i];
  }
  NUM_LIMBS=old_NUM_LIMBS;
}


// Compute N' for montgomery multiplication
// Recall montgomery multiplication uses identity RR^{-1} - NN' = 1, where N is an odd modulus and R is 2^{64*num_limbs_in_N}.
// This function computes N' := (-N)^{-1} mod R.
// wher -N is R-N, which we compute.
uint64_t biginth_compute_Nprime(uint64_t* Nprime, uint64_t* mod, uint64_t n){
  // assert that mod is odd

  uint64_t original_NUM_LIMBS = NUM_LIMBS;

  // mod may have fewer limbs than n, so find most significant limb index
  uint64_t i;
  for (i=n-1;i>=0;i--){
    if (mod[i]!=0)
      break;
  }
  n=i+1;

  uint64_t R[n+1];
  for(int i=0;i<n+1;i++)
    R[i]=0;
  R[n]=1;

  // compute R - mod
  // note: R uses an extra limb, so will give mod an extra limb too
  uint64_t R_minus_mod[n+1];
  uint64_t c=0;
  for (int i=0; i<n; i++){
    uint64_t temp = R[i]-c;
    c = (temp<mod[i] || R[i]<c) ? 1:0;
    R_minus_mod[i] = temp-mod[i];
  }
  R_minus_mod[n]=0;

  uint64_t out[n+1];
  biginth_multiplicative_inverse( out, R_minus_mod, R, n+1);
  // Note: 14.61 says to add the modulus if the output is negative
  // but we could just interpret it as unsigned (i.e. adding R does nothing)
  // so could just call biginth_extended_gcd_binary_HAC() directly.
  // but we ignore many optimizations like this for now

  NUM_LIMBS = original_NUM_LIMBS;	// reset NUM_LIMBS, since gcd algorithm might have changed it

  for(int i=0;i<n;i++)
    Nprime[i] = out[i];

  // return the number of limbs in mod, since may be useful for some applications.
  return n;
}

#endif	// end of functions which can't have NUM_LIMBS hardcoded



#undef uint128_t

#endif
