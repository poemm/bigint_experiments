
default: bench




#compiler := gcc
compiler := clang

num_tests := 2

test:
	# 256-bit tests
	${compiler} test_and_bench.c -o test256_32 -w -DBIGINT_BITS=256 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64 -DNUM_ITERS=1
	${compiler} test_and_bench.c -o test256_64 -w -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 -DNUM_ITERS=1
	python3 generate_tests.py add 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py add 256 tests.sh ./test256_64 $(num_tests)
	python3 generate_tests.py subtract 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py subtract 256 tests.sh ./test256_64 $(num_tests)
	python3 generate_tests.py lessthan 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py lessthan 256 tests.sh ./test256_64 $(num_tests)
	python3 generate_tests.py lessthanequal 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py lessthanequal 256 tests.sh ./test256_64 $(num_tests)
	python3 generate_tests.py mul 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py mul 256 tests.sh ./test256_64 $(num_tests)
	python3 generate_tests.py montmul 256 tests.sh ./test256_32 $(num_tests)
	python3 generate_tests.py montmul 256 tests.sh ./test256_64 $(num_tests)
	bash tests.sh
	rm tests.sh


bench_montmul:
	echo ---------------------------------
	echo montgomery multiplication 256-bit as 32-bit limbs 100000 iters
	${compiler} test_and_bench.c -o test256_32 -w -DBIGINT_BITS=256 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64 -DNUM_ITERS=100000
	python3 generate_tests.py montmul 256 tests.sh time\ ./test256_32 1
	bash tests.sh
	rm tests.sh
	echo ---------------------------------
	echo montgomery multiplication 256-bit as 64-bit limbs 100000 iters
	${compiler} test_and_bench.c -o test256_64 -w -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 -DNUM_ITERS=100000
	python3 generate_tests.py montmul 256 tests.sh time\ ./test256_64 1
	bash tests.sh
	rm tests.sh

bench_mul:
	echo ---------------------------------
	echo multiplication 256-bit as 32-bit limbs 1000000 iters
	${compiler} test_and_bench.c -o test256_32 -w -DBIGINT_BITS=256 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64 -DNUM_ITERS=1000000
	python3 generate_tests.py mul 256 tests.sh time\ ./test256_32 1
	bash tests.sh
	rm tests.sh
	echo ---------------------------------
	echo multiplication 256-bit as 64-bit limbs 1000000 iters
	${compiler} test_and_bench.c -o test256_64 -w -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 -DNUM_ITERS=1000000
	python3 generate_tests.py mul 256 tests.sh time\ ./test256_64 1
	bash tests.sh
	rm tests.sh

test_old:
	${compiler} test_and_bench.c -o test256_32 -w -DBIGINT_BITS=256 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	${compiler} test_and_bench.c -o test256_64 -w -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128
	${compiler} test_and_bench.c -o test384_32 -w -DBIGINT_BITS=384 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	${compiler} test_and_bench.c -o test512_32 -w -DBIGINT_BITS=512 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	${compiler} test_and_bench.c -o test768_32 -w -DBIGINT_BITS=768 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	${compiler} test_and_bench.c -o test1024_32 -w -DBIGINT_BITS=1024 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	echo ---------------------------------
	echo montgomery multiplication 256-bit as 32-bit limbs
	echo 256-bit using 32-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./test256_32 montmul 0x3f1c1f052ec7fcf3ae9235e365227456e0aad70660a12b598614c8fa584a1535 0x727b764436a7fbecec677e27eb8adb718ac19edf0412d4cb3b744672b7a302c7 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47 0x2ddccb3fa965bcb892d206fbf462e21f9ede7d651eca6ac987d20782e4866389 0x2d9e16714fc4fd748028191997556608dd3674723007b6a6303982d89a84056
	echo 256-bit using 64-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./test256_64 montmul 0x3f1c1f052ec7fcf3ae9235e365227456e0aad70660a12b598614c8fa584a1535 0x727b764436a7fbecec677e27eb8adb718ac19edf0412d4cb3b744672b7a302c7 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47 0x2ddccb3fa965bcb892d206fbf462e21f9ede7d651eca6ac987d20782e4866389 0x2d9e16714fc4fd748028191997556608dd3674723007b6a6303982d89a84056
	echo ---------------------------------
	echo montgomery multiplication 768-bit as 32-bit limbs
	echo 768-bit using 32-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./test768_32 montmul 0x18519fba4b3fd2b923f780582a66fa8474c6540a788c17cd09d3ab98beb4ce0c28af644a4a0c57687e11420de74462834423d404fdcb1b6883b2befb4b872c689b799f2600a6ba8fa35238e8c6337638e2686a236e6b8195aa3d13f283c534e1 0x588e86f098891064643bef202ea0a4625409fad9e4586e0dbacfe9309cb0678d0a131a8c90e103267f389aa9acae00ded5fa966c37550c9bf0897ef3ff61524bf2f82d8369f6cfb8ce2a0b600a4a7009356aa635e99a3b03c367e8b89f1bdaea 0x1c4c62d92c41110229022eee2cdadb7f997505b8fafed5eb7e8f96c97d87307fdb925e8a0ed8d99d124d9a15af79db26c5c28c859a99b3eebca9429212636b9dff97634993aa4d6c381bc3f0057974ea099170fa13a4fd90776e240000001 0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff 0x8694766676aa2552940df17a6096ec6262699ff5252483f7e2e45b99a6727a987f1dc33d0c989c4481b7ac50601aa0b359b49b556d05ca311a04d8bf7074724039c1169a3474b14da11d5e67401b4108529d2aac696641e8234a2f3ae03ad1f
	echo 768-bit using 64-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./test768_64 montmul 0x18519fba4b3fd2b923f780582a66fa8474c6540a788c17cd09d3ab98beb4ce0c28af644a4a0c57687e11420de74462834423d404fdcb1b6883b2befb4b872c689b799f2600a6ba8fa35238e8c6337638e2686a236e6b8195aa3d13f283c534e1 0x588e86f098891064643bef202ea0a4625409fad9e4586e0dbacfe9309cb0678d0a131a8c90e103267f389aa9acae00ded5fa966c37550c9bf0897ef3ff61524bf2f82d8369f6cfb8ce2a0b600a4a7009356aa635e99a3b03c367e8b89f1bdaea 0x1c4c62d92c41110229022eee2cdadb7f997505b8fafed5eb7e8f96c97d87307fdb925e8a0ed8d99d124d9a15af79db26c5c28c859a99b3eebca9429212636b9dff97634993aa4d6c381bc3f0057974ea099170fa13a4fd90776e240000001 0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff 0x8694766676aa2552940df17a6096ec6262699ff5252483f7e2e45b99a6727a987f1dc33d0c989c4481b7ac50601aa0b359b49b556d05ca311a04d8bf7074724039c1169a3474b14da11d5e67401b4108529d2aac696641e8234a2f3ae03ad1f


bench768_old:
	${compiler} test_and_bench.c -o bench768_32 -w -DBIGINT_BITS=768 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64
	${compiler} test_and_bench.c -o bench768_64 -w -DBIGINT_BITS=768 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128
	echo ---------------------------------
	echo montgomery multiplication 768-bit
	echo 24 32-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./bench768_32 montmul 0x18519fba4b3fd2b923f780582a66fa8474c6540a788c17cd09d3ab98beb4ce0c28af644a4a0c57687e11420de74462834423d404fdcb1b6883b2befb4b872c689b799f2600a6ba8fa35238e8c6337638e2686a236e6b8195aa3d13f283c534e1 0x588e86f098891064643bef202ea0a4625409fad9e4586e0dbacfe9309cb0678d0a131a8c90e103267f389aa9acae00ded5fa966c37550c9bf0897ef3ff61524bf2f82d8369f6cfb8ce2a0b600a4a7009356aa635e99a3b03c367e8b89f1bdaea 0x1c4c62d92c41110229022eee2cdadb7f997505b8fafed5eb7e8f96c97d87307fdb925e8a0ed8d99d124d9a15af79db26c5c28c859a99b3eebca9429212636b9dff97634993aa4d6c381bc3f0057974ea099170fa13a4fd90776e240000001 0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff 0x8694766676aa2552940df17a6096ec6262699ff5252483f7e2e45b99a6727a987f1dc33d0c989c4481b7ac50601aa0b359b49b556d05ca311a04d8bf7074724039c1169a3474b14da11d5e67401b4108529d2aac696641e8234a2f3ae03ad1f
	echo 12 64-bit limbs
	time -f "\t%E real,\t%U user,\t%S sys" ./bench768_64 montmul 0x18519fba4b3fd2b923f780582a66fa8474c6540a788c17cd09d3ab98beb4ce0c28af644a4a0c57687e11420de74462834423d404fdcb1b6883b2befb4b872c689b799f2600a6ba8fa35238e8c6337638e2686a236e6b8195aa3d13f283c534e1 0x588e86f098891064643bef202ea0a4625409fad9e4586e0dbacfe9309cb0678d0a131a8c90e103267f389aa9acae00ded5fa966c37550c9bf0897ef3ff61524bf2f82d8369f6cfb8ce2a0b600a4a7009356aa635e99a3b03c367e8b89f1bdaea 0x1c4c62d92c41110229022eee2cdadb7f997505b8fafed5eb7e8f96c97d87307fdb925e8a0ed8d99d124d9a15af79db26c5c28c859a99b3eebca9429212636b9dff97634993aa4d6c381bc3f0057974ea099170fa13a4fd90776e240000001 0x1ca8d9105b396c8b26f9de60c2f805ec55f11b8452e51525f17af3144d2288b60dbe0076f54231fbd6b213d679f81291f14d3dc5311a484986a3d163f2c2de3107fb1f51969f35795f3f7d6484182adb37525ab8c5f5ac90776e23fffffff 0x8694766676aa2552940df17a6096ec6262699ff5252483f7e2e45b99a6727a987f1dc33d0c989c4481b7ac50601aa0b359b49b556d05ca311a04d8bf7074724039c1169a3474b14da11d5e67401b4108529d2aac696641e8234a2f3ae03ad1f

