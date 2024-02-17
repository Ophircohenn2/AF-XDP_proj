; ModuleID = 'preserve_dscp_kern.c'
source_filename = "preserve_dscp_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { [9 x i32]*, i32*, i8*, [16384 x i32]* }
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
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.8 }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.4 }
%union.anon.4 = type { %struct.anon.5 }
%struct.anon.5 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.6 }
%union.anon.6 = type { [4 x i32] }

@flow_dscps = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !23
@ip_only = internal constant i32 0, align 4, !dbg !133
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.3* @flow_dscps to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @read_dscp to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @write_dscp to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @read_dscp(%struct.__sk_buff* noundef %0) #0 section "tc" !dbg !176 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !180, metadata !DIExpression()), !dbg !183
  %4 = bitcast i32* %2 to i8*, !dbg !184
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #5, !dbg !184
  %5 = tail call i32 inttoptr (i64 34 to i32 (%struct.__sk_buff*)*)(%struct.__sk_buff* noundef %0) #5, !dbg !185
  call void @llvm.dbg.value(metadata i32 %5, metadata !181, metadata !DIExpression()), !dbg !183
  store i32 %5, i32* %2, align 4, !dbg !186, !tbaa !187
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %3) #5, !dbg !191
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !192, metadata !DIExpression()) #5, !dbg !287
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !289
  %7 = load i32, i32* %6, align 8, !dbg !289, !tbaa !290
  %8 = zext i32 %7 to i64, !dbg !293
  %9 = inttoptr i64 %8 to i8*, !dbg !294
  call void @llvm.dbg.value(metadata i8* %9, metadata !197, metadata !DIExpression()) #5, !dbg !287
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !295
  %11 = load i32, i32* %10, align 4, !dbg !295, !tbaa !296
  %12 = zext i32 %11 to i64, !dbg !297
  %13 = inttoptr i64 %12 to i8*, !dbg !298
  call void @llvm.dbg.value(metadata i8* %13, metadata !198, metadata !DIExpression()) #5, !dbg !287
  call void @llvm.dbg.value(metadata i8* %13, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %14 = load volatile i32, i32* @ip_only, align 4, !dbg !299, !tbaa !187
  %15 = icmp eq i32 %14, 0, !dbg !299
  br i1 %15, label %16, label %53, !dbg !301

16:                                               ; preds = %1
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !275, metadata !DIExpression(DW_OP_deref)) #5, !dbg !287
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !302, metadata !DIExpression()) #5, !dbg !311
  call void @llvm.dbg.value(metadata i8* %9, metadata !309, metadata !DIExpression()) #5, !dbg !311
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !310, metadata !DIExpression()) #5, !dbg !311
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !314, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i8* %9, metadata !326, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !327, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !328, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i8* %13, metadata !329, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i32 14, metadata !330, metadata !DIExpression()) #5, !dbg !339
  %17 = getelementptr i8, i8* %13, i64 14, !dbg !341
  %18 = icmp ugt i8* %17, %9, !dbg !343
  br i1 %18, label %180, label %19, !dbg !344

19:                                               ; preds = %16
  call void @llvm.dbg.value(metadata i8* %13, metadata !329, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i8* %17, metadata !199, metadata !DIExpression()) #5, !dbg !287
  call void @llvm.dbg.value(metadata i8* %17, metadata !331, metadata !DIExpression()) #5, !dbg !339
  %20 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !345
  %21 = bitcast i8* %20 to i16*, !dbg !345
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i32 0, metadata !338, metadata !DIExpression()) #5, !dbg !339
  %22 = load i16, i16* %21, align 1, !dbg !339, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %22, metadata !337, metadata !DIExpression()) #5, !dbg !339
  %23 = inttoptr i64 %8 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %22, metadata !348, metadata !DIExpression()) #5, !dbg !353
  %24 = icmp eq i16 %22, 129, !dbg !359
  %25 = icmp eq i16 %22, -22392, !dbg !360
  %26 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %24) #5
  %27 = or i1 %25, %26, !dbg !360
  %28 = xor i1 %27, true, !dbg !361
  %29 = getelementptr i8, i8* %13, i64 18
  %30 = bitcast i8* %29 to %struct.vlan_hdr*
  %31 = icmp ugt %struct.vlan_hdr* %30, %23
  %32 = select i1 %28, i1 true, i1 %31, !dbg !362
  br i1 %32, label %50, label %33, !dbg !362

33:                                               ; preds = %19
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !339
  %34 = getelementptr i8, i8* %13, i64 16, !dbg !363
  %35 = bitcast i8* %34 to i16*, !dbg !363
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %30, metadata !331, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i32 1, metadata !338, metadata !DIExpression()) #5, !dbg !339
  %36 = load i16, i16* %35, align 1, !dbg !339, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %36, metadata !337, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i16 %36, metadata !348, metadata !DIExpression()) #5, !dbg !353
  %37 = icmp eq i16 %36, 129, !dbg !359
  %38 = icmp eq i16 %36, -22392, !dbg !360
  %39 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %37) #5
  %40 = or i1 %38, %39, !dbg !360
  %41 = xor i1 %40, true, !dbg !361
  %42 = getelementptr i8, i8* %13, i64 22
  %43 = bitcast i8* %42 to %struct.vlan_hdr*
  %44 = icmp ugt %struct.vlan_hdr* %43, %23
  %45 = select i1 %41, i1 true, i1 %44, !dbg !362
  br i1 %45, label %50, label %46, !dbg !362

46:                                               ; preds = %33
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !339
  %47 = getelementptr i8, i8* %13, i64 20, !dbg !363
  %48 = bitcast i8* %47 to i16*, !dbg !363
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %43, metadata !331, metadata !DIExpression()) #5, !dbg !339
  call void @llvm.dbg.value(metadata i32 2, metadata !338, metadata !DIExpression()) #5, !dbg !339
  %49 = load i16, i16* %48, align 1, !dbg !339, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %49, metadata !337, metadata !DIExpression()) #5, !dbg !339
  br label %50

50:                                               ; preds = %46, %33, %19
  %51 = phi i8* [ %17, %19 ], [ %29, %33 ], [ %42, %46 ], !dbg !339
  %52 = phi i16 [ %22, %19 ], [ %36, %33 ], [ %49, %46 ], !dbg !339
  call void @llvm.dbg.value(metadata i8* %51, metadata !199, metadata !DIExpression()) #5, !dbg !287
  call void @llvm.dbg.value(metadata i16 %52, metadata !286, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)) #5, !dbg !287
  switch i16 %52, label %180 [
    i16 -8826, label %53
    i16 8, label %53
  ], !dbg !364

53:                                               ; preds = %50, %50, %1
  %54 = phi i8* [ %51, %50 ], [ %51, %50 ], [ %13, %1 ], !dbg !366
  call void @llvm.dbg.value(metadata i8* %54, metadata !199, metadata !DIExpression()) #5, !dbg !287
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !367, metadata !DIExpression()) #5, !dbg !377
  call void @llvm.dbg.value(metadata i8* %9, metadata !373, metadata !DIExpression()) #5, !dbg !377
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !374, metadata !DIExpression()) #5, !dbg !377
  call void @llvm.dbg.value(metadata i8* %54, metadata !375, metadata !DIExpression()) #5, !dbg !377
  %55 = getelementptr inbounds i8, i8* %54, i64 20, !dbg !380
  %56 = icmp ugt i8* %55, %9, !dbg !382
  br i1 %56, label %77, label %57, !dbg !383

57:                                               ; preds = %53
  %58 = load i8, i8* %54, align 4, !dbg !384
  %59 = and i8 %58, -16, !dbg !386
  %60 = icmp eq i8 %59, 64, !dbg !386
  br i1 %60, label %61, label %77, !dbg !387

61:                                               ; preds = %57
  %62 = shl i8 %58, 2, !dbg !388
  %63 = and i8 %62, 60, !dbg !388
  call void @llvm.dbg.value(metadata i8 %63, metadata !376, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !377
  %64 = icmp ult i8 %63, 20, !dbg !389
  br i1 %64, label %77, label %65, !dbg !391

65:                                               ; preds = %61
  %66 = zext i8 %63 to i64
  call void @llvm.dbg.value(metadata i64 %66, metadata !376, metadata !DIExpression()) #5, !dbg !377
  %67 = getelementptr i8, i8* %54, i64 %66, !dbg !392
  %68 = icmp ugt i8* %67, %9, !dbg !394
  br i1 %68, label %77, label %69, !dbg !395

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i8* %67, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %70 = getelementptr inbounds i8, i8* %54, i64 9, !dbg !396
  %71 = load i8, i8* %70, align 1, !dbg !396, !tbaa !397
  %72 = icmp eq i8 %71, 0, !dbg !399
  br i1 %72, label %77, label %73, !dbg !400

73:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %54, metadata !247, metadata !DIExpression()) #5, !dbg !287
  %74 = getelementptr inbounds i8, i8* %54, i64 1, !dbg !401
  %75 = load i8, i8* %74, align 1, !dbg !401, !tbaa !402
  %76 = lshr i8 %75, 2, !dbg !403
  br label %175, !dbg !404

77:                                               ; preds = %69, %65, %61, %57, %53
  %78 = phi i8* [ %67, %69 ], [ %54, %53 ], [ %54, %57 ], [ %54, %61 ], [ %54, %65 ]
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !405, metadata !DIExpression()) #5, !dbg !414
  call void @llvm.dbg.value(metadata i8* %9, metadata !411, metadata !DIExpression()) #5, !dbg !414
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !412, metadata !DIExpression()) #5, !dbg !414
  %79 = getelementptr inbounds i8, i8* %78, i64 40, !dbg !417
  %80 = icmp ugt i8* %79, %9, !dbg !419
  br i1 %80, label %180, label %81, !dbg !420

81:                                               ; preds = %77
  %82 = load i8, i8* %78, align 4, !dbg !421
  %83 = and i8 %82, -16, !dbg !423
  %84 = icmp eq i8 %83, 96, !dbg !423
  br i1 %84, label %85, label %180, !dbg !424

85:                                               ; preds = %81
  call void @llvm.dbg.value(metadata i8* %79, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %86 = getelementptr inbounds i8, i8* %78, i64 6, !dbg !425
  %87 = load i8, i8* %86, align 2, !dbg !425, !tbaa !426
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !428, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %9, metadata !433, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i32 0, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %87, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %79, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %88 = getelementptr inbounds i8, i8* %78, i64 42, !dbg !449
  %89 = icmp ugt i8* %88, %9, !dbg !451
  br i1 %89, label %180, label %90, !dbg !452

90:                                               ; preds = %85
  switch i8 %87, label %166 [
    i8 0, label %92
    i8 60, label %92
    i8 43, label %92
    i8 -121, label %92
    i8 51, label %91
    i8 44, label %99
  ], !dbg !453

91:                                               ; preds = %90
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !445
  br label %92, !dbg !454

92:                                               ; preds = %91, %90, %90, %90, %90
  %93 = phi i64 [ 2, %91 ], [ 3, %90 ], [ 3, %90 ], [ 3, %90 ], [ 3, %90 ]
  %94 = getelementptr inbounds i8, i8* %78, i64 41, !dbg !456
  %95 = load i8, i8* %94, align 1, !dbg !456, !tbaa !457
  %96 = zext i8 %95 to i64, !dbg !456
  %97 = shl nuw nsw i64 %96, %93, !dbg !456
  %98 = add nuw nsw i64 %97, 8, !dbg !456
  br label %99, !dbg !456

99:                                               ; preds = %92, %90
  %100 = phi i64 [ 8, %90 ], [ %98, %92 ]
  %101 = getelementptr inbounds i8, i8* %79, i64 %100, !dbg !456
  call void @llvm.dbg.value(metadata i8* %101, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %102 = load i8, i8* %79, align 1, !dbg !456, !tbaa !459
  call void @llvm.dbg.value(metadata i32 1, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %102, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %101, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %103 = getelementptr inbounds i8, i8* %101, i64 2, !dbg !449
  %104 = icmp ugt i8* %103, %9, !dbg !451
  br i1 %104, label %180, label %105, !dbg !452

105:                                              ; preds = %99
  switch i8 %102, label %166 [
    i8 0, label %106
    i8 60, label %106
    i8 43, label %106
    i8 -121, label %106
    i8 51, label %107
    i8 44, label %114
  ], !dbg !453

106:                                              ; preds = %105, %105, %105, %105
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !445
  br label %107, !dbg !460

107:                                              ; preds = %106, %105
  %108 = phi i64 [ 3, %106 ], [ 2, %105 ]
  %109 = getelementptr inbounds i8, i8* %101, i64 1, !dbg !456
  %110 = load i8, i8* %109, align 1, !dbg !456, !tbaa !457
  %111 = zext i8 %110 to i64, !dbg !456
  %112 = shl nuw nsw i64 %111, %108, !dbg !456
  %113 = add nuw nsw i64 %112, 8, !dbg !456
  br label %114, !dbg !456

114:                                              ; preds = %107, %105
  %115 = phi i64 [ 8, %105 ], [ %113, %107 ]
  %116 = getelementptr inbounds i8, i8* %101, i64 %115, !dbg !456
  call void @llvm.dbg.value(metadata i8* %116, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %117 = load i8, i8* %101, align 1, !dbg !456, !tbaa !459
  call void @llvm.dbg.value(metadata i32 2, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %117, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %116, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %118 = getelementptr inbounds i8, i8* %116, i64 2, !dbg !449
  %119 = icmp ugt i8* %118, %9, !dbg !451
  br i1 %119, label %180, label %120, !dbg !452

120:                                              ; preds = %114
  switch i8 %117, label %166 [
    i8 0, label %121
    i8 60, label %121
    i8 43, label %121
    i8 -121, label %121
    i8 51, label %122
    i8 44, label %129
  ], !dbg !453

121:                                              ; preds = %120, %120, %120, %120
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !445
  br label %122, !dbg !460

122:                                              ; preds = %121, %120
  %123 = phi i64 [ 3, %121 ], [ 2, %120 ]
  %124 = getelementptr inbounds i8, i8* %116, i64 1, !dbg !456
  %125 = load i8, i8* %124, align 1, !dbg !456, !tbaa !457
  %126 = zext i8 %125 to i64, !dbg !456
  %127 = shl nuw nsw i64 %126, %123, !dbg !456
  %128 = add nuw nsw i64 %127, 8, !dbg !456
  br label %129, !dbg !456

129:                                              ; preds = %122, %120
  %130 = phi i64 [ 8, %120 ], [ %128, %122 ]
  %131 = getelementptr inbounds i8, i8* %116, i64 %130, !dbg !456
  call void @llvm.dbg.value(metadata i8* %131, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %132 = load i8, i8* %116, align 1, !dbg !456, !tbaa !459
  call void @llvm.dbg.value(metadata i32 3, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %132, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %131, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %133 = getelementptr inbounds i8, i8* %131, i64 2, !dbg !449
  %134 = icmp ugt i8* %133, %9, !dbg !451
  br i1 %134, label %180, label %135, !dbg !452

135:                                              ; preds = %129
  switch i8 %132, label %166 [
    i8 0, label %136
    i8 60, label %136
    i8 43, label %136
    i8 -121, label %136
    i8 51, label %137
    i8 44, label %144
  ], !dbg !453

136:                                              ; preds = %135, %135, %135, %135
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !445
  br label %137, !dbg !460

137:                                              ; preds = %136, %135
  %138 = phi i64 [ 3, %136 ], [ 2, %135 ]
  %139 = getelementptr inbounds i8, i8* %131, i64 1, !dbg !456
  %140 = load i8, i8* %139, align 1, !dbg !456, !tbaa !457
  %141 = zext i8 %140 to i64, !dbg !456
  %142 = shl nuw nsw i64 %141, %138, !dbg !456
  %143 = add nuw nsw i64 %142, 8, !dbg !456
  br label %144, !dbg !456

144:                                              ; preds = %137, %135
  %145 = phi i64 [ 8, %135 ], [ %143, %137 ]
  %146 = getelementptr inbounds i8, i8* %131, i64 %145, !dbg !456
  call void @llvm.dbg.value(metadata i8* %146, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %147 = load i8, i8* %131, align 1, !dbg !456, !tbaa !459
  call void @llvm.dbg.value(metadata i32 4, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %147, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %146, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %148 = getelementptr inbounds i8, i8* %146, i64 2, !dbg !449
  %149 = icmp ugt i8* %148, %9, !dbg !451
  br i1 %149, label %180, label %150, !dbg !452

150:                                              ; preds = %144
  switch i8 %147, label %166 [
    i8 0, label %151
    i8 60, label %151
    i8 43, label %151
    i8 -121, label %151
    i8 51, label %152
    i8 44, label %159
  ], !dbg !453

151:                                              ; preds = %150, %150, %150, %150
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !445
  br label %152, !dbg !460

152:                                              ; preds = %151, %150
  %153 = phi i64 [ 3, %151 ], [ 2, %150 ]
  %154 = getelementptr inbounds i8, i8* %146, i64 1, !dbg !456
  %155 = load i8, i8* %154, align 1, !dbg !456, !tbaa !457
  %156 = zext i8 %155 to i64, !dbg !456
  %157 = shl nuw nsw i64 %156, %153, !dbg !456
  %158 = add nuw nsw i64 %157, 8, !dbg !456
  br label %159, !dbg !456

159:                                              ; preds = %152, %150
  %160 = phi i64 [ 8, %150 ], [ %158, %152 ]
  %161 = getelementptr inbounds i8, i8* %146, i64 %160, !dbg !456
  call void @llvm.dbg.value(metadata i8* %161, metadata !199, metadata !DIExpression()) #5, !dbg !287
  %162 = load i8, i8* %146, align 1, !dbg !456, !tbaa !459
  call void @llvm.dbg.value(metadata i32 5, metadata !435, metadata !DIExpression()) #5, !dbg !447
  call void @llvm.dbg.value(metadata i8 %162, metadata !434, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i8* %161, metadata !437, metadata !DIExpression()) #5, !dbg !448
  %163 = getelementptr inbounds i8, i8* %161, i64 2, !dbg !449
  %164 = icmp ugt i8* %163, %9, !dbg !451
  br i1 %164, label %180, label %165, !dbg !452

165:                                              ; preds = %159
  switch i8 %162, label %166 [
    i8 0, label %180
    i8 60, label %180
    i8 43, label %180
    i8 -121, label %180
    i8 51, label %180
    i8 44, label %180
  ], !dbg !453

166:                                              ; preds = %165, %150, %135, %120, %105, %90
  %167 = phi i8 [ %87, %90 ], [ %102, %105 ], [ %117, %120 ], [ %132, %135 ], [ %147, %150 ], [ %162, %165 ]
  %168 = icmp eq i8 %167, 0, !dbg !461
  br i1 %168, label %180, label %169, !dbg !462

169:                                              ; preds = %166
  %170 = bitcast i8* %78 to i16*, !dbg !463
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* undef, metadata !204, metadata !DIExpression()) #5, !dbg !287
  %171 = load i16, i16* %170, align 2, !dbg !463, !tbaa !346
  %172 = tail call i16 @llvm.bswap.i16(i16 %171) #5, !dbg !463
  %173 = lshr i16 %172, 4, !dbg !463
  %174 = trunc i16 %173 to i8, !dbg !463
  br label %175, !dbg !464

175:                                              ; preds = %73, %169
  %176 = phi i8 [ %76, %73 ], [ %174, %169 ], !dbg !287
  call void @llvm.dbg.value(metadata i8 %176, metadata !182, metadata !DIExpression()), !dbg !183
  store i8 %176, i8* %3, align 1, !dbg !465, !tbaa !466
  %177 = icmp eq i8 %176, 0, !dbg !467
  call void @llvm.dbg.value(metadata i32* %2, metadata !181, metadata !DIExpression(DW_OP_deref)), !dbg !183
  br i1 %177, label %180, label %178, !dbg !469

178:                                              ; preds = %175
  call void @llvm.dbg.value(metadata i8* %3, metadata !182, metadata !DIExpression(DW_OP_deref)), !dbg !183
  %179 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.3* @flow_dscps to i8*), i8* noundef nonnull %4, i8* noundef nonnull %3, i64 noundef 0) #5, !dbg !470
  br label %182, !dbg !470

180:                                              ; preds = %165, %165, %165, %165, %165, %165, %85, %99, %114, %129, %144, %159, %81, %77, %16, %166, %50, %175
  %181 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @flow_dscps to i8*), i8* noundef nonnull %4) #5, !dbg !471
  br label %182

182:                                              ; preds = %180, %178
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #5, !dbg !472
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #5, !dbg !472
  ret i32 0, !dbg !473
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
define dso_local i32 @write_dscp(%struct.__sk_buff* nocapture noundef readonly %0) #0 section "tc" !dbg !474 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !476, metadata !DIExpression()), !dbg !479
  %3 = bitcast i32* %2 to i8*, !dbg !480
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #5, !dbg !480
  %4 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 13, !dbg !481
  %5 = load i32, i32* %4, align 4, !dbg !481, !tbaa !482
  call void @llvm.dbg.value(metadata i32 %5, metadata !477, metadata !DIExpression()), !dbg !479
  store i32 %5, i32* %2, align 4, !dbg !483, !tbaa !187
  call void @llvm.dbg.value(metadata i32* %2, metadata !477, metadata !DIExpression(DW_OP_deref)), !dbg !479
  %6 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @flow_dscps to i8*), i8* noundef nonnull %3) #5, !dbg !484
  call void @llvm.dbg.value(metadata i8* %6, metadata !478, metadata !DIExpression()), !dbg !479
  %7 = icmp eq i8* %6, null, !dbg !485
  br i1 %7, label %196, label %8, !dbg !487

8:                                                ; preds = %1
  %9 = load i8, i8* %6, align 1, !dbg !488, !tbaa !466
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !489, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata i8 %9, metadata !494, metadata !DIExpression()) #5, !dbg !502
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !504
  %11 = load i32, i32* %10, align 8, !dbg !504, !tbaa !290
  %12 = zext i32 %11 to i64, !dbg !505
  %13 = inttoptr i64 %12 to i8*, !dbg !506
  call void @llvm.dbg.value(metadata i8* %13, metadata !495, metadata !DIExpression()) #5, !dbg !502
  %14 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !507
  %15 = load i32, i32* %14, align 4, !dbg !507, !tbaa !296
  %16 = zext i32 %15 to i64, !dbg !508
  %17 = inttoptr i64 %16 to i8*, !dbg !509
  call void @llvm.dbg.value(metadata i8* %17, metadata !496, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata i8* %17, metadata !497, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !500, metadata !DIExpression(DW_OP_deref)) #5, !dbg !502
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !302, metadata !DIExpression()) #5, !dbg !510
  call void @llvm.dbg.value(metadata i8* %13, metadata !309, metadata !DIExpression()) #5, !dbg !510
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !310, metadata !DIExpression()) #5, !dbg !510
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !314, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i8* %13, metadata !326, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !327, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !328, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i8* %17, metadata !329, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i32 14, metadata !330, metadata !DIExpression()) #5, !dbg !512
  %18 = getelementptr i8, i8* %17, i64 14, !dbg !514
  %19 = icmp ugt i8* %18, %13, !dbg !515
  br i1 %19, label %196, label %20, !dbg !516

20:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i8* %17, metadata !329, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i8* %18, metadata !497, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata i8* %18, metadata !331, metadata !DIExpression()) #5, !dbg !512
  %21 = getelementptr inbounds i8, i8* %17, i64 12, !dbg !517
  %22 = bitcast i8* %21 to i16*, !dbg !517
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i32 0, metadata !338, metadata !DIExpression()) #5, !dbg !512
  %23 = load i16, i16* %22, align 1, !dbg !512, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %23, metadata !337, metadata !DIExpression()) #5, !dbg !512
  %24 = inttoptr i64 %12 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %23, metadata !348, metadata !DIExpression()) #5, !dbg !518
  %25 = icmp eq i16 %23, 129, !dbg !520
  %26 = icmp eq i16 %23, -22392, !dbg !521
  %27 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %25) #5
  %28 = or i1 %26, %27, !dbg !521
  %29 = xor i1 %28, true, !dbg !522
  %30 = getelementptr i8, i8* %17, i64 18
  %31 = bitcast i8* %30 to %struct.vlan_hdr*
  %32 = icmp ugt %struct.vlan_hdr* %31, %24
  %33 = select i1 %29, i1 true, i1 %32, !dbg !523
  br i1 %33, label %51, label %34, !dbg !523

34:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !512
  %35 = getelementptr i8, i8* %17, i64 16, !dbg !524
  %36 = bitcast i8* %35 to i16*, !dbg !524
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %31, metadata !331, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i32 1, metadata !338, metadata !DIExpression()) #5, !dbg !512
  %37 = load i16, i16* %36, align 1, !dbg !512, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %37, metadata !337, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i16 %37, metadata !348, metadata !DIExpression()) #5, !dbg !518
  %38 = icmp eq i16 %37, 129, !dbg !520
  %39 = icmp eq i16 %37, -22392, !dbg !521
  %40 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %38) #5
  %41 = or i1 %39, %40, !dbg !521
  %42 = xor i1 %41, true, !dbg !522
  %43 = getelementptr i8, i8* %17, i64 22
  %44 = bitcast i8* %43 to %struct.vlan_hdr*
  %45 = icmp ugt %struct.vlan_hdr* %44, %24
  %46 = select i1 %42, i1 true, i1 %45, !dbg !523
  br i1 %46, label %51, label %47, !dbg !523

47:                                               ; preds = %34
  call void @llvm.dbg.value(metadata i16 undef, metadata !337, metadata !DIExpression()) #5, !dbg !512
  %48 = getelementptr i8, i8* %17, i64 20, !dbg !524
  %49 = bitcast i8* %48 to i16*, !dbg !524
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %44, metadata !331, metadata !DIExpression()) #5, !dbg !512
  call void @llvm.dbg.value(metadata i32 2, metadata !338, metadata !DIExpression()) #5, !dbg !512
  %50 = load i16, i16* %49, align 1, !dbg !512, !tbaa !346
  call void @llvm.dbg.value(metadata i16 %50, metadata !337, metadata !DIExpression()) #5, !dbg !512
  br label %51

51:                                               ; preds = %47, %34, %20
  %52 = phi i8* [ %18, %20 ], [ %30, %34 ], [ %43, %47 ], !dbg !512
  %53 = phi i16 [ %23, %20 ], [ %37, %34 ], [ %50, %47 ], !dbg !512
  call void @llvm.dbg.value(metadata i8* %52, metadata !497, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata i16 %53, metadata !501, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)) #5, !dbg !502
  switch i16 %53, label %196 [
    i16 8, label %54
    i16 -8826, label %96
  ], !dbg !525

54:                                               ; preds = %51
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !367, metadata !DIExpression()) #5, !dbg !527
  call void @llvm.dbg.value(metadata i8* %13, metadata !373, metadata !DIExpression()) #5, !dbg !527
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !374, metadata !DIExpression()) #5, !dbg !527
  call void @llvm.dbg.value(metadata i8* %52, metadata !375, metadata !DIExpression()) #5, !dbg !527
  %55 = getelementptr inbounds i8, i8* %52, i64 20, !dbg !529
  %56 = icmp ugt i8* %55, %13, !dbg !530
  br i1 %56, label %196, label %57, !dbg !531

57:                                               ; preds = %54
  %58 = load i8, i8* %52, align 4, !dbg !532
  %59 = and i8 %58, -16, !dbg !533
  %60 = icmp eq i8 %59, 64, !dbg !533
  br i1 %60, label %61, label %196, !dbg !534

61:                                               ; preds = %57
  %62 = shl i8 %58, 2, !dbg !535
  %63 = and i8 %62, 60, !dbg !535
  call void @llvm.dbg.value(metadata i8 %63, metadata !376, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !527
  %64 = icmp ult i8 %63, 20, !dbg !536
  br i1 %64, label %196, label %65, !dbg !537

65:                                               ; preds = %61
  %66 = zext i8 %63 to i64
  call void @llvm.dbg.value(metadata i64 %66, metadata !376, metadata !DIExpression()) #5, !dbg !527
  %67 = getelementptr i8, i8* %52, i64 %66, !dbg !538
  %68 = icmp ugt i8* %67, %13, !dbg !539
  br i1 %68, label %196, label %69, !dbg !540

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i8* %67, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %70 = getelementptr inbounds i8, i8* %52, i64 9, !dbg !541
  %71 = load i8, i8* %70, align 1, !dbg !541, !tbaa !397
  %72 = icmp eq i8 %71, 0, !dbg !542
  br i1 %72, label %196, label %73, !dbg !543

73:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8* %52, metadata !499, metadata !DIExpression()) #5, !dbg !502
  %74 = shl i8 %9, 2, !dbg !544
  call void @llvm.dbg.value(metadata i8* %52, metadata !545, metadata !DIExpression()) #5, !dbg !554
  call void @llvm.dbg.value(metadata i8 3, metadata !550, metadata !DIExpression()) #5, !dbg !554
  call void @llvm.dbg.value(metadata i8 %74, metadata !551, metadata !DIExpression()) #5, !dbg !554
  %75 = getelementptr inbounds i8, i8* %52, i64 10, !dbg !556
  %76 = bitcast i8* %75 to i16*, !dbg !556
  %77 = load i16, i16* %76, align 2, !dbg !556, !tbaa !557
  %78 = call i16 @llvm.bswap.i16(i16 %77) #5, !dbg !556
  %79 = zext i16 %78 to i32, !dbg !556
  call void @llvm.dbg.value(metadata i32 %79, metadata !552, metadata !DIExpression()) #5, !dbg !554
  %80 = getelementptr inbounds i8, i8* %52, i64 1, !dbg !558
  %81 = load i8, i8* %80, align 1, !dbg !558, !tbaa !402
  %82 = zext i8 %81 to i32, !dbg !559
  %83 = and i8 %81, 3, !dbg !560
  %84 = or i8 %83, %74, !dbg !561
  call void @llvm.dbg.value(metadata i8 %84, metadata !553, metadata !DIExpression()) #5, !dbg !554
  %85 = add nuw nsw i32 %79, %82, !dbg !562
  call void @llvm.dbg.value(metadata i32 %85, metadata !552, metadata !DIExpression()) #5, !dbg !554
  %86 = icmp ult i32 %85, 65535, !dbg !563
  %87 = add nuw nsw i32 %85, 1, !dbg !565
  %88 = and i32 %87, 65535, !dbg !565
  %89 = select i1 %86, i32 %85, i32 %88, !dbg !565
  call void @llvm.dbg.value(metadata i32 %89, metadata !552, metadata !DIExpression()) #5, !dbg !554
  %90 = zext i8 %84 to i32, !dbg !566
  %91 = sub nsw i32 %89, %90, !dbg !567
  call void @llvm.dbg.value(metadata i32 %91, metadata !552, metadata !DIExpression()) #5, !dbg !554
  call void @llvm.dbg.value(metadata !DIArgList(i32 %91, i32 %91), metadata !552, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_shr, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #5, !dbg !554
  call void @llvm.dbg.value(metadata !DIArgList(i32 %91, i32 %91), metadata !552, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_shr, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #5, !dbg !554
  call void @llvm.dbg.value(metadata !DIArgList(i32 %91, i32 %91), metadata !552, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_shr, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #5, !dbg !554
  %92 = lshr i32 %91, 16, !dbg !568
  call void @llvm.dbg.value(metadata !DIArgList(i32 %92, i32 %91), metadata !552, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #5, !dbg !554
  %93 = add nsw i32 %92, %91, !dbg !569
  call void @llvm.dbg.value(metadata i32 %93, metadata !552, metadata !DIExpression()) #5, !dbg !554
  %94 = trunc i32 %93 to i16, !dbg !570
  %95 = call i16 @llvm.bswap.i16(i16 %94) #5, !dbg !570
  store i16 %95, i16* %76, align 2, !dbg !571, !tbaa !557
  store i8 %84, i8* %80, align 1, !dbg !572, !tbaa !402
  br label %196, !dbg !573

96:                                               ; preds = %51
  call void @llvm.dbg.value(metadata i8* %52, metadata !497, metadata !DIExpression()) #5, !dbg !502
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !405, metadata !DIExpression()) #5, !dbg !574
  call void @llvm.dbg.value(metadata i8* %13, metadata !411, metadata !DIExpression()) #5, !dbg !574
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !412, metadata !DIExpression()) #5, !dbg !574
  call void @llvm.dbg.value(metadata i8* %52, metadata !413, metadata !DIExpression()) #5, !dbg !574
  %97 = getelementptr inbounds i8, i8* %52, i64 40, !dbg !577
  %98 = icmp ugt i8* %97, %13, !dbg !578
  br i1 %98, label %196, label %99, !dbg !579

99:                                               ; preds = %96
  %100 = load i8, i8* %52, align 4, !dbg !580
  %101 = and i8 %100, -16, !dbg !581
  %102 = icmp eq i8 %101, 96, !dbg !581
  br i1 %102, label %103, label %196, !dbg !582

103:                                              ; preds = %99
  call void @llvm.dbg.value(metadata i8* %97, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %104 = getelementptr inbounds i8, i8* %52, i64 6, !dbg !583
  %105 = load i8, i8* %104, align 2, !dbg !583, !tbaa !426
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !428, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %13, metadata !433, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %105, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %97, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %106 = getelementptr inbounds i8, i8* %52, i64 42, !dbg !588
  %107 = icmp ugt i8* %106, %13, !dbg !589
  br i1 %107, label %196, label %108, !dbg !590

108:                                              ; preds = %103
  switch i8 %105, label %184 [
    i8 0, label %110
    i8 60, label %110
    i8 43, label %110
    i8 -121, label %110
    i8 51, label %109
    i8 44, label %117
  ], !dbg !591

109:                                              ; preds = %108
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !584
  br label %110, !dbg !592

110:                                              ; preds = %109, %108, %108, %108, %108
  %111 = phi i64 [ 2, %109 ], [ 3, %108 ], [ 3, %108 ], [ 3, %108 ], [ 3, %108 ]
  %112 = getelementptr inbounds i8, i8* %52, i64 41, !dbg !593
  %113 = load i8, i8* %112, align 1, !dbg !593, !tbaa !457
  %114 = zext i8 %113 to i64, !dbg !593
  %115 = shl nuw nsw i64 %114, %111, !dbg !593
  %116 = add nuw nsw i64 %115, 8, !dbg !593
  br label %117, !dbg !593

117:                                              ; preds = %110, %108
  %118 = phi i64 [ 8, %108 ], [ %116, %110 ]
  %119 = getelementptr inbounds i8, i8* %97, i64 %118, !dbg !593
  call void @llvm.dbg.value(metadata i8* %119, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %120 = load i8, i8* %97, align 1, !dbg !593, !tbaa !459
  call void @llvm.dbg.value(metadata i32 1, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %120, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %119, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %121 = getelementptr inbounds i8, i8* %119, i64 2, !dbg !588
  %122 = icmp ugt i8* %121, %13, !dbg !589
  br i1 %122, label %196, label %123, !dbg !590

123:                                              ; preds = %117
  switch i8 %120, label %184 [
    i8 0, label %124
    i8 60, label %124
    i8 43, label %124
    i8 -121, label %124
    i8 51, label %125
    i8 44, label %132
  ], !dbg !591

124:                                              ; preds = %123, %123, %123, %123
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !584
  br label %125, !dbg !594

125:                                              ; preds = %124, %123
  %126 = phi i64 [ 3, %124 ], [ 2, %123 ]
  %127 = getelementptr inbounds i8, i8* %119, i64 1, !dbg !593
  %128 = load i8, i8* %127, align 1, !dbg !593, !tbaa !457
  %129 = zext i8 %128 to i64, !dbg !593
  %130 = shl nuw nsw i64 %129, %126, !dbg !593
  %131 = add nuw nsw i64 %130, 8, !dbg !593
  br label %132, !dbg !593

132:                                              ; preds = %125, %123
  %133 = phi i64 [ 8, %123 ], [ %131, %125 ]
  %134 = getelementptr inbounds i8, i8* %119, i64 %133, !dbg !593
  call void @llvm.dbg.value(metadata i8* %134, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %135 = load i8, i8* %119, align 1, !dbg !593, !tbaa !459
  call void @llvm.dbg.value(metadata i32 2, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %135, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %134, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %136 = getelementptr inbounds i8, i8* %134, i64 2, !dbg !588
  %137 = icmp ugt i8* %136, %13, !dbg !589
  br i1 %137, label %196, label %138, !dbg !590

138:                                              ; preds = %132
  switch i8 %135, label %184 [
    i8 0, label %139
    i8 60, label %139
    i8 43, label %139
    i8 -121, label %139
    i8 51, label %140
    i8 44, label %147
  ], !dbg !591

139:                                              ; preds = %138, %138, %138, %138
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !584
  br label %140, !dbg !594

140:                                              ; preds = %139, %138
  %141 = phi i64 [ 3, %139 ], [ 2, %138 ]
  %142 = getelementptr inbounds i8, i8* %134, i64 1, !dbg !593
  %143 = load i8, i8* %142, align 1, !dbg !593, !tbaa !457
  %144 = zext i8 %143 to i64, !dbg !593
  %145 = shl nuw nsw i64 %144, %141, !dbg !593
  %146 = add nuw nsw i64 %145, 8, !dbg !593
  br label %147, !dbg !593

147:                                              ; preds = %140, %138
  %148 = phi i64 [ 8, %138 ], [ %146, %140 ]
  %149 = getelementptr inbounds i8, i8* %134, i64 %148, !dbg !593
  call void @llvm.dbg.value(metadata i8* %149, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %150 = load i8, i8* %134, align 1, !dbg !593, !tbaa !459
  call void @llvm.dbg.value(metadata i32 3, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %150, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %149, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %151 = getelementptr inbounds i8, i8* %149, i64 2, !dbg !588
  %152 = icmp ugt i8* %151, %13, !dbg !589
  br i1 %152, label %196, label %153, !dbg !590

153:                                              ; preds = %147
  switch i8 %150, label %184 [
    i8 0, label %154
    i8 60, label %154
    i8 43, label %154
    i8 -121, label %154
    i8 51, label %155
    i8 44, label %162
  ], !dbg !591

154:                                              ; preds = %153, %153, %153, %153
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !584
  br label %155, !dbg !594

155:                                              ; preds = %154, %153
  %156 = phi i64 [ 3, %154 ], [ 2, %153 ]
  %157 = getelementptr inbounds i8, i8* %149, i64 1, !dbg !593
  %158 = load i8, i8* %157, align 1, !dbg !593, !tbaa !457
  %159 = zext i8 %158 to i64, !dbg !593
  %160 = shl nuw nsw i64 %159, %156, !dbg !593
  %161 = add nuw nsw i64 %160, 8, !dbg !593
  br label %162, !dbg !593

162:                                              ; preds = %155, %153
  %163 = phi i64 [ 8, %153 ], [ %161, %155 ]
  %164 = getelementptr inbounds i8, i8* %149, i64 %163, !dbg !593
  call void @llvm.dbg.value(metadata i8* %164, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %165 = load i8, i8* %149, align 1, !dbg !593, !tbaa !459
  call void @llvm.dbg.value(metadata i32 4, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %165, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %164, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %166 = getelementptr inbounds i8, i8* %164, i64 2, !dbg !588
  %167 = icmp ugt i8* %166, %13, !dbg !589
  br i1 %167, label %196, label %168, !dbg !590

168:                                              ; preds = %162
  switch i8 %165, label %184 [
    i8 0, label %169
    i8 60, label %169
    i8 43, label %169
    i8 -121, label %169
    i8 51, label %170
    i8 44, label %177
  ], !dbg !591

169:                                              ; preds = %168, %168, %168, %168
  call void @llvm.dbg.value(metadata i8 undef, metadata !434, metadata !DIExpression()) #5, !dbg !584
  br label %170, !dbg !594

170:                                              ; preds = %169, %168
  %171 = phi i64 [ 3, %169 ], [ 2, %168 ]
  %172 = getelementptr inbounds i8, i8* %164, i64 1, !dbg !593
  %173 = load i8, i8* %172, align 1, !dbg !593, !tbaa !457
  %174 = zext i8 %173 to i64, !dbg !593
  %175 = shl nuw nsw i64 %174, %171, !dbg !593
  %176 = add nuw nsw i64 %175, 8, !dbg !593
  br label %177, !dbg !593

177:                                              ; preds = %170, %168
  %178 = phi i64 [ 8, %168 ], [ %176, %170 ]
  %179 = getelementptr inbounds i8, i8* %164, i64 %178, !dbg !593
  call void @llvm.dbg.value(metadata i8* %179, metadata !497, metadata !DIExpression()) #5, !dbg !502
  %180 = load i8, i8* %164, align 1, !dbg !593, !tbaa !459
  call void @llvm.dbg.value(metadata i32 5, metadata !435, metadata !DIExpression()) #5, !dbg !586
  call void @llvm.dbg.value(metadata i8 %180, metadata !434, metadata !DIExpression()) #5, !dbg !584
  call void @llvm.dbg.value(metadata i8* %179, metadata !437, metadata !DIExpression()) #5, !dbg !587
  %181 = getelementptr inbounds i8, i8* %179, i64 2, !dbg !588
  %182 = icmp ugt i8* %181, %13, !dbg !589
  br i1 %182, label %196, label %183, !dbg !590

183:                                              ; preds = %177
  switch i8 %180, label %184 [
    i8 0, label %196
    i8 60, label %196
    i8 43, label %196
    i8 -121, label %196
    i8 51, label %196
    i8 44, label %196
  ], !dbg !591

184:                                              ; preds = %183, %168, %153, %138, %123, %108
  %185 = phi i8 [ %105, %108 ], [ %120, %123 ], [ %135, %138 ], [ %150, %153 ], [ %165, %168 ], [ %180, %183 ]
  %186 = icmp eq i8 %185, 0, !dbg !595
  br i1 %186, label %196, label %187, !dbg !596

187:                                              ; preds = %184
  call void @llvm.dbg.value(metadata i8* %52, metadata !498, metadata !DIExpression()) #5, !dbg !502
  %188 = shl i8 %9, 2, !dbg !597
  call void @llvm.dbg.value(metadata i8* %52, metadata !598, metadata !DIExpression()) #5, !dbg !606
  call void @llvm.dbg.value(metadata i8 3, metadata !603, metadata !DIExpression()) #5, !dbg !606
  call void @llvm.dbg.value(metadata i8 %188, metadata !604, metadata !DIExpression()) #5, !dbg !606
  %189 = bitcast i8* %52 to i16*, !dbg !608
  call void @llvm.dbg.value(metadata i16* %189, metadata !605, metadata !DIExpression()) #5, !dbg !606
  %190 = load i16, i16* %189, align 2, !dbg !609, !tbaa !346
  %191 = zext i8 %188 to i16, !dbg !610
  %192 = shl nuw nsw i16 %191, 4, !dbg !610
  %193 = call i16 @llvm.bswap.i16(i16 %192) #5, !dbg !610
  %194 = and i16 %190, 16368, !dbg !611
  %195 = or i16 %193, %194, !dbg !612
  store i16 %195, i16* %189, align 2, !dbg !613, !tbaa !346
  br label %196, !dbg !614

196:                                              ; preds = %187, %184, %183, %183, %183, %183, %183, %183, %177, %162, %147, %132, %117, %103, %99, %96, %73, %69, %65, %61, %57, %54, %51, %8, %1
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #5, !dbg !615
  ret i32 0, !dbg !616
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!171, !172, !173, !174}
!llvm.ident = !{!175}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "flow_dscps", scope: !2, file: !3, line: 17, type: !155, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !22, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "preserve_dscp_kern.c", directory: "/home/nir_ophir/code/bpf-examples/preserve-dscp", checksumkind: CSK_MD5, checksum: "1b528ab107863058b7df36fec9d2c031")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 397, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/preserve-dscp", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_ANY", value: 0)
!10 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!11 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!12 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!13 = !{!14, !15, !16, !19, !20}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !17, line: 24, baseType: !18)
!17 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!18 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23, !0, !28, !133, !137, !145, !150}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 122, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 32, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 4)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "bpf_get_hash_recalc", scope: !2, file: !30, line: 923, type: !31, isLocal: true, isDefinition: true)
!30 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/preserve-dscp", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !35}
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !17, line: 27, baseType: !7)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !37)
!37 = !{!38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64, !65, !66, !67, !68, !105, !107, !108, !109, !132}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !36, file: !6, line: 4184, baseType: !34, size: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !36, file: !6, line: 4185, baseType: !34, size: 32, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !36, file: !6, line: 4186, baseType: !34, size: 32, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !36, file: !6, line: 4187, baseType: !34, size: 32, offset: 96)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !36, file: !6, line: 4188, baseType: !34, size: 32, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !36, file: !6, line: 4189, baseType: !34, size: 32, offset: 160)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !36, file: !6, line: 4190, baseType: !34, size: 32, offset: 192)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !36, file: !6, line: 4191, baseType: !34, size: 32, offset: 224)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !36, file: !6, line: 4192, baseType: !34, size: 32, offset: 256)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !36, file: !6, line: 4193, baseType: !34, size: 32, offset: 288)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !36, file: !6, line: 4194, baseType: !34, size: 32, offset: 320)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !36, file: !6, line: 4195, baseType: !34, size: 32, offset: 352)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !36, file: !6, line: 4196, baseType: !51, size: 160, offset: 384)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 5)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !36, file: !6, line: 4197, baseType: !34, size: 32, offset: 544)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !36, file: !6, line: 4198, baseType: !34, size: 32, offset: 576)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !36, file: !6, line: 4199, baseType: !34, size: 32, offset: 608)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !36, file: !6, line: 4200, baseType: !34, size: 32, offset: 640)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !36, file: !6, line: 4201, baseType: !34, size: 32, offset: 672)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !36, file: !6, line: 4204, baseType: !34, size: 32, offset: 704)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !36, file: !6, line: 4205, baseType: !34, size: 32, offset: 736)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !36, file: !6, line: 4206, baseType: !34, size: 32, offset: 768)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !36, file: !6, line: 4207, baseType: !63, size: 128, offset: 800)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !26)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !36, file: !6, line: 4208, baseType: !63, size: 128, offset: 928)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !36, file: !6, line: 4209, baseType: !34, size: 32, offset: 1056)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !36, file: !6, line: 4210, baseType: !34, size: 32, offset: 1088)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !36, file: !6, line: 4213, baseType: !34, size: 32, offset: 1120)
!68 = !DIDerivedType(tag: DW_TAG_member, scope: !36, file: !6, line: 4214, baseType: !69, size: 64, align: 64, offset: 1152)
!69 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !36, file: !6, line: 4214, size: 64, align: 64, elements: !70)
!70 = !{!71}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !69, file: !6, line: 4214, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !74)
!74 = !{!75, !76, !77, !78, !81, !82, !83, !84, !87, !88, !89, !103, !104}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !73, file: !6, line: 5042, baseType: !16, size: 16)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !73, file: !6, line: 5043, baseType: !16, size: 16, offset: 16)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !73, file: !6, line: 5044, baseType: !16, size: 16, offset: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !73, file: !6, line: 5045, baseType: !79, size: 8, offset: 48)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !17, line: 21, baseType: !80)
!80 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !73, file: !6, line: 5046, baseType: !79, size: 8, offset: 56)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !73, file: !6, line: 5047, baseType: !79, size: 8, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !73, file: !6, line: 5048, baseType: !79, size: 8, offset: 72)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !73, file: !6, line: 5049, baseType: !85, size: 16, offset: 80)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !86, line: 25, baseType: !16)
!86 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !73, file: !6, line: 5050, baseType: !85, size: 16, offset: 96)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !73, file: !6, line: 5051, baseType: !85, size: 16, offset: 112)
!89 = !DIDerivedType(tag: DW_TAG_member, scope: !73, file: !6, line: 5052, baseType: !90, size: 256, offset: 128)
!90 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !73, file: !6, line: 5052, size: 256, elements: !91)
!91 = !{!92, !98}
!92 = !DIDerivedType(tag: DW_TAG_member, scope: !90, file: !6, line: 5053, baseType: !93, size: 64)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !90, file: !6, line: 5053, size: 64, elements: !94)
!94 = !{!95, !97}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !93, file: !6, line: 5054, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !86, line: 27, baseType: !34)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !93, file: !6, line: 5055, baseType: !96, size: 32, offset: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, scope: !90, file: !6, line: 5057, baseType: !99, size: 256)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !90, file: !6, line: 5057, size: 256, elements: !100)
!100 = !{!101, !102}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !99, file: !6, line: 5058, baseType: !63, size: 128)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !99, file: !6, line: 5059, baseType: !63, size: 128, offset: 128)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !73, file: !6, line: 5062, baseType: !34, size: 32, offset: 384)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !73, file: !6, line: 5063, baseType: !96, size: 32, offset: 416)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !36, file: !6, line: 4215, baseType: !106, size: 64, offset: 1216)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !17, line: 31, baseType: !15)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !36, file: !6, line: 4216, baseType: !34, size: 32, offset: 1280)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !36, file: !6, line: 4217, baseType: !34, size: 32, offset: 1312)
!109 = !DIDerivedType(tag: DW_TAG_member, scope: !36, file: !6, line: 4218, baseType: !110, size: 64, align: 64, offset: 1344)
!110 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !36, file: !6, line: 4218, size: 64, align: 64, elements: !111)
!111 = !{!112}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !110, file: !6, line: 4218, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !115)
!115 = !{!116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !114, file: !6, line: 4273, baseType: !34, size: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !114, file: !6, line: 4274, baseType: !34, size: 32, offset: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !114, file: !6, line: 4275, baseType: !34, size: 32, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !114, file: !6, line: 4276, baseType: !34, size: 32, offset: 96)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !114, file: !6, line: 4277, baseType: !34, size: 32, offset: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !114, file: !6, line: 4278, baseType: !34, size: 32, offset: 160)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !114, file: !6, line: 4280, baseType: !34, size: 32, offset: 192)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !114, file: !6, line: 4281, baseType: !63, size: 128, offset: 224)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !114, file: !6, line: 4282, baseType: !34, size: 32, offset: 352)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !114, file: !6, line: 4283, baseType: !34, size: 32, offset: 384)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !114, file: !6, line: 4284, baseType: !34, size: 32, offset: 416)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !114, file: !6, line: 4285, baseType: !63, size: 128, offset: 448)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !114, file: !6, line: 4286, baseType: !34, size: 32, offset: 576)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !114, file: !6, line: 4287, baseType: !130, size: 32, offset: 608)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !17, line: 26, baseType: !131)
!131 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !36, file: !6, line: 4219, baseType: !34, size: 32, offset: 1408)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(name: "ip_only", scope: !2, file: !3, line: 19, type: !135, isLocal: true, isDefinition: true)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !136)
!136 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !131)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !30, line: 77, type: !139, isLocal: true, isDefinition: true)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = !DISubroutineType(types: !141)
!141 = !{!142, !14, !143, !143, !106}
!142 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !30, line: 87, type: !147, isLocal: true, isDefinition: true)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = !DISubroutineType(types: !149)
!149 = !{!142, !14, !143}
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !30, line: 55, type: !152, isLocal: true, isDefinition: true)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DISubroutineType(types: !154)
!154 = !{!14, !14, !143}
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 12, size: 256, elements: !156)
!156 = !{!157, !162, !164, !166}
!157 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !155, file: !3, line: 13, baseType: !158, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 288, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 9)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !155, file: !3, line: 14, baseType: !163, size: 64, offset: 64)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !155, file: !3, line: 15, baseType: !165, size: 64, offset: 128)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !155, file: !3, line: 16, baseType: !167, size: 64, offset: 192)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 524288, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 16384)
!171 = !{i32 7, !"Dwarf Version", i32 5}
!172 = !{i32 2, !"Debug Info Version", i32 3}
!173 = !{i32 1, !"wchar_size", i32 4}
!174 = !{i32 7, !"frame-pointer", i32 2}
!175 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!176 = distinct !DISubprogram(name: "read_dscp", scope: !3, file: !3, line: 95, type: !177, scopeLine: 96, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !179)
!177 = !DISubroutineType(types: !178)
!178 = !{!131, !35}
!179 = !{!180, !181, !182}
!180 = !DILocalVariable(name: "skb", arg: 1, scope: !176, file: !3, line: 95, type: !35)
!181 = !DILocalVariable(name: "key", scope: !176, file: !3, line: 97, type: !34)
!182 = !DILocalVariable(name: "dscp", scope: !176, file: !3, line: 98, type: !79)
!183 = !DILocation(line: 0, scope: !176)
!184 = !DILocation(line: 97, column: 2, scope: !176)
!185 = !DILocation(line: 97, column: 14, scope: !176)
!186 = !DILocation(line: 97, column: 8, scope: !176)
!187 = !{!188, !188, i64 0}
!188 = !{!"int", !189, i64 0}
!189 = !{!"omnipotent char", !190, i64 0}
!190 = !{!"Simple C/C++ TBAA"}
!191 = !DILocation(line: 98, column: 2, scope: !176)
!192 = !DILocalVariable(name: "skb", arg: 1, scope: !193, file: !3, line: 21, type: !35)
!193 = distinct !DISubprogram(name: "get_dscp", scope: !3, file: !3, line: 21, type: !194, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !196)
!194 = !DISubroutineType(types: !195)
!195 = !{!79, !35}
!196 = !{!192, !197, !198, !199, !204, !247, !275, !286}
!197 = !DILocalVariable(name: "data_end", scope: !193, file: !3, line: 23, type: !14)
!198 = !DILocalVariable(name: "data", scope: !193, file: !3, line: 24, type: !14)
!199 = !DILocalVariable(name: "nh", scope: !193, file: !3, line: 25, type: !200)
!200 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !201, line: 35, size: 64, elements: !202)
!201 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/preserve-dscp", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!202 = !{!203}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !200, file: !201, line: 36, baseType: !14, size: 64)
!204 = !DILocalVariable(name: "ipv6hdr", scope: !193, file: !3, line: 27, type: !205)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !207, line: 118, size: 320, elements: !208)
!207 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!208 = !{!209, !210, !211, !215, !216, !217, !218}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !206, file: !207, line: 120, baseType: !79, size: 4, flags: DIFlagBitField, extraData: i64 0)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !206, file: !207, line: 121, baseType: !79, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !206, file: !207, line: 128, baseType: !212, size: 24, offset: 8)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 24, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 3)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !206, file: !207, line: 130, baseType: !85, size: 16, offset: 32)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !206, file: !207, line: 131, baseType: !79, size: 8, offset: 48)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !206, file: !207, line: 132, baseType: !79, size: 8, offset: 56)
!218 = !DIDerivedType(tag: DW_TAG_member, scope: !206, file: !207, line: 134, baseType: !219, size: 256, offset: 64)
!219 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !206, file: !207, line: 134, size: 256, elements: !220)
!220 = !{!221, !242}
!221 = !DIDerivedType(tag: DW_TAG_member, scope: !219, file: !207, line: 134, baseType: !222, size: 256)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 134, size: 256, elements: !223)
!223 = !{!224, !241}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !222, file: !207, line: 134, baseType: !225, size: 128)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !226, line: 33, size: 128, elements: !227)
!226 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!227 = !{!228}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !225, file: !226, line: 40, baseType: !229, size: 128)
!229 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !225, file: !226, line: 34, size: 128, elements: !230)
!230 = !{!231, !235, !239}
!231 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !229, file: !226, line: 35, baseType: !232, size: 128)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 128, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 16)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !229, file: !226, line: 37, baseType: !236, size: 128)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 128, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 8)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !229, file: !226, line: 38, baseType: !240, size: 128)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 128, elements: !26)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !222, file: !207, line: 134, baseType: !225, size: 128, offset: 128)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !219, file: !207, line: 134, baseType: !243, size: 256)
!243 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 134, size: 256, elements: !244)
!244 = !{!245, !246}
!245 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !243, file: !207, line: 134, baseType: !225, size: 128)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !243, file: !207, line: 134, baseType: !225, size: 128, offset: 128)
!247 = !DILocalVariable(name: "iphdr", scope: !193, file: !3, line: 28, type: !248)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !250, line: 87, size: 160, elements: !251)
!250 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!251 = !{!252, !253, !254, !255, !256, !257, !258, !259, !260, !262}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !249, file: !250, line: 89, baseType: !79, size: 4, flags: DIFlagBitField, extraData: i64 0)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !249, file: !250, line: 90, baseType: !79, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !249, file: !250, line: 97, baseType: !79, size: 8, offset: 8)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !249, file: !250, line: 98, baseType: !85, size: 16, offset: 16)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !249, file: !250, line: 99, baseType: !85, size: 16, offset: 32)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !249, file: !250, line: 100, baseType: !85, size: 16, offset: 48)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !249, file: !250, line: 101, baseType: !79, size: 8, offset: 64)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !249, file: !250, line: 102, baseType: !79, size: 8, offset: 72)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !249, file: !250, line: 103, baseType: !261, size: 16, offset: 80)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !86, line: 31, baseType: !16)
!262 = !DIDerivedType(tag: DW_TAG_member, scope: !249, file: !250, line: 104, baseType: !263, size: 64, offset: 96)
!263 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !249, file: !250, line: 104, size: 64, elements: !264)
!264 = !{!265, !270}
!265 = !DIDerivedType(tag: DW_TAG_member, scope: !263, file: !250, line: 104, baseType: !266, size: 64)
!266 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !263, file: !250, line: 104, size: 64, elements: !267)
!267 = !{!268, !269}
!268 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !266, file: !250, line: 104, baseType: !96, size: 32)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !266, file: !250, line: 104, baseType: !96, size: 32, offset: 32)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !263, file: !250, line: 104, baseType: !271, size: 64)
!271 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !263, file: !250, line: 104, size: 64, elements: !272)
!272 = !{!273, !274}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !271, file: !250, line: 104, baseType: !96, size: 32)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !271, file: !250, line: 104, baseType: !96, size: 32, offset: 32)
!275 = !DILocalVariable(name: "eth", scope: !193, file: !3, line: 29, type: !276)
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !278, line: 168, size: 112, elements: !279)
!278 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!279 = !{!280, !284, !285}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !277, file: !278, line: 169, baseType: !281, size: 48)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 48, elements: !282)
!282 = !{!283}
!283 = !DISubrange(count: 6)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !277, file: !278, line: 170, baseType: !281, size: 48, offset: 48)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !277, file: !278, line: 171, baseType: !85, size: 16, offset: 96)
!286 = !DILocalVariable(name: "eth_type", scope: !193, file: !3, line: 30, type: !131)
!287 = !DILocation(line: 0, scope: !193, inlinedAt: !288)
!288 = distinct !DILocation(line: 100, column: 9, scope: !176)
!289 = !DILocation(line: 23, column: 52, scope: !193, inlinedAt: !288)
!290 = !{!291, !188, i64 80}
!291 = !{!"__sk_buff", !188, i64 0, !188, i64 4, !188, i64 8, !188, i64 12, !188, i64 16, !188, i64 20, !188, i64 24, !188, i64 28, !188, i64 32, !188, i64 36, !188, i64 40, !188, i64 44, !189, i64 48, !188, i64 68, !188, i64 72, !188, i64 76, !188, i64 80, !188, i64 84, !188, i64 88, !188, i64 92, !188, i64 96, !189, i64 100, !189, i64 116, !188, i64 132, !188, i64 136, !188, i64 140, !189, i64 144, !292, i64 152, !188, i64 160, !188, i64 164, !189, i64 168, !188, i64 176}
!292 = !{!"long long", !189, i64 0}
!293 = !DILocation(line: 23, column: 27, scope: !193, inlinedAt: !288)
!294 = !DILocation(line: 23, column: 19, scope: !193, inlinedAt: !288)
!295 = !DILocation(line: 24, column: 48, scope: !193, inlinedAt: !288)
!296 = !{!291, !188, i64 76}
!297 = !DILocation(line: 24, column: 23, scope: !193, inlinedAt: !288)
!298 = !DILocation(line: 24, column: 15, scope: !193, inlinedAt: !288)
!299 = !DILocation(line: 32, column: 7, scope: !300, inlinedAt: !288)
!300 = distinct !DILexicalBlock(scope: !193, file: !3, line: 32, column: 6)
!301 = !DILocation(line: 32, column: 6, scope: !193, inlinedAt: !288)
!302 = !DILocalVariable(name: "nh", arg: 1, scope: !303, file: !201, line: 131, type: !306)
!303 = distinct !DISubprogram(name: "parse_ethhdr", scope: !201, file: !201, line: 131, type: !304, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !308)
!304 = !DISubroutineType(types: !305)
!305 = !{!131, !306, !14, !307}
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!308 = !{!302, !309, !310}
!309 = !DILocalVariable(name: "data_end", arg: 2, scope: !303, file: !201, line: 132, type: !14)
!310 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !303, file: !201, line: 133, type: !307)
!311 = !DILocation(line: 0, scope: !303, inlinedAt: !312)
!312 = distinct !DILocation(line: 34, column: 14, scope: !313, inlinedAt: !288)
!313 = distinct !DILexicalBlock(scope: !300, file: !3, line: 32, column: 16)
!314 = !DILocalVariable(name: "nh", arg: 1, scope: !315, file: !201, line: 86, type: !306)
!315 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !201, file: !201, line: 86, type: !316, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !325)
!316 = !DISubroutineType(types: !317)
!317 = !{!131, !306, !14, !307, !318}
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!319 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !201, line: 71, size: 32, elements: !320)
!320 = !{!321}
!321 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !319, file: !201, line: 72, baseType: !322, size: 32)
!322 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !323)
!323 = !{!324}
!324 = !DISubrange(count: 2)
!325 = !{!314, !326, !327, !328, !329, !330, !331, !337, !338}
!326 = !DILocalVariable(name: "data_end", arg: 2, scope: !315, file: !201, line: 87, type: !14)
!327 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !315, file: !201, line: 88, type: !307)
!328 = !DILocalVariable(name: "vlans", arg: 4, scope: !315, file: !201, line: 89, type: !318)
!329 = !DILocalVariable(name: "eth", scope: !315, file: !201, line: 91, type: !276)
!330 = !DILocalVariable(name: "hdrsize", scope: !315, file: !201, line: 92, type: !131)
!331 = !DILocalVariable(name: "vlh", scope: !315, file: !201, line: 93, type: !332)
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !333, size: 64)
!333 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !201, line: 44, size: 32, elements: !334)
!334 = !{!335, !336}
!335 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !333, file: !201, line: 45, baseType: !85, size: 16)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !333, file: !201, line: 46, baseType: !85, size: 16, offset: 16)
!337 = !DILocalVariable(name: "h_proto", scope: !315, file: !201, line: 94, type: !16)
!338 = !DILocalVariable(name: "i", scope: !315, file: !201, line: 95, type: !131)
!339 = !DILocation(line: 0, scope: !315, inlinedAt: !340)
!340 = distinct !DILocation(line: 136, column: 9, scope: !303, inlinedAt: !312)
!341 = !DILocation(line: 100, column: 14, scope: !342, inlinedAt: !340)
!342 = distinct !DILexicalBlock(scope: !315, file: !201, line: 100, column: 6)
!343 = !DILocation(line: 100, column: 24, scope: !342, inlinedAt: !340)
!344 = !DILocation(line: 100, column: 6, scope: !315, inlinedAt: !340)
!345 = !DILocation(line: 106, column: 17, scope: !315, inlinedAt: !340)
!346 = !{!347, !347, i64 0}
!347 = !{!"short", !189, i64 0}
!348 = !DILocalVariable(name: "h_proto", arg: 1, scope: !349, file: !201, line: 75, type: !16)
!349 = distinct !DISubprogram(name: "proto_is_vlan", scope: !201, file: !201, line: 75, type: !350, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !352)
!350 = !DISubroutineType(types: !351)
!351 = !{!131, !16}
!352 = !{!348}
!353 = !DILocation(line: 0, scope: !349, inlinedAt: !354)
!354 = distinct !DILocation(line: 113, column: 8, scope: !355, inlinedAt: !340)
!355 = distinct !DILexicalBlock(scope: !356, file: !201, line: 113, column: 7)
!356 = distinct !DILexicalBlock(scope: !357, file: !201, line: 112, column: 39)
!357 = distinct !DILexicalBlock(scope: !358, file: !201, line: 112, column: 2)
!358 = distinct !DILexicalBlock(scope: !315, file: !201, line: 112, column: 2)
!359 = !DILocation(line: 77, column: 20, scope: !349, inlinedAt: !354)
!360 = !DILocation(line: 77, column: 46, scope: !349, inlinedAt: !354)
!361 = !DILocation(line: 113, column: 8, scope: !355, inlinedAt: !340)
!362 = !DILocation(line: 113, column: 7, scope: !356, inlinedAt: !340)
!363 = !DILocation(line: 119, column: 18, scope: !356, inlinedAt: !340)
!364 = !DILocation(line: 35, column: 39, scope: !365, inlinedAt: !288)
!365 = distinct !DILexicalBlock(scope: !313, file: !3, line: 35, column: 7)
!366 = !DILocation(line: 25, column: 25, scope: !193, inlinedAt: !288)
!367 = !DILocalVariable(name: "nh", arg: 1, scope: !368, file: !201, line: 196, type: !306)
!368 = distinct !DISubprogram(name: "parse_iphdr", scope: !201, file: !201, line: 196, type: !369, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !372)
!369 = !DISubroutineType(types: !370)
!370 = !{!131, !306, !14, !371}
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!372 = !{!367, !373, !374, !375, !376}
!373 = !DILocalVariable(name: "data_end", arg: 2, scope: !368, file: !201, line: 197, type: !14)
!374 = !DILocalVariable(name: "iphdr", arg: 3, scope: !368, file: !201, line: 198, type: !371)
!375 = !DILocalVariable(name: "iph", scope: !368, file: !201, line: 200, type: !248)
!376 = !DILocalVariable(name: "hdrsize", scope: !368, file: !201, line: 201, type: !131)
!377 = !DILocation(line: 0, scope: !368, inlinedAt: !378)
!378 = distinct !DILocation(line: 39, column: 6, scope: !379, inlinedAt: !288)
!379 = distinct !DILexicalBlock(scope: !193, file: !3, line: 39, column: 6)
!380 = !DILocation(line: 203, column: 10, scope: !381, inlinedAt: !378)
!381 = distinct !DILexicalBlock(scope: !368, file: !201, line: 203, column: 6)
!382 = !DILocation(line: 203, column: 14, scope: !381, inlinedAt: !378)
!383 = !DILocation(line: 203, column: 6, scope: !368, inlinedAt: !378)
!384 = !DILocation(line: 206, column: 11, scope: !385, inlinedAt: !378)
!385 = distinct !DILexicalBlock(scope: !368, file: !201, line: 206, column: 6)
!386 = !DILocation(line: 206, column: 19, scope: !385, inlinedAt: !378)
!387 = !DILocation(line: 206, column: 6, scope: !368, inlinedAt: !378)
!388 = !DILocation(line: 209, column: 21, scope: !368, inlinedAt: !378)
!389 = !DILocation(line: 211, column: 13, scope: !390, inlinedAt: !378)
!390 = distinct !DILexicalBlock(scope: !368, file: !201, line: 211, column: 5)
!391 = !DILocation(line: 211, column: 5, scope: !368, inlinedAt: !378)
!392 = !DILocation(line: 215, column: 14, scope: !393, inlinedAt: !378)
!393 = distinct !DILexicalBlock(scope: !368, file: !201, line: 215, column: 6)
!394 = !DILocation(line: 215, column: 24, scope: !393, inlinedAt: !378)
!395 = !DILocation(line: 215, column: 6, scope: !368, inlinedAt: !378)
!396 = !DILocation(line: 221, column: 14, scope: !368, inlinedAt: !378)
!397 = !{!398, !189, i64 9}
!398 = !{!"iphdr", !189, i64 0, !189, i64 0, !189, i64 1, !347, i64 2, !347, i64 4, !347, i64 6, !189, i64 8, !189, i64 9, !347, i64 10, !189, i64 12}
!399 = !DILocation(line: 39, column: 41, scope: !379, inlinedAt: !288)
!400 = !DILocation(line: 39, column: 6, scope: !193, inlinedAt: !288)
!401 = !DILocation(line: 40, column: 17, scope: !379, inlinedAt: !288)
!402 = !{!398, !189, i64 1}
!403 = !DILocation(line: 40, column: 21, scope: !379, inlinedAt: !288)
!404 = !DILocation(line: 40, column: 3, scope: !379, inlinedAt: !288)
!405 = !DILocalVariable(name: "nh", arg: 1, scope: !406, file: !201, line: 174, type: !306)
!406 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !201, file: !201, line: 174, type: !407, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !410)
!407 = !DISubroutineType(types: !408)
!408 = !{!131, !306, !14, !409}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!410 = !{!405, !411, !412, !413}
!411 = !DILocalVariable(name: "data_end", arg: 2, scope: !406, file: !201, line: 175, type: !14)
!412 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !406, file: !201, line: 176, type: !409)
!413 = !DILocalVariable(name: "ip6h", scope: !406, file: !201, line: 178, type: !205)
!414 = !DILocation(line: 0, scope: !406, inlinedAt: !415)
!415 = distinct !DILocation(line: 42, column: 11, scope: !416, inlinedAt: !288)
!416 = distinct !DILexicalBlock(scope: !379, file: !3, line: 42, column: 11)
!417 = !DILocation(line: 184, column: 11, scope: !418, inlinedAt: !415)
!418 = distinct !DILexicalBlock(scope: !406, file: !201, line: 184, column: 6)
!419 = !DILocation(line: 184, column: 15, scope: !418, inlinedAt: !415)
!420 = !DILocation(line: 184, column: 6, scope: !406, inlinedAt: !415)
!421 = !DILocation(line: 187, column: 12, scope: !422, inlinedAt: !415)
!422 = distinct !DILexicalBlock(scope: !406, file: !201, line: 187, column: 6)
!423 = !DILocation(line: 187, column: 20, scope: !422, inlinedAt: !415)
!424 = !DILocation(line: 187, column: 6, scope: !406, inlinedAt: !415)
!425 = !DILocation(line: 193, column: 44, scope: !406, inlinedAt: !415)
!426 = !{!427, !189, i64 6}
!427 = !{!"ipv6hdr", !189, i64 0, !189, i64 0, !189, i64 1, !347, i64 4, !189, i64 6, !189, i64 7, !189, i64 8}
!428 = !DILocalVariable(name: "nh", arg: 1, scope: !429, file: !201, line: 139, type: !306)
!429 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !201, file: !201, line: 139, type: !430, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !432)
!430 = !DISubroutineType(types: !431)
!431 = !{!131, !306, !14, !79}
!432 = !{!428, !433, !434, !435, !437}
!433 = !DILocalVariable(name: "data_end", arg: 2, scope: !429, file: !201, line: 140, type: !14)
!434 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !429, file: !201, line: 141, type: !79)
!435 = !DILocalVariable(name: "i", scope: !436, file: !201, line: 143, type: !131)
!436 = distinct !DILexicalBlock(scope: !429, file: !201, line: 143, column: 2)
!437 = !DILocalVariable(name: "hdr", scope: !438, file: !201, line: 144, type: !440)
!438 = distinct !DILexicalBlock(scope: !439, file: !201, line: 143, column: 47)
!439 = distinct !DILexicalBlock(scope: !436, file: !201, line: 143, column: 2)
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64)
!441 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !207, line: 63, size: 16, elements: !442)
!442 = !{!443, !444}
!443 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !441, file: !207, line: 64, baseType: !79, size: 8)
!444 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !441, file: !207, line: 65, baseType: !79, size: 8, offset: 8)
!445 = !DILocation(line: 0, scope: !429, inlinedAt: !446)
!446 = distinct !DILocation(line: 193, column: 9, scope: !406, inlinedAt: !415)
!447 = !DILocation(line: 0, scope: !436, inlinedAt: !446)
!448 = !DILocation(line: 0, scope: !438, inlinedAt: !446)
!449 = !DILocation(line: 146, column: 11, scope: !450, inlinedAt: !446)
!450 = distinct !DILexicalBlock(scope: !438, file: !201, line: 146, column: 7)
!451 = !DILocation(line: 146, column: 15, scope: !450, inlinedAt: !446)
!452 = !DILocation(line: 146, column: 7, scope: !438, inlinedAt: !446)
!453 = !DILocation(line: 149, column: 3, scope: !438, inlinedAt: !446)
!454 = !DILocation(line: 160, column: 4, scope: !455, inlinedAt: !446)
!455 = distinct !DILexicalBlock(scope: !438, file: !201, line: 149, column: 26)
!456 = !DILocation(line: 0, scope: !455, inlinedAt: !446)
!457 = !{!458, !189, i64 1}
!458 = !{!"ipv6_opt_hdr", !189, i64 0, !189, i64 1}
!459 = !{!458, !189, i64 0}
!460 = !DILocation(line: 156, column: 4, scope: !455, inlinedAt: !446)
!461 = !DILocation(line: 42, column: 49, scope: !416, inlinedAt: !288)
!462 = !DILocation(line: 42, column: 11, scope: !379, inlinedAt: !288)
!463 = !DILocation(line: 43, column: 10, scope: !416, inlinedAt: !288)
!464 = !DILocation(line: 43, column: 3, scope: !416, inlinedAt: !288)
!465 = !DILocation(line: 100, column: 7, scope: !176)
!466 = !{!189, !189, i64 0}
!467 = !DILocation(line: 101, column: 6, scope: !468)
!468 = distinct !DILexicalBlock(scope: !176, file: !3, line: 101, column: 6)
!469 = !DILocation(line: 101, column: 6, scope: !176)
!470 = !DILocation(line: 102, column: 3, scope: !468)
!471 = !DILocation(line: 104, column: 3, scope: !468)
!472 = !DILocation(line: 107, column: 1, scope: !176)
!473 = !DILocation(line: 106, column: 2, scope: !176)
!474 = distinct !DISubprogram(name: "write_dscp", scope: !3, file: !3, line: 110, type: !177, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !475)
!475 = !{!476, !477, !478}
!476 = !DILocalVariable(name: "skb", arg: 1, scope: !474, file: !3, line: 110, type: !35)
!477 = !DILocalVariable(name: "key", scope: !474, file: !3, line: 112, type: !34)
!478 = !DILocalVariable(name: "dscp", scope: !474, file: !3, line: 113, type: !165)
!479 = !DILocation(line: 0, scope: !474)
!480 = !DILocation(line: 112, column: 2, scope: !474)
!481 = !DILocation(line: 112, column: 19, scope: !474)
!482 = !{!291, !188, i64 68}
!483 = !DILocation(line: 112, column: 8, scope: !474)
!484 = !DILocation(line: 115, column: 9, scope: !474)
!485 = !DILocation(line: 116, column: 6, scope: !486)
!486 = distinct !DILexicalBlock(scope: !474, file: !3, line: 116, column: 6)
!487 = !DILocation(line: 116, column: 6, scope: !474)
!488 = !DILocation(line: 117, column: 17, scope: !486)
!489 = !DILocalVariable(name: "skb", arg: 1, scope: !490, file: !3, line: 72, type: !35)
!490 = distinct !DISubprogram(name: "set_dscp", scope: !3, file: !3, line: 72, type: !491, scopeLine: 73, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !493)
!491 = !DISubroutineType(types: !492)
!492 = !{null, !35, !79}
!493 = !{!489, !494, !495, !496, !497, !498, !499, !500, !501}
!494 = !DILocalVariable(name: "dscp", arg: 2, scope: !490, file: !3, line: 72, type: !79)
!495 = !DILocalVariable(name: "data_end", scope: !490, file: !3, line: 74, type: !14)
!496 = !DILocalVariable(name: "data", scope: !490, file: !3, line: 75, type: !14)
!497 = !DILocalVariable(name: "nh", scope: !490, file: !3, line: 76, type: !200)
!498 = !DILocalVariable(name: "ipv6hdr", scope: !490, file: !3, line: 78, type: !205)
!499 = !DILocalVariable(name: "iphdr", scope: !490, file: !3, line: 79, type: !248)
!500 = !DILocalVariable(name: "eth", scope: !490, file: !3, line: 80, type: !276)
!501 = !DILocalVariable(name: "eth_type", scope: !490, file: !3, line: 81, type: !131)
!502 = !DILocation(line: 0, scope: !490, inlinedAt: !503)
!503 = distinct !DILocation(line: 117, column: 3, scope: !486)
!504 = !DILocation(line: 74, column: 52, scope: !490, inlinedAt: !503)
!505 = !DILocation(line: 74, column: 27, scope: !490, inlinedAt: !503)
!506 = !DILocation(line: 74, column: 19, scope: !490, inlinedAt: !503)
!507 = !DILocation(line: 75, column: 48, scope: !490, inlinedAt: !503)
!508 = !DILocation(line: 75, column: 23, scope: !490, inlinedAt: !503)
!509 = !DILocation(line: 75, column: 15, scope: !490, inlinedAt: !503)
!510 = !DILocation(line: 0, scope: !303, inlinedAt: !511)
!511 = distinct !DILocation(line: 83, column: 13, scope: !490, inlinedAt: !503)
!512 = !DILocation(line: 0, scope: !315, inlinedAt: !513)
!513 = distinct !DILocation(line: 136, column: 9, scope: !303, inlinedAt: !511)
!514 = !DILocation(line: 100, column: 14, scope: !342, inlinedAt: !513)
!515 = !DILocation(line: 100, column: 24, scope: !342, inlinedAt: !513)
!516 = !DILocation(line: 100, column: 6, scope: !315, inlinedAt: !513)
!517 = !DILocation(line: 106, column: 17, scope: !315, inlinedAt: !513)
!518 = !DILocation(line: 0, scope: !349, inlinedAt: !519)
!519 = distinct !DILocation(line: 113, column: 8, scope: !355, inlinedAt: !513)
!520 = !DILocation(line: 77, column: 20, scope: !349, inlinedAt: !519)
!521 = !DILocation(line: 77, column: 46, scope: !349, inlinedAt: !519)
!522 = !DILocation(line: 113, column: 8, scope: !355, inlinedAt: !513)
!523 = !DILocation(line: 113, column: 7, scope: !356, inlinedAt: !513)
!524 = !DILocation(line: 119, column: 18, scope: !356, inlinedAt: !513)
!525 = !DILocation(line: 85, column: 38, scope: !526, inlinedAt: !503)
!526 = distinct !DILexicalBlock(scope: !490, file: !3, line: 85, column: 6)
!527 = !DILocation(line: 0, scope: !368, inlinedAt: !528)
!528 = distinct !DILocation(line: 86, column: 6, scope: !526, inlinedAt: !503)
!529 = !DILocation(line: 203, column: 10, scope: !381, inlinedAt: !528)
!530 = !DILocation(line: 203, column: 14, scope: !381, inlinedAt: !528)
!531 = !DILocation(line: 203, column: 6, scope: !368, inlinedAt: !528)
!532 = !DILocation(line: 206, column: 11, scope: !385, inlinedAt: !528)
!533 = !DILocation(line: 206, column: 19, scope: !385, inlinedAt: !528)
!534 = !DILocation(line: 206, column: 6, scope: !368, inlinedAt: !528)
!535 = !DILocation(line: 209, column: 21, scope: !368, inlinedAt: !528)
!536 = !DILocation(line: 211, column: 13, scope: !390, inlinedAt: !528)
!537 = !DILocation(line: 211, column: 5, scope: !368, inlinedAt: !528)
!538 = !DILocation(line: 215, column: 14, scope: !393, inlinedAt: !528)
!539 = !DILocation(line: 215, column: 24, scope: !393, inlinedAt: !528)
!540 = !DILocation(line: 215, column: 6, scope: !368, inlinedAt: !528)
!541 = !DILocation(line: 221, column: 14, scope: !368, inlinedAt: !528)
!542 = !DILocation(line: 86, column: 41, scope: !526, inlinedAt: !503)
!543 = !DILocation(line: 85, column: 6, scope: !490, inlinedAt: !503)
!544 = !DILocation(line: 87, column: 50, scope: !526, inlinedAt: !503)
!545 = !DILocalVariable(name: "iph", arg: 1, scope: !546, file: !3, line: 48, type: !248)
!546 = distinct !DISubprogram(name: "ipv4_change_dsfield", scope: !3, file: !3, line: 48, type: !547, scopeLine: 49, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !549)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !248, !79, !79}
!549 = !{!545, !550, !551, !552, !553}
!550 = !DILocalVariable(name: "mask", arg: 2, scope: !546, file: !3, line: 48, type: !79)
!551 = !DILocalVariable(name: "value", arg: 3, scope: !546, file: !3, line: 48, type: !79)
!552 = !DILocalVariable(name: "check", scope: !546, file: !3, line: 50, type: !34)
!553 = !DILocalVariable(name: "dsfield", scope: !546, file: !3, line: 51, type: !79)
!554 = !DILocation(line: 0, scope: !546, inlinedAt: !555)
!555 = distinct !DILocation(line: 87, column: 3, scope: !526, inlinedAt: !503)
!556 = !DILocation(line: 50, column: 23, scope: !546, inlinedAt: !555)
!557 = !{!398, !347, i64 10}
!558 = !DILocation(line: 53, column: 18, scope: !546, inlinedAt: !555)
!559 = !DILocation(line: 53, column: 13, scope: !546, inlinedAt: !555)
!560 = !DILocation(line: 53, column: 22, scope: !546, inlinedAt: !555)
!561 = !DILocation(line: 53, column: 30, scope: !546, inlinedAt: !555)
!562 = !DILocation(line: 54, column: 8, scope: !546, inlinedAt: !555)
!563 = !DILocation(line: 55, column: 16, scope: !564, inlinedAt: !555)
!564 = distinct !DILexicalBlock(scope: !546, file: !3, line: 55, column: 6)
!565 = !DILocation(line: 55, column: 6, scope: !546, inlinedAt: !555)
!566 = !DILocation(line: 56, column: 11, scope: !546, inlinedAt: !555)
!567 = !DILocation(line: 56, column: 8, scope: !546, inlinedAt: !555)
!568 = !DILocation(line: 57, column: 17, scope: !546, inlinedAt: !555)
!569 = !DILocation(line: 57, column: 8, scope: !546, inlinedAt: !555)
!570 = !DILocation(line: 58, column: 15, scope: !546, inlinedAt: !555)
!571 = !DILocation(line: 58, column: 13, scope: !546, inlinedAt: !555)
!572 = !DILocation(line: 59, column: 11, scope: !546, inlinedAt: !555)
!573 = !DILocation(line: 87, column: 3, scope: !526, inlinedAt: !503)
!574 = !DILocation(line: 0, scope: !406, inlinedAt: !575)
!575 = distinct !DILocation(line: 90, column: 4, scope: !576, inlinedAt: !503)
!576 = distinct !DILexicalBlock(scope: !526, file: !3, line: 89, column: 11)
!577 = !DILocation(line: 184, column: 11, scope: !418, inlinedAt: !575)
!578 = !DILocation(line: 184, column: 15, scope: !418, inlinedAt: !575)
!579 = !DILocation(line: 184, column: 6, scope: !406, inlinedAt: !575)
!580 = !DILocation(line: 187, column: 12, scope: !422, inlinedAt: !575)
!581 = !DILocation(line: 187, column: 20, scope: !422, inlinedAt: !575)
!582 = !DILocation(line: 187, column: 6, scope: !406, inlinedAt: !575)
!583 = !DILocation(line: 193, column: 44, scope: !406, inlinedAt: !575)
!584 = !DILocation(line: 0, scope: !429, inlinedAt: !585)
!585 = distinct !DILocation(line: 193, column: 9, scope: !406, inlinedAt: !575)
!586 = !DILocation(line: 0, scope: !436, inlinedAt: !585)
!587 = !DILocation(line: 0, scope: !438, inlinedAt: !585)
!588 = !DILocation(line: 146, column: 11, scope: !450, inlinedAt: !585)
!589 = !DILocation(line: 146, column: 15, scope: !450, inlinedAt: !585)
!590 = !DILocation(line: 146, column: 7, scope: !438, inlinedAt: !585)
!591 = !DILocation(line: 149, column: 3, scope: !438, inlinedAt: !585)
!592 = !DILocation(line: 160, column: 4, scope: !455, inlinedAt: !585)
!593 = !DILocation(line: 0, scope: !455, inlinedAt: !585)
!594 = !DILocation(line: 156, column: 4, scope: !455, inlinedAt: !585)
!595 = !DILocation(line: 90, column: 42, scope: !576, inlinedAt: !503)
!596 = !DILocation(line: 89, column: 11, scope: !526, inlinedAt: !503)
!597 = !DILocation(line: 91, column: 52, scope: !576, inlinedAt: !503)
!598 = !DILocalVariable(name: "ipv6h", arg: 1, scope: !599, file: !3, line: 62, type: !205)
!599 = distinct !DISubprogram(name: "ipv6_change_dsfield", scope: !3, file: !3, line: 62, type: !600, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !602)
!600 = !DISubroutineType(types: !601)
!601 = !{null, !205, !79, !79}
!602 = !{!598, !603, !604, !605}
!603 = !DILocalVariable(name: "mask", arg: 2, scope: !599, file: !3, line: 62, type: !79)
!604 = !DILocalVariable(name: "value", arg: 3, scope: !599, file: !3, line: 63, type: !79)
!605 = !DILocalVariable(name: "p", scope: !599, file: !3, line: 65, type: !19)
!606 = !DILocation(line: 0, scope: !599, inlinedAt: !607)
!607 = distinct !DILocation(line: 91, column: 3, scope: !576, inlinedAt: !503)
!608 = !DILocation(line: 65, column: 13, scope: !599, inlinedAt: !607)
!609 = !DILocation(line: 67, column: 8, scope: !599, inlinedAt: !607)
!610 = !DILocation(line: 67, column: 57, scope: !599, inlinedAt: !607)
!611 = !DILocation(line: 67, column: 11, scope: !599, inlinedAt: !607)
!612 = !DILocation(line: 67, column: 55, scope: !599, inlinedAt: !607)
!613 = !DILocation(line: 67, column: 5, scope: !599, inlinedAt: !607)
!614 = !DILocation(line: 91, column: 3, scope: !576, inlinedAt: !503)
!615 = !DILocation(line: 120, column: 1, scope: !474)
!616 = !DILocation(line: 119, column: 2, scope: !474)
