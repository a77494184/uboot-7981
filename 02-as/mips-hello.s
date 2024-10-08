# File: hello.s -- "hello, world!" in MIPS Assembly Programming
# by falcon , 2008/05/21
# refer to: 
#    [*] http://www.tldp.org/HOWTO/Assembly-HOWTO/mips.html
#    [*] MIPS Assembly Language Programmer’s Guide
#    [*] See MIPS Run Linux(second version)
# compile: 
#       $ as -o hello.o hello.s
#       $ ld -e main -o hello hello.o

# data section
.rdata        
hello: .asciiz "hello, world!\n"
length: .word . - hello            # length = current address - the string address

# text section
.text
.globl main
main:
    # if compiled with gcc-4.2.3 in 2.6.18-6-qemu the following three statements are needed

    .set noreorder
    .cpload $t9
    .set reorder
            
            # there is no need to include regdef.h in gcc-4.2.3 in 2.6.18-6-qemu
            # but you should use $a0, not a0, of course, you can use $4 directly

            # print "hello, world!" with the sys_write system call, 
            # -- ssize_t write(int fd, const void *buf, size_t count);
    li $a0, 1    # first argumen: the standard output, 1
    la $a1, hello    # second argument: the string addr
    lw $a2, length  # third argument: the string length
    li $v0, 4004    # sys_write: system call number, defined as __NR_write in /usr/include/asm/unistd.h
    syscall        # causes a system call trap.

            # exit from this program via calling the sys_exit system call
    move $a0, $0    # or "li $a0, 0", set the normal exit status as 0
            # you can print the exit status with "echo $?" after executing this program
    li $v0, 4001    # 4001 is __NR_exit defined in /usr/include/asm/unistd.h
    syscall
