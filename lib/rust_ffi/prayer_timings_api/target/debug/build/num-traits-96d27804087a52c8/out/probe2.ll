; ModuleID = 'probe2.31fa8e8f-cgu.0'
source_filename = "probe2.31fa8e8f-cgu.0"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; core::f64::<impl f64>::to_int_unchecked
; Function Attrs: inlinehint nonlazybind uwtable
define i32 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$16to_int_unchecked17ha5c1e33c44c26920E"(double %self) unnamed_addr #0 {
start:
; call <f64 as core::convert::num::FloatToInt<i32>>::to_int_unchecked
  %0 = call i32 @"_ZN65_$LT$f64$u20$as$u20$core..convert..num..FloatToInt$LT$i32$GT$$GT$16to_int_unchecked17hc668dc2ea55fba47E"(double %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %0
}

; <f64 as core::convert::num::FloatToInt<i32>>::to_int_unchecked
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN65_$LT$f64$u20$as$u20$core..convert..num..FloatToInt$LT$i32$GT$$GT$16to_int_unchecked17hc668dc2ea55fba47E"(double %self) unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  %1 = fptosi double %self to i32
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %2
}

; probe2::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe25probe17h77d9de35809d4997E() unnamed_addr #1 {
start:
; call core::f64::<impl f64>::to_int_unchecked
  %_1 = call i32 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$16to_int_unchecked17ha5c1e33c44c26920E"(double 1.000000e+00)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

attributes #0 = { inlinehint nonlazybind uwtable "target-cpu"="generic" "target-features"="+outline-atomics" }
attributes #1 = { nonlazybind uwtable "target-cpu"="generic" "target-features"="+outline-atomics" }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
