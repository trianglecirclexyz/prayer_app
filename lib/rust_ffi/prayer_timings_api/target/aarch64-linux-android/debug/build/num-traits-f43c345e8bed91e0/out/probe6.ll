; ModuleID = 'probe6.553e6923-cgu.0'
source_filename = "probe6.553e6923-cgu.0"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android"

%"core::panic::location::Location" = type { { [0 x i8]*, i64 }, i32, i32 }

@alloc3 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/4b91a6ea7258a947e59c6522cd5898e7c0a6a88f/library/core/src/num/mod.rs" }>, align 1
@alloc4 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [75 x i8] }>, <{ [75 x i8] }>* @alloc3, i32 0, i32 0, i32 0), [16 x i8] c"K\00\00\00\00\00\00\00K\03\00\00\05\00\00\00" }>, align 8
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe6::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN6probe65probe17h02d85f581e587b28E() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hcc1aa8ad81847fcfE.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h0ec05f9547fbd65aE([0 x i8]* align 1 bitcast ([25 x i8]* @str.0 to [0 x i8]*), i64 25, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc4 to %"core::panic::location::Location"*)) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hcc1aa8ad81847fcfE.exit": ; preds = %start
  br label %bb1

bb1:                                              ; preds = %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17hcc1aa8ad81847fcfE.exit"
  ret void
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking5panic17h0ec05f9547fbd65aE([0 x i8]* align 1, i64, %"core::panic::location::Location"* align 8) unnamed_addr #2

attributes #0 = { nonlazybind uwtable "target-cpu"="generic" "target-features"="+neon,+fp-armv8" }
attributes #1 = { nofree nosync nounwind readnone willreturn }
attributes #2 = { cold noinline noreturn nonlazybind uwtable "target-cpu"="generic" "target-features"="+neon,+fp-armv8" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
