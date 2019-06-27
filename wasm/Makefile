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

export OPT := -O3


default: montmul

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


# Build, convert, optimize
montmul:
	# build
	$(LLVM)clang -cc1 $(OPT) -emit-llvm -triple=wasm32-unknown-unknown-wasm montmul.c -o montmul.ll
	$(LLVM)opt $(OPT) montmul.ll -o montmul.ll
	$(LLVM)llc $(OPT) -filetype=obj montmul.ll -o montmul.o
	# get builtin __multi3() to link against
ifeq (, $(shell if [ -e lib/wasi/libclang_rt.builtins-wasm32.a ] ; then echo blah ; fi;))
	wget https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-5/libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
	tar -xvzf libclang_rt.builtins-wasm32-wasi-5.0.tar.gz
endif
	$(LLVM)wasm-ld montmul.o -o montmul.wasm --no-entry -export=montmul256_32bitlimbs -export=montmul256_64bitlimbs -export=montmul768_32bitlimbs -export=montmul768_64bitlimbs lib/wasi/libclang_rt.builtins-wasm32.a
	# done compiling, save text version
	$(WABT_DIR)wasm2wat montmul.wasm > montmul.wat
	$(WABT_DIR)wat2wasm montmul.wat > montmul.wasm
	# size optimize
	$(BINARYEN_DIR)wasm-opt $(OPT) montmul.wasm -o montmul_optimized.wasm
	# save text format of final ewasm contract
	$(WABT_DIR)wasm2wat montmul_optimized.wasm > montmul_optimized.wat
	# save everything to wasm directory
	# remove intermediate files
	rm -f montmul.ll montmul.o



clean:
	rm *.wasm *.wat

