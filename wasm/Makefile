#
#    Copyright 2019 Paul Dworzanski et al.
#
#    This file is part of c_ewasm_contracts.
#
#    c_ewasm_contracts is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    c_ewasm_contracts is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with c_ewasm_contracts.  If not, see <https://www.gnu.org/licenses/>.
#


# all of the following constants can be passed as command-line arguments to make

# paths to tools
#export LLVM_DIR := 
#export WABT_DIR := 
#export BINARYEN_DIR := 
#export LLVM_DIR := llvm-project/build/bin/
#export WABT_DIR := wabt/bin/
#export BINARYEN_DIR := binaryen/build/bin/
export LLVM_DIR := ~/repos/llvm/llvm10/llvm-project/build/bin/
#export WABT_DIR := ~/repos/wabt/wabt-1.0.12/
export WABT_DIR := ~/repos/wabt/wabt/build/
export BINARYEN_DIR := ~/repos/binaryen/binaryen-1.37.35/

# compiler flags
export OPTIMIZATION_CLANG := -O3        #-Oz, -Os, -O0, -O1, -O2, or -O3
export OPTIMIZATION_OPT := -O3          #-Oz, -Os, -O0, -O1, -O2, or -O3
export OPTIMIZATION_LLC := -O3          #          -O0, -O1, -O2, or -O3
export OPTIMIZATION_WASM_LD := -O3      #          -O0, -O1, or -O2 # see docs, this has to do with string merging, dont think it affects wasm
export OPTIMIZATION_BINARYEN := -O3     #-Oz, -Os, -O0, -O1, -O2, or -O3
export EXPORTS :=      # this will be is an arg to wasm-ld
export SOURCE := 	# any extra source files, other than bigint.h

# these are for #defines in bigint.h
export BIGINT_BITS := 256
export LIMB_BITS := 32
export LIMB_BITS_OVERFLOW := 64

# this is the name of the current thing being compiled
export PROJECT := montmul





# this is the main compilation recipe
project:
	# build
	$(LLVM_DIR)/clang -cc1 $(OPTIMIZATION_CLANG) -emit-llvm -triple=wasm32-unknown-unknown-wasm -DBIGINT_BITS=$(BIGINT_BITS) -DLIMB_BITS=$(LIMB_BITS) -DLIMB_BITS_OVERFLOW=$(LIMB_BITS_OVERFLOW) -DWASM=1 ../bigint.h $(SOURCE) -o $(PROJECT).ll
	$(LLVM_DIR)/opt $(OPTIMIZATION_OPT) $(PROJECT).ll -o $(PROJECT).ll
	$(LLVM_DIR)/llc $(OPTIMIZATION_LLC) -filetype=obj $(PROJECT).ll -o $(PROJECT).o
	$(LLVM_DIR)/wasm-ld $(OPTIMIZATION_WASM_LD) $(PROJECT).o -o $(PROJECT).wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a $(EXPORTS)
	# done compiling, save text version
	$(WABT_DIR)wasm2wat $(PROJECT).wasm > $(PROJECT).wat
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPTIMIZATION_BINARYEN) $(PROJECT).wasm -o $(PROJECT).wasm -g #-g keeps names but takes some size
	# save final text format
	$(WABT_DIR)wasm2wat $(PROJECT).wasm > $(PROJECT).wat
	# remove intermediate files
	rm -f $(PROJECT).ll $(PROJECT).o



#####
# mul

mul:
	make project \
	PROJECT=mul$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs \
	EXPORTS="-export=mul$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs"

mul256_32bitlimbs:
	make mul \
	BIGINT_BITS=256 \
	LIMB_BITS=32 \
	LIMB_BITS_OVERFLOW=64 

mul256_64bitlimbs:
	make mul \
	BIGINT_BITS=256 \
	LIMB_BITS=64 \
	LIMB_BITS_OVERFLOW=128 

mul_all: mul256_32bitlimbs mul256_64bitlimbs



#########
# montmul

montmul:
	make project \
	PROJECT=montmul$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs \
	EXPORTS="-export=montmul$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs"

montmul256_32bitlimbs:
	make montmul \
	BIGINT_BITS=256 \
	LIMB_BITS=32 \
	LIMB_BITS_OVERFLOW=64 

montmul256_64bitlimbs:
	make montmul \
	BIGINT_BITS=256 \
	LIMB_BITS=64 \
	LIMB_BITS_OVERFLOW=128 

montmul_all: montmul256_32bitlimbs montmul256_64bitlimbs



############
# montsquare

montsquare:
	make project \
	PROJECT=montsquare$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs \
	EXPORTS="-export=montsquare$(BIGINT_BITS)_$(LIMB_BITS)bitlimbs"

montsquare256_32bitlimbs:
	make montsquare \
	BIGINT_BITS=256 \
	LIMB_BITS=32 \
	LIMB_BITS_OVERFLOW=64 

montsquare256_64bitlimbs:
	make montsquare \
	BIGINT_BITS=256 \
	LIMB_BITS=64 \
	LIMB_BITS_OVERFLOW=128 

montsquare_all: montsquare256_32bitlimbs montsquare256_64bitlimbs




################
# benchmarking #
################

# to create make a new benchmark, add it here and in bench.c

montmul256_32bitlimbs_bench:
	make project \
	PROJECT=montmul256_32bitlimbs_bench \
	SOURCE=bench.c \
	EXPORTS="-export=montmul256_64bitlimbs_bench"
	time -v $(WABT_DIR)/wasm-interp montmul256_64bitlimbs_bench.wasm --run-all-exports

montmul256_64bitlimbs_bench:
	make project \
	PROJECT=montmul256_64bitlimbs_bench \
	SOURCE=bench.c \
	EXPORTS="-export=montmul256_64bitlimbs_bench"
	time -v $(WABT_DIR)/wasm-interp montmul256_32bitlimbs_bench.wasm --run-all-exports

montmul768_32bitlimbs_bench:
	make project \
	PROJECT=montmul768_32bitlimbs_bench \
	SOURCE=bench.c \
	EXPORTS="-export=montmul768_32bitlimbs_bench"
	time -v $(WABT_DIR)/wasm-interp montmul768_32bitlimbs_bench.wasm --run-all-exports

montmul768_64bitlimbs_bench:
	make project \
	PROJECT=montmul768_64bitlimbs_bench \
	SOURCE=bench.c \
	EXPORTS="-export=montmul768_64bitlimbs_bench"
	time -v $(WABT_DIR)/wasm-interp montmul768_64bitlimbs_bench.wasm --run-all-exports

bench_all: montmul256_32bitlimbs_bench montmul256_64bitlimbs_bench montmul768_32bitlimbs_bench montmul768_64bitlimbs_bench



#################
# make everything
#

all: mul_all montmul_all montsquare_all

clean:
	rm *.ll *.o *.wasm *.wat

