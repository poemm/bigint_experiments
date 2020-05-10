
# set your compiler and compiler flags and options here
CC=gcc
EXTRA=../asm/mulmodmont384.x86_64.S


$CC test_and_bench.c $EXTRA -o test256_32 -w -DBIGINT_BITS=256 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64 -DNUM_ITERS=1
$CC test_and_bench.c $EXTRA -o test256_64 -w -DBIGINT_BITS=256 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 -DNUM_ITERS=1



./test256_64 add 0xbbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a 0x00000000000000000000000000000000000000000000000000000000000000 0xbbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a

./test256_64 add 0xbbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xbcefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c49

./test256_64 add 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe

./test256_64 add 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x00000000000000000000000000000000000000000000000000000000000001 0x00000000000000000000000000000000000000000000000000000000000000

./test256_64 add 0x00000000000000000000000000000000000000000000000000000000000000 0x00000000000000000000000000000000000000000000000000000000000000 0x00000000000000000000000000000000000000000000000000000000000000



./test256_64 sub 0x00000000000000000000000000000000000000000000000000000000000000 0x00000000000000000000000000000000000000000000000000000000000000 0x00000000000000000000000000000000000000000000000000000000000000


./test256_64 sub 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x00000000000000000000000000000000000000000000000000000000000000 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

./test256_64 sub 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x00000000000000000000000000000000000000000000000000000000000000

./test256_64 sub 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xbbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a 0x44104a1691f2b6a018197a9355f59ca5a68305e0a1c963a5b38cf5079fb6b3b5

./test256_64 sub 0x0000000000000000000000000000000000000000000000000000000000000000 0x0000000000000000000000000000000000000000000000000000000000000001 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

./test256_64 sub 0x0000000000000000000000000000000000000000000000000000000000000000 0xbbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a 0x44104a1691f2b6a018197a9355f59ca5a68305e0a1c963a5b38cf5079fb6b3b6


./test256_64 addmod 0x00000000000000000000000000000000000000000000000000000000000002 0x00000000000000000000000000000000000000000000000000000000000002 0x00000000000000000000000000000000000000000000000000000000000003 0x00000000000000000000000000000000000000000000000000000000000001


./test256_64 mulmodmont 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x00000000000000000000000000000000000000000000000000000000000001 0x00000000000000000000000000000000000000000000000000000000000000

./test256_64 mulmodmont 0x00000000000000000000000000000000000000000000000000000000000000 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x00000000000000000000000000000000000000000000000000000000000001 0x00000000000000000000000000000000000000000000000000000000000000




$CC test_and_bench.c $EXTRA -o test384_32 -w -DBIGINT_BITS=384 -DLIMB_BITS=32 -DLIMB_BITS_OVERFLOW=64 -DNUM_ITERS=1
$CC test_and_bench.c $EXTRA -o test384_64 -w -DBIGINT_BITS=384 -DLIMB_BITS=64 -DLIMB_BITS_OVERFLOW=128 -DNUM_ITERS=1


./test384_64 add 0x83fd8e7e80dae507d3a975f0ef25a2bbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 0x83fd8e7e80dae507d3a975f0ef25a2bbefb5e96e0d495fe7e6856caa0a635a597cfa1f5e369c5a4c730af860494c4a



./test384_64 mulmodmont 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000




# a bunch of mulmodmont384 tests
./test384_64 mulmodmont 0x52c42e58e8a7ed668e0ab8e5a65b41f54b75ea255559704e9ea6bf11ef9498917b4bc04151a10fba72e4850987d4743 0x12f0fbbc2af26c450106fe4b9d3ab9ad1f19b425bd4d41f12c2f5939efed8c91c9a42bcb76e9c00c7b755c45b083afb 0xb598e3af07f7199d9795ec57c07e2077eeb9e5a170a87a79afa62d8e415982340c0a7552eaa9fdf84fc033eee34cd9b 0xa18e24fc1f39aecd88ce25f5e5ed35aafcefc1e2664084e520b5e8789480f7acdf3d6420d80f4c744da1f039b41f2f6d 0x5b783814c809f72a32aea787a62a588930c439647ebbbd9787d49af12513693f45997e5b52cc10ea28be3af20f2ea4f
./test384_64 mulmodmont 0x45d2bdefe8b56bb29ab16df0ba97a2d887baf24bd4ffe435f4e26f85a553fa02513c38d4c7fcf702b09547ca40a30727 0x564575ea86c074b19d0746366bd5c9308ddeaeb0ba19d8398a30ae23ecebcee2880a5c57795e8092bb72f5171ad048b0 0x75023098e81cc4c5a8bd6802a4dfa3eb9708a29ca08a474e4e2c4903656e310cab27ed9377a9da3852a4e7683a09cd37 0x209176f94479dd6c8fb4fb607811f3083d1431021d871d32cbb766dec4cc6ca67d9d4474c64bc3bc7845a0dcae0a8779 0x38ac865218c595634d27461d27e7e7b777c16cb1814f6329d01cde0a6d289f381bdf2482a15a72e96741e5673ef122df
./test384_64 mulmodmont 0x95bdc67419b453feeee418750e997d1b9f060d7e2d5ebfee465717871f08d78e258fee7ff896372aea34a829c177373 0x2ae770aa27a9d033b75db9d3b5882b6c2d5ed49ef193a0e67e3d470a2217b5409b319ae950461a817acdfdd74bd8697b 0x3a5fc7fd834df6fcaf26906d9e804b07bb5d0276db3d2142d8adc38b5b433b5f6b4bf11a2ac6792bee1c74ac25e01d45 0x46065f8c4ecc9532baf6468e4e2beb93dc609ab29bd0c5ec054d3ea7f0983b3bb04c71e4ac58016a05ffe28a0b741273 0x3a1f51b20e003ff7dc4b5a5ec809792a233ff5882b31b68bee0697df41f9c1f94deac4394f60aa7aa1d05944bad62c5c
./test384_64 mulmodmont 0x5844f932e09ed9228b9c0533f2dac838e6903f4e8cdafae4b926779c1388e4d0353c24e01b217d7a6ef7bf7a945f1049 0x34bb3f521222e8de266980566d7c16d0ffde9ba9ce3b4e56a335f12e7f188847e29502433336eafac4e7a3e0728eaa14 0x9138627b591b9247204e604a454ffb75cf9793ef059bcf965048ccaefc1d5df3617789950fe95df74b2cf517a9363629 0x71f48cd9c10323da14143baeff170315382b40be02892e19498ba1557ac2ac01a9242d7ff4c8cd2991755ec5b29639e7 0x643d9419529f5963dc9c7ec782827a4912f7cb45bae91f3cf8c02f5314d2783cb8b4df60ef0ba3f810b3a8eb57e96f0f
./test384_64 mulmodmont 0x8326e27e1870ae0d60620aa74ae0d43e90352872955821e3b8d898286d263f08aeff10a5c035596dced4c561df16919e 0x1e426c6defa9057ff9789abfc34c39b8306ff029116a22412298e17b135d94c68f896d25830768dcf7c37a71d15b0cb1 0xa46d9981e1ae140eb6a1aae87470178b8dcf6b9bfe70647722cfc816cce850526e12683d8a4f3bc46efc3882081d199f 0x8f1e011e250ae2e7f2fa64c951565d327c1557160b08f8e772fefc7d1b52f73d5a773f2a3d7275ec44ac99f9b2683da1 0x5d78d434e91bad5d5a08177066e103ceb04478a2f7626f085fe894be3eb6c659cebe7cf05de789e529f3527768f76035
./test384_64 mulmodmont 0x832585bb4f5284725b08dc158fa84371bb85b01a76bb2e1e13fcfa66116bfa538342fa873aab9579e7fccd501a642d7 0x9e3181618d212e88263932448dd0079d552db4263df03e734cf3c9ab420031d0a3eab88a1a2d58116941dfe716eca6e 0xfb2372a3c4b872a7486f82412563dc921e4b5edbb39d8282b39ce13bf6bf1a9eeffc237719440c076eecd62cc6141e5 0x66dec6a526c72c728b871da66bb0e7d53b18f0f57da8595565468011a2555951e1898c83da9df641798e89946f55ec13 0x350a997fe6bed496c05ecf77e11d6bd1ef789f1a4a4d396bd36ba9b194f5ffe8a12e4b287b675e46051b80397f490a8
./test384_64 mulmodmont 0x40e8a133b5f684c49c9c601f1910b8bff4b63ee02e1d5ce518f85640104e02535cb0913c73f727d0e1dd6929627ffb0b 0x45d4945f3311213c4948e89baf63f43fba409c7609b564f0dd3f6e87c5b71d6f87bafaf912e298763e0f4d53277d44c3 0x4a4a1febc2f79554c36c8755b7a21e97d63b1529421d8805b8b22309144a0da2be99b189ecab1603e7eb2302a08062ff 0xae510375b1f9c15e82e8efd7d106a4e64db6f5e8e4e1507c7c6921f89891d40f4035e21ea815ba9f6ef15b4501c96301 0x93e63b39f25cd4401263af60067c4c6629faa249e08dc6bb7a339018ed6a75a08596c59f572a729aac7403fc9d98dde
./test384_64 mulmodmont 0x76e24fb33ad59f53d5f68f7a71248784a726f27d1649ec7e3b7ccfaf14235257d64c15388abb2e62c762fcc25ebb2e55 0x51c58d1f8ad988986be65b60e8929606aba9f76ddfd28073370d7c2841aebe723f891cc834ff52ba676e1e9d45338b85 0xa92e90f9968fb7cc7645407963ff53e9d690027f3a819963309b0c6ec6696d489a755912317960558e1a07e5e214d103 0xfcb37aa43d8705161bd62d656f6ca6b0b2fca595fd357740790b324c8b300f123755568f60419ec7bb4b9d706ff2de55 0x1dfa21ed65ff96c10be48cfab796345d0bdefbd7d43623049d04d0cc7a249d61fe387b629f2e73617406846852801f29
./test384_64 mulmodmont 0x277e599db1c0bcbebf924aa2abc20a7d77d2867060f8af4c740fcaa216b4cc7b9d6f9ff8445bf362abd19fb37efae80d 0x38040d3d21a4698711b7dd546dfadc8e1642ed89e5b229eff8c8b32e08fd4c43a33ae8936dff4e94d9c7c12176d2a5b9 0x4857f436881cd7ded524bee5d3a47f58613406efd1e31924ce0611cfa57903c72591aba620f0f7c72474ff01625f1c37 0xfc7b53e69eedeaba65acb2ec9e00d698cfe7542d17266973972374ea3a5e956cd131d544f58ced1d181c2c88f140a679 0x1585609d599513c6a415aa352e6db85748c402d110fc2ec2a564fba2f894ff09bd8f94ff42973ad9db87b81677e0a4d3
./test384_64 mulmodmont 0x1a00b6395952ff91a27dab52c1813a9c38382d013850e117a38073478636d550e80d9e21bf973708a9bdc779f5255088 0x1a80d6caf29446e6e8603c815254fd48a786d5735276aaa77160101de4fa089e33c2fcbfba619b4b26ef8b1afc85962a 0x1cb8c70e8bffb414dae312c484e39eeeb109c658d668f2d62244f30241a77ba9e30b4a2da7e0e89599b6a6fb5d9d75e9 0xaf8b2ab864a004ada809a00172bfa0b9543476107df4ae8f80613bc8fe3e5b46d39e93574b4bf7f482cd1aa103a94da7 0xf614e7fbe7ae18e87a89d29db3143fd7df179213c0da7a06aedbca37dd5e94498293c8e706254731db5a4aaff9c55ed
./test384_64 mulmodmont 0x862d146a729256f3e32ca7195405fc2b297dd10b9e3fe391da957e69cb91c49f62ae07576e99957e6605f6070e103526 0x6cc441775b8ad3bdf21e1038dd69fb8b71820866428e1f95aac0db17abcf9926a71cf40302684750fe9b2e3bd62799da 0xd4791d24d692c941d1b947d9d78f9998fd0ae70f55a160d8ef4440aba30a92a4f198adf2b71d0159e7fb3ccdf75b63e1 0xed64f4fe815c4d1c3241587764ac2159a2ac46b4da58ee440aafe97fe6a65f32329c405658e122d9ea90025ab7c3dfdf 0xa6fb3e8e7b174f9377a441415312a778fdcfa9be6c5d0ae3e336a6c2a17a54a91858f28940ca7c9dcd2b6112c77f618d
./test384_64 mulmodmont 0x5807a8e6396046cb720c0befdf2ed47b42d566a8521e1436caaae87bcda8517d5f3502dccba7d2868f7776a8ced472dc 0x9d51768ad3d372f5bffb6b4994e5b6207e6d6fa0cf2038aed9605def3b9c32f1faf01bc6e6c2b5f878667d51c35a0647 0xc8193291e20dcbb49166c5dd20b819d7540cd276ae944e5963fc1814560b735206be34f377df61c4360ed8620e3a9343 0xf1dadb34b4ab1a2af25d54d86b907b91821b6e443d65cad2bd31ef84e76e91842f788b73ada52eba2ebaa6600100ee95 0x7b5c21dcd913628d3602e04fab9521a342575c39b5b958b8e17aae73809361727c495b425ac0311422974318132578a5
./test384_64 mulmodmont 0x19edf86ced41b1718b069ebcdf550a5934febacf5abc0e5fe2d54b8202dc1e6d1c5321b86ba227285746124341d41518 0x56b1734819b207b0137828096ed32b6179b48eb5c834fc91eb1aa84bcfcd3647e42a2e4b6c0781fde52188ed5e535f4 0x551467287dfecb955b5a0ade98703f6c9a801374f63f911990cd86ed485df0509a4821cef293f7b10e41275987a5bf0b 0x5797775de1a05297bfbad892c8a335e02b4508f3fb62d1bfc1f9efab68742cc6e4ce457ff928ceccf1b24fec4bd06b5d 0x373f2a02554eb2d7266bb9535a29b00fc6adfcb8cec0ee7689e1edc302ff3db0738974a125dfeab1c22ac7987f8ff715
./test384_64 mulmodmont 0x3dbcacd84b15077c92e22cd2fd2b65a97f2c8856ac90fe8099dc48c3282b10a5188401ceb98589470cf984a8ea700075 0x1df20b8f74508000fafcf24f62d1ef375fce2e615c6198726cea7aa0675aa7f41b6741156ee1f7b30db196c475581533 0x89903f7cbd80599c7031786e0107d9c7b679d804a313045e34a2de4777ed4ba390015021be400c1bb698049443574c37 0x4b375d87900eade668991eeecb2e3b714a673896ec3e4ff3d6b199f3dccf8f57fdd5c1776f2eab438ad4a02680b1d679 0x2f18e89f291f1602f3830f997dfb8a2071ec6ecc5475292f578cbed3c9c48ebf414377e940bf5ea1440de7d4bbedf468
./test384_64 mulmodmont 0x7037515dff0a64afde30ffa581b2dd5b80d402f8c76f7b7cfd0156ca1fe0c1dcc81e1442109db68dc8e57803d8422ead 0x4dd41b451404e3902d1e740376065dfd08abf270d70bea7f3f4f9c29a6c1bd430a3ee3c402fc05bbef4452f3ce8fc10c 0xa3b02ef8611c04fd839510acbe580fab05e2d0792852af68d41d52ab543cfe653844c0638216c3f579810c2628d41145 0xf2ae1494b38e038e7c1657e42031e9583a85a8ddb62cd844e0191ea571c26f6b921d5aa10bee328fbb6aeb1cba3c2673 0x74961ba1f384837251f8523e240c7a4411054411f31bcdb51cee572e45acfed5195984a70967822dde124e96dcdfbd6c
./test384_64 mulmodmont 0x771585443a457941c12127176c7182565e8364536ba5c061b94699cd6655816d76faf9a0bb3a8c741579d12737b7f6ad 0xad3926c631194ffea3dbb4642abdbd9e7a11988e082d5eecc2cdfe0a72bb2878aa4b3f98168a46d2864a9e957c1a3e2b 0xfd300e8b085957a91eee5c5f5dc238a8aec2f7cc8b1eb61e5a540ad38be5c23e2f18f1fceb217d0915c9af8372d7942d 0xe416c29463e34af4efa089eb3d82cf8decc53c55ab7972d9a6737cf2ff88d9a5831d09af951fc4c21eea08697ba8245b 0xf73c1ba94ff799b2627ae8ffc08b916de5b6d2e0c67315c5bfea1ffe9b8d2e76f2754d93bdc03814040ca711907e7d61
./test384_64 mulmodmont 0xbdc4fb105f032a9a6b28c042381d19a089d13796da39b881e7b77f6b94fc7886cc4c0d44c6c650c39407af95aadcb3c 0x6569c34fd6a58d2d740c7784ed969533b7962beff58ccf9a4705c9b69eda24dae5afde5a6f6a45c1116034c3604e7a9f 0x8163012a4fcc083a87ef503eb86b82d1ce5c18013e6fe1b997b0f626d0ec0d8bc754a057d42d10010f21f4c846a996f3 0x377a670c4747aeb330cb6732003cdb1c9c59e9ee7206cea5491eb3bcc43e168c5549c936cf9ced4a30ff778747f98dc5 0x7c3cfafcedfb1be0327231a834edbb8afa427fa350c5556289b589565f91a9f866f1f1b5e1e0a075bd908c68bf676a65
./test384_64 mulmodmont 0xc7ec835dcd88c4b9d848c341ebcd02daacbdd5b99afebcb010272ea701bbdcf6afeb748acf601c2ede40ce3c507d8ebf 0xaa13b2577c9a378bff51204c1bf7bb45b70fe738a4b2c88db714ca3be77c90b3e8f51cf044824b8bfe15e66592e13355 0xe9ba1fe38f2945763a596bb516219bc1c152a66e719e8814a91af52d385e7db953eedd6c0889a453b11225c89806caa1 0x9967f77727bb282756fdbec060c4037680dd33ae04746fac606643ea40b1db2cdc7e0433f770482fdf686a1caf8c669f 0x41181bb93b4fc5b2eb76ce7b51070a03e77fbbac036ac5cf0e8442f97e415852fe20742a8c9f9fd592acff33112cce6b
./test384_64 mulmodmont 0x5b8e641a0bbe2113e815f978e16ccea3c46b4759fee6a8a72cd3918dcdf3ebb7fd08a7675bc2ba1a111943fd31eddeea 0x3806cc87255f1105d63d9b0ed04df4380d4918cf0b54578510fc92ae54217d7caac56a9c873fa9824d0bebb689c7dd28 0xe01c071b58bd228800e83df16897cdcd0cc1dd5a335177acb15cae10b86c46b2db57a50883228c5b003a0c102ac4659f 0xc862c37d81ef87df590af5d9a1c90935354f88274543a5a3004cffdee7d7a2249f2227ecdff35497bb7450e405a689a1 0x21e6ad5633f75bfb0b1584a1e6184d68cbdbb14e6cc2f9982215ba4912f7df5eae11519e093cad9a88643ec7c865dba9
./test384_64 mulmodmont 0x5f9bde833c658e022fb54a4c7133ac91be59725c72a56b5fd296ceff10f1ddf041c658bd887fefcd8f7fd0609b817647 0x711b154bab3f66fe3c4dce929ab5d601dfac58a51765c493bcddf3fe3e3aebddd0b5f3964b5654ff3c7fd32705aff2de 0x964e92bc9e292c4e01da5c77a9ddc6dc43d4d8d4bb7b1edf061981ce7905d35707f7adb7af6af18dd044407048988a79 0x327bfe6db4c08dc5fcf4f12470af72146f1c8c0810e4f29a22b05012559795f97aed2487390fe04261bd5044427c4037 0x1d2045ea10b1b82c906bb775f69f05bb6a31af2b9ec0520e027ccd38f0d232eda3e940faf58f29cf801efd7ab8c4d7f9
./test384_64 mulmodmont 0x9be59000c196f1792091300ce182cd19a007e2a790b8ba5b51324ef11d28e974024470c06eb47cb7169f40c5694ea69 0x9cab11f1659a02a728df02354e4e15269324c08912aff5e356036338844a736579b9ae203b014f920d1e3c39d3b3291c 0xa4da9f51532552a4e9238121fa023a91277c371a466f098275748fd74dd2bf11f5ac7154796f6148723d4f933e22b3f5 0x88e2613047ebee3b310badda0da7345c384729ce07397392caf1ef8fa3c6a6f5d4765a0bbcee7ec5f16d6b80ee71dfa3 0xbd5f0d3a0cba3f2d298d9e9d3ab3396dfa1e4c122a4c97c82ea53d86cfb6eb94baa0b86b55e7d4b6879e2ab92c7f924
./test384_64 mulmodmont 0x7ef63fa834c4c9c07a8f9455d9729b7af65f9f97bd76c54283ba399f482a00d469fc98c77de8e450d6471c9086ca009c 0x94039cf0c4b46c5bcf4c83d030b1e040ad079511a7d7ad65750551226834c0fd8b52cbe30f512706ed16d8eb06d98d8b 0xc7fd456005f4862b53df207fc893ac457cfcbbbcd5e5f4f0ceb31cb63f3c70927c5eaaf81301838ae717258212269d2f 0x175e49f6f15f4b17b898436f72a898ffb0a1d474ce68515980df440eff1142e3a81388547bd22b3b220f2f88e0cc3631 0x3459a19ffb755e45040bfbcfa53aadebcc6d28bc12ede022f8f63e488a9d12b658565081e4c20f3354f66700b3c6fb9a
./test384_64 mulmodmont 0x287965aac1d875471fc83c2de2cf46f966bb3e09c6ab3093e34e9bc02d335a96804c1e88e1c1fdf3be28612033fb8025 0x26672ce92333dd50d5b0bd7e31985be7c0b6bbe95c8d355d8f0bb227e5c4940c9415eba40af4fbe24ca30246a2c29c52 0x76ad4dc362195f2068d4df7921a8dbf8229a44e1dc389a289829da4d9d5430a219391bdb6db25a3892b9de2cb2ea9a5b 0x741dffbdc66e4c42c3cc4a8f367b72047746701d51f63e8939caa233070ce45e5c1caca3317812531d53771718f2fa2d 0x6abd9a4e8262a346843d589cb71920083791eb16415e85e3d4d0e53657af21be411a7c0b4238cf356178f1255ea68d05
./test384_64 mulmodmont 0x80de3230db3b4b805a714461e340750c362844dd9ca0de33acd1e49928bc612df87af8ca73071c4e3a8924a318f5b2cd 0xfe8a1c531e527bb0d3ccdf46a7a0612b13846aa5b5fba4f236b8a5e45255b4a25012bffb6ecb2e6e2c414cbaa38badf 0xe1196333634982a461391921c0126a5a8a8831337addb63f9348055df84c6313c22a5b1670df2e8b54a26d2117ec74df 0xa10ae360adcfb789aece1521fcbd7529d6d513e0641cea1334580f11e4dfe9c3bee1afd0c42eeb56c7903c541b73b8e1 0x603dae6a511c667361092450d4f7476f564633ec66907c1c625d164589c86e1a0b95e6359407d5a0534fd0cf2fdc5df5
