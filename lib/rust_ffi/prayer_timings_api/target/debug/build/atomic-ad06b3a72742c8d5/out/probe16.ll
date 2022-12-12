; ModuleID = 'probe16.535aeeca-cgu.0'
source_filename = "probe16.535aeeca-cgu.0"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; probe16::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN7probe165probe17hff30a6f3a794318eE() unnamed_addr #0 {
start:
  ret void
}

attributes #0 = { nonlazybind uwtable "target-cpu"="generic" "target-features"="+outline-atomics" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
