import random
import binascii

import sys
sys.path.append('..')
import bigint

##################
# Helper functions

def wikipedia_REDC(R,N,Nprime,T):
  m = ((T%R)*Nprime) % R
  t = (T+m*N) // R
  if t>= N:
    return t-N
  else:
    return t

def wikipedia_inverse(a,n):
  # https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Modular_integers
  t=0; newt=1
  r=n; newr=a
  i=0
  while newr!=0:
    quotient = r//newr
    #print(i, quotient, r, newr)
    i+=1
    t,newt = newt, t-quotient*newt
    r,newr = newr, r-quotient*newr
  if r>1:
    print("a is not invertible")
    return None
  if t<0:
    t=t+n
  return t

# following the original [M85, section 2] notation and algorithm
def REDC_multiprecision(T,N,Nprime,n):
  # T is the bigint value to be reduced
  # N is the bigint modulus
  # Nprime is the 64-bit montgomery parameter
  # n is the number of limbs of the modulus

  b = 2**64   # the base

  # convert inputs to limbs in base b, starting with least-significant limb
  T_=[0]*(2*n+1)  # with extra limb for carries
  for i in range(2*n):  T_[i] = T%b;  T = T//b
  N_=[0]*n
  for i in range(n):    N_[i] = N%b;  N = N//b

  # main loop
  c = 0
  for i in range(n):
    # from [M85]: (d T_{i+n-1} ... T_i)_b <- (0 T_{i+n-1} ... T_i)_b + N*(T_i*N' mod R)
    TixNprime = (T_[i]*Nprime) % b
    d = 0
    for j in range(n):
      temp = T_[i+j] + N_[j]*TixNprime + d
      T_[i+j] = temp % b
      d = temp // b
    # from [M85]: (c T_{i+n})_b <- c + d + T_{i+n}
    temp = c + d + T_[i+n]
    T_[i+n] = temp % b
    c = temp // b
  T_[2*n] += c

  # convert result T_ back to bigint, ignoring lowest n limbs
  for i in range(n+1): T += T_[n+i] * b**i

  # finally, subtract the modulus if we exceed it
  if T>=N:
    return T-N
  else:
    return T


###########################################################3############
# The test generators


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

def generate_addmod_tests(filename,execname,numtests,max_bits):  
  print("generate_addmod_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  for i in range(numtests):
    # mod for bn curve
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # for secp256k1:
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random mod, compute inv
    #mod = 0
    #while(mod%2==0):
    #  mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    #inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)

    # generate random a and b
    a=random.randrange(0, mod)
    b=random.randrange(0, mod)
    expected=(a+b)%mod
    command = execname+" addmod "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(expected)+"\n"
    f.write(command)
  f.close

def generate_sub_tests(filename,execname,numtests,max_bits):  
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    if a<b:
      a,b=b,a
    out=a-b
    command = execname+" sub "+hex(a)+" "+hex(b)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_submod_tests(filename,execname,numtests,max_bits):  
  f = open(filename, 'a')
  for i in range(numtests):
    # mod for bn curve
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # for secp256k1:
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random mod, compute inv
    #mod = 0
    #while(mod%2==0):
    #  mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    #inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)

    # generate random a and b
    a=random.randrange(0, mod)
    b=random.randrange(0, mod)
    expected=(a-b)%mod
    command = execname+" submod "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(expected)+"\n"
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

def generate_div_tests(filename,execname,numtests,max_bits):
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    b=random.randint(0,2**max_bits-1)
    outq = a//b
    outr = a%b
    command = execname+" div "+hex(a)+" "+hex(b)+" "+"{0:#0{1}x}".format(outq,max_bits//4)+" "+"{0:#0{1}x}".format(outr,max_bits//4)+"\n"
    f.write(command)
  f.close

def generate_square_tests(filename,execname,numtests,max_bits):
  f = open(filename, 'a')
  for i in range(numtests):
    a=random.randint(0,2**max_bits-1)
    expected=a*a
    command = execname+" square "+hex(a)+" "+hex(expected)+"\n"
    f.write(command)
  f.close

def generate_montreduce_tests(filename,execname,numtests,max_bits):  
  print("generate_monsreduce_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    # mod for bn curve
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # for secp256k1:
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random mod, compute inv
    #mod = 0
    #while(mod%2==0):
    #  mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    #inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)

    # generate random a and b
    a=random.randrange(0, mod)
    # use wikipedia notation to compute (a*b) % mod
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    out = wikipedia_REDC(R,N,Nprime,a)

    # print command
    inv=Nprime
    command = execname+" montreduce "+hex(a)+" "+hex(mod)+" "+hex(inv)+" "+hex(out)+"\n"
    f.write(command)
  f.close

def generate_mulmodmont_tests(filename,execname,numtests,max_bits):  
  #print("generate_mulmodmont_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    #print("i",i)
    # mod for bn curve
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # for secp256k1:
    #mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random mod, compute inv
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)

    # generate random a and b
    a=random.randrange(0, mod)
    b=random.randrange(0, mod)
    # use wikipedia notation to compute (a*b) % mod
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    aR = (a*R)%N
    bR = (b*R)%N
    T = aR*bR   # multiply first, then will reduce
    outR = wikipedia_REDC(R,N,Nprime,T)
    out = wikipedia_REDC(R,N,Nprime,outR)
    assert out == (a*b)%N
    # print command
    command = execname+" mulmodmont "+hex(aR)+" "+hex(bR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    #command = execname+" mulmodmontFIOS "+hex(aR)+" "+hex(bR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    #command += "python3 ../bigint.py mulmodmont "+hex(aR)+" "+hex(bR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    f.write(command)
  f.close

def generate_mulmodmontSOS_tests(filename,execname,numtests,max_bits):  
  print("generate_mulmodmontSOS_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    #print("i",i)

    # generate random mod, compute inv
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    #inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)
    # mod for bn curve
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # for secp256k1:
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random a and b
    a=random.randrange(0, mod)
    b=random.randrange(0, mod)
    # use wikipedia notation to compute (a*b) % mod
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    aR = (a*R)%N
    bR = (b*R)%N
    T = aR*bR   # multiply first, then will reduce
    outR = wikipedia_REDC(R,N,Nprime,T)
    out = wikipedia_REDC(R,N,Nprime,outR)
    assert out == (a*b)%N
    # print command
    command = execname+" mulmodmontSOS "+hex(aR)+" "+hex(bR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    #command = "python3 ../bigint.py mulmodmont "+hex(aR)+" "+hex(bR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    f.write(command)
  f.close

def generate_montsquare_tests(filename,execname,numtests,max_bits):  
  print("generate_montsquare_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    #print("i",i)
    # generate random mod, compute inv
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    # mod from bn curve stuff
    #mod = 0x2e67157159e5c639cf63e9cfb74492d9eb2022850278edf8ed84884a014afa37
    # mod from secp256k1
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    # generate random a and b
    a=random.randrange(0, mod)
    # use wikipedia notation to compute (a*b) % mod
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    aR = (a*R)%N
    T = aR*aR   # multiply first, then will reduce
    outR = wikipedia_REDC(R,N,Nprime,T)
    out = wikipedia_REDC(R,N,Nprime,outR)
    assert out == (a*a)%N
    # print command
    command = execname+" montsquare "+hex(aR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    f.write(command)
    #command = "python3 ../bigint.py montsquare "+hex(aR)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(outR)+"\n"
    #f.write(command)
  f.close

def generate_mulmod_oddmod_tests(filename,execname,numtests,max_bits):
  print("generate_mulmod_oddmod_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):
    #print("i",i)
    # mod for bn curve
    #mod=21888242871839275222246405745257275088696311157297823662689037894645226208583
    # for secp256k1:
    mod = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
    #inv = 0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091dd2253531
    #inv =  0xc9bd1905155383999c46c2c295f2b761bcb223fedc24a059d838091d0868192a

    # generate random mod, compute inv
    #mod = 0
    #while(mod%2==0):
    #  mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)
    #inv = bigint.compute_minus_m_inv_mod_base(mod,base)
    #print("inv",inv)

    # generate random a and b
    a=random.randrange(0, mod)
    b=random.randrange(0, mod)
    # use wikipedia notation to compute (a*b) % mod
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    aR = (a*R)%N
    bR = (b*R)%N
    T = aR*bR   # multiply first, then will reduce
    outR = wikipedia_REDC(R,N,Nprime,T)
    out = wikipedia_REDC(R,N,Nprime,outR)
    assert out == (a*b)%N
    # print command
    command = execname+" mulmod_oddmod "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(Nprime)+" "+hex(out)+"\n"
    f.write(command)
  f.close



def generate_compute_Nprime_tests(filename,execname,numtests,max_bits):  
  #print("generate_compute_Nprime_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):

    # generate random mod
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)

    # use wikipedia notation
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    # print command
    command = execname+" compute_Nprime "+hex(mod)+" "+hex(Nprime)+"\n"

    f.write(command)
  f.close

def generate_compute_Nprime_tests(filename,execname,numtests,max_bits):  
  #print("generate_compute_Nprime_tests(",filename,execname,numtests,max_bits,")")
  f = open(filename, 'a')
  base=2**max_bits
  for i in range(numtests):

    # generate random mod
    mod = 0
    while(mod%2==0):
      mod=random.randint(0,2**max_bits-1)
    #print("mod",mod)

    # use wikipedia notation
    R = base; N=mod
    Rprime = wikipedia_inverse(R,N)
    Nprime = (R*Rprime-1)//N
    assert R*Rprime - N*Nprime == 1     # Bézout's identity
    # print command
    command = execname+" compute_Nprime_experimental "+hex(mod)+" "+hex(Nprime)+"\n"

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
def generate_mulmodmont768_tests(filename,numtests,max_bits):  
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
    command ="./bigint_test_gcc_24 mulmodmont "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)+" "+hex(out)+"\n"
    f.write(command)
    #command ="./bigint_test_clang_24 mulmodmont "+hex(a)+" "+hex(b)+" "+hex(mod)+" "+hex(inv)+" "+hex(out)+"\n"
    #f.write(command)
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
    elif funcname=="addmod":
      generate_addmod_tests(filename,execname,numtests,256)
    elif funcname=="sub":
      generate_sub_tests(filename,execname,numtests,max_bits)
    elif funcname=="submod":
      generate_submod_tests(filename,execname,numtests,max_bits)
    elif funcname=="lessthan":
      generate_less_than_tests(filename,execname,numtests,256)
    elif funcname=="lessthanequal":
      generate_less_than_or_equal_tests(filename,execname,numtests,256)
    elif funcname=="mul":
      generate_mul_tests(filename,execname,numtests,max_bits)
    elif funcname=="div":
      generate_div_tests(filename,execname,numtests,max_bits)
    elif funcname=="square":
      generate_square_tests(filename,execname,numtests,max_bits)
    elif funcname=="montreduce":
      generate_montreduce_tests(filename,execname,numtests,max_bits)
    elif funcname=="mulmodmont":
      generate_mulmodmont_tests(filename,execname,numtests,max_bits)
    elif funcname=="mulmodmontSOS":
      generate_mulmodmontSOS_tests(filename,execname,numtests,max_bits)
    elif funcname=="mulmodmont":
      generate_mulmodmont_tests(filename,execname,numtests,max_bits)
    elif funcname=="montsquare":
      generate_montsquare_tests(filename,execname,numtests,max_bits)
    elif funcname=="mulmod_oddmod":
      generate_mulmod_oddmod_tests(filename,execname,numtests,max_bits)
    elif funcname=="multiplicative_inverse":
      generate_multiplicative_inverse_tests(filename,execname,numtests,max_bits)
    elif funcname=="compute_Nprime":
      generate_compute_Nprime_tests(filename,execname,numtests,max_bits)
    elif funcname=="compute_Nprime_experimental":
      generate_compute_Nprime_tests(filename,execname,numtests,max_bits)
    else:
      print("error: bad funcname:",funcname)


