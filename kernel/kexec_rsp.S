#include <linux/linkage.h>
#include <asm/page_64_types.h>
#include <asm/page_types.h>
#include <asm/segment.h>

	.code64
	.text

#define __RSP_OFFSET 0xffff888000000000

GLOBAL(efi_enter_rsp)
#movq $__RSP_OFFSET, %rcx
  subq %rdi, %rsp
  subq %rdi, %rbp
  retq
ENDPROC(efi_enter_rsp)

GLOBAL(efi_exit_rsp)
  movq $__RSP_OFFSET, %rcx
  addq %rcx, %rsp
  addq %rcx, %rbp
  retq
ENDPROC(efi_exit_rsp)


