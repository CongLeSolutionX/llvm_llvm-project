; RUN: not llc < %s -mtriple=arm-apple-darwin 2>&1 | FileCheck %s
; RUN: not llc < %s -mtriple=arm-linux-gnueabi 2>&1 | FileCheck %s

define i32 @get_stack() nounwind {
entry:
; CHECK: error: <unknown>:0:0: invalid register "notareg" for llvm.read_register
  %sp = call i32 @llvm.read_register.i32(metadata !0)
  ret i32 %sp
}

declare i32 @llvm.read_register.i32(metadata) nounwind

!0 = !{!"notareg\00"}
