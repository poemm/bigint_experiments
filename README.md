bignum.hpp is a header-only library for the following bignum arithmetic over integers:
  addition without an extra carry limb
  subtraction for lhs<=rhs
  comparisons < and <=
  montogmery multiplication

## Goals of this library
 - Support arbitrarily many limbs and multiple limb sizes. For example, newer architectures support multiplication like u64xu64->u128, but we also support u32xu32->u64 for compatibility with things like Wasm 1.0.
 - C-like. The only C++ feature we use is templates. This allows copy/paste/replace into C projects, or checking whether the C compiler produces faster code.
 - Spec-based. The code cites where the algorithms were found.
 - A baseline for optimizations.

## How to use
```
#include "bigint.hpp"
montgomery_multiplication<uint64_t,uint128_t,4>(x,y,m,inv,out);
// How to compile:
g++ myprogram.cpp -o myprogram -w -I/path/to/header/file's/directory
./myprogram
```

## Use notes
 - The limb types and numbers of limbs must be known at compile-time for C++ templates.
 - Computation is little-endian wrt limbs i.e. least-significant limb first. It is possible to overhaul the code indices to be big-endian.

