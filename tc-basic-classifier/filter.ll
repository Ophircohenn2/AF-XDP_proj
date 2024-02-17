; ModuleID = 'filter.c'
source_filename = "filter.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.3 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.6 }
%union.anon.6 = type { %struct.anon.7 }
%struct.anon.7 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.8 }
%union.anon.8 = type { [4 x i32] }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @cls_filter to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nounwind willreturn
define dso_local i32 @cls_filter(%struct.__sk_buff* nocapture noundef %0) #0 section "classifier" !dbg !54 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !158, metadata !DIExpression()), !dbg !274
  %2 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !275
  %3 = load i32, i32* %2, align 8, !dbg !275, !tbaa !276
  %4 = zext i32 %3 to i64, !dbg !282
  %5 = inttoptr i64 %4 to i8*, !dbg !283
  call void @llvm.dbg.value(metadata i8* %5, metadata !159, metadata !DIExpression()), !dbg !274
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !284
  %7 = load i32, i32* %6, align 4, !dbg !284, !tbaa !285
  %8 = zext i32 %7 to i64, !dbg !286
  %9 = inttoptr i64 %8 to i8*, !dbg !287
  call void @llvm.dbg.value(metadata i8* %9, metadata !160, metadata !DIExpression()), !dbg !274
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 14, !dbg !288
  store i32 48, i32* %10, align 8, !dbg !289, !tbaa !290
  call void @llvm.dbg.value(metadata i8* %9, metadata !161, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !166, metadata !DIExpression(DW_OP_deref)), !dbg !274
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !291, metadata !DIExpression()) #4, !dbg !300
  call void @llvm.dbg.value(metadata i8* %5, metadata !298, metadata !DIExpression()) #4, !dbg !300
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !299, metadata !DIExpression()) #4, !dbg !300
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !302, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i8* %5, metadata !314, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !315, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !316, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i8* %9, metadata !317, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i32 14, metadata !318, metadata !DIExpression()) #4, !dbg !327
  %11 = getelementptr i8, i8* %9, i64 14, !dbg !329
  %12 = icmp ugt i8* %11, %5, !dbg !331
  br i1 %12, label %186, label %13, !dbg !332

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %9, metadata !317, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i8* %11, metadata !161, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata i8* %11, metadata !319, metadata !DIExpression()) #4, !dbg !327
  %14 = getelementptr inbounds i8, i8* %9, i64 12, !dbg !333
  %15 = bitcast i8* %14 to i16*, !dbg !333
  call void @llvm.dbg.value(metadata i16 undef, metadata !325, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i32 0, metadata !326, metadata !DIExpression()) #4, !dbg !327
  %16 = load i16, i16* %15, align 1, !dbg !327, !tbaa !334
  call void @llvm.dbg.value(metadata i16 %16, metadata !325, metadata !DIExpression()) #4, !dbg !327
  %17 = inttoptr i64 %4 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %16, metadata !336, metadata !DIExpression()) #4, !dbg !341
  %18 = icmp eq i16 %16, 129, !dbg !347
  %19 = icmp eq i16 %16, -22392, !dbg !348
  %20 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %18) #4
  %21 = or i1 %19, %20, !dbg !348
  %22 = xor i1 %21, true, !dbg !349
  %23 = getelementptr i8, i8* %9, i64 18
  %24 = bitcast i8* %23 to %struct.vlan_hdr*
  %25 = icmp ugt %struct.vlan_hdr* %24, %17
  %26 = select i1 %22, i1 true, i1 %25, !dbg !350
  br i1 %26, label %44, label %27, !dbg !350

27:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i16 undef, metadata !325, metadata !DIExpression()) #4, !dbg !327
  %28 = getelementptr i8, i8* %9, i64 16, !dbg !351
  %29 = bitcast i8* %28 to i16*, !dbg !351
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %24, metadata !319, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i32 1, metadata !326, metadata !DIExpression()) #4, !dbg !327
  %30 = load i16, i16* %29, align 1, !dbg !327, !tbaa !334
  call void @llvm.dbg.value(metadata i16 %30, metadata !325, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i16 %30, metadata !336, metadata !DIExpression()) #4, !dbg !341
  %31 = icmp eq i16 %30, 129, !dbg !347
  %32 = icmp eq i16 %30, -22392, !dbg !348
  %33 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %31) #4
  %34 = or i1 %32, %33, !dbg !348
  %35 = xor i1 %34, true, !dbg !349
  %36 = getelementptr i8, i8* %9, i64 22
  %37 = bitcast i8* %36 to %struct.vlan_hdr*
  %38 = icmp ugt %struct.vlan_hdr* %37, %17
  %39 = select i1 %35, i1 true, i1 %38, !dbg !350
  br i1 %39, label %44, label %40, !dbg !350

40:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i16 undef, metadata !325, metadata !DIExpression()) #4, !dbg !327
  %41 = getelementptr i8, i8* %9, i64 20, !dbg !351
  %42 = bitcast i8* %41 to i16*, !dbg !351
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %37, metadata !319, metadata !DIExpression()) #4, !dbg !327
  call void @llvm.dbg.value(metadata i32 2, metadata !326, metadata !DIExpression()) #4, !dbg !327
  %43 = load i16, i16* %42, align 1, !dbg !327, !tbaa !334
  call void @llvm.dbg.value(metadata i16 %43, metadata !325, metadata !DIExpression()) #4, !dbg !327
  br label %44

44:                                               ; preds = %13, %27, %40
  %45 = phi i8* [ %11, %13 ], [ %23, %27 ], [ %36, %40 ], !dbg !327
  %46 = phi i16 [ %16, %13 ], [ %30, %27 ], [ %43, %40 ], !dbg !327
  call void @llvm.dbg.value(metadata i8* %45, metadata !161, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata i16 %46, metadata !177, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !274
  switch i16 %46, label %186 [
    i16 8, label %47
    i16 -8826, label %66
  ], !dbg !352

47:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !180, metadata !DIExpression(DW_OP_deref)), !dbg !274
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !353, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %5, metadata !359, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !360, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %45, metadata !361, metadata !DIExpression()), !dbg !363
  %48 = getelementptr inbounds i8, i8* %45, i64 20, !dbg !367
  %49 = icmp ugt i8* %48, %5, !dbg !369
  br i1 %49, label %186, label %50, !dbg !370

50:                                               ; preds = %47
  %51 = load i8, i8* %45, align 4, !dbg !371
  %52 = and i8 %51, -16, !dbg !373
  %53 = icmp eq i8 %52, 64, !dbg !373
  br i1 %53, label %54, label %186, !dbg !374

54:                                               ; preds = %50
  %55 = shl i8 %51, 2, !dbg !375
  %56 = and i8 %55, 60, !dbg !375
  call void @llvm.dbg.value(metadata i8 %56, metadata !362, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !363
  %57 = icmp ult i8 %56, 20, !dbg !376
  br i1 %57, label %186, label %58, !dbg !378

58:                                               ; preds = %54
  %59 = zext i8 %56 to i64
  call void @llvm.dbg.value(metadata i64 %59, metadata !362, metadata !DIExpression()), !dbg !363
  %60 = getelementptr i8, i8* %45, i64 %59, !dbg !379
  %61 = icmp ugt i8* %60, %5, !dbg !381
  br i1 %61, label %186, label %62, !dbg !382

62:                                               ; preds = %58
  call void @llvm.dbg.value(metadata i8* %60, metadata !161, metadata !DIExpression()), !dbg !274
  %63 = getelementptr inbounds i8, i8* %45, i64 9, !dbg !383
  %64 = load i8, i8* %63, align 1, !dbg !383, !tbaa !384
  call void @llvm.dbg.value(metadata i8 %64, metadata !178, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !274
  %65 = icmp eq i8 %64, 6, !dbg !386
  br i1 %65, label %158, label %186, !dbg !388

66:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !208, metadata !DIExpression(DW_OP_deref)), !dbg !274
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !389, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i8* %5, metadata !395, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !396, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.value(metadata i8* %45, metadata !397, metadata !DIExpression()), !dbg !398
  %67 = getelementptr inbounds i8, i8* %45, i64 40, !dbg !402
  %68 = icmp ugt i8* %67, %5, !dbg !404
  br i1 %68, label %186, label %69, !dbg !405

69:                                               ; preds = %66
  %70 = load i8, i8* %45, align 4, !dbg !406
  %71 = and i8 %70, -16, !dbg !408
  %72 = icmp eq i8 %71, 96, !dbg !408
  br i1 %72, label %73, label %186, !dbg !409

73:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %67, metadata !161, metadata !DIExpression()), !dbg !274
  %74 = getelementptr inbounds i8, i8* %45, i64 6, !dbg !410
  %75 = load i8, i8* %74, align 2, !dbg !410, !tbaa !411
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !413, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %5, metadata !418, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i32 0, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %75, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %67, metadata !422, metadata !DIExpression()), !dbg !433
  %76 = getelementptr inbounds i8, i8* %45, i64 42, !dbg !434
  %77 = icmp ugt i8* %76, %5, !dbg !436
  br i1 %77, label %186, label %78, !dbg !437

78:                                               ; preds = %73
  switch i8 %75, label %154 [
    i8 0, label %80
    i8 60, label %80
    i8 43, label %80
    i8 -121, label %80
    i8 51, label %79
    i8 44, label %87
  ], !dbg !438

79:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i8 undef, metadata !419, metadata !DIExpression()), !dbg !430
  br label %80, !dbg !439

80:                                               ; preds = %79, %78, %78, %78, %78
  %81 = phi i64 [ 2, %79 ], [ 3, %78 ], [ 3, %78 ], [ 3, %78 ], [ 3, %78 ]
  %82 = getelementptr inbounds i8, i8* %45, i64 41, !dbg !441
  %83 = load i8, i8* %82, align 1, !dbg !441, !tbaa !442
  %84 = zext i8 %83 to i64, !dbg !441
  %85 = shl nuw nsw i64 %84, %81, !dbg !441
  %86 = add nuw nsw i64 %85, 8, !dbg !441
  br label %87, !dbg !441

87:                                               ; preds = %80, %78
  %88 = phi i64 [ 8, %78 ], [ %86, %80 ]
  %89 = getelementptr inbounds i8, i8* %67, i64 %88, !dbg !441
  call void @llvm.dbg.value(metadata i8* %89, metadata !161, metadata !DIExpression()), !dbg !274
  %90 = load i8, i8* %67, align 1, !dbg !441, !tbaa !444
  call void @llvm.dbg.value(metadata i32 1, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %90, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %89, metadata !422, metadata !DIExpression()), !dbg !433
  %91 = getelementptr inbounds i8, i8* %89, i64 2, !dbg !434
  %92 = icmp ugt i8* %91, %5, !dbg !436
  br i1 %92, label %186, label %93, !dbg !437

93:                                               ; preds = %87
  switch i8 %90, label %154 [
    i8 0, label %94
    i8 60, label %94
    i8 43, label %94
    i8 -121, label %94
    i8 51, label %95
    i8 44, label %102
  ], !dbg !438

94:                                               ; preds = %93, %93, %93, %93
  call void @llvm.dbg.value(metadata i8 undef, metadata !419, metadata !DIExpression()), !dbg !430
  br label %95, !dbg !445

95:                                               ; preds = %94, %93
  %96 = phi i64 [ 3, %94 ], [ 2, %93 ]
  %97 = getelementptr inbounds i8, i8* %89, i64 1, !dbg !441
  %98 = load i8, i8* %97, align 1, !dbg !441, !tbaa !442
  %99 = zext i8 %98 to i64, !dbg !441
  %100 = shl nuw nsw i64 %99, %96, !dbg !441
  %101 = add nuw nsw i64 %100, 8, !dbg !441
  br label %102, !dbg !441

102:                                              ; preds = %95, %93
  %103 = phi i64 [ 8, %93 ], [ %101, %95 ]
  %104 = getelementptr inbounds i8, i8* %89, i64 %103, !dbg !441
  call void @llvm.dbg.value(metadata i8* %104, metadata !161, metadata !DIExpression()), !dbg !274
  %105 = load i8, i8* %89, align 1, !dbg !441, !tbaa !444
  call void @llvm.dbg.value(metadata i32 2, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %105, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %104, metadata !422, metadata !DIExpression()), !dbg !433
  %106 = getelementptr inbounds i8, i8* %104, i64 2, !dbg !434
  %107 = icmp ugt i8* %106, %5, !dbg !436
  br i1 %107, label %186, label %108, !dbg !437

108:                                              ; preds = %102
  switch i8 %105, label %154 [
    i8 0, label %109
    i8 60, label %109
    i8 43, label %109
    i8 -121, label %109
    i8 51, label %110
    i8 44, label %117
  ], !dbg !438

109:                                              ; preds = %108, %108, %108, %108
  call void @llvm.dbg.value(metadata i8 undef, metadata !419, metadata !DIExpression()), !dbg !430
  br label %110, !dbg !445

110:                                              ; preds = %109, %108
  %111 = phi i64 [ 3, %109 ], [ 2, %108 ]
  %112 = getelementptr inbounds i8, i8* %104, i64 1, !dbg !441
  %113 = load i8, i8* %112, align 1, !dbg !441, !tbaa !442
  %114 = zext i8 %113 to i64, !dbg !441
  %115 = shl nuw nsw i64 %114, %111, !dbg !441
  %116 = add nuw nsw i64 %115, 8, !dbg !441
  br label %117, !dbg !441

117:                                              ; preds = %110, %108
  %118 = phi i64 [ 8, %108 ], [ %116, %110 ]
  %119 = getelementptr inbounds i8, i8* %104, i64 %118, !dbg !441
  call void @llvm.dbg.value(metadata i8* %119, metadata !161, metadata !DIExpression()), !dbg !274
  %120 = load i8, i8* %104, align 1, !dbg !441, !tbaa !444
  call void @llvm.dbg.value(metadata i32 3, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %120, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %119, metadata !422, metadata !DIExpression()), !dbg !433
  %121 = getelementptr inbounds i8, i8* %119, i64 2, !dbg !434
  %122 = icmp ugt i8* %121, %5, !dbg !436
  br i1 %122, label %186, label %123, !dbg !437

123:                                              ; preds = %117
  switch i8 %120, label %154 [
    i8 0, label %124
    i8 60, label %124
    i8 43, label %124
    i8 -121, label %124
    i8 51, label %125
    i8 44, label %132
  ], !dbg !438

124:                                              ; preds = %123, %123, %123, %123
  call void @llvm.dbg.value(metadata i8 undef, metadata !419, metadata !DIExpression()), !dbg !430
  br label %125, !dbg !445

125:                                              ; preds = %124, %123
  %126 = phi i64 [ 3, %124 ], [ 2, %123 ]
  %127 = getelementptr inbounds i8, i8* %119, i64 1, !dbg !441
  %128 = load i8, i8* %127, align 1, !dbg !441, !tbaa !442
  %129 = zext i8 %128 to i64, !dbg !441
  %130 = shl nuw nsw i64 %129, %126, !dbg !441
  %131 = add nuw nsw i64 %130, 8, !dbg !441
  br label %132, !dbg !441

132:                                              ; preds = %125, %123
  %133 = phi i64 [ 8, %123 ], [ %131, %125 ]
  %134 = getelementptr inbounds i8, i8* %119, i64 %133, !dbg !441
  call void @llvm.dbg.value(metadata i8* %134, metadata !161, metadata !DIExpression()), !dbg !274
  %135 = load i8, i8* %119, align 1, !dbg !441, !tbaa !444
  call void @llvm.dbg.value(metadata i32 4, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %135, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %134, metadata !422, metadata !DIExpression()), !dbg !433
  %136 = getelementptr inbounds i8, i8* %134, i64 2, !dbg !434
  %137 = icmp ugt i8* %136, %5, !dbg !436
  br i1 %137, label %186, label %138, !dbg !437

138:                                              ; preds = %132
  switch i8 %135, label %154 [
    i8 0, label %139
    i8 60, label %139
    i8 43, label %139
    i8 -121, label %139
    i8 51, label %140
    i8 44, label %147
  ], !dbg !438

139:                                              ; preds = %138, %138, %138, %138
  call void @llvm.dbg.value(metadata i8 undef, metadata !419, metadata !DIExpression()), !dbg !430
  br label %140, !dbg !445

140:                                              ; preds = %139, %138
  %141 = phi i64 [ 3, %139 ], [ 2, %138 ]
  %142 = getelementptr inbounds i8, i8* %134, i64 1, !dbg !441
  %143 = load i8, i8* %142, align 1, !dbg !441, !tbaa !442
  %144 = zext i8 %143 to i64, !dbg !441
  %145 = shl nuw nsw i64 %144, %141, !dbg !441
  %146 = add nuw nsw i64 %145, 8, !dbg !441
  br label %147, !dbg !441

147:                                              ; preds = %140, %138
  %148 = phi i64 [ 8, %138 ], [ %146, %140 ]
  %149 = getelementptr inbounds i8, i8* %134, i64 %148, !dbg !441
  call void @llvm.dbg.value(metadata i8* %149, metadata !161, metadata !DIExpression()), !dbg !274
  %150 = load i8, i8* %134, align 1, !dbg !441, !tbaa !444
  call void @llvm.dbg.value(metadata i32 5, metadata !420, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i8 %150, metadata !419, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i8* %149, metadata !422, metadata !DIExpression()), !dbg !433
  %151 = getelementptr inbounds i8, i8* %149, i64 2, !dbg !434
  %152 = icmp ugt i8* %151, %5, !dbg !436
  br i1 %152, label %186, label %153, !dbg !437

153:                                              ; preds = %147
  switch i8 %150, label %154 [
    i8 0, label %186
    i8 60, label %186
    i8 43, label %186
    i8 -121, label %186
    i8 51, label %186
    i8 44, label %186
  ], !dbg !438

154:                                              ; preds = %78, %93, %108, %123, %138, %153
  %155 = phi i8* [ %67, %78 ], [ %89, %93 ], [ %104, %108 ], [ %119, %123 ], [ %134, %138 ], [ %149, %153 ], !dbg !398
  %156 = phi i8 [ %75, %78 ], [ %90, %93 ], [ %105, %108 ], [ %120, %123 ], [ %135, %138 ], [ %150, %153 ]
  call void @llvm.dbg.value(metadata i8* %155, metadata !161, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata i8 %156, metadata !178, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !274
  %157 = icmp eq i8 %156, 6, !dbg !446
  br i1 %157, label %158, label %186, !dbg !448

158:                                              ; preds = %154, %62
  %159 = phi i8* [ %155, %154 ], [ %60, %62 ], !dbg !449
  call void @llvm.dbg.value(metadata i8* %159, metadata !161, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !450, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i8* %5, metadata !456, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !457, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i8* %159, metadata !459, metadata !DIExpression()), !dbg !460
  %160 = getelementptr inbounds i8, i8* %159, i64 20, !dbg !462
  %161 = icmp ugt i8* %160, %5, !dbg !464
  br i1 %161, label %175, label %162, !dbg !465

162:                                              ; preds = %158
  %163 = getelementptr inbounds i8, i8* %159, i64 12, !dbg !466
  %164 = bitcast i8* %163 to i16*, !dbg !466
  %165 = load i16, i16* %164, align 4, !dbg !466
  %166 = lshr i16 %165, 2, !dbg !467
  %167 = and i16 %166, 60, !dbg !467
  call void @llvm.dbg.value(metadata i16 %167, metadata !458, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !460
  %168 = icmp ult i16 %167, 20, !dbg !468
  br i1 %168, label %175, label %169, !dbg !470

169:                                              ; preds = %162
  %170 = zext i16 %167 to i64
  call void @llvm.dbg.value(metadata i64 %170, metadata !458, metadata !DIExpression()), !dbg !460
  %171 = getelementptr i8, i8* %159, i64 %170, !dbg !471
  %172 = icmp ugt i8* %171, %5, !dbg !473
  br i1 %172, label %175, label %173, !dbg !474

173:                                              ; preds = %169
  call void @llvm.dbg.value(metadata i8* %171, metadata !161, metadata !DIExpression()), !dbg !274
  %174 = bitcast i8* %159 to %struct.tcphdr*, !dbg !475
  br label %175, !dbg !476

175:                                              ; preds = %158, %162, %169, %173
  %176 = phi %struct.tcphdr* [ undef, %158 ], [ undef, %162 ], [ undef, %169 ], [ %174, %173 ]
  call void @llvm.dbg.value(metadata i32 undef, metadata !179, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.value(metadata %struct.tcphdr* %176, metadata !251, metadata !DIExpression()), !dbg !274
  %177 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %176, i64 1, !dbg !477
  %178 = inttoptr i64 %4 to %struct.tcphdr*, !dbg !479
  %179 = icmp ugt %struct.tcphdr* %177, %178, !dbg !480
  br i1 %179, label %186, label %180, !dbg !481

180:                                              ; preds = %175
  %181 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %176, i64 0, i32 1, !dbg !482
  %182 = load i16, i16* %181, align 2, !dbg !482, !tbaa !483
  switch i16 %182, label %186 [
    i16 -28641, label %184
    i16 -28385, label %183
  ], !dbg !485

183:                                              ; preds = %180
  br label %184, !dbg !486

184:                                              ; preds = %180, %183
  %185 = phi i32 [ 32, %183 ], [ 16, %180 ]
  store i32 %185, i32* %10, align 8, !dbg !488, !tbaa !290
  br label %186, !dbg !489

186:                                              ; preds = %184, %153, %153, %153, %153, %153, %153, %73, %87, %102, %117, %132, %147, %69, %66, %58, %54, %50, %47, %1, %44, %180, %175, %154, %62
  call void @llvm.dbg.label(metadata !273), !dbg !490
  ret i32 0, !dbg !489
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

attributes #0 = { mustprogress nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!49, !50, !51, !52}
!llvm.ident = !{!53}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 70, type: !46, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !37, globals: !45, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "filter.c", directory: "/home/nir_ophir/code/bpf-examples/tc-basic-classifier", checksumkind: CSK_MD5, checksum: "7839c84c8d804e534ad6d2b97f10390c")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 28, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!9 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!10 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!11 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!12 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!13 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!14 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!15 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!16 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!17 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!18 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!19 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!20 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!21 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!22 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!23 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!24 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!25 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!26 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!27 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!28 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!29 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!30 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!31 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!32 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!33 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!34 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!35 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!36 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!37 = !{!38, !39, !40, !43}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !41, line: 24, baseType: !42)
!41 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!42 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !{!0}
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 32, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 4)
!49 = !{i32 7, !"Dwarf Version", i32 5}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{i32 1, !"wchar_size", i32 4}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!54 = distinct !DISubprogram(name: "cls_filter", scope: !3, file: !3, line: 20, type: !55, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !157)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !60, line: 4183, size: 1472, elements: !61)
!60 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/tc-basic-classifier", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!61 = !{!62, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !79, !80, !81, !82, !83, !84, !85, !86, !87, !89, !90, !91, !92, !93, !130, !132, !133, !134, !156}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !59, file: !60, line: 4184, baseType: !63, size: 32)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !41, line: 27, baseType: !7)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !59, file: !60, line: 4185, baseType: !63, size: 32, offset: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !59, file: !60, line: 4186, baseType: !63, size: 32, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !59, file: !60, line: 4187, baseType: !63, size: 32, offset: 96)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !59, file: !60, line: 4188, baseType: !63, size: 32, offset: 128)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !59, file: !60, line: 4189, baseType: !63, size: 32, offset: 160)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !59, file: !60, line: 4190, baseType: !63, size: 32, offset: 192)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !59, file: !60, line: 4191, baseType: !63, size: 32, offset: 224)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !59, file: !60, line: 4192, baseType: !63, size: 32, offset: 256)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !59, file: !60, line: 4193, baseType: !63, size: 32, offset: 288)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !59, file: !60, line: 4194, baseType: !63, size: 32, offset: 320)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !59, file: !60, line: 4195, baseType: !63, size: 32, offset: 352)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !59, file: !60, line: 4196, baseType: !76, size: 160, offset: 384)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 160, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 5)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !59, file: !60, line: 4197, baseType: !63, size: 32, offset: 544)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !59, file: !60, line: 4198, baseType: !63, size: 32, offset: 576)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !59, file: !60, line: 4199, baseType: !63, size: 32, offset: 608)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !59, file: !60, line: 4200, baseType: !63, size: 32, offset: 640)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !59, file: !60, line: 4201, baseType: !63, size: 32, offset: 672)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !59, file: !60, line: 4204, baseType: !63, size: 32, offset: 704)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !59, file: !60, line: 4205, baseType: !63, size: 32, offset: 736)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !59, file: !60, line: 4206, baseType: !63, size: 32, offset: 768)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !59, file: !60, line: 4207, baseType: !88, size: 128, offset: 800)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 128, elements: !47)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !59, file: !60, line: 4208, baseType: !88, size: 128, offset: 928)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !59, file: !60, line: 4209, baseType: !63, size: 32, offset: 1056)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !59, file: !60, line: 4210, baseType: !63, size: 32, offset: 1088)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !59, file: !60, line: 4213, baseType: !63, size: 32, offset: 1120)
!93 = !DIDerivedType(tag: DW_TAG_member, scope: !59, file: !60, line: 4214, baseType: !94, size: 64, align: 64, offset: 1152)
!94 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !59, file: !60, line: 4214, size: 64, align: 64, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !94, file: !60, line: 4214, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !60, line: 5041, size: 448, elements: !99)
!99 = !{!100, !101, !102, !103, !106, !107, !108, !109, !112, !113, !114, !128, !129}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !98, file: !60, line: 5042, baseType: !40, size: 16)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !98, file: !60, line: 5043, baseType: !40, size: 16, offset: 16)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !98, file: !60, line: 5044, baseType: !40, size: 16, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !98, file: !60, line: 5045, baseType: !104, size: 8, offset: 48)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !41, line: 21, baseType: !105)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !98, file: !60, line: 5046, baseType: !104, size: 8, offset: 56)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !98, file: !60, line: 5047, baseType: !104, size: 8, offset: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !98, file: !60, line: 5048, baseType: !104, size: 8, offset: 72)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !98, file: !60, line: 5049, baseType: !110, size: 16, offset: 80)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !111, line: 25, baseType: !40)
!111 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!112 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !98, file: !60, line: 5050, baseType: !110, size: 16, offset: 96)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !98, file: !60, line: 5051, baseType: !110, size: 16, offset: 112)
!114 = !DIDerivedType(tag: DW_TAG_member, scope: !98, file: !60, line: 5052, baseType: !115, size: 256, offset: 128)
!115 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !98, file: !60, line: 5052, size: 256, elements: !116)
!116 = !{!117, !123}
!117 = !DIDerivedType(tag: DW_TAG_member, scope: !115, file: !60, line: 5053, baseType: !118, size: 64)
!118 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !115, file: !60, line: 5053, size: 64, elements: !119)
!119 = !{!120, !122}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !118, file: !60, line: 5054, baseType: !121, size: 32)
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !111, line: 27, baseType: !63)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !118, file: !60, line: 5055, baseType: !121, size: 32, offset: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, scope: !115, file: !60, line: 5057, baseType: !124, size: 256)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !115, file: !60, line: 5057, size: 256, elements: !125)
!125 = !{!126, !127}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !124, file: !60, line: 5058, baseType: !88, size: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !124, file: !60, line: 5059, baseType: !88, size: 128, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !98, file: !60, line: 5062, baseType: !63, size: 32, offset: 384)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !98, file: !60, line: 5063, baseType: !121, size: 32, offset: 416)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !59, file: !60, line: 4215, baseType: !131, size: 64, offset: 1216)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !41, line: 31, baseType: !39)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !59, file: !60, line: 4216, baseType: !63, size: 32, offset: 1280)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !59, file: !60, line: 4217, baseType: !63, size: 32, offset: 1312)
!134 = !DIDerivedType(tag: DW_TAG_member, scope: !59, file: !60, line: 4218, baseType: !135, size: 64, align: 64, offset: 1344)
!135 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !59, file: !60, line: 4218, size: 64, align: 64, elements: !136)
!136 = !{!137}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !135, file: !60, line: 4218, baseType: !138, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !60, line: 4272, size: 640, elements: !140)
!140 = !{!141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !139, file: !60, line: 4273, baseType: !63, size: 32)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !139, file: !60, line: 4274, baseType: !63, size: 32, offset: 32)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !139, file: !60, line: 4275, baseType: !63, size: 32, offset: 64)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !139, file: !60, line: 4276, baseType: !63, size: 32, offset: 96)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !139, file: !60, line: 4277, baseType: !63, size: 32, offset: 128)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !139, file: !60, line: 4278, baseType: !63, size: 32, offset: 160)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !139, file: !60, line: 4280, baseType: !63, size: 32, offset: 192)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !139, file: !60, line: 4281, baseType: !88, size: 128, offset: 224)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !139, file: !60, line: 4282, baseType: !63, size: 32, offset: 352)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !139, file: !60, line: 4283, baseType: !63, size: 32, offset: 384)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !139, file: !60, line: 4284, baseType: !63, size: 32, offset: 416)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !139, file: !60, line: 4285, baseType: !88, size: 128, offset: 448)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !139, file: !60, line: 4286, baseType: !63, size: 32, offset: 576)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !139, file: !60, line: 4287, baseType: !155, size: 32, offset: 608)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !41, line: 26, baseType: !57)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !59, file: !60, line: 4219, baseType: !63, size: 32, offset: 1408)
!157 = !{!158, !159, !160, !161, !166, !177, !178, !179, !180, !208, !251, !273}
!158 = !DILocalVariable(name: "skb", arg: 1, scope: !54, file: !3, line: 20, type: !58)
!159 = !DILocalVariable(name: "data_end", scope: !54, file: !3, line: 22, type: !38)
!160 = !DILocalVariable(name: "data", scope: !54, file: !3, line: 23, type: !38)
!161 = !DILocalVariable(name: "nh", scope: !54, file: !3, line: 25, type: !162)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !163, line: 35, size: 64, elements: !164)
!163 = !DIFile(filename: "./../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/tc-basic-classifier", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !162, file: !163, line: 36, baseType: !38, size: 64)
!166 = !DILocalVariable(name: "eth", scope: !54, file: !3, line: 26, type: !167)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !169, line: 168, size: 112, elements: !170)
!169 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!170 = !{!171, !175, !176}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !168, file: !169, line: 169, baseType: !172, size: 48)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 48, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 6)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !168, file: !169, line: 170, baseType: !172, size: 48, offset: 48)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !168, file: !169, line: 171, baseType: !110, size: 16, offset: 96)
!177 = !DILocalVariable(name: "eth_type", scope: !54, file: !3, line: 27, type: !57)
!178 = !DILocalVariable(name: "ip_type", scope: !54, file: !3, line: 28, type: !57)
!179 = !DILocalVariable(name: "tcp_type", scope: !54, file: !3, line: 29, type: !57)
!180 = !DILocalVariable(name: "iphdr", scope: !54, file: !3, line: 30, type: !181)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !183, line: 87, size: 160, elements: !184)
!183 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!184 = !{!185, !186, !187, !188, !189, !190, !191, !192, !193, !195}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !182, file: !183, line: 89, baseType: !104, size: 4, flags: DIFlagBitField, extraData: i64 0)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !182, file: !183, line: 90, baseType: !104, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !182, file: !183, line: 97, baseType: !104, size: 8, offset: 8)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !182, file: !183, line: 98, baseType: !110, size: 16, offset: 16)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !182, file: !183, line: 99, baseType: !110, size: 16, offset: 32)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !182, file: !183, line: 100, baseType: !110, size: 16, offset: 48)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !182, file: !183, line: 101, baseType: !104, size: 8, offset: 64)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !182, file: !183, line: 102, baseType: !104, size: 8, offset: 72)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !182, file: !183, line: 103, baseType: !194, size: 16, offset: 80)
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !111, line: 31, baseType: !40)
!195 = !DIDerivedType(tag: DW_TAG_member, scope: !182, file: !183, line: 104, baseType: !196, size: 64, offset: 96)
!196 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !182, file: !183, line: 104, size: 64, elements: !197)
!197 = !{!198, !203}
!198 = !DIDerivedType(tag: DW_TAG_member, scope: !196, file: !183, line: 104, baseType: !199, size: 64)
!199 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !196, file: !183, line: 104, size: 64, elements: !200)
!200 = !{!201, !202}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !199, file: !183, line: 104, baseType: !121, size: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !199, file: !183, line: 104, baseType: !121, size: 32, offset: 32)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !196, file: !183, line: 104, baseType: !204, size: 64)
!204 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !196, file: !183, line: 104, size: 64, elements: !205)
!205 = !{!206, !207}
!206 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !204, file: !183, line: 104, baseType: !121, size: 32)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !204, file: !183, line: 104, baseType: !121, size: 32, offset: 32)
!208 = !DILocalVariable(name: "ipv6hdr", scope: !54, file: !3, line: 31, type: !209)
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!210 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !211, line: 118, size: 320, elements: !212)
!211 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!212 = !{!213, !214, !215, !219, !220, !221, !222}
!213 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !210, file: !211, line: 120, baseType: !104, size: 4, flags: DIFlagBitField, extraData: i64 0)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !210, file: !211, line: 121, baseType: !104, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !210, file: !211, line: 128, baseType: !216, size: 24, offset: 8)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 24, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 3)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !210, file: !211, line: 130, baseType: !110, size: 16, offset: 32)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !210, file: !211, line: 131, baseType: !104, size: 8, offset: 48)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !210, file: !211, line: 132, baseType: !104, size: 8, offset: 56)
!222 = !DIDerivedType(tag: DW_TAG_member, scope: !210, file: !211, line: 134, baseType: !223, size: 256, offset: 64)
!223 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !210, file: !211, line: 134, size: 256, elements: !224)
!224 = !{!225, !246}
!225 = !DIDerivedType(tag: DW_TAG_member, scope: !223, file: !211, line: 134, baseType: !226, size: 256)
!226 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !223, file: !211, line: 134, size: 256, elements: !227)
!227 = !{!228, !245}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !226, file: !211, line: 134, baseType: !229, size: 128)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !230, line: 33, size: 128, elements: !231)
!230 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!231 = !{!232}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !229, file: !230, line: 40, baseType: !233, size: 128)
!233 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !229, file: !230, line: 34, size: 128, elements: !234)
!234 = !{!235, !239, !243}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !233, file: !230, line: 35, baseType: !236, size: 128)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 128, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 16)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !233, file: !230, line: 37, baseType: !240, size: 128)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !110, size: 128, elements: !241)
!241 = !{!242}
!242 = !DISubrange(count: 8)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !233, file: !230, line: 38, baseType: !244, size: 128)
!244 = !DICompositeType(tag: DW_TAG_array_type, baseType: !121, size: 128, elements: !47)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !226, file: !211, line: 134, baseType: !229, size: 128, offset: 128)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !223, file: !211, line: 134, baseType: !247, size: 256)
!247 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !223, file: !211, line: 134, size: 256, elements: !248)
!248 = !{!249, !250}
!249 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !247, file: !211, line: 134, baseType: !229, size: 128)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !247, file: !211, line: 134, baseType: !229, size: 128, offset: 128)
!251 = !DILocalVariable(name: "tcphdr", scope: !54, file: !3, line: 32, type: !252)
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !254, line: 25, size: 160, elements: !255)
!254 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!255 = !{!256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !253, file: !254, line: 26, baseType: !110, size: 16)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !253, file: !254, line: 27, baseType: !110, size: 16, offset: 16)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !253, file: !254, line: 28, baseType: !121, size: 32, offset: 32)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !253, file: !254, line: 29, baseType: !121, size: 32, offset: 64)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !253, file: !254, line: 31, baseType: !40, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !253, file: !254, line: 32, baseType: !40, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !253, file: !254, line: 33, baseType: !40, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !253, file: !254, line: 34, baseType: !40, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !253, file: !254, line: 35, baseType: !40, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !253, file: !254, line: 36, baseType: !40, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !253, file: !254, line: 37, baseType: !40, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !253, file: !254, line: 38, baseType: !40, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !253, file: !254, line: 39, baseType: !40, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !253, file: !254, line: 40, baseType: !40, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !253, file: !254, line: 55, baseType: !110, size: 16, offset: 112)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !253, file: !254, line: 56, baseType: !194, size: 16, offset: 128)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !253, file: !254, line: 57, baseType: !110, size: 16, offset: 144)
!273 = !DILabel(scope: !54, name: "out", file: !3, line: 66)
!274 = !DILocation(line: 0, scope: !54)
!275 = !DILocation(line: 22, column: 52, scope: !54)
!276 = !{!277, !278, i64 80}
!277 = !{!"__sk_buff", !278, i64 0, !278, i64 4, !278, i64 8, !278, i64 12, !278, i64 16, !278, i64 20, !278, i64 24, !278, i64 28, !278, i64 32, !278, i64 36, !278, i64 40, !278, i64 44, !279, i64 48, !278, i64 68, !278, i64 72, !278, i64 76, !278, i64 80, !278, i64 84, !278, i64 88, !278, i64 92, !278, i64 96, !279, i64 100, !279, i64 116, !278, i64 132, !278, i64 136, !278, i64 140, !279, i64 144, !281, i64 152, !278, i64 160, !278, i64 164, !279, i64 168, !278, i64 176}
!278 = !{!"int", !279, i64 0}
!279 = !{!"omnipotent char", !280, i64 0}
!280 = !{!"Simple C/C++ TBAA"}
!281 = !{!"long long", !279, i64 0}
!282 = !DILocation(line: 22, column: 27, scope: !54)
!283 = !DILocation(line: 22, column: 19, scope: !54)
!284 = !DILocation(line: 23, column: 48, scope: !54)
!285 = !{!277, !278, i64 76}
!286 = !DILocation(line: 23, column: 23, scope: !54)
!287 = !DILocation(line: 23, column: 15, scope: !54)
!288 = !DILocation(line: 33, column: 7, scope: !54)
!289 = !DILocation(line: 33, column: 18, scope: !54)
!290 = !{!277, !278, i64 72}
!291 = !DILocalVariable(name: "nh", arg: 1, scope: !292, file: !163, line: 131, type: !295)
!292 = distinct !DISubprogram(name: "parse_ethhdr", scope: !163, file: !163, line: 131, type: !293, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !297)
!293 = !DISubroutineType(types: !294)
!294 = !{!57, !295, !38, !296}
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!297 = !{!291, !298, !299}
!298 = !DILocalVariable(name: "data_end", arg: 2, scope: !292, file: !163, line: 132, type: !38)
!299 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !292, file: !163, line: 133, type: !296)
!300 = !DILocation(line: 0, scope: !292, inlinedAt: !301)
!301 = distinct !DILocation(line: 38, column: 13, scope: !54)
!302 = !DILocalVariable(name: "nh", arg: 1, scope: !303, file: !163, line: 86, type: !295)
!303 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !163, file: !163, line: 86, type: !304, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !313)
!304 = !DISubroutineType(types: !305)
!305 = !{!57, !295, !38, !296, !306}
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !307, size: 64)
!307 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !163, line: 71, size: 32, elements: !308)
!308 = !{!309}
!309 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !307, file: !163, line: 72, baseType: !310, size: 32)
!310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 32, elements: !311)
!311 = !{!312}
!312 = !DISubrange(count: 2)
!313 = !{!302, !314, !315, !316, !317, !318, !319, !325, !326}
!314 = !DILocalVariable(name: "data_end", arg: 2, scope: !303, file: !163, line: 87, type: !38)
!315 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !303, file: !163, line: 88, type: !296)
!316 = !DILocalVariable(name: "vlans", arg: 4, scope: !303, file: !163, line: 89, type: !306)
!317 = !DILocalVariable(name: "eth", scope: !303, file: !163, line: 91, type: !167)
!318 = !DILocalVariable(name: "hdrsize", scope: !303, file: !163, line: 92, type: !57)
!319 = !DILocalVariable(name: "vlh", scope: !303, file: !163, line: 93, type: !320)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !321, size: 64)
!321 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !163, line: 44, size: 32, elements: !322)
!322 = !{!323, !324}
!323 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !321, file: !163, line: 45, baseType: !110, size: 16)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !321, file: !163, line: 46, baseType: !110, size: 16, offset: 16)
!325 = !DILocalVariable(name: "h_proto", scope: !303, file: !163, line: 94, type: !40)
!326 = !DILocalVariable(name: "i", scope: !303, file: !163, line: 95, type: !57)
!327 = !DILocation(line: 0, scope: !303, inlinedAt: !328)
!328 = distinct !DILocation(line: 136, column: 9, scope: !292, inlinedAt: !301)
!329 = !DILocation(line: 100, column: 14, scope: !330, inlinedAt: !328)
!330 = distinct !DILexicalBlock(scope: !303, file: !163, line: 100, column: 6)
!331 = !DILocation(line: 100, column: 24, scope: !330, inlinedAt: !328)
!332 = !DILocation(line: 100, column: 6, scope: !303, inlinedAt: !328)
!333 = !DILocation(line: 106, column: 17, scope: !303, inlinedAt: !328)
!334 = !{!335, !335, i64 0}
!335 = !{!"short", !279, i64 0}
!336 = !DILocalVariable(name: "h_proto", arg: 1, scope: !337, file: !163, line: 75, type: !40)
!337 = distinct !DISubprogram(name: "proto_is_vlan", scope: !163, file: !163, line: 75, type: !338, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !340)
!338 = !DISubroutineType(types: !339)
!339 = !{!57, !40}
!340 = !{!336}
!341 = !DILocation(line: 0, scope: !337, inlinedAt: !342)
!342 = distinct !DILocation(line: 113, column: 8, scope: !343, inlinedAt: !328)
!343 = distinct !DILexicalBlock(scope: !344, file: !163, line: 113, column: 7)
!344 = distinct !DILexicalBlock(scope: !345, file: !163, line: 112, column: 39)
!345 = distinct !DILexicalBlock(scope: !346, file: !163, line: 112, column: 2)
!346 = distinct !DILexicalBlock(scope: !303, file: !163, line: 112, column: 2)
!347 = !DILocation(line: 77, column: 20, scope: !337, inlinedAt: !342)
!348 = !DILocation(line: 77, column: 46, scope: !337, inlinedAt: !342)
!349 = !DILocation(line: 113, column: 8, scope: !343, inlinedAt: !328)
!350 = !DILocation(line: 113, column: 7, scope: !344, inlinedAt: !328)
!351 = !DILocation(line: 119, column: 18, scope: !344, inlinedAt: !328)
!352 = !DILocation(line: 39, column: 6, scope: !54)
!353 = !DILocalVariable(name: "nh", arg: 1, scope: !354, file: !163, line: 196, type: !295)
!354 = distinct !DISubprogram(name: "parse_iphdr", scope: !163, file: !163, line: 196, type: !355, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !358)
!355 = !DISubroutineType(types: !356)
!356 = !{!57, !295, !38, !357}
!357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!358 = !{!353, !359, !360, !361, !362}
!359 = !DILocalVariable(name: "data_end", arg: 2, scope: !354, file: !163, line: 197, type: !38)
!360 = !DILocalVariable(name: "iphdr", arg: 3, scope: !354, file: !163, line: 198, type: !357)
!361 = !DILocalVariable(name: "iph", scope: !354, file: !163, line: 200, type: !181)
!362 = !DILocalVariable(name: "hdrsize", scope: !354, file: !163, line: 201, type: !57)
!363 = !DILocation(line: 0, scope: !354, inlinedAt: !364)
!364 = distinct !DILocation(line: 40, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !366, file: !3, line: 39, column: 39)
!366 = distinct !DILexicalBlock(scope: !54, file: !3, line: 39, column: 6)
!367 = !DILocation(line: 203, column: 10, scope: !368, inlinedAt: !364)
!368 = distinct !DILexicalBlock(scope: !354, file: !163, line: 203, column: 6)
!369 = !DILocation(line: 203, column: 14, scope: !368, inlinedAt: !364)
!370 = !DILocation(line: 203, column: 6, scope: !354, inlinedAt: !364)
!371 = !DILocation(line: 206, column: 11, scope: !372, inlinedAt: !364)
!372 = distinct !DILexicalBlock(scope: !354, file: !163, line: 206, column: 6)
!373 = !DILocation(line: 206, column: 19, scope: !372, inlinedAt: !364)
!374 = !DILocation(line: 206, column: 6, scope: !354, inlinedAt: !364)
!375 = !DILocation(line: 209, column: 21, scope: !354, inlinedAt: !364)
!376 = !DILocation(line: 211, column: 13, scope: !377, inlinedAt: !364)
!377 = distinct !DILexicalBlock(scope: !354, file: !163, line: 211, column: 5)
!378 = !DILocation(line: 211, column: 5, scope: !354, inlinedAt: !364)
!379 = !DILocation(line: 215, column: 14, scope: !380, inlinedAt: !364)
!380 = distinct !DILexicalBlock(scope: !354, file: !163, line: 215, column: 6)
!381 = !DILocation(line: 215, column: 24, scope: !380, inlinedAt: !364)
!382 = !DILocation(line: 215, column: 6, scope: !354, inlinedAt: !364)
!383 = !DILocation(line: 221, column: 14, scope: !354, inlinedAt: !364)
!384 = !{!385, !279, i64 9}
!385 = !{!"iphdr", !279, i64 0, !279, i64 0, !279, i64 1, !335, i64 2, !335, i64 4, !335, i64 6, !279, i64 8, !279, i64 9, !335, i64 10, !279, i64 12}
!386 = !DILocation(line: 41, column: 15, scope: !387)
!387 = distinct !DILexicalBlock(scope: !365, file: !3, line: 41, column: 7)
!388 = !DILocation(line: 41, column: 7, scope: !365)
!389 = !DILocalVariable(name: "nh", arg: 1, scope: !390, file: !163, line: 174, type: !295)
!390 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !163, file: !163, line: 174, type: !391, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !394)
!391 = !DISubroutineType(types: !392)
!392 = !{!57, !295, !38, !393}
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!394 = !{!389, !395, !396, !397}
!395 = !DILocalVariable(name: "data_end", arg: 2, scope: !390, file: !163, line: 175, type: !38)
!396 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !390, file: !163, line: 176, type: !393)
!397 = !DILocalVariable(name: "ip6h", scope: !390, file: !163, line: 178, type: !209)
!398 = !DILocation(line: 0, scope: !390, inlinedAt: !399)
!399 = distinct !DILocation(line: 45, column: 13, scope: !400)
!400 = distinct !DILexicalBlock(scope: !401, file: !3, line: 44, column: 46)
!401 = distinct !DILexicalBlock(scope: !366, file: !3, line: 44, column: 11)
!402 = !DILocation(line: 184, column: 11, scope: !403, inlinedAt: !399)
!403 = distinct !DILexicalBlock(scope: !390, file: !163, line: 184, column: 6)
!404 = !DILocation(line: 184, column: 15, scope: !403, inlinedAt: !399)
!405 = !DILocation(line: 184, column: 6, scope: !390, inlinedAt: !399)
!406 = !DILocation(line: 187, column: 12, scope: !407, inlinedAt: !399)
!407 = distinct !DILexicalBlock(scope: !390, file: !163, line: 187, column: 6)
!408 = !DILocation(line: 187, column: 20, scope: !407, inlinedAt: !399)
!409 = !DILocation(line: 187, column: 6, scope: !390, inlinedAt: !399)
!410 = !DILocation(line: 193, column: 44, scope: !390, inlinedAt: !399)
!411 = !{!412, !279, i64 6}
!412 = !{!"ipv6hdr", !279, i64 0, !279, i64 0, !279, i64 1, !335, i64 4, !279, i64 6, !279, i64 7, !279, i64 8}
!413 = !DILocalVariable(name: "nh", arg: 1, scope: !414, file: !163, line: 139, type: !295)
!414 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !163, file: !163, line: 139, type: !415, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !417)
!415 = !DISubroutineType(types: !416)
!416 = !{!57, !295, !38, !104}
!417 = !{!413, !418, !419, !420, !422}
!418 = !DILocalVariable(name: "data_end", arg: 2, scope: !414, file: !163, line: 140, type: !38)
!419 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !414, file: !163, line: 141, type: !104)
!420 = !DILocalVariable(name: "i", scope: !421, file: !163, line: 143, type: !57)
!421 = distinct !DILexicalBlock(scope: !414, file: !163, line: 143, column: 2)
!422 = !DILocalVariable(name: "hdr", scope: !423, file: !163, line: 144, type: !425)
!423 = distinct !DILexicalBlock(scope: !424, file: !163, line: 143, column: 47)
!424 = distinct !DILexicalBlock(scope: !421, file: !163, line: 143, column: 2)
!425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !426, size: 64)
!426 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !211, line: 63, size: 16, elements: !427)
!427 = !{!428, !429}
!428 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !426, file: !211, line: 64, baseType: !104, size: 8)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !426, file: !211, line: 65, baseType: !104, size: 8, offset: 8)
!430 = !DILocation(line: 0, scope: !414, inlinedAt: !431)
!431 = distinct !DILocation(line: 193, column: 9, scope: !390, inlinedAt: !399)
!432 = !DILocation(line: 0, scope: !421, inlinedAt: !431)
!433 = !DILocation(line: 0, scope: !423, inlinedAt: !431)
!434 = !DILocation(line: 146, column: 11, scope: !435, inlinedAt: !431)
!435 = distinct !DILexicalBlock(scope: !423, file: !163, line: 146, column: 7)
!436 = !DILocation(line: 146, column: 15, scope: !435, inlinedAt: !431)
!437 = !DILocation(line: 146, column: 7, scope: !423, inlinedAt: !431)
!438 = !DILocation(line: 149, column: 3, scope: !423, inlinedAt: !431)
!439 = !DILocation(line: 160, column: 4, scope: !440, inlinedAt: !431)
!440 = distinct !DILexicalBlock(scope: !423, file: !163, line: 149, column: 26)
!441 = !DILocation(line: 0, scope: !440, inlinedAt: !431)
!442 = !{!443, !279, i64 1}
!443 = !{!"ipv6_opt_hdr", !279, i64 0, !279, i64 1}
!444 = !{!443, !279, i64 0}
!445 = !DILocation(line: 156, column: 4, scope: !440, inlinedAt: !431)
!446 = !DILocation(line: 46, column: 15, scope: !447)
!447 = distinct !DILexicalBlock(scope: !400, file: !3, line: 46, column: 7)
!448 = !DILocation(line: 46, column: 7, scope: !400)
!449 = !DILocation(line: 35, column: 9, scope: !54)
!450 = !DILocalVariable(name: "nh", arg: 1, scope: !451, file: !163, line: 295, type: !295)
!451 = distinct !DISubprogram(name: "parse_tcphdr", scope: !163, file: !163, line: 295, type: !452, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !455)
!452 = !DISubroutineType(types: !453)
!453 = !{!57, !295, !38, !454}
!454 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!455 = !{!450, !456, !457, !458, !459}
!456 = !DILocalVariable(name: "data_end", arg: 2, scope: !451, file: !163, line: 296, type: !38)
!457 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !451, file: !163, line: 297, type: !454)
!458 = !DILocalVariable(name: "len", scope: !451, file: !163, line: 299, type: !57)
!459 = !DILocalVariable(name: "h", scope: !451, file: !163, line: 300, type: !252)
!460 = !DILocation(line: 0, scope: !451, inlinedAt: !461)
!461 = distinct !DILocation(line: 53, column: 13, scope: !54)
!462 = !DILocation(line: 302, column: 8, scope: !463, inlinedAt: !461)
!463 = distinct !DILexicalBlock(scope: !451, file: !163, line: 302, column: 6)
!464 = !DILocation(line: 302, column: 12, scope: !463, inlinedAt: !461)
!465 = !DILocation(line: 302, column: 6, scope: !451, inlinedAt: !461)
!466 = !DILocation(line: 305, column: 11, scope: !451, inlinedAt: !461)
!467 = !DILocation(line: 305, column: 16, scope: !451, inlinedAt: !461)
!468 = !DILocation(line: 307, column: 9, scope: !469, inlinedAt: !461)
!469 = distinct !DILexicalBlock(scope: !451, file: !163, line: 307, column: 5)
!470 = !DILocation(line: 307, column: 5, scope: !451, inlinedAt: !461)
!471 = !DILocation(line: 311, column: 14, scope: !472, inlinedAt: !461)
!472 = distinct !DILexicalBlock(scope: !451, file: !163, line: 311, column: 6)
!473 = !DILocation(line: 311, column: 20, scope: !472, inlinedAt: !461)
!474 = !DILocation(line: 311, column: 6, scope: !451, inlinedAt: !461)
!475 = !DILocation(line: 315, column: 10, scope: !451, inlinedAt: !461)
!476 = !DILocation(line: 317, column: 2, scope: !451, inlinedAt: !461)
!477 = !DILocation(line: 54, column: 13, scope: !478)
!478 = distinct !DILexicalBlock(scope: !54, file: !3, line: 54, column: 6)
!479 = !DILocation(line: 54, column: 19, scope: !478)
!480 = !DILocation(line: 54, column: 17, scope: !478)
!481 = !DILocation(line: 54, column: 6, scope: !54)
!482 = !DILocation(line: 58, column: 18, scope: !54)
!483 = !{!484, !335, i64 2}
!484 = !{!"tcphdr", !335, i64 0, !335, i64 2, !278, i64 4, !278, i64 8, !335, i64 12, !335, i64 12, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 13, !335, i64 14, !335, i64 16, !335, i64 18}
!485 = !DILocation(line: 58, column: 2, scope: !54)
!486 = !DILocation(line: 64, column: 2, scope: !487)
!487 = distinct !DILexicalBlock(scope: !54, file: !3, line: 58, column: 24)
!488 = !DILocation(line: 0, scope: !487)
!489 = !DILocation(line: 67, column: 2, scope: !54)
!490 = !DILocation(line: 66, column: 2, scope: !54)
