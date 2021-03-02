
default: bench

#compiler := gcc
compiler := clang

num_tests := 5
num_iters := 100000

asm_files := ../asm/mulmodmont384.x86_64.S
extra := $(asm_files) -O3 -march=native


test_random_inputs:
	# 256-bit tests
	${compiler} test_and_bench.c $(extra) -o test256 -w -DNUMLIMBS=4 -DNUM_ITERS=1
	python3 generate_tests.py sub 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py submod 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py lessthan 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py lessthanequal 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py mul 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py div 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py mulmodmont 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py mulmodmontSOS 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py montsquare 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py square 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py montreduce 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py add 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py addmod 256 tests_generated.sh ./test256 $(num_tests)
	python3 generate_tests.py compute_Nprime 256 tests_generated.sh ./test256 $(num_tests)
	
	${compiler} test_and_bench.c $(extra) -o test384 -w -DNUMLIMBS=6 -DNUM_ITERS=1
	python3 generate_tests.py mulmodmont 384 tests_generated.sh ./test384 $(num_tests)
	python3 generate_tests.py compute_Nprime 384 tests_generated.sh ./test384 $(num_tests)
	
	${compiler} test_and_bench.c $(extra) -o test512 -w -DNUMLIMBS=8 -DNUM_ITERS=1
	python3 generate_tests.py mulmodmont 512 tests_generated.sh ./test512 $(num_tests)
	python3 generate_tests.py compute_Nprime 512 tests_generated.sh ./test512 $(num_tests)
	
	bash tests_generated.sh
	rm tests_generated.sh test256 test384 test512

test_edge_cases:
	bash tests_edge_cases.sh


test_compute_Nprime_experimental:
	${compiler} test_and_bench.c $(extra) -o test256 -w -DNUMLIMBS=4 -DNUM_ITERS=1
	python3 generate_tests.py compute_Nprime 256 tests_generated.sh ./test256 1000
	bash tests_generated.sh
	#rm tests_generated.sh test256


bench_compute_Nprime:
	bash bench_growing_bitwidths.sh compute_Nprime

bench_compute_Nprime_experimental:
	bash bench_growing_bitwidths.sh compute_Nprime_experimental

bench_mulmodmont:
	bash bench_growing_bitwidths.sh mulmodmont 

