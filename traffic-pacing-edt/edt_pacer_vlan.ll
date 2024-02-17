; ModuleID = 'edt_pacer_vlan.c'
source_filename = "edt_pacer_vlan.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { [2 x i32]*, [4096 x i32]*, i32*, %struct.edt_val* }
%struct.edt_val = type { i64, i64, i64, i64, %struct.codel_state, [8 x i8] }
%struct.codel_state = type { i64, i64, i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.collect_vlans = type { [2 x i16] }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vlan_hdr = type { i16, i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@time_delay_map = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !24
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_edt_vlan to i8*), i8* bitcast (%struct.anon.3* @time_delay_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @tc_edt_vlan(%struct.__sk_buff* noundef %0) #0 section "classifier" !dbg !181 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !185, metadata !DIExpression()), !dbg !213
  %3 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !214
  %4 = load i32, i32* %3, align 4, !dbg !214, !tbaa !215
  %5 = zext i32 %4 to i64, !dbg !221
  %6 = inttoptr i64 %5 to i8*, !dbg !222
  call void @llvm.dbg.value(metadata i8* %6, metadata !186, metadata !DIExpression()), !dbg !213
  %7 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !223
  %8 = load i32, i32* %7, align 8, !dbg !223, !tbaa !224
  %9 = zext i32 %8 to i64, !dbg !225
  %10 = inttoptr i64 %9 to i8*, !dbg !226
  call void @llvm.dbg.value(metadata i8* %10, metadata !187, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata %struct.collect_vlans* undef, metadata !188, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.value(metadata i32 0, metadata !205, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.value(metadata i8* %6, metadata !207, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !228, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i8* %10, metadata !236, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !237, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !238, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i8* %6, metadata !239, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i32 14, metadata !240, metadata !DIExpression()) #5, !dbg !249
  %11 = getelementptr i8, i8* %6, i64 14, !dbg !251
  %12 = icmp ugt i8* %11, %10, !dbg !253
  br i1 %12, label %261, label %13, !dbg !254

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %6, metadata !239, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i8* %11, metadata !207, metadata !DIExpression()), !dbg !213
  %14 = inttoptr i64 %5 to %struct.ethhdr*, !dbg !255
  call void @llvm.dbg.value(metadata i8* %11, metadata !241, metadata !DIExpression()) #5, !dbg !249
  %15 = getelementptr inbounds i8, i8* %6, i64 12, !dbg !256
  %16 = bitcast i8* %15 to i16*, !dbg !256
  %17 = load i16, i16* %16, align 1, !dbg !256, !tbaa !257
  call void @llvm.dbg.value(metadata i16 %17, metadata !247, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i32 0, metadata !248, metadata !DIExpression()) #5, !dbg !249
  %18 = inttoptr i64 %9 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i64 0, metadata !248, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i16 %17, metadata !260, metadata !DIExpression()) #5, !dbg !265
  %19 = icmp eq i16 %17, 129, !dbg !271
  %20 = icmp eq i16 %17, -22392, !dbg !272
  %21 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %19) #5
  %22 = or i1 %20, %21, !dbg !272
  %23 = xor i1 %22, true, !dbg !273
  %24 = getelementptr i8, i8* %6, i64 18
  %25 = bitcast i8* %24 to %struct.vlan_hdr*
  %26 = icmp ugt %struct.vlan_hdr* %25, %18
  %27 = select i1 %23, i1 true, i1 %26, !dbg !274
  br i1 %27, label %53, label %28, !dbg !274

28:                                               ; preds = %13
  %29 = getelementptr i8, i8* %6, i64 16, !dbg !275
  %30 = bitcast i8* %29 to i16*, !dbg !275
  %31 = load i16, i16* %30, align 2, !dbg !275, !tbaa !276
  call void @llvm.dbg.value(metadata i16 %31, metadata !247, metadata !DIExpression()) #5, !dbg !249
  %32 = bitcast i8* %11 to i16*, !dbg !278
  %33 = load i16, i16* %32, align 2, !dbg !278, !tbaa !280
  %34 = and i16 %33, -241, !dbg !281
  %35 = tail call i16 @llvm.bswap.i16(i16 %34) #5, !dbg !281
  call void @llvm.dbg.value(metadata i64 1, metadata !248, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %25, metadata !241, metadata !DIExpression()) #5, !dbg !249
  call void @llvm.dbg.value(metadata i16 %31, metadata !260, metadata !DIExpression()) #5, !dbg !265
  %36 = icmp eq i16 %31, 129, !dbg !271
  %37 = icmp eq i16 %31, -22392, !dbg !272
  %38 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %36) #5
  %39 = or i1 %37, %38, !dbg !272
  %40 = xor i1 %39, true, !dbg !273
  %41 = getelementptr i8, i8* %6, i64 22
  %42 = bitcast i8* %41 to %struct.vlan_hdr*
  %43 = icmp ugt %struct.vlan_hdr* %42, %18
  %44 = select i1 %40, i1 true, i1 %43, !dbg !274
  br i1 %44, label %53, label %45, !dbg !274

45:                                               ; preds = %28
  %46 = getelementptr i8, i8* %6, i64 20, !dbg !275
  %47 = bitcast i8* %46 to i16*, !dbg !275
  %48 = load i16, i16* %47, align 2, !dbg !275, !tbaa !276
  call void @llvm.dbg.value(metadata i16 %48, metadata !247, metadata !DIExpression()) #5, !dbg !249
  %49 = bitcast i8* %24 to i16*, !dbg !278
  %50 = load i16, i16* %49, align 2, !dbg !278, !tbaa !280
  %51 = and i16 %50, -241, !dbg !281
  %52 = tail call i16 @llvm.bswap.i16(i16 %51) #5, !dbg !281
  br label %53, !dbg !282

53:                                               ; preds = %13, %28, %45
  %54 = phi i16 [ 0, %13 ], [ %35, %28 ], [ %35, %45 ], !dbg !213
  %55 = phi i16 [ 0, %13 ], [ 0, %28 ], [ %52, %45 ], !dbg !213
  %56 = phi i16 [ %17, %13 ], [ %31, %28 ], [ %48, %45 ], !dbg !249
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !207, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.value(metadata i16 %56, metadata !211, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !213
  %57 = icmp eq i16 %56, 1544, !dbg !283
  br i1 %57, label %261, label %58, !dbg !285

58:                                               ; preds = %53
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !194, metadata !DIExpression()), !dbg !213
  %59 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 2, !dbg !286
  %60 = load i16, i16* %59, align 1, !dbg !286, !tbaa !257
  call void @llvm.dbg.value(metadata i16 %60, metadata !260, metadata !DIExpression()) #5, !dbg !288
  %61 = icmp eq i16 %60, 129, !dbg !290
  %62 = icmp eq i16 %60, -22392, !dbg !291
  %63 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %61) #5
  %64 = or i1 %62, %63, !dbg !291
  %65 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 5
  %66 = load i32, i32* %65, align 4, !dbg !213, !tbaa !292
  %67 = xor i1 %64, true, !dbg !293
  %68 = icmp eq i32 %66, 0
  %69 = select i1 %67, i1 %68, i1 false, !dbg !293
  br i1 %69, label %261, label %70, !dbg !293

70:                                               ; preds = %58
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !294, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !299, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.value(metadata i32 0, metadata !300, metadata !DIExpression()), !dbg !301
  %71 = icmp eq i32 %66, 0, !dbg !303
  br i1 %71, label %74, label %72, !dbg !305

72:                                               ; preds = %70
  %73 = icmp eq i16 %54, 0, !dbg !306
  br i1 %73, label %78, label %76, !dbg !309

74:                                               ; preds = %70
  %75 = icmp eq i16 %55, 0, !dbg !310
  br i1 %75, label %83, label %76, !dbg !313

76:                                               ; preds = %74, %72
  %77 = phi i16 [ %55, %74 ], [ %54, %72 ], !dbg !314
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !317, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !318, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.value(metadata i16 %77, metadata !319, metadata !DIExpression()), !dbg !314
  br label %83, !dbg !322

78:                                               ; preds = %72
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !323, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !326, metadata !DIExpression()), !dbg !328
  %79 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 6, !dbg !330
  %80 = load i32, i32* %79, align 8, !dbg !330, !tbaa !332
  %81 = trunc i32 %80 to i16, !dbg !333
  %82 = and i16 %81, 4095, !dbg !333
  call void @llvm.dbg.value(metadata i16 %82, metadata !327, metadata !DIExpression()), !dbg !328
  br label %83, !dbg !334

83:                                               ; preds = %74, %76, %78
  %84 = phi i16 [ %77, %76 ], [ %82, %78 ], [ %54, %74 ], !dbg !335
  call void @llvm.dbg.value(metadata i16 %84, metadata !206, metadata !DIExpression()), !dbg !213
  %85 = zext i16 %84 to i32, !dbg !336
  %86 = bitcast i32* %2 to i8*, !dbg !337
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %86), !dbg !337
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !342, metadata !DIExpression()) #5, !dbg !337
  call void @llvm.dbg.value(metadata i32 %85, metadata !343, metadata !DIExpression()) #5, !dbg !337
  store i32 %85, i32* %2, align 4, !tbaa !363
  call void @llvm.dbg.value(metadata i32* %2, metadata !343, metadata !DIExpression(DW_OP_deref)) #5, !dbg !337
  %87 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @time_delay_map to i8*), i8* noundef nonnull %86) #5, !dbg !364
  call void @llvm.dbg.value(metadata i8* %87, metadata !344, metadata !DIExpression()) #5, !dbg !337
  %88 = icmp eq i8* %87, null, !dbg !365
  br i1 %88, label %259, label %89, !dbg !367

89:                                               ; preds = %83
  call void @llvm.dbg.value(metadata i64 123750000, metadata !345, metadata !DIExpression()) #5, !dbg !337
  %90 = bitcast i8* %87 to i64*, !dbg !368
  %91 = load i64, i64* %90, align 64, !dbg !368, !tbaa !370
  %92 = icmp eq i64 %91, 0, !dbg !373
  %93 = select i1 %92, i64 123750000, i64 %91, !dbg !374
  call void @llvm.dbg.value(metadata i64 %93, metadata !345, metadata !DIExpression()) #5, !dbg !337
  %94 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 28, !dbg !375
  %95 = load i32, i32* %94, align 8, !dbg !375, !tbaa !376
  %96 = add i32 %95, 32, !dbg !377
  %97 = zext i32 %96 to i64, !dbg !378
  call void @llvm.dbg.value(metadata i64 %97, metadata !348, metadata !DIExpression()) #5, !dbg !337
  %98 = icmp ugt i64 %97, 84, !dbg !379
  %99 = select i1 %98, i64 %97, i64 84, !dbg !380
  call void @llvm.dbg.value(metadata i64 %99, metadata !348, metadata !DIExpression()) #5, !dbg !337
  %100 = mul nuw nsw i64 %99, 1000000000, !dbg !381
  %101 = udiv i64 %100, %93, !dbg !382
  call void @llvm.dbg.value(metadata i64 %101, metadata !347, metadata !DIExpression()) #5, !dbg !337
  %102 = call i64 inttoptr (i64 125 to i64 ()*)() #5, !dbg !383
  call void @llvm.dbg.value(metadata i64 %102, metadata !351, metadata !DIExpression()) #5, !dbg !337
  %103 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 27, !dbg !384
  %104 = load i64, i64* %103, align 8, !dbg !384, !tbaa !385
  call void @llvm.dbg.value(metadata i64 %104, metadata !350, metadata !DIExpression()) #5, !dbg !337
  %105 = icmp ult i64 %104, %102, !dbg !386
  %106 = select i1 %105, i64 %102, i64 %104, !dbg !388
  call void @llvm.dbg.value(metadata i64 %106, metadata !350, metadata !DIExpression()) #5, !dbg !337
  %107 = getelementptr inbounds i8, i8* %87, i64 8, !dbg !389
  %108 = bitcast i8* %107 to i64*, !dbg !389
  %109 = load volatile i64, i64* %108, align 8, !dbg !389, !tbaa !390
  call void @llvm.dbg.value(metadata i64 %109, metadata !352, metadata !DIExpression()) #5, !dbg !391
  call void asm sideeffect "", "~{memory}"() #5, !dbg !392, !srcloc !399
  %110 = add i64 %109, %101, !dbg !400
  call void @llvm.dbg.value(metadata i64 %110, metadata !349, metadata !DIExpression()) #5, !dbg !337
  %111 = icmp ugt i64 %110, %106, !dbg !401
  br i1 %111, label %119, label %112, !dbg !402

112:                                              ; preds = %89
  call void @llvm.dbg.value(metadata i32 1538, metadata !357, metadata !DIExpression()) #5, !dbg !403
  %113 = icmp ugt i64 %99, 1538, !dbg !404
  call void @llvm.dbg.value(metadata i64 undef, metadata !348, metadata !DIExpression()) #5, !dbg !337
  %114 = mul nuw nsw i64 %97, 1000000000, !dbg !405
  %115 = select i1 %113, i64 %114, i64 1538000000000, !dbg !405
  %116 = udiv i64 %115, %93, !dbg !406
  call void @llvm.dbg.value(metadata i64 %116, metadata !347, metadata !DIExpression()) #5, !dbg !337
  %117 = add i64 %116, %106, !dbg !407
  call void @llvm.dbg.value(metadata i64 %117, metadata !354, metadata !DIExpression()) #5, !dbg !403
  call void @llvm.dbg.value(metadata i64 %117, metadata !358, metadata !DIExpression()) #5, !dbg !408
  store volatile i64 %117, i64* %108, align 8, !dbg !409, !tbaa !390
  call void asm sideeffect "", "~{memory}"() #5, !dbg !410, !srcloc !399
  store i64 %117, i64* %103, align 8, !dbg !412, !tbaa !385
  %118 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 2, !dbg !413
  store i32 1, i32* %118, align 8, !dbg !414, !tbaa !415
  br label %259

119:                                              ; preds = %89
  %120 = sub i64 %110, %102, !dbg !416
  call void @llvm.dbg.value(metadata i64 %120, metadata !346, metadata !DIExpression()) #5, !dbg !337
  %121 = icmp ugt i64 %120, 39999999, !dbg !417
  br i1 %121, label %259, label %122, !dbg !419

122:                                              ; preds = %119
  %123 = getelementptr inbounds i8, i8* %87, i64 32, !dbg !420
  call void @llvm.dbg.value(metadata i8* %123, metadata !422, metadata !DIExpression()) #5, !dbg !437
  call void @llvm.dbg.value(metadata i64 %120, metadata !429, metadata !DIExpression()) #5, !dbg !437
  call void @llvm.dbg.value(metadata i64 %110, metadata !430, metadata !DIExpression()) #5, !dbg !437
  call void @llvm.dbg.value(metadata i64 100000000, metadata !431, metadata !DIExpression()) #5, !dbg !437
  call void @llvm.dbg.value(metadata i8* %123, metadata !439, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i64 %120, metadata !442, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i64 %110, metadata !443, metadata !DIExpression()) #5, !dbg !445
  call void @llvm.dbg.value(metadata i64 100000000, metadata !444, metadata !DIExpression()) #5, !dbg !445
  %124 = icmp ult i64 %120, 5000000, !dbg !447
  %125 = bitcast i8* %123 to i64*, !dbg !445
  br i1 %124, label %126, label %127, !dbg !449

126:                                              ; preds = %122
  store i64 0, i64* %125, align 8, !dbg !450, !tbaa !452
  br label %134, !dbg !453

127:                                              ; preds = %122
  %128 = load i64, i64* %125, align 8, !dbg !454, !tbaa !452
  %129 = icmp eq i64 %128, 0, !dbg !456
  br i1 %129, label %130, label %132, !dbg !457

130:                                              ; preds = %127
  %131 = add i64 %110, 100000000, !dbg !458
  store i64 %131, i64* %125, align 8, !dbg !460, !tbaa !452
  br label %134, !dbg !461

132:                                              ; preds = %127
  %133 = icmp ule i64 %128, %110, !dbg !462
  br label %134, !dbg !445

134:                                              ; preds = %132, %130, %126
  %135 = phi i64 [ 0, %126 ], [ %131, %130 ], [ %128, %132 ]
  %136 = phi i1 [ false, %126 ], [ false, %130 ], [ %133, %132 ], !dbg !445
  call void @llvm.dbg.value(metadata i1 %136, metadata !432, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !437
  %137 = getelementptr inbounds i8, i8* %87, i64 52, !dbg !464
  %138 = bitcast i8* %137 to i32*, !dbg !464
  %139 = load i32, i32* %138, align 4, !dbg !464, !tbaa !465
  %140 = icmp eq i32 %139, 0, !dbg !466
  br i1 %140, label %193, label %141, !dbg !467

141:                                              ; preds = %134
  br i1 %136, label %143, label %142, !dbg !468

142:                                              ; preds = %141
  store i32 0, i32* %138, align 4, !dbg !470, !tbaa !465
  br label %253, !dbg !473

143:                                              ; preds = %141
  %144 = getelementptr inbounds i8, i8* %87, i64 40, !dbg !474
  %145 = bitcast i8* %144 to i64*, !dbg !474
  %146 = load i64, i64* %145, align 8, !dbg !474, !tbaa !476
  %147 = icmp ugt i64 %146, %110, !dbg !477
  br i1 %147, label %253, label %148, !dbg !478

148:                                              ; preds = %143
  %149 = getelementptr inbounds i8, i8* %87, i64 48, !dbg !479
  %150 = bitcast i8* %149 to i32*, !dbg !479
  %151 = load i32, i32* %150, align 8, !dbg !481, !tbaa !482
  %152 = add i32 %151, 1, !dbg !481
  store i32 %152, i32* %150, align 8, !dbg !481, !tbaa !482
  call void @llvm.dbg.value(metadata i64 %146, metadata !483, metadata !DIExpression()) #5, !dbg !489
  call void @llvm.dbg.value(metadata i32 %152, metadata !488, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !489
  call void @llvm.dbg.value(metadata i32 %152, metadata !491, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !497
  call void @llvm.dbg.value(metadata i32 %152, metadata !499, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !504
  switch i32 %151, label %188 [
    i32 0, label %189
    i32 1, label %153
    i32 2, label %154
    i32 3, label %155
    i32 4, label %156
    i32 5, label %157
    i32 6, label %158
    i32 7, label %159
    i32 8, label %160
    i32 9, label %161
    i32 10, label %162
    i32 11, label %163
    i32 12, label %164
    i32 13, label %165
    i32 14, label %166
    i32 15, label %167
    i32 16, label %168
    i32 17, label %169
    i32 18, label %170
    i32 19, label %171
    i32 20, label %172
    i32 21, label %173
    i32 22, label %174
    i32 23, label %175
    i32 24, label %176
    i32 25, label %177
    i32 26, label %178
    i32 27, label %179
    i32 28, label %180
    i32 29, label %181
    i32 30, label %182
    i32 31, label %183
    i32 32, label %184
    i32 33, label %185
    i32 34, label %186
    i32 35, label %187
  ], !dbg !506

153:                                              ; preds = %148
  br label %189, !dbg !507

154:                                              ; preds = %148
  br label %189, !dbg !509

155:                                              ; preds = %148
  br label %189, !dbg !510

156:                                              ; preds = %148
  br label %189, !dbg !511

157:                                              ; preds = %148
  br label %189, !dbg !512

158:                                              ; preds = %148
  br label %189, !dbg !513

159:                                              ; preds = %148
  br label %189, !dbg !514

160:                                              ; preds = %148
  br label %189, !dbg !515

161:                                              ; preds = %148
  br label %189, !dbg !516

162:                                              ; preds = %148
  br label %189, !dbg !517

163:                                              ; preds = %148
  br label %189, !dbg !518

164:                                              ; preds = %148
  br label %189, !dbg !519

165:                                              ; preds = %148
  br label %189, !dbg !520

166:                                              ; preds = %148
  br label %189, !dbg !521

167:                                              ; preds = %148
  br label %189, !dbg !522

168:                                              ; preds = %148
  br label %189, !dbg !523

169:                                              ; preds = %148
  br label %189, !dbg !524

170:                                              ; preds = %148
  br label %189, !dbg !525

171:                                              ; preds = %148
  br label %189, !dbg !526

172:                                              ; preds = %148
  br label %189, !dbg !527

173:                                              ; preds = %148
  br label %189, !dbg !528

174:                                              ; preds = %148
  br label %189, !dbg !529

175:                                              ; preds = %148
  br label %189, !dbg !530

176:                                              ; preds = %148
  br label %189, !dbg !531

177:                                              ; preds = %148
  br label %189, !dbg !532

178:                                              ; preds = %148
  br label %189, !dbg !533

179:                                              ; preds = %148
  br label %189, !dbg !534

180:                                              ; preds = %148
  br label %189, !dbg !535

181:                                              ; preds = %148
  br label %189, !dbg !536

182:                                              ; preds = %148
  br label %189, !dbg !537

183:                                              ; preds = %148
  br label %189, !dbg !538

184:                                              ; preds = %148
  br label %189, !dbg !539

185:                                              ; preds = %148
  br label %189, !dbg !540

186:                                              ; preds = %148
  br label %189, !dbg !541

187:                                              ; preds = %148
  br label %189, !dbg !542

188:                                              ; preds = %148
  br label %189, !dbg !543

189:                                              ; preds = %188, %187, %186, %185, %184, %183, %182, %181, %180, %179, %178, %177, %176, %175, %174, %173, %172, %171, %170, %169, %168, %167, %166, %165, %164, %163, %162, %161, %160, %159, %158, %157, %156, %155, %154, %153, %148
  %190 = phi i64 [ 463410, %188 ], [ 393216, %187 ], [ 387716, %186 ], [ 382137, %185 ], [ 376476, %184 ], [ 370728, %183 ], [ 364889, %182 ], [ 358955, %181 ], [ 352922, %180 ], [ 346784, %179 ], [ 340535, %178 ], [ 334169, %177 ], [ 327680, %176 ], [ 321060, %175 ], [ 314300, %174 ], [ 307391, %173 ], [ 300324, %172 ], [ 293086, %171 ], [ 285664, %170 ], [ 278046, %169 ], [ 270212, %168 ], [ 262144, %167 ], [ 253820, %166 ], [ 245213, %165 ], [ 236293, %164 ], [ 227023, %163 ], [ 217358, %162 ], [ 207243, %161 ], [ 196608, %160 ], [ 185364, %159 ], [ 173392, %158 ], [ 160530, %157 ], [ 146543, %156 ], [ 131072, %155 ], [ 113512, %154 ], [ 92682, %153 ], [ 65536, %148 ]
  %191 = udiv i64 6553600000000, %190, !dbg !544
  call void @llvm.dbg.value(metadata i64 %191, metadata !496, metadata !DIExpression()) #5, !dbg !497
  %192 = add i64 %191, %146, !dbg !545
  store i64 %192, i64* %145, align 8, !dbg !546, !tbaa !476
  br label %259, !dbg !547

193:                                              ; preds = %134
  br i1 %136, label %194, label %253, !dbg !548

194:                                              ; preds = %193
  %195 = getelementptr inbounds i8, i8* %87, i64 40, !dbg !549
  %196 = bitcast i8* %195 to i64*, !dbg !549
  %197 = load i64, i64* %196, align 8, !dbg !549, !tbaa !476
  %198 = sub i64 %110, %197, !dbg !550
  %199 = icmp ult i64 %198, 100000000, !dbg !551
  br i1 %199, label %206, label %200, !dbg !552

200:                                              ; preds = %194
  %201 = sub i64 %110, %135, !dbg !553
  %202 = icmp ugt i64 %201, 99999999, !dbg !554
  br i1 %202, label %203, label %253, !dbg !555

203:                                              ; preds = %200
  %204 = getelementptr inbounds i8, i8* %87, i64 48, !dbg !556
  %205 = bitcast i8* %204 to i32*, !dbg !556
  call void @llvm.dbg.value(metadata i32 undef, metadata !433, metadata !DIExpression()) #5, !dbg !557
  store i32 1, i32* %138, align 4, !dbg !558, !tbaa !465
  store i32 1, i32* %205, align 8, !dbg !559, !tbaa !482
  call void @llvm.dbg.value(metadata i64 %110, metadata !483, metadata !DIExpression()) #5, !dbg !560
  br label %249, !dbg !562

206:                                              ; preds = %194
  %207 = getelementptr inbounds i8, i8* %87, i64 48, !dbg !556
  %208 = bitcast i8* %207 to i32*, !dbg !556
  %209 = load i32, i32* %208, align 8, !dbg !556, !tbaa !482
  call void @llvm.dbg.value(metadata i32 undef, metadata !433, metadata !DIExpression()) #5, !dbg !557
  store i32 1, i32* %138, align 4, !dbg !558, !tbaa !465
  %210 = icmp ugt i32 %209, 2, !dbg !565
  %211 = add i32 %209, -2, !dbg !567
  %212 = select i1 %210, i32 %211, i32 1, !dbg !567
  call void @llvm.dbg.value(metadata i32 %212, metadata !433, metadata !DIExpression()) #5, !dbg !557
  store i32 %212, i32* %208, align 8, !dbg !559, !tbaa !482
  call void @llvm.dbg.value(metadata i64 %110, metadata !483, metadata !DIExpression()) #5, !dbg !560
  call void @llvm.dbg.value(metadata i32 %212, metadata !488, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !560
  call void @llvm.dbg.value(metadata i32 %212, metadata !491, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !568
  call void @llvm.dbg.value(metadata i32 %212, metadata !499, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #5, !dbg !569
  switch i32 %212, label %248 [
    i32 1, label %249
    i32 2, label %213
    i32 3, label %214
    i32 4, label %215
    i32 5, label %216
    i32 6, label %217
    i32 7, label %218
    i32 8, label %219
    i32 9, label %220
    i32 10, label %221
    i32 11, label %222
    i32 12, label %223
    i32 13, label %224
    i32 14, label %225
    i32 15, label %226
    i32 16, label %227
    i32 17, label %228
    i32 18, label %229
    i32 19, label %230
    i32 20, label %231
    i32 21, label %232
    i32 22, label %233
    i32 23, label %234
    i32 24, label %235
    i32 25, label %236
    i32 26, label %237
    i32 27, label %238
    i32 28, label %239
    i32 29, label %240
    i32 30, label %241
    i32 31, label %242
    i32 32, label %243
    i32 33, label %244
    i32 34, label %245
    i32 35, label %246
    i32 36, label %247
  ], !dbg !562

213:                                              ; preds = %206
  br label %249, !dbg !570

214:                                              ; preds = %206
  br label %249, !dbg !571

215:                                              ; preds = %206
  br label %249, !dbg !572

216:                                              ; preds = %206
  br label %249, !dbg !573

217:                                              ; preds = %206
  br label %249, !dbg !574

218:                                              ; preds = %206
  br label %249, !dbg !575

219:                                              ; preds = %206
  br label %249, !dbg !576

220:                                              ; preds = %206
  br label %249, !dbg !577

221:                                              ; preds = %206
  br label %249, !dbg !578

222:                                              ; preds = %206
  br label %249, !dbg !579

223:                                              ; preds = %206
  br label %249, !dbg !580

224:                                              ; preds = %206
  br label %249, !dbg !581

225:                                              ; preds = %206
  br label %249, !dbg !582

226:                                              ; preds = %206
  br label %249, !dbg !583

227:                                              ; preds = %206
  br label %249, !dbg !584

228:                                              ; preds = %206
  br label %249, !dbg !585

229:                                              ; preds = %206
  br label %249, !dbg !586

230:                                              ; preds = %206
  br label %249, !dbg !587

231:                                              ; preds = %206
  br label %249, !dbg !588

232:                                              ; preds = %206
  br label %249, !dbg !589

233:                                              ; preds = %206
  br label %249, !dbg !590

234:                                              ; preds = %206
  br label %249, !dbg !591

235:                                              ; preds = %206
  br label %249, !dbg !592

236:                                              ; preds = %206
  br label %249, !dbg !593

237:                                              ; preds = %206
  br label %249, !dbg !594

238:                                              ; preds = %206
  br label %249, !dbg !595

239:                                              ; preds = %206
  br label %249, !dbg !596

240:                                              ; preds = %206
  br label %249, !dbg !597

241:                                              ; preds = %206
  br label %249, !dbg !598

242:                                              ; preds = %206
  br label %249, !dbg !599

243:                                              ; preds = %206
  br label %249, !dbg !600

244:                                              ; preds = %206
  br label %249, !dbg !601

245:                                              ; preds = %206
  br label %249, !dbg !602

246:                                              ; preds = %206
  br label %249, !dbg !603

247:                                              ; preds = %206
  br label %249, !dbg !604

248:                                              ; preds = %206
  br label %249, !dbg !605

249:                                              ; preds = %248, %247, %246, %245, %244, %243, %242, %241, %240, %239, %238, %237, %236, %235, %234, %233, %232, %231, %230, %229, %228, %227, %226, %225, %224, %223, %222, %221, %220, %219, %218, %217, %216, %215, %214, %213, %206, %203
  %250 = phi i64 [ 463410, %248 ], [ 393216, %247 ], [ 387716, %246 ], [ 382137, %245 ], [ 376476, %244 ], [ 370728, %243 ], [ 364889, %242 ], [ 358955, %241 ], [ 352922, %240 ], [ 346784, %239 ], [ 340535, %238 ], [ 334169, %237 ], [ 327680, %236 ], [ 321060, %235 ], [ 314300, %234 ], [ 307391, %233 ], [ 300324, %232 ], [ 293086, %231 ], [ 285664, %230 ], [ 278046, %229 ], [ 270212, %228 ], [ 262144, %227 ], [ 253820, %226 ], [ 245213, %225 ], [ 236293, %224 ], [ 227023, %223 ], [ 217358, %222 ], [ 207243, %221 ], [ 196608, %220 ], [ 185364, %219 ], [ 173392, %218 ], [ 160530, %217 ], [ 146543, %216 ], [ 131072, %215 ], [ 113512, %214 ], [ 92682, %213 ], [ 65536, %206 ], [ 65536, %203 ]
  %251 = udiv i64 6553600000000, %250, !dbg !606
  call void @llvm.dbg.value(metadata i64 %251, metadata !496, metadata !DIExpression()) #5, !dbg !568
  %252 = add i64 %251, %110, !dbg !607
  store i64 %252, i64* %196, align 8, !dbg !608, !tbaa !476
  br label %259

253:                                              ; preds = %200, %193, %143, %142
  %254 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 2, !dbg !609
  store i32 2, i32* %254, align 8, !dbg !610, !tbaa !415
  %255 = icmp ugt i64 %120, 999999, !dbg !611
  br i1 %255, label %256, label %258, !dbg !613

256:                                              ; preds = %253
  store i32 3, i32* %254, align 8, !dbg !614, !tbaa !415
  %257 = call i64 inttoptr (i64 97 to i64 (%struct.__sk_buff*)*)(%struct.__sk_buff* noundef nonnull %0) #5, !dbg !616
  br label %258, !dbg !617

258:                                              ; preds = %256, %253
  call void @llvm.dbg.value(metadata i64 %110, metadata !360, metadata !DIExpression()) #5, !dbg !618
  store volatile i64 %110, i64* %108, align 8, !dbg !619, !tbaa !390
  call void asm sideeffect "", "~{memory}"() #5, !dbg !620, !srcloc !399
  store i64 %110, i64* %103, align 8, !dbg !622, !tbaa !385
  br label %259, !dbg !623

259:                                              ; preds = %83, %112, %119, %189, %249, %258
  %260 = phi i32 [ 0, %112 ], [ 0, %258 ], [ 2, %83 ], [ 2, %119 ], [ 2, %189 ], [ 2, %249 ], !dbg !337
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %86), !dbg !624
  br label %261, !dbg !625

261:                                              ; preds = %58, %1, %53, %259
  %262 = phi i32 [ %260, %259 ], [ 0, %53 ], [ 2, %1 ], [ 0, %58 ], !dbg !213
  ret i32 %262, !dbg !626
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!176, !177, !178, !179}
!llvm.ident = !{!180}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 11, type: !174, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "edt_pacer_vlan.c", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "7173192a7898e6f990c953e6d4ba5c8f")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_ret_code", file: !6, line: 4255, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_OK", value: 0)
!10 = !DIEnumerator(name: "BPF_DROP", value: 2)
!11 = !DIEnumerator(name: "BPF_REDIRECT", value: 7)
!12 = !DIEnumerator(name: "BPF_LWT_REROUTE", value: 128)
!13 = !{!14, !15, !16, !19, !21}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !17, line: 24, baseType: !18)
!17 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!18 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !17, line: 31, baseType: !22)
!22 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!23 = !{!0, !24, !58, !66, !71}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "time_delay_map", scope: !2, file: !3, line: 69, type: !26, isLocal: false, isDefinition: true)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 63, size: 256, elements: !27)
!27 = !{!28, !34, !39, !42}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !26, file: !3, line: 64, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 64, elements: !32)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !{!33}
!33 = !DISubrange(count: 2)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !26, file: !3, line: 65, baseType: !35, size: 64, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 131072, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 4096)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !26, file: !3, line: 66, baseType: !40, size: 64, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !17, line: 27, baseType: !7)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !26, file: !3, line: 67, baseType: !43, size: 64, offset: 192)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "edt_val", file: !3, line: 53, size: 512, align: 512, elements: !45)
!45 = !{!46, !47, !48, !49, !50}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "rate", scope: !44, file: !3, line: 54, baseType: !21, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "t_last", scope: !44, file: !3, line: 55, baseType: !21, size: 64, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "t_horizon_drop", scope: !44, file: !3, line: 56, baseType: !21, size: 64, offset: 128)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "t_horizon_ecn", scope: !44, file: !3, line: 57, baseType: !21, size: 64, offset: 192)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "codel", scope: !44, file: !3, line: 58, baseType: !51, size: 192, offset: 256)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "codel_state", file: !52, line: 17, size: 192, elements: !53)
!52 = !DIFile(filename: "./codel_impl.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "8586c19d570218be89ad8dfbe04da526")
!53 = !{!54, !55, !56, !57}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "first_above_time", scope: !51, file: !52, line: 19, baseType: !21, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "drop_next", scope: !51, file: !52, line: 20, baseType: !21, size: 64, offset: 64)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !51, file: !52, line: 21, baseType: !41, size: 32, offset: 128)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "dropping", scope: !51, file: !52, line: 22, baseType: !41, size: 32, offset: 160)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !60, line: 55, type: !61, isLocal: true, isDefinition: true)
!60 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DISubroutineType(types: !63)
!63 = !{!14, !14, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "bpf_ktime_get_boot_ns", scope: !2, file: !60, line: 3031, type: !68, isLocal: true, isDefinition: true)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DISubroutineType(types: !70)
!70 = !{!21}
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "bpf_skb_ecn_set_ce", scope: !2, file: !60, line: 2436, type: !73, isLocal: true, isDefinition: true)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DISubroutineType(types: !75)
!75 = !{!15, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !78)
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !95, !96, !97, !98, !99, !100, !101, !102, !103, !107, !108, !109, !110, !111, !148, !149, !150, !151, !173}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !77, file: !6, line: 4184, baseType: !41, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !77, file: !6, line: 4185, baseType: !41, size: 32, offset: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !77, file: !6, line: 4186, baseType: !41, size: 32, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !77, file: !6, line: 4187, baseType: !41, size: 32, offset: 96)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !77, file: !6, line: 4188, baseType: !41, size: 32, offset: 128)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !77, file: !6, line: 4189, baseType: !41, size: 32, offset: 160)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !77, file: !6, line: 4190, baseType: !41, size: 32, offset: 192)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !77, file: !6, line: 4191, baseType: !41, size: 32, offset: 224)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !77, file: !6, line: 4192, baseType: !41, size: 32, offset: 256)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !77, file: !6, line: 4193, baseType: !41, size: 32, offset: 288)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !77, file: !6, line: 4194, baseType: !41, size: 32, offset: 320)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !77, file: !6, line: 4195, baseType: !41, size: 32, offset: 352)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !77, file: !6, line: 4196, baseType: !92, size: 160, offset: 384)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 160, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 5)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !77, file: !6, line: 4197, baseType: !41, size: 32, offset: 544)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !77, file: !6, line: 4198, baseType: !41, size: 32, offset: 576)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !77, file: !6, line: 4199, baseType: !41, size: 32, offset: 608)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !77, file: !6, line: 4200, baseType: !41, size: 32, offset: 640)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !77, file: !6, line: 4201, baseType: !41, size: 32, offset: 672)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !77, file: !6, line: 4204, baseType: !41, size: 32, offset: 704)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !77, file: !6, line: 4205, baseType: !41, size: 32, offset: 736)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !77, file: !6, line: 4206, baseType: !41, size: 32, offset: 768)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !77, file: !6, line: 4207, baseType: !104, size: 128, offset: 800)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 128, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 4)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !77, file: !6, line: 4208, baseType: !104, size: 128, offset: 928)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !77, file: !6, line: 4209, baseType: !41, size: 32, offset: 1056)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !77, file: !6, line: 4210, baseType: !41, size: 32, offset: 1088)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !77, file: !6, line: 4213, baseType: !41, size: 32, offset: 1120)
!111 = !DIDerivedType(tag: DW_TAG_member, scope: !77, file: !6, line: 4214, baseType: !112, size: 64, align: 64, offset: 1152)
!112 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !77, file: !6, line: 4214, size: 64, align: 64, elements: !113)
!113 = !{!114}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !112, file: !6, line: 4214, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !117)
!117 = !{!118, !119, !120, !121, !124, !125, !126, !127, !130, !131, !132, !146, !147}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !116, file: !6, line: 5042, baseType: !16, size: 16)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !116, file: !6, line: 5043, baseType: !16, size: 16, offset: 16)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !116, file: !6, line: 5044, baseType: !16, size: 16, offset: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !116, file: !6, line: 5045, baseType: !122, size: 8, offset: 48)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !17, line: 21, baseType: !123)
!123 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !116, file: !6, line: 5046, baseType: !122, size: 8, offset: 56)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !116, file: !6, line: 5047, baseType: !122, size: 8, offset: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !116, file: !6, line: 5048, baseType: !122, size: 8, offset: 72)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !116, file: !6, line: 5049, baseType: !128, size: 16, offset: 80)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !129, line: 25, baseType: !16)
!129 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!130 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !116, file: !6, line: 5050, baseType: !128, size: 16, offset: 96)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !116, file: !6, line: 5051, baseType: !128, size: 16, offset: 112)
!132 = !DIDerivedType(tag: DW_TAG_member, scope: !116, file: !6, line: 5052, baseType: !133, size: 256, offset: 128)
!133 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !116, file: !6, line: 5052, size: 256, elements: !134)
!134 = !{!135, !141}
!135 = !DIDerivedType(tag: DW_TAG_member, scope: !133, file: !6, line: 5053, baseType: !136, size: 64)
!136 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !133, file: !6, line: 5053, size: 64, elements: !137)
!137 = !{!138, !140}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !136, file: !6, line: 5054, baseType: !139, size: 32)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !129, line: 27, baseType: !41)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !136, file: !6, line: 5055, baseType: !139, size: 32, offset: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, scope: !133, file: !6, line: 5057, baseType: !142, size: 256)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !133, file: !6, line: 5057, size: 256, elements: !143)
!143 = !{!144, !145}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !142, file: !6, line: 5058, baseType: !104, size: 128)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !142, file: !6, line: 5059, baseType: !104, size: 128, offset: 128)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !116, file: !6, line: 5062, baseType: !41, size: 32, offset: 384)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !116, file: !6, line: 5063, baseType: !139, size: 32, offset: 416)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !77, file: !6, line: 4215, baseType: !21, size: 64, offset: 1216)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !77, file: !6, line: 4216, baseType: !41, size: 32, offset: 1280)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !77, file: !6, line: 4217, baseType: !41, size: 32, offset: 1312)
!151 = !DIDerivedType(tag: DW_TAG_member, scope: !77, file: !6, line: 4218, baseType: !152, size: 64, align: 64, offset: 1344)
!152 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !77, file: !6, line: 4218, size: 64, align: 64, elements: !153)
!153 = !{!154}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !152, file: !6, line: 4218, baseType: !155, size: 64)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !156, size: 64)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !157)
!157 = !{!158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !156, file: !6, line: 4273, baseType: !41, size: 32)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !156, file: !6, line: 4274, baseType: !41, size: 32, offset: 32)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !156, file: !6, line: 4275, baseType: !41, size: 32, offset: 64)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !156, file: !6, line: 4276, baseType: !41, size: 32, offset: 96)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !156, file: !6, line: 4277, baseType: !41, size: 32, offset: 128)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !156, file: !6, line: 4278, baseType: !41, size: 32, offset: 160)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !156, file: !6, line: 4280, baseType: !41, size: 32, offset: 192)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !156, file: !6, line: 4281, baseType: !104, size: 128, offset: 224)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !156, file: !6, line: 4282, baseType: !41, size: 32, offset: 352)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !156, file: !6, line: 4283, baseType: !41, size: 32, offset: 384)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !156, file: !6, line: 4284, baseType: !41, size: 32, offset: 416)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !156, file: !6, line: 4285, baseType: !104, size: 128, offset: 448)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !156, file: !6, line: 4286, baseType: !41, size: 32, offset: 576)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !156, file: !6, line: 4287, baseType: !172, size: 32, offset: 608)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !17, line: 26, baseType: !31)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !77, file: !6, line: 4219, baseType: !41, size: 32, offset: 1408)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 32, elements: !105)
!175 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!176 = !{i32 7, !"Dwarf Version", i32 5}
!177 = !{i32 2, !"Debug Info Version", i32 3}
!178 = !{i32 1, !"wchar_size", i32 4}
!179 = !{i32 7, !"frame-pointer", i32 2}
!180 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!181 = distinct !DISubprogram(name: "tc_edt_vlan", scope: !3, file: !3, line: 246, type: !182, scopeLine: 247, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !184)
!182 = !DISubroutineType(types: !183)
!183 = !{!31, !76}
!184 = !{!185, !186, !187, !188, !194, !205, !206, !207, !211, !212}
!185 = !DILocalVariable(name: "skb", arg: 1, scope: !181, file: !3, line: 246, type: !76)
!186 = !DILocalVariable(name: "data", scope: !181, file: !3, line: 248, type: !14)
!187 = !DILocalVariable(name: "data_end", scope: !181, file: !3, line: 249, type: !14)
!188 = !DILocalVariable(name: "vlans", scope: !181, file: !3, line: 250, type: !189)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !190, line: 71, size: 32, elements: !191)
!190 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!191 = !{!192}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !189, file: !190, line: 72, baseType: !193, size: 32)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !32)
!194 = !DILocalVariable(name: "eth", scope: !181, file: !3, line: 251, type: !195)
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !197, line: 168, size: 112, elements: !198)
!197 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!198 = !{!199, !203, !204}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !196, file: !197, line: 169, baseType: !200, size: 48)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 48, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 6)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !196, file: !197, line: 170, baseType: !200, size: 48, offset: 48)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !196, file: !197, line: 171, baseType: !128, size: 16, offset: 96)
!205 = !DILocalVariable(name: "ret", scope: !181, file: !3, line: 252, type: !31)
!206 = !DILocalVariable(name: "vlan_key", scope: !181, file: !3, line: 253, type: !16)
!207 = !DILocalVariable(name: "nh", scope: !181, file: !3, line: 256, type: !208)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !190, line: 35, size: 64, elements: !209)
!209 = !{!210}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !208, file: !190, line: 36, baseType: !14, size: 64)
!211 = !DILocalVariable(name: "eth_type", scope: !181, file: !3, line: 257, type: !31)
!212 = !DILabel(scope: !181, name: "out", file: !3, line: 280)
!213 = !DILocation(line: 0, scope: !181)
!214 = !DILocation(line: 248, column: 38, scope: !181)
!215 = !{!216, !217, i64 76}
!216 = !{!"__sk_buff", !217, i64 0, !217, i64 4, !217, i64 8, !217, i64 12, !217, i64 16, !217, i64 20, !217, i64 24, !217, i64 28, !217, i64 32, !217, i64 36, !217, i64 40, !217, i64 44, !218, i64 48, !217, i64 68, !217, i64 72, !217, i64 76, !217, i64 80, !217, i64 84, !217, i64 88, !217, i64 92, !217, i64 96, !218, i64 100, !218, i64 116, !217, i64 132, !217, i64 136, !217, i64 140, !218, i64 144, !220, i64 152, !217, i64 160, !217, i64 164, !218, i64 168, !217, i64 176}
!217 = !{!"int", !218, i64 0}
!218 = !{!"omnipotent char", !219, i64 0}
!219 = !{!"Simple C/C++ TBAA"}
!220 = !{!"long long", !218, i64 0}
!221 = !DILocation(line: 248, column: 27, scope: !181)
!222 = !DILocation(line: 248, column: 19, scope: !181)
!223 = !DILocation(line: 249, column: 38, scope: !181)
!224 = !{!216, !217, i64 80}
!225 = !DILocation(line: 249, column: 27, scope: !181)
!226 = !DILocation(line: 249, column: 19, scope: !181)
!227 = !DILocation(line: 250, column: 23, scope: !181)
!228 = !DILocalVariable(name: "nh", arg: 1, scope: !229, file: !190, line: 86, type: !232)
!229 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !190, file: !190, line: 86, type: !230, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !235)
!230 = !DISubroutineType(types: !231)
!231 = !{!31, !232, !14, !233, !234}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!235 = !{!228, !236, !237, !238, !239, !240, !241, !247, !248}
!236 = !DILocalVariable(name: "data_end", arg: 2, scope: !229, file: !190, line: 87, type: !14)
!237 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !229, file: !190, line: 88, type: !233)
!238 = !DILocalVariable(name: "vlans", arg: 4, scope: !229, file: !190, line: 89, type: !234)
!239 = !DILocalVariable(name: "eth", scope: !229, file: !190, line: 91, type: !195)
!240 = !DILocalVariable(name: "hdrsize", scope: !229, file: !190, line: 92, type: !31)
!241 = !DILocalVariable(name: "vlh", scope: !229, file: !190, line: 93, type: !242)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64)
!243 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !190, line: 44, size: 32, elements: !244)
!244 = !{!245, !246}
!245 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !243, file: !190, line: 45, baseType: !128, size: 16)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !243, file: !190, line: 46, baseType: !128, size: 16, offset: 16)
!247 = !DILocalVariable(name: "h_proto", scope: !229, file: !190, line: 94, type: !16)
!248 = !DILocalVariable(name: "i", scope: !229, file: !190, line: 95, type: !31)
!249 = !DILocation(line: 0, scope: !229, inlinedAt: !250)
!250 = distinct !DILocation(line: 260, column: 13, scope: !181)
!251 = !DILocation(line: 100, column: 14, scope: !252, inlinedAt: !250)
!252 = distinct !DILexicalBlock(scope: !229, file: !190, line: 100, column: 6)
!253 = !DILocation(line: 100, column: 24, scope: !252, inlinedAt: !250)
!254 = !DILocation(line: 100, column: 6, scope: !229, inlinedAt: !250)
!255 = !DILocation(line: 104, column: 10, scope: !229, inlinedAt: !250)
!256 = !DILocation(line: 106, column: 17, scope: !229, inlinedAt: !250)
!257 = !{!258, !259, i64 12}
!258 = !{!"ethhdr", !218, i64 0, !218, i64 6, !259, i64 12}
!259 = !{!"short", !218, i64 0}
!260 = !DILocalVariable(name: "h_proto", arg: 1, scope: !261, file: !190, line: 75, type: !16)
!261 = distinct !DISubprogram(name: "proto_is_vlan", scope: !190, file: !190, line: 75, type: !262, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !264)
!262 = !DISubroutineType(types: !263)
!263 = !{!31, !16}
!264 = !{!260}
!265 = !DILocation(line: 0, scope: !261, inlinedAt: !266)
!266 = distinct !DILocation(line: 113, column: 8, scope: !267, inlinedAt: !250)
!267 = distinct !DILexicalBlock(scope: !268, file: !190, line: 113, column: 7)
!268 = distinct !DILexicalBlock(scope: !269, file: !190, line: 112, column: 39)
!269 = distinct !DILexicalBlock(scope: !270, file: !190, line: 112, column: 2)
!270 = distinct !DILexicalBlock(scope: !229, file: !190, line: 112, column: 2)
!271 = !DILocation(line: 77, column: 20, scope: !261, inlinedAt: !266)
!272 = !DILocation(line: 77, column: 46, scope: !261, inlinedAt: !266)
!273 = !DILocation(line: 113, column: 8, scope: !267, inlinedAt: !250)
!274 = !DILocation(line: 113, column: 7, scope: !268, inlinedAt: !250)
!275 = !DILocation(line: 119, column: 18, scope: !268, inlinedAt: !250)
!276 = !{!277, !259, i64 2}
!277 = !{!"vlan_hdr", !259, i64 0, !259, i64 2}
!278 = !DILocation(line: 122, column: 6, scope: !279, inlinedAt: !250)
!279 = distinct !DILexicalBlock(scope: !268, file: !190, line: 120, column: 7)
!280 = !{!277, !259, i64 0}
!281 = !DILocation(line: 122, column: 33, scope: !279, inlinedAt: !250)
!282 = !DILocation(line: 121, column: 4, scope: !279, inlinedAt: !250)
!283 = !DILocation(line: 265, column: 15, scope: !284)
!284 = distinct !DILexicalBlock(scope: !181, file: !3, line: 265, column: 6)
!285 = !DILocation(line: 265, column: 6, scope: !181)
!286 = !DILocation(line: 270, column: 26, scope: !287)
!287 = distinct !DILexicalBlock(scope: !181, file: !3, line: 270, column: 6)
!288 = !DILocation(line: 0, scope: !261, inlinedAt: !289)
!289 = distinct !DILocation(line: 270, column: 7, scope: !287)
!290 = !DILocation(line: 77, column: 20, scope: !261, inlinedAt: !289)
!291 = !DILocation(line: 77, column: 46, scope: !261, inlinedAt: !289)
!292 = !{!216, !217, i64 20}
!293 = !DILocation(line: 270, column: 35, scope: !287)
!294 = !DILocalVariable(name: "skb", arg: 1, scope: !295, file: !3, line: 223, type: !76)
!295 = distinct !DISubprogram(name: "extract_vlan_key", scope: !3, file: !3, line: 223, type: !296, scopeLine: 224, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !298)
!296 = !DISubroutineType(types: !297)
!297 = !{!16, !76, !234}
!298 = !{!294, !299, !300}
!299 = !DILocalVariable(name: "vlans", arg: 2, scope: !295, file: !3, line: 223, type: !234)
!300 = !DILocalVariable(name: "QinQ", scope: !295, file: !3, line: 225, type: !31)
!301 = !DILocation(line: 0, scope: !295, inlinedAt: !302)
!302 = distinct !DILocation(line: 275, column: 13, scope: !181)
!303 = !DILocation(line: 232, column: 6, scope: !304, inlinedAt: !302)
!304 = distinct !DILexicalBlock(scope: !295, file: !3, line: 232, column: 6)
!305 = !DILocation(line: 232, column: 6, scope: !295, inlinedAt: !302)
!306 = !DILocation(line: 233, column: 7, scope: !307, inlinedAt: !302)
!307 = distinct !DILexicalBlock(scope: !308, file: !3, line: 233, column: 7)
!308 = distinct !DILexicalBlock(scope: !304, file: !3, line: 232, column: 25)
!309 = !DILocation(line: 233, column: 7, scope: !308, inlinedAt: !302)
!310 = !DILocation(line: 236, column: 7, scope: !311, inlinedAt: !302)
!311 = distinct !DILexicalBlock(scope: !312, file: !3, line: 236, column: 7)
!312 = distinct !DILexicalBlock(scope: !304, file: !3, line: 235, column: 9)
!313 = !DILocation(line: 236, column: 7, scope: !312, inlinedAt: !302)
!314 = !DILocation(line: 0, scope: !315, inlinedAt: !320)
!315 = distinct !DISubprogram(name: "get_inner_qinq_vlan", scope: !3, file: !3, line: 195, type: !296, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !316)
!316 = !{!317, !318, !319}
!317 = !DILocalVariable(name: "skb", arg: 1, scope: !315, file: !3, line: 195, type: !76)
!318 = !DILocalVariable(name: "vlans", arg: 2, scope: !315, file: !3, line: 195, type: !234)
!319 = !DILocalVariable(name: "vlan_key", scope: !315, file: !3, line: 197, type: !16)
!320 = distinct !DILocation(line: 241, column: 10, scope: !321, inlinedAt: !302)
!321 = distinct !DILexicalBlock(scope: !295, file: !3, line: 240, column: 6)
!322 = !DILocation(line: 241, column: 3, scope: !321, inlinedAt: !302)
!323 = !DILocalVariable(name: "skb", arg: 1, scope: !324, file: !3, line: 209, type: !76)
!324 = distinct !DISubprogram(name: "get_vlan", scope: !3, file: !3, line: 209, type: !296, scopeLine: 210, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !325)
!325 = !{!323, !326, !327}
!326 = !DILocalVariable(name: "vlans", arg: 2, scope: !324, file: !3, line: 209, type: !234)
!327 = !DILocalVariable(name: "vlan_key", scope: !324, file: !3, line: 211, type: !16)
!328 = !DILocation(line: 0, scope: !324, inlinedAt: !329)
!329 = distinct !DILocation(line: 243, column: 10, scope: !321, inlinedAt: !302)
!330 = !DILocation(line: 215, column: 19, scope: !331, inlinedAt: !329)
!331 = distinct !DILexicalBlock(scope: !324, file: !3, line: 214, column: 6)
!332 = !{!216, !217, i64 24}
!333 = !DILocation(line: 215, column: 14, scope: !331, inlinedAt: !329)
!334 = !DILocation(line: 215, column: 3, scope: !331, inlinedAt: !329)
!335 = !DILocation(line: 0, scope: !321, inlinedAt: !302)
!336 = !DILocation(line: 278, column: 30, scope: !181)
!337 = !DILocation(line: 0, scope: !338, inlinedAt: !362)
!338 = distinct !DISubprogram(name: "sched_departure", scope: !3, file: !3, line: 90, type: !339, scopeLine: 91, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !341)
!339 = !DISubroutineType(types: !340)
!340 = !{!31, !76, !41}
!341 = !{!342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !354, !357, !358, !360}
!342 = !DILocalVariable(name: "skb", arg: 1, scope: !338, file: !3, line: 90, type: !76)
!343 = !DILocalVariable(name: "key", arg: 2, scope: !338, file: !3, line: 90, type: !41)
!344 = !DILocalVariable(name: "edt", scope: !338, file: !3, line: 92, type: !43)
!345 = !DILocalVariable(name: "rate_in_bytes", scope: !338, file: !3, line: 93, type: !21)
!346 = !DILocalVariable(name: "t_queue_sz", scope: !338, file: !3, line: 94, type: !21)
!347 = !DILocalVariable(name: "t_xmit_ns", scope: !338, file: !3, line: 95, type: !21)
!348 = !DILocalVariable(name: "wire_len", scope: !338, file: !3, line: 96, type: !21)
!349 = !DILocalVariable(name: "t_next", scope: !338, file: !3, line: 97, type: !21)
!350 = !DILocalVariable(name: "t_curr", scope: !338, file: !3, line: 98, type: !21)
!351 = !DILocalVariable(name: "now", scope: !338, file: !3, line: 99, type: !21)
!352 = !DILocalVariable(name: "__val", scope: !353, file: !3, line: 133, type: !21)
!353 = distinct !DILexicalBlock(scope: !338, file: !3, line: 133, column: 11)
!354 = !DILocalVariable(name: "t_curr_next", scope: !355, file: !3, line: 145, type: !21)
!355 = distinct !DILexicalBlock(scope: !356, file: !3, line: 143, column: 24)
!356 = distinct !DILexicalBlock(scope: !338, file: !3, line: 143, column: 6)
!357 = !DILocalVariable(name: "min_len", scope: !355, file: !3, line: 146, type: !41)
!358 = !DILocalVariable(name: "__val", scope: !359, file: !3, line: 153, type: !21)
!359 = distinct !DILexicalBlock(scope: !355, file: !3, line: 153, column: 3)
!360 = !DILocalVariable(name: "__val", scope: !361, file: !3, line: 187, type: !21)
!361 = distinct !DILexicalBlock(scope: !338, file: !3, line: 187, column: 2)
!362 = distinct !DILocation(line: 278, column: 9, scope: !181)
!363 = !{!217, !217, i64 0}
!364 = !DILocation(line: 101, column: 8, scope: !338, inlinedAt: !362)
!365 = !DILocation(line: 102, column: 7, scope: !366, inlinedAt: !362)
!366 = distinct !DILexicalBlock(scope: !338, file: !3, line: 102, column: 6)
!367 = !DILocation(line: 102, column: 6, scope: !338, inlinedAt: !362)
!368 = !DILocation(line: 106, column: 11, scope: !369, inlinedAt: !362)
!369 = distinct !DILexicalBlock(scope: !338, file: !3, line: 106, column: 6)
!370 = !{!371, !220, i64 0}
!371 = !{!"edt_val", !220, i64 0, !220, i64 8, !220, i64 16, !220, i64 24, !372, i64 32}
!372 = !{!"codel_state", !220, i64 0, !220, i64 8, !217, i64 16, !217, i64 20}
!373 = !DILocation(line: 106, column: 16, scope: !369, inlinedAt: !362)
!374 = !DILocation(line: 106, column: 6, scope: !338, inlinedAt: !362)
!375 = !DILocation(line: 116, column: 18, scope: !338, inlinedAt: !362)
!376 = !{!216, !217, i64 160}
!377 = !DILocation(line: 116, column: 27, scope: !338, inlinedAt: !362)
!378 = !DILocation(line: 116, column: 13, scope: !338, inlinedAt: !362)
!379 = !DILocation(line: 117, column: 22, scope: !338, inlinedAt: !362)
!380 = !DILocation(line: 117, column: 13, scope: !338, inlinedAt: !362)
!381 = !DILocation(line: 119, column: 25, scope: !338, inlinedAt: !362)
!382 = !DILocation(line: 119, column: 38, scope: !338, inlinedAt: !362)
!383 = !DILocation(line: 122, column: 8, scope: !338, inlinedAt: !362)
!384 = !DILocation(line: 125, column: 17, scope: !338, inlinedAt: !362)
!385 = !{!216, !220, i64 152}
!386 = !DILocation(line: 126, column: 13, scope: !387, inlinedAt: !362)
!387 = distinct !DILexicalBlock(scope: !338, file: !3, line: 126, column: 6)
!388 = !DILocation(line: 126, column: 6, scope: !338, inlinedAt: !362)
!389 = !DILocation(line: 133, column: 11, scope: !353, inlinedAt: !362)
!390 = !{!220, !220, i64 0}
!391 = !DILocation(line: 0, scope: !353, inlinedAt: !362)
!392 = !DILocation(line: 92, column: 2, scope: !393, inlinedAt: !398)
!393 = distinct !DISubprogram(name: "bpf_barrier", scope: !394, file: !394, line: 86, type: !395, scopeLine: 87, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !397)
!394 = !DIFile(filename: "../lib/../include/bpf/compiler.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "9b621a3db856867c0f1395c710b0963e")
!395 = !DISubroutineType(types: !396)
!396 = !{null}
!397 = !{}
!398 = distinct !DILocation(line: 133, column: 11, scope: !353, inlinedAt: !362)
!399 = !{i64 2147915756}
!400 = !DILocation(line: 133, column: 34, scope: !338, inlinedAt: !362)
!401 = !DILocation(line: 143, column: 13, scope: !356, inlinedAt: !362)
!402 = !DILocation(line: 143, column: 6, scope: !338, inlinedAt: !362)
!403 = !DILocation(line: 0, scope: !355, inlinedAt: !362)
!404 = !DILocation(line: 149, column: 24, scope: !355, inlinedAt: !362)
!405 = !DILocation(line: 150, column: 26, scope: !355, inlinedAt: !362)
!406 = !DILocation(line: 150, column: 39, scope: !355, inlinedAt: !362)
!407 = !DILocation(line: 151, column: 24, scope: !355, inlinedAt: !362)
!408 = !DILocation(line: 0, scope: !359, inlinedAt: !362)
!409 = !DILocation(line: 153, column: 3, scope: !359, inlinedAt: !362)
!410 = !DILocation(line: 92, column: 2, scope: !393, inlinedAt: !411)
!411 = distinct !DILocation(line: 153, column: 3, scope: !359, inlinedAt: !362)
!412 = !DILocation(line: 154, column: 15, scope: !355, inlinedAt: !362)
!413 = !DILocation(line: 155, column: 8, scope: !355, inlinedAt: !362)
!414 = !DILocation(line: 155, column: 13, scope: !355, inlinedAt: !362)
!415 = !{!216, !217, i64 8}
!416 = !DILocation(line: 164, column: 22, scope: !338, inlinedAt: !362)
!417 = !DILocation(line: 170, column: 17, scope: !418, inlinedAt: !362)
!418 = distinct !DILexicalBlock(scope: !338, file: !3, line: 170, column: 6)
!419 = !DILocation(line: 170, column: 6, scope: !338, inlinedAt: !362)
!420 = !DILocation(line: 175, column: 23, scope: !421, inlinedAt: !362)
!421 = distinct !DILexicalBlock(scope: !338, file: !3, line: 175, column: 6)
!422 = !DILocalVariable(name: "codel", arg: 1, scope: !423, file: !52, line: 106, type: !427)
!423 = distinct !DISubprogram(name: "codel_drop", scope: !52, file: !52, line: 106, type: !424, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !428)
!424 = !DISubroutineType(types: !425)
!425 = !{!426, !427, !21, !21}
!426 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!428 = !{!422, !429, !430, !431, !432, !433}
!429 = !DILocalVariable(name: "t_queue_sz", arg: 2, scope: !423, file: !52, line: 106, type: !21)
!430 = !DILocalVariable(name: "now", arg: 3, scope: !423, file: !52, line: 106, type: !21)
!431 = !DILocalVariable(name: "interval", scope: !423, file: !52, line: 108, type: !21)
!432 = !DILocalVariable(name: "drop", scope: !423, file: !52, line: 111, type: !426)
!433 = !DILocalVariable(name: "count", scope: !434, file: !52, line: 134, type: !41)
!434 = distinct !DILexicalBlock(scope: !435, file: !52, line: 130, column: 53)
!435 = distinct !DILexicalBlock(scope: !436, file: !52, line: 128, column: 13)
!436 = distinct !DILexicalBlock(scope: !423, file: !52, line: 113, column: 6)
!437 = !DILocation(line: 0, scope: !423, inlinedAt: !438)
!438 = distinct !DILocation(line: 175, column: 6, scope: !421, inlinedAt: !362)
!439 = !DILocalVariable(name: "codel", arg: 1, scope: !440, file: !52, line: 83, type: !427)
!440 = distinct !DISubprogram(name: "codel_should_drop", scope: !52, file: !52, line: 83, type: !424, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !441)
!441 = !{!439, !442, !443, !444}
!442 = !DILocalVariable(name: "t_queue_sz", arg: 2, scope: !440, file: !52, line: 83, type: !21)
!443 = !DILocalVariable(name: "now", arg: 3, scope: !440, file: !52, line: 83, type: !21)
!444 = !DILocalVariable(name: "interval", scope: !440, file: !52, line: 85, type: !21)
!445 = !DILocation(line: 0, scope: !440, inlinedAt: !446)
!446 = distinct !DILocation(line: 111, column: 14, scope: !423, inlinedAt: !438)
!447 = !DILocation(line: 87, column: 17, scope: !448, inlinedAt: !446)
!448 = distinct !DILexicalBlock(scope: !440, file: !52, line: 87, column: 6)
!449 = !DILocation(line: 87, column: 6, scope: !440, inlinedAt: !446)
!450 = !DILocation(line: 89, column: 27, scope: !451, inlinedAt: !446)
!451 = distinct !DILexicalBlock(scope: !448, file: !52, line: 87, column: 33)
!452 = !{!372, !220, i64 0}
!453 = !DILocation(line: 90, column: 3, scope: !451, inlinedAt: !446)
!454 = !DILocation(line: 93, column: 13, scope: !455, inlinedAt: !446)
!455 = distinct !DILexicalBlock(scope: !440, file: !52, line: 93, column: 6)
!456 = !DILocation(line: 93, column: 30, scope: !455, inlinedAt: !446)
!457 = !DILocation(line: 93, column: 6, scope: !440, inlinedAt: !446)
!458 = !DILocation(line: 97, column: 33, scope: !459, inlinedAt: !446)
!459 = distinct !DILexicalBlock(scope: !455, file: !52, line: 93, column: 36)
!460 = !DILocation(line: 97, column: 27, scope: !459, inlinedAt: !446)
!461 = !DILocation(line: 98, column: 3, scope: !459, inlinedAt: !446)
!462 = !DILocation(line: 99, column: 17, scope: !463, inlinedAt: !446)
!463 = distinct !DILexicalBlock(scope: !455, file: !52, line: 99, column: 13)
!464 = !DILocation(line: 113, column: 13, scope: !436, inlinedAt: !438)
!465 = !{!372, !217, i64 20}
!466 = !DILocation(line: 113, column: 6, scope: !436, inlinedAt: !438)
!467 = !DILocation(line: 113, column: 6, scope: !423, inlinedAt: !438)
!468 = !DILocation(line: 114, column: 7, scope: !469, inlinedAt: !438)
!469 = distinct !DILexicalBlock(scope: !436, file: !52, line: 113, column: 23)
!470 = !DILocation(line: 116, column: 20, scope: !471, inlinedAt: !438)
!471 = distinct !DILexicalBlock(scope: !472, file: !52, line: 114, column: 14)
!472 = distinct !DILexicalBlock(scope: !469, file: !52, line: 114, column: 7)
!473 = !DILocation(line: 117, column: 4, scope: !471, inlinedAt: !438)
!474 = !DILocation(line: 118, column: 28, scope: !475, inlinedAt: !438)
!475 = distinct !DILexicalBlock(scope: !472, file: !52, line: 118, column: 14)
!476 = !{!372, !220, i64 8}
!477 = !DILocation(line: 118, column: 18, scope: !475, inlinedAt: !438)
!478 = !DILocation(line: 118, column: 14, scope: !472, inlinedAt: !438)
!479 = !DILocation(line: 122, column: 11, scope: !480, inlinedAt: !438)
!480 = distinct !DILexicalBlock(scope: !475, file: !52, line: 118, column: 39)
!481 = !DILocation(line: 122, column: 17, scope: !480, inlinedAt: !438)
!482 = !{!372, !217, i64 16}
!483 = !DILocalVariable(name: "t", arg: 1, scope: !484, file: !52, line: 77, type: !21)
!484 = distinct !DISubprogram(name: "codel_control_law", scope: !52, file: !52, line: 77, type: !485, scopeLine: 78, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !487)
!485 = !DISubroutineType(types: !486)
!486 = !{!21, !21, !21}
!487 = !{!483, !488}
!488 = !DILocalVariable(name: "cnt", arg: 2, scope: !484, file: !52, line: 77, type: !21)
!489 = !DILocation(line: 0, scope: !484, inlinedAt: !490)
!490 = distinct !DILocation(line: 125, column: 5, scope: !480, inlinedAt: !438)
!491 = !DILocalVariable(name: "cnt", arg: 1, scope: !492, file: !52, line: 70, type: !21)
!492 = distinct !DISubprogram(name: "get_next_interval_sqrt", scope: !52, file: !52, line: 70, type: !493, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !495)
!493 = !DISubroutineType(types: !494)
!494 = !{!21, !21}
!495 = !{!491, !496}
!496 = !DILocalVariable(name: "val", scope: !492, file: !52, line: 72, type: !21)
!497 = !DILocation(line: 0, scope: !492, inlinedAt: !498)
!498 = distinct !DILocation(line: 79, column: 13, scope: !484, inlinedAt: !490)
!499 = !DILocalVariable(name: "cnt", arg: 1, scope: !500, file: !52, line: 26, type: !21)
!500 = distinct !DISubprogram(name: "get_sqrt_sh16", scope: !52, file: !52, line: 26, type: !501, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !503)
!501 = !DISubroutineType(types: !502)
!502 = !{!41, !21}
!503 = !{!499}
!504 = !DILocation(line: 0, scope: !500, inlinedAt: !505)
!505 = distinct !DILocation(line: 72, column: 53, scope: !492, inlinedAt: !498)
!506 = !DILocation(line: 28, column: 2, scope: !500, inlinedAt: !505)
!507 = !DILocation(line: 30, column: 10, scope: !508, inlinedAt: !505)
!508 = distinct !DILexicalBlock(scope: !500, file: !52, line: 28, column: 15)
!509 = !DILocation(line: 31, column: 10, scope: !508, inlinedAt: !505)
!510 = !DILocation(line: 32, column: 10, scope: !508, inlinedAt: !505)
!511 = !DILocation(line: 33, column: 10, scope: !508, inlinedAt: !505)
!512 = !DILocation(line: 34, column: 10, scope: !508, inlinedAt: !505)
!513 = !DILocation(line: 35, column: 10, scope: !508, inlinedAt: !505)
!514 = !DILocation(line: 36, column: 10, scope: !508, inlinedAt: !505)
!515 = !DILocation(line: 37, column: 10, scope: !508, inlinedAt: !505)
!516 = !DILocation(line: 38, column: 11, scope: !508, inlinedAt: !505)
!517 = !DILocation(line: 39, column: 11, scope: !508, inlinedAt: !505)
!518 = !DILocation(line: 40, column: 11, scope: !508, inlinedAt: !505)
!519 = !DILocation(line: 41, column: 11, scope: !508, inlinedAt: !505)
!520 = !DILocation(line: 42, column: 11, scope: !508, inlinedAt: !505)
!521 = !DILocation(line: 43, column: 11, scope: !508, inlinedAt: !505)
!522 = !DILocation(line: 44, column: 11, scope: !508, inlinedAt: !505)
!523 = !DILocation(line: 45, column: 11, scope: !508, inlinedAt: !505)
!524 = !DILocation(line: 46, column: 11, scope: !508, inlinedAt: !505)
!525 = !DILocation(line: 47, column: 11, scope: !508, inlinedAt: !505)
!526 = !DILocation(line: 48, column: 11, scope: !508, inlinedAt: !505)
!527 = !DILocation(line: 49, column: 11, scope: !508, inlinedAt: !505)
!528 = !DILocation(line: 50, column: 11, scope: !508, inlinedAt: !505)
!529 = !DILocation(line: 51, column: 11, scope: !508, inlinedAt: !505)
!530 = !DILocation(line: 52, column: 11, scope: !508, inlinedAt: !505)
!531 = !DILocation(line: 53, column: 11, scope: !508, inlinedAt: !505)
!532 = !DILocation(line: 54, column: 11, scope: !508, inlinedAt: !505)
!533 = !DILocation(line: 55, column: 11, scope: !508, inlinedAt: !505)
!534 = !DILocation(line: 56, column: 11, scope: !508, inlinedAt: !505)
!535 = !DILocation(line: 57, column: 11, scope: !508, inlinedAt: !505)
!536 = !DILocation(line: 58, column: 11, scope: !508, inlinedAt: !505)
!537 = !DILocation(line: 59, column: 11, scope: !508, inlinedAt: !505)
!538 = !DILocation(line: 60, column: 11, scope: !508, inlinedAt: !505)
!539 = !DILocation(line: 61, column: 11, scope: !508, inlinedAt: !505)
!540 = !DILocation(line: 62, column: 11, scope: !508, inlinedAt: !505)
!541 = !DILocation(line: 63, column: 11, scope: !508, inlinedAt: !505)
!542 = !DILocation(line: 64, column: 11, scope: !508, inlinedAt: !505)
!543 = !DILocation(line: 66, column: 3, scope: !508, inlinedAt: !505)
!544 = !DILocation(line: 72, column: 51, scope: !492, inlinedAt: !498)
!545 = !DILocation(line: 79, column: 11, scope: !484, inlinedAt: !490)
!546 = !DILocation(line: 124, column: 42, scope: !480, inlinedAt: !438)
!547 = !DILocation(line: 126, column: 4, scope: !480, inlinedAt: !438)
!548 = !DILocation(line: 128, column: 18, scope: !435, inlinedAt: !438)
!549 = !DILocation(line: 129, column: 21, scope: !435, inlinedAt: !438)
!550 = !DILocation(line: 129, column: 12, scope: !435, inlinedAt: !438)
!551 = !DILocation(line: 129, column: 31, scope: !435, inlinedAt: !438)
!552 = !DILocation(line: 129, column: 43, scope: !435, inlinedAt: !438)
!553 = !DILocation(line: 130, column: 12, scope: !435, inlinedAt: !438)
!554 = !DILocation(line: 130, column: 38, scope: !435, inlinedAt: !438)
!555 = !DILocation(line: 128, column: 13, scope: !436, inlinedAt: !438)
!556 = !DILocation(line: 134, column: 24, scope: !434, inlinedAt: !438)
!557 = !DILocation(line: 0, scope: !434, inlinedAt: !438)
!558 = !DILocation(line: 136, column: 19, scope: !434, inlinedAt: !438)
!559 = !DILocation(line: 146, column: 16, scope: !434, inlinedAt: !438)
!560 = !DILocation(line: 0, scope: !484, inlinedAt: !561)
!561 = distinct !DILocation(line: 147, column: 22, scope: !434, inlinedAt: !438)
!562 = !DILocation(line: 28, column: 2, scope: !500, inlinedAt: !563)
!563 = distinct !DILocation(line: 72, column: 53, scope: !492, inlinedAt: !564)
!564 = distinct !DILocation(line: 79, column: 13, scope: !484, inlinedAt: !561)
!565 = !DILocation(line: 142, column: 18, scope: !566, inlinedAt: !438)
!566 = distinct !DILexicalBlock(scope: !434, file: !52, line: 141, column: 7)
!567 = !DILocation(line: 142, column: 12, scope: !566, inlinedAt: !438)
!568 = !DILocation(line: 0, scope: !492, inlinedAt: !564)
!569 = !DILocation(line: 0, scope: !500, inlinedAt: !563)
!570 = !DILocation(line: 30, column: 10, scope: !508, inlinedAt: !563)
!571 = !DILocation(line: 31, column: 10, scope: !508, inlinedAt: !563)
!572 = !DILocation(line: 32, column: 10, scope: !508, inlinedAt: !563)
!573 = !DILocation(line: 33, column: 10, scope: !508, inlinedAt: !563)
!574 = !DILocation(line: 34, column: 10, scope: !508, inlinedAt: !563)
!575 = !DILocation(line: 35, column: 10, scope: !508, inlinedAt: !563)
!576 = !DILocation(line: 36, column: 10, scope: !508, inlinedAt: !563)
!577 = !DILocation(line: 37, column: 10, scope: !508, inlinedAt: !563)
!578 = !DILocation(line: 38, column: 11, scope: !508, inlinedAt: !563)
!579 = !DILocation(line: 39, column: 11, scope: !508, inlinedAt: !563)
!580 = !DILocation(line: 40, column: 11, scope: !508, inlinedAt: !563)
!581 = !DILocation(line: 41, column: 11, scope: !508, inlinedAt: !563)
!582 = !DILocation(line: 42, column: 11, scope: !508, inlinedAt: !563)
!583 = !DILocation(line: 43, column: 11, scope: !508, inlinedAt: !563)
!584 = !DILocation(line: 44, column: 11, scope: !508, inlinedAt: !563)
!585 = !DILocation(line: 45, column: 11, scope: !508, inlinedAt: !563)
!586 = !DILocation(line: 46, column: 11, scope: !508, inlinedAt: !563)
!587 = !DILocation(line: 47, column: 11, scope: !508, inlinedAt: !563)
!588 = !DILocation(line: 48, column: 11, scope: !508, inlinedAt: !563)
!589 = !DILocation(line: 49, column: 11, scope: !508, inlinedAt: !563)
!590 = !DILocation(line: 50, column: 11, scope: !508, inlinedAt: !563)
!591 = !DILocation(line: 51, column: 11, scope: !508, inlinedAt: !563)
!592 = !DILocation(line: 52, column: 11, scope: !508, inlinedAt: !563)
!593 = !DILocation(line: 53, column: 11, scope: !508, inlinedAt: !563)
!594 = !DILocation(line: 54, column: 11, scope: !508, inlinedAt: !563)
!595 = !DILocation(line: 55, column: 11, scope: !508, inlinedAt: !563)
!596 = !DILocation(line: 56, column: 11, scope: !508, inlinedAt: !563)
!597 = !DILocation(line: 57, column: 11, scope: !508, inlinedAt: !563)
!598 = !DILocation(line: 58, column: 11, scope: !508, inlinedAt: !563)
!599 = !DILocation(line: 59, column: 11, scope: !508, inlinedAt: !563)
!600 = !DILocation(line: 60, column: 11, scope: !508, inlinedAt: !563)
!601 = !DILocation(line: 61, column: 11, scope: !508, inlinedAt: !563)
!602 = !DILocation(line: 62, column: 11, scope: !508, inlinedAt: !563)
!603 = !DILocation(line: 63, column: 11, scope: !508, inlinedAt: !563)
!604 = !DILocation(line: 64, column: 11, scope: !508, inlinedAt: !563)
!605 = !DILocation(line: 66, column: 3, scope: !508, inlinedAt: !563)
!606 = !DILocation(line: 72, column: 51, scope: !492, inlinedAt: !564)
!607 = !DILocation(line: 79, column: 11, scope: !484, inlinedAt: !561)
!608 = !DILocation(line: 147, column: 20, scope: !434, inlinedAt: !438)
!609 = !DILocation(line: 178, column: 7, scope: !338, inlinedAt: !362)
!610 = !DILocation(line: 178, column: 12, scope: !338, inlinedAt: !362)
!611 = !DILocation(line: 181, column: 17, scope: !612, inlinedAt: !362)
!612 = distinct !DILexicalBlock(scope: !338, file: !3, line: 181, column: 6)
!613 = !DILocation(line: 181, column: 6, scope: !338, inlinedAt: !362)
!614 = !DILocation(line: 182, column: 13, scope: !615, inlinedAt: !362)
!615 = distinct !DILexicalBlock(scope: !612, file: !3, line: 181, column: 35)
!616 = !DILocation(line: 183, column: 3, scope: !615, inlinedAt: !362)
!617 = !DILocation(line: 184, column: 2, scope: !615, inlinedAt: !362)
!618 = !DILocation(line: 0, scope: !361, inlinedAt: !362)
!619 = !DILocation(line: 187, column: 2, scope: !361, inlinedAt: !362)
!620 = !DILocation(line: 92, column: 2, scope: !393, inlinedAt: !621)
!621 = distinct !DILocation(line: 187, column: 2, scope: !361, inlinedAt: !362)
!622 = !DILocation(line: 190, column: 14, scope: !338, inlinedAt: !362)
!623 = !DILocation(line: 191, column: 2, scope: !338, inlinedAt: !362)
!624 = !DILocation(line: 192, column: 1, scope: !338, inlinedAt: !362)
!625 = !DILocation(line: 278, column: 2, scope: !181)
!626 = !DILocation(line: 282, column: 1, scope: !181)
