
# set parameters here:
#CC=gcc
CC=clang
#CC=/home/user/repos/llvm/llvm10/llvm-project/build/bin/clang
#CC=/home/user/repos/gcc/bin_10.1.0/home/user/GCC-10.1.0/bin/gcc
#CC=/home/user/repos/gcc/bin_9.2.0/home/user/GCC-9.2.0/bin/gcc
FLAGS="-march=native -O4"
NUMITERS=1000000


echo EXECUTING WITH THE FOLLOWING CPU
lscpu | grep Model\ name

UNROLL="-DUNROLL=1 -DUNROLL_OUTER=0"

echo ""
echo COMPILING WITH THE FOLLOWING COMPILER
$CC --version | head -n 1
$CC test_and_bench.c ../asm/mulmodmont384.x86_64.S -o bench384 -w -DNUMLIMBS=6 -DNUM_ITERS=$NUMITERS $FLAGS $UNROLL
$CC test_and_bench.c ../asm/mulmodmont384.x86_64.S -o bench384_hardcoded -w -DNUMLIMBS_HARDCODED=1 -DNUMLIMBS=6 -DNUM_ITERS=$NUMITERS $FLAGS $UNROLL

echo ""
echo EACH ALGORITHM EXECUTES TWICE, $NUMITERS TIMES EACH
echo FIRST WITHOUT A FINAL SUBTRACTION, THEN WITH A FINAL SUBTRACTION
# the first input is (in format <x> <y> <mod> <inv> <expected>):
INPUT1="0x180d162063d6acaceba24052ed16e6f7fbe9ff413dbfbc22177226f54fafbf4b19b3bb8725fd7838ff59c862a91aa041 0x80d5a287d46cb2f350e79412ab933fe93dede0500edf2bd4869c93b13c7b8749fa4c30e34e829233fc4b37b860bff6 0x4a9086a8d252e07f01f7e5e212922f4ecf2cf8fed99c38bb4db88154bfafbcd3a1e8d013e6bb47ac1d6fe1f5720dbe0d 0x35a716fc61bd3b5000eea8084ab60265d1ad65a10fd0446746415fc25177b5ca5a45cac3b02329e6986b668e75503f3b 0x3d1f5ec3962ec1170bf1d60be9f472636ae988098c80acccd30b0a15ec8d55bd08879cdb64828253af5a342939f96f93"
# this second input, which includes a final subtraction:
INPUT2="0x9bb9c2291303ede0f1900bf9804eda703b202d56f4735720b6f5d8a7f188e9d34f9aa1d15e15e6d133f08f4f4671e405 0x8fcf59a9e3570125a6b373910527cc7c21065f60c8b272974bb867ec6e12d556a96e393f9163f0ffbe595d0f4dafcc49 0x9d04edf8d89047d901ea4cd8112128e570c43cb28b548da094f8b653c7b65ab452ed144002f7756b3dd5887d25e0e8ad 0xda66589a325bddf49acffc84b142d7ea0c2ce2aa95f5a14db23836bf749d68da0cf50a32337189089ab6e889e85744db 0x3bf636b64461f7cc160794d3ff808e13838ad2cb8b38119669f98942e9fabf740e280e75525025a44d1052f2011b04fb"

echo ""
echo MULMODMONT SOS ALGORITHM
./bench384 mulmodmontSOS $INPUT1
./bench384 mulmodmontSOS $INPUT2
./bench384_hardcoded mulmodmontSOS $INPUT1
./bench384_hardcoded mulmodmontSOS $INPUT2

echo ""
echo MULMODMONT FIOS ALGORITHM
./bench384 mulmodmontFIOS $INPUT1
./bench384 mulmodmontFIOS $INPUT2
./bench384_hardcoded mulmodmontFIOS $INPUT1
./bench384_hardcoded mulmodmontFIOS $INPUT2

echo ""
echo MULMODMONT HAC ALGORITHM
./bench384 mulmodmontHAC $INPUT1
./bench384 mulmodmontHAC $INPUT2
./bench384_hardcoded mulmodmontHAC $INPUT1
./bench384_hardcoded mulmodmontHAC $INPUT2

echo ""
echo MULMODMONT CIOS ALGORITHM
./bench384 mulmodmontCIOS $INPUT1
./bench384 mulmodmontCIOS $INPUT2
./bench384_hardcoded mulmodmontCIOS $INPUT1
./bench384_hardcoded mulmodmontCIOS $INPUT2

echo ""
echo MULMODMONT ASSEMBLY IMPLEMENTATION
./bench384 mulmodmont384_asm $INPUT1
./bench384 mulmodmont384_asm $INPUT2
./bench384_hardcoded mulmodmont384_asm $INPUT1
./bench384_hardcoded mulmodmont384_asm $INPUT2



echo ""
echo SANITY CHECK: MAKE SURE THE FOLLOWING TESTS PASS \(each should print test name then new line with \"correct\"\)
$CC test_and_bench.c ../asm/mulmodmont384.x86_64.S -o test384 -w -DNUMLIMBS=6 -DNUM_ITERS=1 $FLAGS $UNROLL
$CC test_and_bench.c ../asm/mulmodmont384.x86_64.S -o test384_hardcoded -w -DNUMLIMBS_HARDCODED=1 -DNUMLIMBS=6 -DNUM_ITERS=1 $FLAGS $UNROLL
./test384 mulmodmontSOS $INPUT1
./test384 mulmodmontSOS $INPUT2
./test384 mulmodmontFIOS $INPUT1
./test384 mulmodmontFIOS $INPUT2
./test384 mulmodmontHAC $INPUT1
./test384 mulmodmontHAC $INPUT2
./test384 mulmodmontCIOS $INPUT1
./test384 mulmodmontCIOS $INPUT2
./test384 mulmodmont384_asm $INPUT1
./test384 mulmodmont384_asm $INPUT2
./test384_hardcoded mulmodmontSOS $INPUT1
./test384_hardcoded mulmodmontSOS $INPUT2
./test384_hardcoded mulmodmontFIOS $INPUT1
./test384_hardcoded mulmodmontFIOS $INPUT2
./test384_hardcoded mulmodmontHAC $INPUT1
./test384_hardcoded mulmodmontHAC $INPUT2
./test384_hardcoded mulmodmontCIOS $INPUT1
./test384_hardcoded mulmodmontCIOS $INPUT2
./test384_hardcoded mulmodmont384_asm $INPUT1
./test384_hardcoded mulmodmont384_asm $INPUT2
