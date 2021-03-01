
# uncomment one of the following
#func_to_test=mulmodmont
#func_to_test=compute_Nprime
func_to_test=$1

# choose one compiler
#compiler := gcc
compiler=clang

# the rest should not be modified unless you know what you are doing

num_iters=100000
extra="-O3 -march=native"

# this is needed by test_and_bench.c, just leave it here
asm_files=../asm/mulmodmont384.x86_64.S

echo testing $func_to_test:

maxlimbs=16
for ((numlimbs=1;numlimbs<=maxlimbs;numlimbs++)); do

  $compiler test_and_bench.c $asm_files $extra -o bench -w -DNUMLIMBS=$numlimbs -DNUM_ITERS=$num_iters

  bitwidth=$(( numlimbs * 64 ))
  echo $bitwidth bits:
  python3 generate_tests.py $func_to_test $bitwidth tests.sh ./bench 1

  bash tests.sh

  rm tests.sh bench

  # decrease num_iters since larger bitwidths take longer and don't need so many iters
  if [ "$(( numlimbs % 4 ))" -eq "0" ]; then
    num_iters=$((num_iters / 2))
  fi

done
