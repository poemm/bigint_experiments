
/*
funciton mul256x256_512 multiplies unaliased bigint values; out <- a*b

gcc -std=c99 callmul256x256_512.c mul256x256_512.s -fno-pie -no-pie

*/

#include <stdio.h>
#include <inttypes.h>

#if TO512
  #define mul256x256 mul256x256_512
#else
  #define mul256x256 mul256x256_256
#endif

void mul256x256(uint64_t* a, uint64_t* b, uint64_t* out);

// in little-endian
//uint64_t a[] = {0xffffffffffffffff,0,0,0};
//uint64_t b[] = {0xffffffffffffffff,0,0,0};
uint32_t a[] = {0xffffffff,0xffffffff,0,0,0,0,0,0};
uint32_t b[] = {0xffffffff,0xffffffff,0,0,0,0,0,0};
uint64_t out[] = {0,0,0,0,0,0,0,0};

int main() {

/*
  printf("a %lu\n",(uint64_t)a);
  printf("b %lu\n",(uint64_t)b);
  printf("out %lu\n",(uint64_t)out);
*/

#if BENCHMARK
  for (int i=0; i<10000;i++){
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);

    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);

    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);

    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
    mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b); mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);

  }

#else // no bench, just evaluate
  mul256x256((uint64_t*)out,(uint64_t*)a,(uint64_t*)b);
#endif

/*
  printf("ok\n");
  for (int i=0; i<16; i++){
    printf(" %d", ((uint32_t*)out)[i]);
  }
  printf("\nok\n");
  for (int i=0; i<8; i++){
    printf(" %ld", ((uint64_t*)out)[i]);
  }
  printf("\nok\n");
*/

  return 0;
}
