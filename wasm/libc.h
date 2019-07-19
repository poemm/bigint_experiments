


#ifndef LIBC_H
#define LIBC_H



///////////
// TYPES //
///////////

typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef unsigned __int128 uint128_t;
typedef unsigned long size_t;




////////////////////////////
// MEMORY OPERATIONSTYPES //
////////////////////////////

// these mem operations may be needed to compile with optimizations

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

#endif

