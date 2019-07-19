



#include "libc.h"


#define WASM 1

#define BIGINT_BITS 256
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64 
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 32
#define LIMB_BITS_OVERFLOW 64
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 256
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

#define BIGINT_BITS 768
#define LIMB_BITS 64
#define LIMB_BITS_OVERFLOW 128
#include "../bignum.h"
#undef BIGINT_BITS
#undef LIMB_BITS
#undef LIMB_BITS_OVERFLOW

