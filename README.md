`bignum.h` (translated from `bignum.py`) is a library for the following bignum arithmetic over integers:
 - addition without an extra carry limb
 - subtraction for lhs>=rhs
 - comparisons < and <=
 - montogmery multiplication

## Goals of this library
 - Support arbitrarily many limbs and multiple limb sizes. For example, newer architectures support multiplication like u64xu64->u128, but we also support u32xu32->u64 for compatibility with things like Wasm 1.0.
 - The Python code is C-like and used for prototyping and testing before porting to C.
 - Spec-based. The code cites where the algorithms were found.
 - A simple baseline for optimizations -- no bit-twiddling or unclear tricks.

## How to use

See comments in `bignum.h` and `bignum.py`. But here is a quick demo:
```
// in myprogram.c
#define BIGINT_BITS 256
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64
#include "bignum.h"
montmul256_32bitlimbs(x,y,m,inv,out);

// compile:
gcc myprogram.c -o myprogram -w -I/path/to/header/file's/directory
./myprogram
```

## Some notes
 - The limb types and numbers of limbs must be known at compile-time.
 - Computation is little-endian wrt limbs i.e. least-significant limb first. It is possible to overhaul the code indices to be big-endian.

