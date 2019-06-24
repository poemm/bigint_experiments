
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef unsigned __int128 uint128_t;
typedef unsigned long size_t;

#define WASM 1
#include "../bignum.hpp"


// some things needed to compile with optimizations
extern "C" {
//__attribute__ ((noinline))
void* memset(void* __restrict in, int c, size_t len) {
  uint8_t* in_ptr = (uint8_t*)in;
  while (len-- > 0) {
    *in_ptr++ = c;
  }
  return in_ptr;
}

//__attribute__ ((noinline))
void* memcpy(void* __restrict destination, const void* __restrict source, size_t len) {
  uint8_t* destination_ptr = (uint8_t*) destination;
  uint8_t* source_ptr = (uint8_t*) source;
  while (len-- > 0) {
    *destination_ptr++ = *source_ptr++;
  }
  return destination;
}
}


extern "C" {
void montmul256_32bitlimbs(uint32_t* x, uint32_t* y, uint32_t* m, uint32_t* inv, uint32_t* out){
  montgomery_multiplication<uint32_t,uint64_t,8>(x,y,m,inv,out);
}

void montmul256_64bitlimbs(uint64_t* x, uint64_t* y, uint64_t* m, uint64_t* inv, uint64_t* out){
  montgomery_multiplication<uint64_t,uint128_t,4>(x,y,m,inv,out);
}

void montmul768_32bitlimbs(uint32_t* x, uint32_t* y, uint32_t* m, uint32_t* inv, uint32_t* out){
  montgomery_multiplication<uint32_t,uint64_t,24>(x,y,m,inv,out);
}

void montmul768_64bitlimbs(uint64_t* x, uint64_t* y, uint64_t* m, uint64_t* inv, uint64_t* out){
  montgomery_multiplication<uint64_t,uint128_t,12>(x,y,m,inv,out);
}
}
