


#define BIGINT_BITS 256
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64 
#include "../bigint.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64
#include "../bigint.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 256
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bigint.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bigint.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW


// some things needed for using 768bit things, otherwise the compiler will complain

typedef unsigned long size_t;

__attribute__ ((noinline))
void* memcpy(void* restrict destination, const void* restrict source, size_t len) {
  uint8_t* destination_ptr = (uint8_t*) destination;
  uint8_t* source_ptr = (uint8_t*) source;
  // copy 8-byte chunks
  while (len > 7) {
    *(uint64_t*)destination_ptr = *(uint64_t*)source_ptr;
    destination_ptr+=8;
    source_ptr+=8;
    len-=8;
  }
  // copy rest 1-byte at a time
  while (len-- > 0)
    *destination_ptr++ = *source_ptr++;
  return destination;
}

__attribute__ ((noinline))
void* memset(void* restrict in, int c, size_t len) {
  uint8_t* in_ptr = (uint8_t*)in;
  if (len>8){
    // set in 8-byte chunks
    uint64_t c64 = c + (c<<8) + (c<<16) + (c<<24) + (((uint64_t)c)<<32) + (((uint64_t)c)<<40) + (((uint64_t)c)<<56);
    while (len > 7) {
      *(uint64_t*)in_ptr = c64;
      in_ptr+=8;
      len-=8;
    }
  }
  // set rest 1-byte at a time
  while (len-- > 0) {
    *in_ptr++ = c;
  }
  return in_ptr;
}


uint32_t a[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
uint32_t b[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
uint32_t out[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
uint32_t mod[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
uint32_t inv[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};


void bench_mul256_32bitlimbs(){ 

  for (int i=0; i<10000; i++){
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);

    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);

    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);

    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
    mul256_32bitlimbs(a,b,out); mul256_32bitlimbs(out,b,a);
  }
}


void bench_mul256_64bitlimbs(){ 

  uint64_t* a64 = (uint64_t*)a;
  uint64_t* b64 = (uint64_t*)b;
  uint64_t* out64 = (uint64_t*)out;

  for (int i=0; i<10000; i++){
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);

    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);

    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);

    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
    mul256_64bitlimbs(a64,b64,out64); mul256_64bitlimbs(out64,b64,a64);
  }
}


void bench_montmul256_32bitlimbs(){ 

  for (int i=0; i<10000; i++){
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);

    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);

    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);

    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
    montmul256_32bitlimbs(a,b,mod,inv,out); montmul256_32bitlimbs(out,b,mod,inv,a);
  }
}

void bench_montmul256_64bitlimbs(){ 

  uint64_t* a64 = (uint64_t*)a;
  uint64_t* b64 = (uint64_t*)b;
  uint64_t* mod64 = (uint64_t*)mod;
  uint64_t* inv64 = (uint64_t*)inv;
  uint64_t* out64 = (uint64_t*)out;

  for (int i=0; i<10000; i++){
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul256_64bitlimbs(a64,b64,mod64,inv64,out64); montmul256_64bitlimbs(out64,b64,mod64,inv64,a64);
  }
}

void bench_montsquare256_32bitlimbs(){ 

  for (int i=0; i<10000; i++){
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);

    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);

    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);

    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
    montsquare256_32bitlimbs(a,mod,inv,out); montsquare256_32bitlimbs(out,mod,inv,a);
  }
}

void bench_montsquare256_64bitlimbs(){ 

  uint64_t* a64 = (uint64_t*)a;
  uint64_t* b64 = (uint64_t*)b;
  uint64_t* mod64 = (uint64_t*)mod;
  uint64_t* inv64 = (uint64_t*)inv;
  uint64_t* out64 = (uint64_t*)out;

  for (int i=0; i<10000; i++){
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);

    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);

    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);

    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
    montsquare256_64bitlimbs(a64,mod64,inv64,out64); montsquare256_64bitlimbs(out64,mod64,inv64,a64);
  }
}

void bench_montmul768_32bitlimbs(){ 

  for (int i=0; i<1000; i++){
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);

    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);

    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);

    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
    montmul768_32bitlimbs(a,b,mod,inv,out); montmul768_32bitlimbs(out,b,mod,inv,a);
  }

}

void bench_montmul768_64bitlimbs(){ 

  uint64_t* a64 = (uint64_t*)a;
  uint64_t* b64 = (uint64_t*)b;
  uint64_t* mod64 = (uint64_t*)mod;
  uint64_t* inv64 = (uint64_t*)inv;
  uint64_t* out64 = (uint64_t*)out;

  for (int i=0; i<1000; i++){
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);

    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
    montmul768_64bitlimbs(a64,b64,mod64,inv64,out64); montmul768_64bitlimbs(out64,b64,mod64,inv64,a64);
  }

}
