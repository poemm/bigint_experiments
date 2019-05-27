
#include "bignum.hpp"
#include <cstdint>
#include <cstdio>
#include <cstring>


// these consts can be defined here or as arguments to the compiler
/*
#define NUM_LIMBS 24
#define LIMB_TYPE uint32_t
#define LIMB_TYPE2 uint64_t
*/



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



int main(int argc, char** argv){

  if (argc!=6){
    printf("ERROR: args must be as follows\n");
    printf("./a.out 0x<hex of x> 0x<hex of y> 0x<hex of mod> 0x<hex of modinv>\n");
    return -1;
  }

  LIMB_TYPE x[NUM_LIMBS], y[NUM_LIMBS], m[NUM_LIMBS], inv[NUM_LIMBS], expected[NUM_LIMBS], out[NUM_LIMBS];

  // parse limbs from command line args
  hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
  hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
  hexstr_to_bytearray(argv[4]+2,(uint8_t*)m);
  hexstr_to_bytearray(argv[5]+2,(uint8_t*)inv);

  for (int i=0;i<20000;i++){
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);

    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);

    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);

    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(x,out,m,inv,out);
    montgomery_multiplication<LIMB_TYPE,LIMB_TYPE2,NUM_LIMBS>(out,y,m,inv,out);

  }

  return 0;
}
