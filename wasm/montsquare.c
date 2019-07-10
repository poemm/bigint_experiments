
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef unsigned __int128 uint128_t;
typedef unsigned long size_t;

#define WASM 1

#define BIGINT_BITS 256
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64 
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 256
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

// some things needed to compile with optimizations
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
