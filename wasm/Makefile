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


# all of these exports can be passed as command-line arguments to make

# paths to tools
export LLVM := /home/user/repos/llvm9/llvm-project/build/bin/
#export LLVM := llvm-project/build/bin
#export LLVM := 
export WABT_DIR := ~/repos/wabt/wabt-1.0.10/
export BINARYEN_DIR := ~/repos/binaryen/binaryen-version_81/

export OPTIMIZATION_CLANG := -Oz        #-Oz, -Os, -O0, -O1, -O2, or -O3
export OPTIMIZATION_OPT := -Oz          #-Oz, -Os, -O0, -O1, -O2, or -O3
export OPTIMIZATION_LLC := -O3          #          -O0, -O1, -O2, or -O3
export OPTIMIZATION_WASM_LD := -O2      #          -O0, -O1, or -O2 # see docs, this has to do with string merging, dont think it affects wasm
export OPTIMIZATION_BINARYEN := -Oz     #-Oz, -Os, -O0, -O1, -O2, or -O3

export EXPORTS :=      # this will be is an arg to wasm-ld

default: montmul_all

# dependencies checks and installation

wabt-install:
	git clone https://github.com/webassembly/wabt.git
	mkdir wabt/build
	cd wabt/build; cmake .. -DBUILD_TESTS=OFF
	cd wabt/build; make -j4
	touch wabt.READY

binaryen-install:
	git clone https://github.com/WebAssembly/binaryen.git
	cd binaryen; mkdir build
	cd binaryen/build; cmake ..
	cd binaryen/build; make -j4

llvm-install:
	# WARNING: should do this manually. Downloads a lot, requires a lot of system resources, and takes a long time. Might require restarting with `make` again if compilation has an error.
	git clone https://github.com/llvm/llvm-project.git
	cd llvm-project; mkdir build
	cd llvm-project/build; cmake -G 'Unix Makefiles' -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lld" ../llvm
	cd llvm-project/build; make -j4

install: wabt-install binaryen-install pywebassembly-install
	#WARNING: this does not include llvm-install because this should be done manually

wabt-check:
ifeq (, $(shell which $(WABT_DIR)/wasm2wat))
	$(error "ERROR: Could not find wabt with wasm2wat, install it yourself and adjust path WABT_DIR in this makefile, or just install it with `make wabt-install`, and try again.")
endif

binaryen-check:
ifeq (, $(shell which $(BINARYEN_DIR)wasm-opt))
	$(error "ERROR: Could not find binaryen with wasm-dis, install it yourself and adjust path BINARYEN_DIR in this makefile, or just install it with `make binaryen-install`, and try again.")
endif

export LLVM_ERROR := "ERROR: Could not find llvm8+, install it yourself and adjust path LLVM_DIR in this makefile. It can also be found in some repositories. Install it yourself with `make llvm-install`, but this may fail and you should do it manually. WARNNG: 600MB+ download size, needs lots of RAM/disk to compile, compilation may fail the first try so need to restart multiple times.")

llvm-check:
ifeq (, $(shell which $(LLVM)clang))
	$(error $(LLVM_ERROR))
endif
ifeq (, $(shell which $(LLVM)opt))
	$(error $(LLVM_ERROR))
endif
ifeq (, $(shell which $(LLVM)lld))
	$(error $(LLVM_ERROR))
endif
ifeq (, $(shell which $(LLVM)wasm-ld))
	$(error $(LLVM_ERROR))
endif



###############
# montmul stuff
#

montmul:
	# build
	$(LLVM)clang -cc1 $(OPTIMIZATION_CLANG) -emit-llvm -triple=wasm32-unknown-unknown-wasm montmul.c -o montmul.ll
	$(LLVM)opt $(OPTIMIZATION_OPT) montmul.ll -o montmul.ll
	$(LLVM)llc $(OPTIMIZATION_LLC) -filetype=obj montmul.ll -o montmul.o
	# get builtin __multi3() to link against
ifeq (, $(shell if [ -e lib/wasi/libclang_rt.builtins-wasm32.a ] ; then echo blah ; fi;))
	wget https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-5/libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
	tar -xvzf libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
endif
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=montmul256_32bitlimbs -export=montmul768_32bitlimbs -export=montmul256_64bitlimbs -export=montmul768_64bitlimbs -export=_main
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main256_32bitlimbs
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main256_64bitlimbs
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main768_32bitlimbs
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main768_64bitlimbs
	$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a $(EXPORTS)
	# done compiling, save text version
	$(WABT_DIR)wasm2wat montmul.wasm > montmul.wat
	#$(WABT_DIR)wat2wasm montmul.wat > montmul.wasm
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPTIMIZATION_BINARYEN) montmul.wasm -o montmul_optimized.wasm -g #-g keeps names but takes some size
	# save text format of final ewasm contract
	$(WABT_DIR)wasm2wat montmul_optimized.wasm > montmul_optimized.wat
	# save everything to wasm directory
	# remove intermediate files
	rm -f montmul.ll montmul.o montmul.wasm montmul.wat

montmul_size_optimized:
	make montmul \
	OPTIMIZATION_CLANG=-Oz \
	OPTIMIZATION_OPT=-Oz \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O2 \
	OPTIMIZATION_BINARYEN=-Oz \
	EXPORTS="-export=montmul256_32bitlimbs -export=montmul768_32bitlimbs -export=montmul256_64bitlimbs -export=montmul768_64bitlimbs"
	mv montmul_optimized.wasm montmul_size_optimized.wasm
	mv montmul_optimized.wat montmul_size_optimized.wat

montmul_speed_optimized:
	make montmul \
	OPTIMIZATION_CLANG=-O3 \
	OPTIMIZATION_OPT=-O3 \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O3 \
	OPTIMIZATION_BINARYEN=-O3 \
	EXPORTS="-export=montmul256_32bitlimbs -export=montmul768_32bitlimbs -export=montmul256_64bitlimbs -export=montmul768_64bitlimbs"
	mv montmul_optimized.wasm montmul_speed_optimized.wasm
	mv montmul_optimized.wat montmul_speed_optimized.wat

montmul_unoptimized:
	make montmul \
	OPTIMIZATION_CLANG=-O0 \
	OPTIMIZATION_OPT=-O0 \
	OPTIMIZATION_LLC=-O0 \
	OPTIMIZATION_WASM_LD=-O0 \
	OPTIMIZATION_BINARYEN=-O0 \
	EXPORTS="-export=montmul256_32bitlimbs -export=montmul768_32bitlimbs -export=montmul256_64bitlimbs -export=montmul768_64bitlimbs"
	mv montmul_optimized.wasm montmul_unoptimized.wasm
	mv montmul_optimized.wat montmul_unoptimized.wat

montmul_all: montmul_speed_optimized montmul_size_optimized montmul_unoptimized


#####################
# montmul_bench stuff
#

montmul_bench:
	# build
	$(LLVM)clang -cc1 $(OPTIMIZATION_CLANG) -emit-llvm -triple=wasm32-unknown-unknown-wasm montmul_bench.c -o montmul_bench.ll
	$(LLVM)opt $(OPTIMIZATION_OPT) montmul_bench.ll -o montmul_bench.ll
	$(LLVM)llc $(OPTIMIZATION_LLC) -filetype=obj montmul_bench.ll -o montmul_bench.o
	# get builtin __multi3() to link against
ifeq (, $(shell if [ -e lib/wasi/libclang_rt.builtins-wasm32.a ] ; then echo blah ; fi;))
	wget https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-5/libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
	tar -xvzf libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
endif
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main256_32bitlimbs
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main256_64bitlimbs
	#$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul.o -o montmul.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=_main768_32bitlimbs
	$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montmul_bench.o -o montmul_bench.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a $(EXPORTS)
	# done compiling, save text version
	$(WABT_DIR)wasm2wat montmul_bench.wasm > montmul_bench.wat
	#$(WABT_DIR)wat2wasm montmul_bench.wat > montmul_bench.wasm
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPTIMIZATION_BINARYEN) montmul_bench.wasm -o montmul_bench_optimized.wasm -g #-g keeps names but takes some size
	# save text format of final ewasm contract
	$(WABT_DIR)wasm2wat montmul_bench_optimized.wasm > montmul_bench_optimized.wat
	# save everything to wasm directory
	# remove intermediate files
	rm -f montmul_bench.ll montmul_bench.o montmul_bench.wasm montmul_bench.wat


montmul_bench_size_optimized:
	make montmul_bench \
	OPTIMIZATION_CLANG=-Oz \
	OPTIMIZATION_OPT=-Oz \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O2 \
	OPTIMIZATION_BINARYEN=-Oz

montmul_bench_speed_optimized:
	make montmul_bench \
	OPTIMIZATION_CLANG=-O3 \
	OPTIMIZATION_OPT=-O3 \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O3 \
	OPTIMIZATION_BINARYEN=-O3 

montmul_bench_unoptimized:
	make montmul_bench \
	OPTIMIZATION_CLANG=-O0 \
	OPTIMIZATION_OPT=-O0 \
	OPTIMIZATION_LLC=-O0 \
	OPTIMIZATION_WASM_LD=-O0 \
	OPTIMIZATION_BINARYEN=-O0 

montmul_bench_all:
	# 256 32
	make montmul_bench_unoptimized EXPORTS=-export=_main256_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_unoptimized256_32bitlimbs.wasm
	make montmul_bench_size_optimized EXPORTS=-export=_main256_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_size_optimized256_32bitlimbs.wasm
	make montmul_bench_speed_optimized EXPORTS=-export=_main256_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_speed_optimized256_32bitlimbs.wasm
	# 256 64
	make montmul_bench_unoptimized EXPORTS=-export=_main256_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_unoptimized256_64bitlimbs.wasm
	make montmul_bench_size_optimized EXPORTS=-export=_main256_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_size_optimized256_64bitlimbs.wasm
	make montmul_bench_speed_optimized EXPORTS=-export=_main256_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_speed_optimized256_64bitlimbs.wasm
	# 768 32 
	make montmul_bench_unoptimized EXPORTS=-export=_main768_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_unoptimized768_32bitlimbs.wasm
	make montmul_bench_size_optimized EXPORTS=-export=_main768_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_size_optimized768_32bitlimbs.wasm
	make montmul_bench_speed_optimized EXPORTS=-export=_main768_32bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_speed_optimized768_32bitlimbs.wasm
	# 768 64
	make montmul_bench_unoptimized EXPORTS=-export=_main768_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_unoptimized768_64bitlimbs.wasm
	make montmul_bench_size_optimized EXPORTS=-export=_main768_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_size_optimized768_64bitlimbs.wasm
	make montmul_bench_speed_optimized EXPORTS=-export=_main768_64bitlimbs
	mv montmul_bench_optimized.wasm montmul_bench_speed_optimized768_64bitlimbs.wasm
	# all sizes in one file
	make montmul_bench_unoptimized EXPORTS="-export=_main256_32bitlimbs -export=_main256_64bitlimbs -export=_main768_32bitlimbs -export=_main768_64bitlimbs"
	mv montmul_bench_optimized.wasm montmul_bench_unoptimized.wasm
	mv montmul_bench_optimized.wat montmul_bench_unoptimized.wat
	make montmul_bench_size_optimized EXPORTS="-export=_main256_32bitlimbs -export=_main256_64bitlimbs -export=_main768_32bitlimbs -export=_main768_64bitlimbs"
	mv montmul_bench_optimized.wasm montmul_bench_size_optimized.wasm
	mv montmul_bench_optimized.wat montmul_bench_size_optimized.wat
	make montmul_bench_speed_optimized EXPORTS="-export=_main256_32bitlimbs -export=_main256_64bitlimbs -export=_main768_32bitlimbs -export=_main768_64bitlimbs"
	mv montmul_bench_optimized.wasm montmul_bench_speed_optimized.wasm
	mv montmul_bench_optimized.wat montmul_bench_speed_optimized.wat


##################
# montsquare stuff
#

montsquare:
	# build
	$(LLVM)clang -cc1 $(OPTIMIZATION_CLANG) -emit-llvm -triple=wasm32-unknown-unknown-wasm montsquare.c -o montsquare.ll
	$(LLVM)opt $(OPTIMIZATION_OPT) montsquare.ll -o montsquare.ll
	$(LLVM)llc $(OPTIMIZATION_LLC) -filetype=obj montsquare.ll -o montsquare.o
	# get builtin __multi3() to link against
ifeq (, $(shell if [ -e lib/wasi/libclang_rt.builtins-wasm32.a ] ; then echo blah ; fi;))
	wget https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-5/libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
	tar -xvzf libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
endif
	$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) montsquare.o -o montsquare.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a -export=montsquare256_32bitlimbs -export=montsquare768_32bitlimbs -export=montsquare256_64bitlimbs
	# done compiling, save text version
	$(WABT_DIR)wasm2wat montsquare.wasm > montsquare.wat
	#$(WABT_DIR)wat2wasm montsquare.wat > montsquare.wasm
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPTIMIZATION_BINARYEN) montsquare.wasm -o montsquare_optimized.wasm -g #-g keeps names but takes some size
	# save text format of final ewasm contract
	$(WABT_DIR)wasm2wat montsquare_optimized.wasm > montsquare_optimized.wat
	# save everything to wasm directory
	# remove intermediate files
	rm -f montsquare.ll montsquare.o montsquare.wasm montsquare.wat

montsquare_size_optimized:
	make montsquare \
	OPTIMIZATION_CLANG=-Oz \
	OPTIMIZATION_OPT=-Oz \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O2 \
	OPTIMIZATION_BINARYEN=-Oz 
	mv montsquare_optimized.wasm montsquare_size_optimized.wasm
	mv montsquare_optimized.wat montsquare_size_optimized.wat

montsquare_speed_optimized:
	make montsquare \
	OPTIMIZATION_CLANG=-O3 \
	OPTIMIZATION_OPT=-O3 \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O3 \
	OPTIMIZATION_BINARYEN=-O3
	mv montsquare_optimized.wasm montsquare_speed_optimized.wasm
	mv montsquare_optimized.wat montsquare_speed_optimized.wat

montsquare_unoptimized:
	make montsquare \
	OPTIMIZATION_CLANG=-O0 \
	OPTIMIZATION_OPT=-O0 \
	OPTIMIZATION_LLC=-O0 \
	OPTIMIZATION_WASM_LD=-O0 \
	OPTIMIZATION_BINARYEN=-O0 
	mv montsquare_optimized.wasm montsquare_unoptimized.wasm
	mv montsquare_optimized.wat montsquare_unoptimized.wat

montsquare_all: montsquare_speed_optimized montsquare_size_optimized montsquare_unoptimized

montmul_3args:
	# build
	$(LLVM)clang -cc1 $(OPTIMIZATION_CLANG) -emit-llvm -triple=wasm32-unknown-unknown-wasm bigint.c -o bigint.ll
	$(LLVM)opt $(OPTIMIZATION_OPT) bigint.ll -o bigint.ll
	$(LLVM)llc $(OPTIMIZATION_LLC) -filetype=obj bigint.ll -o bigint.o
	# get builtin __multi3() to link against
ifeq (, $(shell if [ -e lib/wasi/libclang_rt.builtins-wasm32.a ] ; then echo blah ; fi;))
	wget https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-5/libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
	tar -xvzf libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
endif
	$(LLVM)wasm-ld $(OPTIMIZATION_WASM_LD) bigint.o -o montmul_3args.wasm --no-entry lib/wasi/libclang_rt.builtins-wasm32.a $(EXPORTS)
	# done compiling, save text version
	$(WABT_DIR)wasm2wat montmul_3args.wasm > montmul_3args.wat
	#$(WABT_DIR)wat2wasm montmul.wat > montmul.wasm
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPTIMIZATION_BINARYEN) montmul_3args.wasm -o montmul_3args_optimized.wasm -g #-g keeps names but takes some size
	# save text format of final ewasm contract
	$(WABT_DIR)wasm2wat montmul_3args_optimized.wasm > montmul_3args_optimized.wat
	# save everything to wasm directory
	# remove intermediate files
	rm -f bigint.ll bigint.o

montmul_3args_speed_optimized:
	make montmul_3args \
	OPTIMIZATION_CLANG=-O3 \
	OPTIMIZATION_OPT=-O3 \
	OPTIMIZATION_LLC=-O3 \
	OPTIMIZATION_WASM_LD=-O3 \
	OPTIMIZATION_BINARYEN=-O3 \
	EXPORTS="-export=montmul_3args_256_32bitlimbs -export=montmul_3args_256_64bitlimbs -export=montmul_3args_768_32bitlimbs -export=montmul_3args_768_64bitlimbs"


#################
# make everything
#

all: montmul_3args_speed_optimized montsquare_all montmul_bench_all montmul_all

clean:
	rm *.wasm *.wat

