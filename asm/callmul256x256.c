




/*
funciton mul256x256_512 multiplies unaliased bigint values; out <- a*b

gcc -std=c99 callmul256x256_512.c mul256x256_512.s -fno-pie -no-pie



# generate tests in python
import random 
in_bits = 256 
out_bits = 256 
for i in range(100): 
  a=random.randint(0,2**in_bits-1) 
  b=random.randint(0,2**in_bits-1) 
  out=(a*b)%(2**out_bits) 
  print("./a.out "+hex(a)+" "+hex(b)+" "+hex(out)+"\n") 

*/

#include <stdio.h>
#include <inttypes.h>
#include <string.h>

#if TO512
  #define mul256x256 mul256x256_512
#else
  #define mul256x256 mul256x256_256
#endif

void mul256x256(uint32_t* out, uint32_t* a, uint32_t* b);

void bench(uint32_t* out, uint32_t* a, uint32_t* b){
  for (int i=0; i<10000;i++){
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);

    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);

    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);

    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
    mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b); mul256x256(out,a,b);
  }
}

// hex string to int array conversion
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


int main(int argc, char** argv) {

  uint32_t a[16], b[16], out[16], out_expected[16];

  for (int i=0; i<16;i++){
    a[i]=0;
    b[i]=0;
    out[i]=0;
    out_expected[i]=0;
  }

  if (argc==1){
    hexstr_to_bytearray("000000000000000000000000000000000000000000000000ffffffffffffffff",(uint8_t*)a);
    hexstr_to_bytearray("000000000000000000000000000000000000000000000000ffffffffffffffff",(uint8_t*)b);
    hexstr_to_bytearray("0000000000000000000000000000000000000000000000000000000000000000",(uint8_t*)out_expected);
  }
  else{
    hexstr_to_bytearray(argv[1]+2,(uint8_t*)a);
    hexstr_to_bytearray(argv[2]+2,(uint8_t*)b);
    hexstr_to_bytearray(argv[3]+2,(uint8_t*)out_expected);
  }

#if BENCHMARK
  bench(out,a,b);
#else // no bench, just evaluate
  mul256x256(out,a,b);
#endif

  int error = 0;
  for (int i=0; i<16; i++){
    if (out[i]!=out_expected[i])
      error=1;
  }
  if (error){
    for (int i=0; i<16; i++)
      printf(" %08x", ((uint32_t*)a)[i]);
    printf("\n");
    for (int i=0; i<16; i++)
      printf(" %08x", ((uint32_t*)b)[i]);
    printf("\n");
    for (int i=0; i<16; i++)
      printf(" %08x", ((uint32_t*)out)[i]);
    printf("\n");
    for (int i=0; i<16; i++)
      printf(" %08x", ((uint32_t*)out_expected)[i]);
    printf("\n");
  }
  else
    printf(".");
  //printf("\n");

  return 0;
}
