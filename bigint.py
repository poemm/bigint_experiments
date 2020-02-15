"""

This python code is for prototyping and testing, it is much slower than bigint.h.

"""

# algorithm 14.7, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
# out = (x+y) % (base^num_limbs), where `x`, `y`, and `out` are arrays of length `num_limbs`, each limb is in base `base`
# unlike algorithm 14.7, we have no final carry because we don't have the extra limb
def add(out,x,y,base,num_limbs):
  carry=0
  for i in range(num_limbs):
    temp = (x[i]+y[i]+carry)%base
    carry = 1 if x[i]>=temp else 0
    out[i]=carry

# algorithm 14.9, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
# but algorithm 14.9 uses negative numbers, which we don't support, so we modify it, needs review
# subtract x-y for x>=y
def subtract(out,x,y,base,num_limbs):
  carry=0
  for i in range(num_limbs):
    tmp1 = (x[i]-carry)%base
    out[i] = (tmp1-y[i])%base
    carry = 1 if tmp1<y[i] or x[i]<carry else 0


# algorithm 14.12, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
# but assume they both have the same number of limbs, this can be changed
# out should have double the limbs of inputs
# num_limbs corresponds to n+1 in the book
def mul(out,x,y,base,num_limbs):
  w = out
  for i in range(2*num_limbs):
    w[i]=0
  for i in range(num_limbs):
    c = 0
    for j in range(num_limbs):
      #print(i,j,c)
      uv = w[i+j] + x[j]*y[i] + c
      w[i+j] = uv % base
      c = uv // base
      #print(hex(x[j]*y[i]),c,hex(w[i+j]))
      #print(w)
    w[i+num_limbs] = c
    #print(w)


# less-than operator <
def less_than(x,y,num_limbs):
  for i in range(num_limbs-1,-1,-1):
    if x[i]>y[i]:
      return False
    elif x[i]<y[i]:
      return True
  return True

# less-than or equal operator <=
def less_than_or_equal(x,y,num_limbs):
  for i in range(num_limbs-1,-1,-1):
    if x[i]>y[i]:
      return False
    elif x[i]<y[i]:
      return True
  return False

# algorithm 14.16, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def square(out,x,b,t):
  w = out
  for i in range(2*t):
    w[i]=0
  for i in range(t):
    uv = w[2*i]+x[i]*x[i]
    u = uv // b
    v = uv % b
    w[2*i] = v
    c = u
    for j in range(i+1,t):
      uv = w[i+j]+2*x[j]*x[i]+c
      u = uv // b
      v = uv % b
      w[i+j] = v
      c = u
    w[i+t] = u


######################
# Modular arithmetic #
######################

# add two numbers modulo another number, a+b (mod m)
# algorithm 14.27, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def addmod(out,x,y,m,base,num_limbs):
  add(out,x,y,base,num_limbs)
  if less_than_or_equal(m,out,num_limbs):
    subtract(out,m,out,base,num_limbs)

# compute x-y (mod m) for x>=y
# algorithm 14.27, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def subtractmod(out,x,y,m,base,num_limbs):
  #  the book referenced says that this is the same as submod
  subtract(out,x,y,base,num_limbs)

# algorithm 14.32, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def montgomery_reduction(out,T,m,minv,b,n):
  A = T+([0]*(2*n-len(T)))
  for i in range(n):
    ui = (A[i]*minv[0]) % b
    carry=0
    for j in range(n):
      uimj = ui*m[j]
      sum_ = (A[i+j] + uimj + carry)%(b*b)
      A[i+j] = sum_ % b
      carry = sum_ // b
      #print(i,j,hex(A[i+j]),hex(carry))
    # carry may be nonzero, so keep carrying
    k=1
    while carry and i+j+k<2*n:
      #print(i+j+k, 2*n)
      sum_ = (A[i+j+k]+carry)%(b*b)
      A[i+j+k] = sum_ % b
      carry = sum_ // b
      k+=1
    #print("A:", [hex(a) for a in A])
  # instead of right shift, just discard lower limbs which are 0's anyway
  for i in range(n):
    out[i]=A[i+n]
  #print("out before final sub:",[hex(o) for o in out])
  # possible final subtraction
  if less_than_or_equal(m,out,n):
    subtract(out,m,out,b,n)
  

# algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def montgomery_multiplication(out,x,y,m,minv,b,n):
  A=[0]*2*n
  for i in range(n):
    ui = (((A[i]+(x[i]*y[0])%b)%b)*minv[0]) % b
    carry=0
    for j in range(n):
      xiyj = x[i]*y[j]
      uimj = ui*m[j]
      partial_sum = xiyj + carry + A[i+j]
      sum_ = (uimj + partial_sum)%(b*b)
      A[i+j] = sum_ % b
      carry = sum_ // b
      # if there was overflow in the sum
      if sum_<partial_sum:
        k=2
        while(i+j+k<n*2 and A[i+j+k]==b**n-1):
          A[i+j+k]=0
          k+=1
        if i+j+k<n*2:
          A[i+j+k]+=1
      #print(i,j,x[i],(x[i]*y[0])%b,ui,xiyj,uimj,partial_sum,sum_,A[i+j],carry)
    A[i+n]+=carry # this doesn't overflow, but remember to init A[:] to 0's
    #print("i:",i,x[i],x[i]*y[0],ui,x[i]*digits_to_int(y,b),ui*digits_to_int(m,b),digits_to_int(A,b))
  # instead of right shift, just discard lower limbs which are 0's anyway
  for i in range(n):
    out[i]=A[i+n]
  # possible final subtraction
  if less_than_or_equal(m,out,n):
    out = subtract(out,m,out,b,n)


# algorithm 14.16 followed by 14.32
# this might be faster than algorithm 14.36
def montgomery_square(out,x,m,minv,b,n):
  out_internal = [0]*2*n
  square(out_internal,x,b,n)
  montgomery_reduction(out,out_internal,m,minv,b,n)



###########################
# some format conversions #
###########################

def int_to_digits(bigint, base):
  digits=[]
  while bigint>0:
    digits += [bigint%base]
    bigint = bigint//base
  return digits

def digits_to_int(digits, base):
  bigint = 0
  num_digits = len(digits)
  for i in range(num_digits):
     bigint += digits[i] * base**i
  return bigint


# pre-compute parameter modinv for montgomery reduction
# compute m' st m'm = -1 mod base, ie -m^{-1} mod base
# ref: fast inverse trick: https://cp-algorithms.com/algebra/montgomery_multiplication.html
# test: 351579423 == compute_minus_m_inv_mod_r(1469411617,2**32)
def compute_minus_m_inv_mod_base(m,base):
  x=1
  x_prev=0
  while x != x_prev:
    # n iters for base 2^n, eg 5 iters for 32-bit, 8 iters for 256-bit
    x_prev=x
    x = (x*(2+x*m))%base
  return x


#########
# tests #
#########

def test_mont_reduce():
  num_limbs=5
  base=10
  out=[0]*num_limbs
  # parse args
  T=int_to_digits(7118368,base)
  m=int_to_digits(72639,base)
  inv=int_to_digits(1,base)
  expected=int_to_digits(39796,base)
  # make sure args have the right size
  T=T+([0]*(2*num_limbs-len(T)))
  m=m+([0]*(num_limbs-len(m)))
  inv=inv+([0]*(num_limbs-len(inv)))
  expected=expected+([0]*(num_limbs-len(expected)))
  #print(x,y,m,inv,expected)
  # perform operation
  montgomery_reduction(out,T,m,inv,base,num_limbs)
  print(out == expected)
  #print([hex(e) for e in out])
  #print([hex(e) for e in expected])

def test_mul():
  num_limbs=4
  base=10
  out=[0]*num_limbs*2
  # parse args
  x=int_to_digits(9274,base)
  y=int_to_digits(847,base)
  expected=int_to_digits(7855078,base)
  # make sure args have the right size
  x=x+([0]*(2*num_limbs-len(x)))
  y=y+([0]*(2*num_limbs-len(y)))
  expected=expected+([0]*(2*num_limbs-len(expected)))
  #print(x,y,m,inv,expected)
  # perform operation
  mul(out,x,y,base,num_limbs)
  print(out == expected)
  #print([hex(e) for e in out])
  #print([hex(e) for e in expected])

def test_square():
  num_limbs=3
  base=10
  out=[0]*num_limbs*2
  # parse args
  x=int_to_digits(989,base)
  expected=int_to_digits(978121,base)
  # make sure args have the right size
  x=x+([0]*(2*num_limbs-len(x)))
  expected=expected+([0]*(num_limbs-len(expected)))
  #print(x,y,m,inv,expected)
  # perform operation
  square(out,x,base,num_limbs)
  print(out == expected)
  #print([hex(e) for e in out])
  #print([hex(e) for e in expected])

def test_subtract():
  num_limbs=5
  base=10
  out_=[0]*num_limbs
  # parse args
  import random
  a=random.randint(0,base**num_limbs-1)
  b=random.randint(0,base**num_limbs-1)
  if a<b:
    a,b=b,a
  a_=int_to_digits(a,base)
  b_=int_to_digits(b,base)
  expected_=int_to_digits(a-b,base)
  # make sure args have the right size
  a_=a_+([0]*(num_limbs-len(a_)))
  b_=b_+([0]*(num_limbs-len(b_)))
  expected_=expected_+([0]*(num_limbs-len(expected_)))
  # perform operation
  subtract(out_,a_,b_,base,num_limbs)
  flag = out_ == expected_
  print(out_ == expected_)
  #if out_ != expected_:
  print(a_)
  print(b_)
  print(out_)
  print(expected_)

def test_montmul():
  # test from referenced book
  num_limbs=5
  base=10
  out=[0]*num_limbs
  # parse args
  x=int_to_digits(5792,base)
  y=int_to_digits(1229,base)
  m=int_to_digits(72639,base)
  inv=int_to_digits(1,base)
  expected=int_to_digits(39796,base)
  # make sure args have the right size
  x=x+([0]*(num_limbs-len(x)))
  y=y+([0]*(num_limbs-len(y)))
  m=m+([0]*(num_limbs-len(m)))
  inv=inv+([0]*(num_limbs-len(inv)))
  expected=expected+([0]*(num_limbs-len(expected)))
  #print(x,y,m,inv,expected)
  # perform operation
  montgomery_multiplication(out,x,y,m,inv,base,num_limbs)
  print(out == expected)




if __name__ == "__main__":
  # this just tests montgomery multiplication for now
  # use like this: python3 bigint.py montmul 0x5bf1157a72e0c409a169d2f0d036bcb9f9090b25c25b27d090c2d9e9bc21f4da 0xd9dc1c4c37ce4b73d08901b7b771bcf905f78da0df88858f115bcc6dc24de3e4 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47 0x2ddccb3fa965bcb892d206fbf462e21f9ede7d651eca6ac987d20782e4866389 0x275614dc5a747e3e5e9e4b286d5e4ba1c41b8afd1cb65e567b13f64a160a48ed
  #test_mul()
  #test_montmul()
  import sys
  # consts and preallocated output
  if len(sys.argv)<2:
    print("first arg is test name")
    exit()
  if sys.argv[1]=="montmul":
    num_limbs=8
    base=2**32
    out=[0]*num_limbs
    # parse args
    x=int_to_digits(int(sys.argv[2],16),base)
    y=int_to_digits(int(sys.argv[3],16),base)
    m=int_to_digits(int(sys.argv[4],16),base)
    inv=int_to_digits(int(sys.argv[5],16),base)
    expected=int_to_digits(int(sys.argv[6],16),base)
    # make sure args have the right size
    x=x+([0]*(num_limbs-len(x)))
    y=y+([0]*(num_limbs-len(y)))
    m=m+([0]*(num_limbs-len(m)))
    inv=inv+([0]*(num_limbs-len(inv)))
    expected=expected+([0]*(num_limbs-len(expected)))
    #print(x,y,m,inv,expected)
    # perform operation
    montgomery_multiplication(out,x,y,m,inv,base,num_limbs)
    print(out==expected,out,expected)
    #print([hex(e) for e in out])
    #print([hex(e) for e in expected])
  if sys.argv[1]=="mul":
    num_limbs=4
    base=2**64
    out=[0]*2*num_limbs
    # parse args
    x=int_to_digits(int(sys.argv[2],16),base)
    y=int_to_digits(int(sys.argv[3],16),base)
    expected=int_to_digits(int(sys.argv[4],16),base)
    # make sure args have the right size
    x=x+([0]*(num_limbs-len(x)))
    y=y+([0]*(num_limbs-len(y)))
    expected=expected+([0]*(2*num_limbs-len(expected)))
    #print(x,y,m,inv,expected)
    # perform operation
    mul(out,x,y,base,num_limbs)
    print(out==expected,out,expected)
    #print([hex(e) for e in out])
    #print([hex(e) for e in expected])
  if sys.argv[1]=="square":
    num_limbs=4
    base=2**64
    out=[0]*2*num_limbs
    # parse args
    x=int_to_digits(int(sys.argv[2],16),base)
    expected=int_to_digits(int(sys.argv[3],16),base)
    # make sure args have the right size
    x=x+([0]*(num_limbs-len(x)))
    expected=expected+([0]*(2*num_limbs-len(expected)))
    #print(x,y,m,inv,expected)
    # perform operation
    square(out,x,base,num_limbs)
    print(out==expected,out,expected)
    #print([hex(e) for e in out])
    #print([hex(e) for e in expected])
  if sys.argv[1]=="montreduce":
    num_limbs=4
    base=2**64
    out=[0]*num_limbs
    # parse args
    x=int_to_digits(int(sys.argv[2],16),base)
    m=int_to_digits(int(sys.argv[3],16),base)
    inv=int_to_digits(int(sys.argv[4],16),base)
    expected=int_to_digits(int(sys.argv[5],16),base)
    # make sure args have the right size
    x=x+([0]*(num_limbs-len(x)))
    m=m+([0]*(num_limbs-len(m)))
    inv=inv+([0]*(num_limbs-len(inv)))
    expected=expected+([0]*(num_limbs-len(expected)))
    #print(x,y,m,inv,expected)
    # perform operation
    montgomery_reduction(out,x,m,inv,base,num_limbs)
    print(out==expected,[hex(o) for o in out],[hex(e) for e in expected])
    #print([hex(e) for e in out])
    #print([hex(e) for e in expected])
  if sys.argv[1]=="montsquare":
    num_limbs=4
    base=2**64
    out=[0]*num_limbs
    # parse args
    x=int_to_digits(int(sys.argv[2],16),base)
    m=int_to_digits(int(sys.argv[3],16),base)
    inv=int_to_digits(int(sys.argv[4],16),base)
    expected=int_to_digits(int(sys.argv[5],16),base)
    # make sure args have the right size
    x=x+([0]*(num_limbs-len(x)))
    m=m+([0]*(num_limbs-len(m)))
    inv=inv+([0]*(num_limbs-len(inv)))
    expected=expected+([0]*(num_limbs-len(expected)))
    #print(x,y,m,inv,expected)
    # perform operation
    montgomery_square(out,x,m,inv,base,num_limbs)
    print(out==expected,[hex(o) for o in out],[hex(e) for e in expected])
    #print([hex(e) for e in out])
    #print([hex(e) for e in expected])


