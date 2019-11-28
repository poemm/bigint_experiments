

#include "utils.h"
#include "../bignum.h"





int main(int argc, char** argv){

  if (argc>1){
    if (strcmp(argv[1],"add") == 0){
      printf("testing add\n");
      if (argc!=5){
        printf("./test_and_bench add 0x<hex of x> 0x<hex of y> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS], expected[NUM_LIMBS], out[NUM_LIMBS];
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,(uint8_t*)expected);
      for (int i=0; i<NUM_ITERS; i++)
        FUNCNAME(add)(x,y,out);
      if (NUM_ITERS==1){
        int error=0;
        for (int i=0; i<NUM_LIMBS; i++){
          if(out[i]!=expected[i]){
            printf("ERROR: out[%d]=%x and expected[%d]=%x\n",i,out[i],i,expected[i]);
            error=1;
          }
        }
        if (!error){ printf("correct\n");}
      }
    }
    else if (strcmp (argv[1],"subtract") == 0){
      printf("testing subtract\n");
      if (argc!=5){
        printf("./test_and_bench subtract 0x<hex of x> 0x<hex of y> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS], expected[NUM_LIMBS], out[NUM_LIMBS];
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,(uint8_t*)expected);
      for (int i=0; i<NUM_ITERS; i++)
        FUNCNAME(subtract)(x,y,out);
      if (NUM_ITERS==1){
        int error=0;
        for (int i=0; i<NUM_LIMBS; i++){
          if(out[i]!=expected[i]){
            printf("ERROR: out[%d]=%x and expected[%d]=%x\n",i,out[i],i,expected[i]);
            error=1;
          }
        }
        if (!error){ printf("correct\n");}
      }
    }
    else if (strcmp (argv[1],"lessthan") == 0){
      printf("testing less_than\n");
      if (argc!=5){
        printf("./test_and_bench subtract 0x<hex of x> 0x<hex of y> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS];
      uint8_t expected, out;
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,&expected);
      for (int i=0; i<NUM_ITERS; i++)
        out = FUNCNAME(less_than)(x,y);
      if (NUM_ITERS==1){
        if (expected != out)
          //printf("ERROR: less than failed. %u %u\n",expected,out);
          printf("ERROR: lessthan expected: %u and got: %u\n",expected, out);
        else
          printf("correct\n");
      }
    }
    else if (strcmp (argv[1],"lessthanequal") == 0){
      printf("testing less_than_or_equal\n");
      if (argc!=5){
        printf("./test_and_bench less_than_or_equal 0x<hex of x> 0x<hex of y> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS];
      uint8_t expected, out;
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,&expected);
      for (int i=0; i<NUM_ITERS; i++)
        out = FUNCNAME(less_than_or_equal)(x,y);
      if (NUM_ITERS==1){
        if (expected != out)
          //printf("ERROR: less than or equal failed.\n");
          printf("less_than_or_equal expected: %u and got: %u\n",expected, out);
        else
          printf("correct\n");
      }
    }
    else if (strcmp (argv[1],"mul") == 0){
      printf("testing mul\n");
      if (argc!=5){
        printf("./test_and_bench mul 0x<hex of x> 0x<hex of y> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS], expected[2*NUM_LIMBS], out[2*NUM_LIMBS];
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,(uint8_t*)expected);
      for (int i=0; i<NUM_ITERS; i++)
        FUNCNAME(mul)(x,y,out);
      if (NUM_ITERS==1){
        int error=0;
        for (int i=0; i<2*NUM_LIMBS; i++){
          if(out[i]!=expected[i]){
            printf("ERROR: out[%d]=%x and expected[%d]=%x\n",i,out[i],i,expected[i]);
            error=1;
          }
        }
        if (!error){ printf("correct\n");}
      }
    }
    else if (strcmp (argv[1],"montmul") == 0){
      printf("testing montgomery multiplication\n");
      if (argc!=7){
        printf("./test_and_bench montmul 0x<hex of x> 0x<hex of y> 0x<hex of mod> 0x<hex of modinv> 0x<hex of expected>\n");
	return -1;
      }

      UINT x[NUM_LIMBS], y[NUM_LIMBS], m[NUM_LIMBS], inv[NUM_LIMBS], expected[NUM_LIMBS], out[NUM_LIMBS];
      hexstr_to_bytearray(argv[2]+2,(uint8_t*)x);
      hexstr_to_bytearray(argv[3]+2,(uint8_t*)y);
      hexstr_to_bytearray(argv[4]+2,(uint8_t*)m);
      hexstr_to_bytearray(argv[5]+2,(uint8_t*)inv);
      hexstr_to_bytearray(argv[6]+2,(uint8_t*)expected);
      for (int i=0; i<NUM_ITERS; i++)
        FUNCNAME(montmul)(x,y,m,inv,out);
      if (NUM_ITERS==1){
        int error=0;
        for (int i=0; i<NUM_LIMBS; i++){
          if(out[i]!=expected[i]){
            printf("ERROR: out[%d]=%x and expected[%d]=%x\n",i,out[i],i,expected[i]);
            error=1;
          }
        }
      if (!error){ printf("correct\n");}
      }

    }
    else {
      printf("./test_and_bench <testname> ...\n");
      printf("    where <testname> is montmul, add, subtract, etc.\n");
    }
  }
}
