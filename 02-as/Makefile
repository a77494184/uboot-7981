all:gcc as

gcc:
	mipsel-openwrt-linux-gcc mips-hello.s -o hello-gcc

as:
	mipsel-openwrt-linux-as mips-hello.s -o hello-as.o
	mipsel-openwrt-linux-ld -e main hello-as.o -o hello-as
