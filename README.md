`bigint.h` (and `bigint.py`) is a library for the following bigint arithmetic:
 - addition returning overflow bit and modular addition
 - subtraction returning underflow bit and modular subtraction
 - comparisons < and <=
 - squaring
 - montgomery reduction
 - montgomery squaring
 - montgomery multiplication

## Goals of this library
 - Support arbitrarily many limbs and multiple limb sizes. For example, newer architectures support multiplication like u64xu64->u128, but we also support u32xu32->u64 for compatibility with things like Wasm32.
 - The Python code is C-like and used for prototyping and testing before porting to C. (But the Python code has fallen behind and has bugs.)
 - Spec-based. The code cites where the algorithms were found. (But deviation is necessary sometimes.)
 - A simple baseline for optimizations -- no bit-twiddling or unclear tricks.

## How to use

See comments in `bigint.h` and `bigint.py`. But here is a quick demo:
```
// in myprogram.c
#define BIGINT_BITS 256
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64
#include "bigint.h"

mulmodmont256_32bitlimbs(out,x,y,m,inv);
```

To apply preprocessor macros and get code for a specific number of bits and limb size:
```
gcc -E -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 bigint.h -o bigint_.h
```

## Some notes
 - The limb types and numbers of limbs must be known at compile-time.
 - Computation is little-endian wrt limbs i.e. least-significant limb first. It is possible to overhaul the code indices to be big-endian.

