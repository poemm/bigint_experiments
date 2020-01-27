
#include <stdint.h>
#include <string.h>

// hex string to int array conversion
// input is string of hex characters, without 0x prefix
// also converts to little endian (ie least significant nibble first)
void hexstr_to_bytearray(uint8_t* out, char* in){
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

// seems to work
void bytearray_to_hexstr(char* out, uint8_t* in, int length){
  for (int i=0;i<length;i++){
    char* nibble;
    // first nibble
    nibble = in[i]>>4;
    if (nibble < 10) nibble = nibble + '0';
    else nibble = nibble - 10 + 'a';
    out[i*2]=nibble;
    // second nibble
    nibble = in[i] & 0x0f;
    if (nibble < 10) nibble = nibble + '0';
    else nibble = nibble - 10 + 'a';
    out[i*2+1]=nibble;
  }
  out[2*length]='\0';
}

// reverse a string in-place
// must be null terminated
// didn't need it, forgot if it works
void reverse_bytearray(char* in, int length){
  printf("reverse_bytearray()\n");
  //size_t length = strlen(in);
  printf("%d\n",length);
  for (int i=0; i<length/2; i++){
    char temp = *(in+i);
    *(in+i)=*(in+length-1-i);
    *(in+length-1-i)=temp;
  }
}

// reverse bytes of hex string without '0x' (or corresponding pairs of characters for non-hex string)
// useful if get big-endian but need little-endian
// in-place
// this doesn't work if there are odd number of characters, which is common
// forgot if it even works
char* reverse_hex_str(char* in){
  printf("reverse(%s)\n",in);
  size_t length = strlen(in);
  if (length%2){printf("ERROR: hex string of odd length\n");}
  for (int i=0; i<length/2; i+=2){
    char temp1 = *(in+i);
    char temp2 = *(in+i+1);
    *(in+i)=*(in+length-i-2);
    *(in+i+1)=*(in+length-i-2+1);
    *(in+length-i-2)=temp1;
    *(in+length-i-2+1)=temp2;
  }
  printf("reverse() -> %s\n",in);
  return in;
}

// may not work, forgot
int hexchar_to_int(char byte){
  if (byte >= '0' && byte <= '9') byte -= '0';
  else if (byte >= 'a' && byte <='f') byte -= 'a' + 10;
  else if (byte >= 'A' && byte <='F') byte -= 'A' + 10;    
  return byte;
}

