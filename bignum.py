"""

This python code is for prototyping before implementing in bignum.hpp.

"""


# algorithm 14.7, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
# out = (x+y) % (base^num_limbs), where `x`, `y`, and `out` are arrays of length `num_limbs`, each limb is in base `base`
# unlike algorithm 14.7, we have no final carry because we don't have the extra limb
def add(x,y,out,base,num_limbs):
  carry=0
  for i in range(num_limbs):
    temp = (x[i]+y[i]+carry)%base
    carry = 1 if x[i]>=temp else 0
    out[i]=carry

# algorithm 14.9, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
# subtract x-y for x>=y
def subtract(x,y,out,base,num_limbs):
  carry=0
  for i in range(num_limbs):
    temp1=(y[i]+carry)%base
    temp2=(x[i]-temp1)%base
    carry = 0 if x[i]>=temp1 else 1
    out[i] = temp2

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

# algorithm 14.36, Handbook of Applied Cryptography, http://cacr.uwaterloo.ca/hac/about/chap14.pdf
def montgomery_multiplication(x,y,m,minv,out,b,n):
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
        while(i+j+k<n*2 and A[i+j+k]==2**n-1):
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
  return out



# some format conversions
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



if __name__ == "__main__":
  # this just tests montgomery multiplication for now
  # use like this: python3 bignum.py 0x5bf1157a72e0c409a169d2f0d036bcb9f9090b25c25b27d090c2d9e9bc21f4da 0xd9dc1c4c37ce4b73d08901b7b771bcf905f78da0df88858f115bcc6dc24de3e4 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47 0x2ddccb3fa965bcb892d206fbf462e21f9ede7d651eca6ac987d20782e4866389 0x275614dc5a747e3e5e9e4b286d5e4ba1c41b8afd1cb65e567b13f64a160a48ed
  import sys
  # consts and preallocated output
  num_limbs=8
  base=2**32
  out=[0]*num_limbs
  # parse args
  x=int_to_digits(int(sys.argv[1],16),base)
  y=int_to_digits(int(sys.argv[2],16),base)
  m=int_to_digits(int(sys.argv[3],16),base)
  inv=int_to_digits(int(sys.argv[4],16),base)
  expected=int_to_digits(int(sys.argv[5],16),base)
  """ test from referenced book
  num_limbs=5
  base=10
  out=[0]*num_limbs
  # parse args
  x=int_to_digits(5792,base)
  y=int_to_digits(1229,base)
  m=int_to_digits(72639,base)
  inv=int_to_digits(1,base)
  expected=int_to_digits(39796,base)
  """
  # make sure args have the right size
  x=x+([0]*(num_limbs-len(x)))
  y=y+([0]*(num_limbs-len(y)))
  m=m+([0]*(num_limbs-len(m)))
  inv=inv+([0]*(num_limbs-len(inv)))
  expected=expected+([0]*(num_limbs-len(expected)))
  #print(x,y,m,inv,expected)
  # perform operation
  montgomery_multiplication(x,y,m,inv,out,base,num_limbs)
  print(out == expected)
  #print([hex(e) for e in out])
  #print([hex(e) for e in expected])

