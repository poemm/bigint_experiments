

mul256x256_512:
	clang -std=c99 callmul256x256.c mul256x256_512.s -fno-pie -no-pie -DBENCHMARK=0 -DTO512=1

mul256x256_512_bench:
	clang -std=c99 callmul256x256.c mul256x256_512.s -fno-pie -no-pie -DBENCHMARK=1 -DTO512=1
	time ./a.out

mul256x256_256:
	clang -std=c99 callmul256x256.c mul256x256_256.s -fno-pie -no-pie -DBENCHMARK=0 -DTO512=0

mul256x256_256_bench:
	clang -std=c99 callmul256x256.c mul256x256_256.s -fno-pie -no-pie -DBENCHMARK=1 -DTO512=0
	time ./a.out

