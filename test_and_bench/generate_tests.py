import random
import binascii

import sys
sys.path.append('..')
import bigint


def generate_add_tests(filename,execname,numtests,max_bits):  
  print("generate_add_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    out=(a+b)%2**max_bits
    command = execname+" add "+hex(a)+" "+hex(b)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_subtract_tests(filename,execname,numtests,max_bits):  
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    if a<b:
      a,b=b,a
    out=a-b
    command = execname+" subtract "+hex(a)+" "+hex(b)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_less_than_tests(filename,execname,numtests,max_bits):  
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    out=1 if a<b else 0
    command = execname+" lessthan "+hex(a)+" "+hex(b)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_less_than_or_equal_tests(filename,execname,numtests,max_bits):  
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    out=1 if a<=b else 0
    command = execname+" lessthanequal "+hex(a)+" "+hex(b)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_mul_tests(filename,execname,numtests,max_bits):
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    expected=a*b
    command = execname+" mul "+hex(a)+" "+hex(b)+" "+hex(expected)+"\n"
    f.write(command)
  f.close

def generate_montmul_tests(filename,execname,numtests,max_bits):  
  print("generate_montmul_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    #print("i",i)
    # mod and inv taken from bn curve stuff
    #mod=21888242871839275222246405745257275088696311157297823662689037894645226208583
    #inv=20744187311322900089244660184552684173238317978539439520726624125354108150665
    # generate random mod, compute inv
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)
    # generate random a and b
    a=mod
    b=mod
    while(a>=mod):
      a=random.randint(0,2**max_bits-1)
    while(b>=mod):
      b=random.randint(0,2**max_bits-1)
    #print("a",a,"b",b)
    # get expected output
    expected = [0]
    bigint.montgomery_reduction(expected,[(a*b)%(2**max_bits),(a*b)//(2**max_bits)],[mod],[inv],2**max_bits,1)  # using montreduce, which must be tested separately
    # print command
    command = execname+" montmul "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)+" "+hex(expected[0])+"\n"
    f.write(command)
  f.close

"""
  def caseys_mulreduce256(self,other,modulus,inv):
    mask = 0xffffffffffffffffffffffffffffffff
    result512 = self * other
    k0 = (inv * result512) & mask
    res2 = ((k0 * modulus) + result512) >> 128
    k1 = (res2 * inv) & mask
    res3 = ((k1 * modulus) + res2) >> 128
    return res3
"""

"""
def generate_montmul768_tests(filename,numtests,max_bits):  
  f = open(filename, 'a')
  #768-bit version
  def caseys_mulreduce_768(self,other,modulus,inv):
    mask = 0xffffffffffffffffffffffffffffffffffffffffffffffff
    result1536 = self * other
    k0 = (inv * result1536) & mask
    res2 = ((k0 * modulus) + result1536) >> 128
    k1 = (res2 * inv) & mask
    res3 = ((k1 * modulus) + res2) >> 128
    return res3
  for i in range(numtests):
    # this mod is from the mnt curve, i think it is a prime and the inv was computed correctly with 10 iterations of extended euclidean algorithm over this modulus
    mod=0x01C4C62D92C41110229022EEE2CDADB7F997505B8FAFED5EB7E8F96C97D87307FDB925E8A0ED8D99D124D9A15AF79DB26C5C28C859A99B3EEBCA9429212636B9DFF97634993AA4D6C381BC3F0057974EA099170FA13A4FD90776E240000001
    inv=0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    if a>=mod or b>=mod: continue
    out = caseys_mulreduce_768(a,b,mod,inv)
    command ="./bigint_test_gcc_24 montmul "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)+" "+hex(out)+"\n"
    f.write(command)
    #command ="./bigint_test_clang_24 montmul "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)+" "+hex(out)+"\n"
    #f.write(command)
  f.close

def generate_montmul_tests_hack(filename,numtests,max_bits):  
  f = open(filename, 'a')
  import bigint
  num_limbs=2 #this is arbitrary and only for generation
  base=2**(max_bits//num_limbs)
  for i in range(numtests):
    # mod and inv taken from bn curve stuff
    mod=21888242871839275222246405745257275088696311157297823662689037894645226208583
    inv=20744187311322900089244660184552684173238317978539439520726624125354108150665
    #mod=0x01C4C62D92C41110229022EEE2CDADB7F997505B8FAFED5EB7E8F96C97D87307FDB925E8A0ED8D99D124D9A15AF79DB26C5C28C859A99B3EEBCA9429212636B9DFF97634993AA4D6C381BC3F0057974EA099170FA13A4FD90776E240000001
    #inv=0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff
    a=0
    b=0
    while(a<mod or b<mod):
      a=random.randint(0,2**max_bits-1)
      b=random.randint(0,2**max_bits-1)
    command ="./a.out montmul "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)
    a=bigint.int_to_digits(a,base)
    b=bigint.int_to_digits(b,base)
    mod=bigint.int_to_digits(mod,base)
    inv=bigint.int_to_digits(inv,base)
    if len(a)!=num_limbs: a=a+[0]*(num_limbs-len(a))
    if len(b)!=num_limbs: a=a+[0]*(num_limbs-len(b))
    if len(mod)!=num_limbs: a=a+[0]*(num_limbs-len(mod))
    if len(inv)!=num_limbs: a=a+[0]*(num_limbs-len(inv))
    out=[0]*num_limbs
    bigint.montgomery_multiplication(a,b,mod,inv,out,base,num_limbs)
    command+=" "+hex(bigint.digits_to_int(out,base))+"\n"
    f.write(command)
  f.close
"""

if __name__ == "__main__":
  import sys
  if len(sys.argv)!=6:
    print("Argument should be: <funcname> <max_bits> <filename> <execname> <numtests>")
  else:
    funcname = sys.argv[1]
    max_bits = int(sys.argv[2])
    filename = sys.argv[3]
    execname = sys.argv[4]
    numtests = int(sys.argv[5])
    if funcname=="add":
      generate_add_tests(filename,execname,numtests,256)
    elif funcname=="subtract":
      generate_subtract_tests(filename,execname,numtests,max_bits)
    elif funcname=="lessthan":
      generate_less_than_tests(filename,execname,numtests,256)
    elif funcname=="lessthanequal":
      generate_less_than_or_equal_tests(filename,execname,numtests,256)
    elif funcname=="mul":
      generate_mul_tests(filename,execname,numtests,max_bits)
    elif funcname=="montmul":
      generate_montmul_tests(filename,execname,numtests,max_bits)
    else:
      print("error: bad funcname:",funcname)


