`bigint.h` (and `bigint.py`) is a library for the following bigint arithmetic:
 - addition returning overflow bit and modular addition
 - subtraction returning underflow bit and modular subtraction
 - comparisons < and <=
 - squaring
 - montgomery reduction
 - montgomery squaring
 - montgomery multiplication (FIOS, CIOS, SOS, HAC)
 - generalized euclidean algorithm for finding GCD

## Goals of this library
 - Support arbitrary bitwidth.
 - The Python code is C-like and used for prototyping and testing before porting to C. (But the Python code has fallen behind and has bugs.)
 - Spec-based. The code cites where the algorithms were found. (But deviation is necessary sometimes.)
 - A simple baseline for optimizations -- no bit-twiddling or unclear tricks.

## How to use
See comment at top of `bigint.h` and `bigint.py`.

## Some notes
 - bigint.h benefits greatly from hardware instructions for multiplication u64xu64->u128. But compilers will convert this to multiple u32xu32->u64, for compatibility with things like Wasm.
 - The numbers of limbs must be known at compile-time, allowing loop unrolling.
 - Computation is little-endian wrt limbs i.e. least-significant limb first. It is possible to overhaul to be big-endian.

