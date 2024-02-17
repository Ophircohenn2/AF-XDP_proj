; ModuleID = 'xdp_synproxy_kern.c'
source_filename = "xdp_synproxy_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { [2 x i32]*, i32*, i64*, [2 x i32]* }
%struct.anon.6 = type { [2 x i32]*, i32*, i16*, [8 x i32]* }
%struct.bpf_ct_opts___local = type { i32, i32, i8, i8, [2 x i8] }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.tcpopt_context = type { i8*, i8*, i8*, i32*, i8, i8, i8 }
%struct.bpf_sock_tuple = type { %union.anon.7 }
%union.anon.7 = type { %struct.anon.9 }
%struct.anon.9 = type { [4 x i32], [4 x i32], i16, i16 }
%struct.header_pointers = type { %struct.ethhdr*, %struct.iphdr*, %struct.ipv6hdr*, %struct.tcphdr*, i16 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.anon.8 = type { i32, i32, i16, i16 }
%struct.nf_conn = type { i64 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@values = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !141
@allowed_ports = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !157
@__const.tcp_lookup.ct_lookup_opts = private unnamed_addr constant %struct.bpf_ct_opts___local { i32 -1, i32 0, i8 6, i8 0, [2 x i8] zeroinitializer }, align 4
@"llvm.nf_conn:0:0$0:0" = external global i64, !llvm.preserve.access.index !301 #0
@"llvm.bpf_ct_opts___local:0:4$0:1" = external global i64, !llvm.preserve.access.index !305 #0
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.6* @allowed_ports to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @syncookie_xdp to i8*), i8* bitcast (%struct.anon.5* @values to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @syncookie_xdp(%struct.xdp_md* noundef %0) #1 section "xdp" !dbg !318 {
  %2 = alloca i32, align 4
  %3 = alloca [6 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca [4 x i32], align 4
  %6 = alloca [6 x i8], align 1
  %7 = alloca i32, align 4
  %8 = alloca %struct.tcpopt_context, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.bpf_ct_opts___local, align 4
  %13 = alloca %struct.bpf_sock_tuple, align 4
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 272, 48)), !dbg !344
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !322, metadata !DIExpression()), !dbg !345
  %14 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !346
  %15 = load i32, i32* %14, align 4, !dbg !346, !tbaa !347
  %16 = zext i32 %15 to i64, !dbg !352
  %17 = inttoptr i64 %16 to i8*, !dbg !353
  call void @llvm.dbg.value(metadata i8* %17, metadata !323, metadata !DIExpression()), !dbg !345
  %18 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !354
  %19 = load i32, i32* %18, align 4, !dbg !354, !tbaa !355
  %20 = zext i32 %19 to i64, !dbg !356
  %21 = inttoptr i64 %20 to i8*, !dbg !357
  call void @llvm.dbg.value(metadata i8* %21, metadata !324, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata i8* %21, metadata !364, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata i8* %17, metadata !365, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !366, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata i8 1, metadata !367, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata i8* %21, metadata !371, metadata !DIExpression()) #10, !dbg !378
  call void @llvm.dbg.value(metadata i8* %17, metadata !376, metadata !DIExpression()) #10, !dbg !378
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !377, metadata !DIExpression()) #10, !dbg !378
  call void @llvm.dbg.value(metadata i8* %21, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !345
  %22 = getelementptr i8, i8* %21, i64 14, !dbg !380
  %23 = icmp ugt i8* %22, %17, !dbg !382
  br i1 %23, label %800, label %24, !dbg !383

24:                                               ; preds = %1
  %25 = getelementptr inbounds i8, i8* %21, i64 12, !dbg !384
  %26 = bitcast i8* %25 to i16*, !dbg !384
  %27 = load i16, i16* %26, align 1, !dbg !384, !tbaa !385
  %28 = tail call i16 @llvm.bswap.i16(i16 %27) #10, !dbg !384
  switch i16 %28, label %800 [
    i16 2048, label %29
    i16 -31011, label %48
  ], !dbg !388

29:                                               ; preds = %24
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* null, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  %30 = bitcast i8* %22 to %struct.iphdr*, !dbg !389
  call void @llvm.dbg.value(metadata %struct.iphdr* %30, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  %31 = getelementptr i8, i8* %21, i64 34, !dbg !391
  %32 = icmp ugt i8* %31, %17, !dbg !393
  br i1 %32, label %800, label %33, !dbg !394

33:                                               ; preds = %29
  %34 = load i8, i8* %22, align 4, !dbg !395
  %35 = shl i8 %34, 2, !dbg !397
  %36 = and i8 %35, 60, !dbg !397
  %37 = zext i8 %36 to i64
  %38 = icmp ugt i8 %36, 19, !dbg !398
  %39 = and i8 %34, -16
  %40 = icmp eq i8 %39, 64
  %41 = select i1 %38, i1 %40, i1 false, !dbg !399
  br i1 %41, label %42, label %800, !dbg !399

42:                                               ; preds = %33
  %43 = getelementptr i8, i8* %21, i64 23, !dbg !400
  %44 = load i8, i8* %43, align 1, !dbg !400, !tbaa !402
  %45 = icmp eq i8 %44, 6, !dbg !404
  br i1 %45, label %46, label %800, !dbg !405

46:                                               ; preds = %42
  %47 = getelementptr i8, i8* %22, i64 %37, !dbg !406
  br label %60, !dbg !407

48:                                               ; preds = %24
  call void @llvm.dbg.value(metadata %struct.iphdr* null, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  %49 = bitcast i8* %22 to %struct.ipv6hdr*, !dbg !408
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %49, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  %50 = getelementptr i8, i8* %21, i64 54, !dbg !409
  %51 = icmp ugt i8* %50, %17, !dbg !411
  br i1 %51, label %800, label %52, !dbg !412

52:                                               ; preds = %48
  %53 = load i8, i8* %22, align 4, !dbg !413
  %54 = and i8 %53, -16, !dbg !415
  %55 = icmp eq i8 %54, 96, !dbg !415
  br i1 %55, label %56, label %800, !dbg !416

56:                                               ; preds = %52
  %57 = getelementptr i8, i8* %21, i64 20, !dbg !417
  %58 = load i8, i8* %57, align 2, !dbg !417, !tbaa !419
  %59 = icmp eq i8 %58, 6, !dbg !421
  br i1 %59, label %60, label %800, !dbg !422

60:                                               ; preds = %56, %46
  %61 = phi %struct.ipv6hdr* [ %49, %56 ], [ null, %46 ], !dbg !423
  %62 = phi %struct.iphdr* [ null, %56 ], [ %30, %46 ], !dbg !423
  %63 = phi i8* [ %50, %56 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata %struct.iphdr* %62, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %61, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  call void @llvm.dbg.value(metadata i8* %63, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !345
  %64 = getelementptr inbounds i8, i8* %63, i64 20, !dbg !424
  %65 = icmp ugt i8* %64, %17, !dbg !426
  br i1 %65, label %800, label %66, !dbg !427

66:                                               ; preds = %60
  %67 = getelementptr inbounds i8, i8* %63, i64 12, !dbg !428
  %68 = bitcast i8* %67 to i16*, !dbg !428
  %69 = load i16, i16* %68, align 4, !dbg !428
  %70 = lshr i16 %69, 2, !dbg !429
  %71 = and i16 %70, 60, !dbg !429
  call void @llvm.dbg.value(metadata i16 %71, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 16)), !dbg !345
  %72 = icmp ult i16 %71, 20, !dbg !430
  br i1 %72, label %800, label %73, !dbg !378

73:                                               ; preds = %66
  call void @llvm.dbg.value(metadata i32 3, metadata !368, metadata !DIExpression()) #10, !dbg !369
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !432, metadata !DIExpression()) #10, !dbg !466
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !437, metadata !DIExpression()) #10, !dbg !466
  call void @llvm.dbg.value(metadata i1 undef, metadata !438, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !466
  %74 = bitcast %struct.bpf_ct_opts___local* %12 to i8*, !dbg !468
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %74) #10, !dbg !468
  call void @llvm.dbg.declare(metadata %struct.bpf_ct_opts___local* %12, metadata !439, metadata !DIExpression()) #10, !dbg !469
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(12) %74, i8* noundef nonnull align 4 dereferenceable(12) bitcast (%struct.bpf_ct_opts___local* @__const.tcp_lookup.ct_lookup_opts to i8*), i64 12, i1 false) #10, !dbg !469
  %75 = bitcast %struct.bpf_sock_tuple* %13 to i8*, !dbg !470
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %75) #10, !dbg !470
  call void @llvm.dbg.declare(metadata %struct.bpf_sock_tuple* %13, metadata !440, metadata !DIExpression()) #10, !dbg !471
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(36) %75, i8 0, i64 36, i1 false) #10, !dbg !471
  %76 = icmp eq %struct.iphdr* %62, null, !dbg !472
  br i1 %76, label %98, label %77, !dbg !474

77:                                               ; preds = %73
  %78 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %62, i64 0, i32 4, !dbg !475
  %79 = load i16, i16* %78, align 2, !dbg !475, !tbaa !478
  %80 = and i16 %79, -129, !dbg !479
  %81 = icmp eq i16 %80, 64, !dbg !480
  br i1 %81, label %82, label %134, !dbg !481

82:                                               ; preds = %77
  %83 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %62, i64 0, i32 8, i32 0, i32 0, !dbg !482
  %84 = load i32, i32* %83, align 4, !dbg !482, !tbaa !483
  %85 = bitcast %struct.bpf_sock_tuple* %13 to %struct.anon.8*, !dbg !484
  %86 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 0, i64 0, !dbg !485
  store i32 %84, i32* %86, align 4, !dbg !486, !tbaa !483
  %87 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %62, i64 0, i32 8, i32 0, i32 1, !dbg !487
  %88 = load i32, i32* %87, align 4, !dbg !487, !tbaa !483
  %89 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 0, i64 1, !dbg !488
  store i32 %88, i32* %89, align 4, !dbg !489, !tbaa !483
  %90 = bitcast i8* %63 to i16*, !dbg !490
  %91 = load i16, i16* %90, align 4, !dbg !490, !tbaa !491
  %92 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 0, i64 2, !dbg !493
  %93 = bitcast i32* %92 to i16*, !dbg !493
  store i16 %91, i16* %93, align 4, !dbg !494, !tbaa !483
  %94 = getelementptr inbounds i8, i8* %63, i64 2, !dbg !495
  %95 = bitcast i8* %94 to i16*, !dbg !495
  %96 = load i16, i16* %95, align 2, !dbg !495, !tbaa !496
  %97 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %85, i64 0, i32 3, !dbg !497
  store i16 %96, i16* %97, align 2, !dbg !498, !tbaa !483
  call void @llvm.dbg.value(metadata i32 12, metadata !462, metadata !DIExpression()) #10, !dbg !466
  br label %114, !dbg !499

98:                                               ; preds = %73
  %99 = icmp eq %struct.ipv6hdr* %61, null, !dbg !500
  br i1 %99, label %134, label %100, !dbg !502

100:                                              ; preds = %98
  %101 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %61, i64 0, i32 5, i32 0, i32 0, !dbg !503
  %102 = bitcast %struct.in6_addr* %101 to i8*, !dbg !505
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %75, i8* noundef nonnull align 4 dereferenceable(16) %102, i64 16, i1 false) #10, !dbg !505
  %103 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 1, i64 0, !dbg !506
  %104 = bitcast i32* %103 to i8*, !dbg !506
  %105 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %61, i64 0, i32 5, i32 0, i32 1, !dbg !507
  %106 = bitcast %struct.in6_addr* %105 to i8*, !dbg !506
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %104, i8* noundef nonnull align 4 dereferenceable(16) %106, i64 16, i1 false) #10, !dbg !506
  %107 = bitcast i8* %63 to i16*, !dbg !508
  %108 = load i16, i16* %107, align 4, !dbg !508, !tbaa !491
  %109 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 2, !dbg !509
  store i16 %108, i16* %109, align 4, !dbg !510, !tbaa !483
  %110 = getelementptr inbounds i8, i8* %63, i64 2, !dbg !511
  %111 = bitcast i8* %110 to i16*, !dbg !511
  %112 = load i16, i16* %111, align 2, !dbg !511, !tbaa !496
  %113 = getelementptr inbounds %struct.bpf_sock_tuple, %struct.bpf_sock_tuple* %13, i64 0, i32 0, i32 0, i32 3, !dbg !512
  store i16 %112, i16* %113, align 2, !dbg !513, !tbaa !483
  call void @llvm.dbg.value(metadata i32 36, metadata !462, metadata !DIExpression()) #10, !dbg !466
  br label %114

114:                                              ; preds = %100, %82
  %115 = phi i32 [ 12, %82 ], [ 36, %100 ], !dbg !514
  call void @llvm.dbg.value(metadata i32 %115, metadata !462, metadata !DIExpression()) #10, !dbg !466
  %116 = call %struct.nf_conn* @bpf_xdp_ct_lookup(%struct.xdp_md* noundef nonnull %0, %struct.bpf_sock_tuple* noundef nonnull %13, i32 noundef %115, %struct.bpf_ct_opts___local* noundef nonnull %12, i32 noundef 12) #10, !dbg !515
  call void @llvm.dbg.value(metadata %struct.nf_conn* %116, metadata !460, metadata !DIExpression()) #10, !dbg !466
  %117 = icmp eq %struct.nf_conn* %116, null, !dbg !516
  br i1 %117, label %127, label %118, !dbg !517

118:                                              ; preds = %114
  %119 = load i64, i64* @"llvm.nf_conn:0:0$0:0", align 8
  %120 = bitcast %struct.nf_conn* %116 to i8*
  %121 = getelementptr i8, i8* %120, i64 %119
  %122 = bitcast i8* %121 to i64*
  %123 = call i64* @llvm.bpf.passthrough.p0i64.p0i64(i32 0, i64* %122) #10
  %124 = load i64, i64* %123, align 8, !dbg !518, !tbaa !519
  call void @llvm.dbg.value(metadata i64 %124, metadata !463, metadata !DIExpression()) #10, !dbg !522
  call void @bpf_ct_release(%struct.nf_conn* noundef nonnull %116) #10, !dbg !523
  %125 = and i64 %124, 8, !dbg !524
  %126 = icmp eq i64 %125, 0, !dbg !524
  br i1 %126, label %136, label %134

127:                                              ; preds = %114
  %128 = load i64, i64* @"llvm.bpf_ct_opts___local:0:4$0:1", align 8
  %129 = getelementptr i8, i8* %74, i64 %128
  %130 = bitcast i8* %129 to i32*
  %131 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 1, i32* %130) #10
  %132 = load i32, i32* %131, align 4, !dbg !526, !tbaa !528
  %133 = icmp eq i32 %132, -2, !dbg !530
  br i1 %133, label %136, label %134, !dbg !531

134:                                              ; preds = %127, %118, %98, %77
  %135 = phi i32 [ 0, %127 ], [ 0, %98 ], [ 1, %77 ], [ 2, %118 ]
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %75) #10, !dbg !532
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %74) #10, !dbg !532
  call void @llvm.dbg.value(metadata i32 3, metadata !368, metadata !DIExpression()) #10, !dbg !369
  br label %800, !dbg !533

136:                                              ; preds = %127, %118
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %75) #10, !dbg !532
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %74) #10, !dbg !532
  call void @llvm.dbg.value(metadata i32 3, metadata !368, metadata !DIExpression()) #10, !dbg !369
  %137 = getelementptr inbounds i8, i8* %63, i64 2, !dbg !534
  %138 = bitcast i8* %137 to i16*, !dbg !534
  %139 = load i16, i16* %138, align 2, !dbg !534, !tbaa !496
  %140 = call i16 @llvm.bswap.i16(i16 %139) #10, !dbg !534
  call void @llvm.dbg.value(metadata i16 %140, metadata !536, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.dbg.value(metadata i32 0, metadata !541, metadata !DIExpression()) #10, !dbg !547
  %141 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 0, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 0, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %142 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %142, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %143 = icmp eq i8* %142, null, !dbg !554
  br i1 %143, label %213, label %207, !dbg !556

144:                                              ; preds = %211
  call void @llvm.dbg.value(metadata i32 1, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 1, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 1, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %145 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %145, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %146 = icmp eq i8* %145, null, !dbg !554
  br i1 %146, label %213, label %147, !dbg !556

147:                                              ; preds = %144
  %148 = bitcast i8* %145 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %148, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %149 = load i16, i16* %148, align 2, !dbg !557, !tbaa !559
  %150 = icmp eq i16 %149, 0, !dbg !560
  br i1 %150, label %213, label %151, !dbg !561

151:                                              ; preds = %147
  %152 = icmp eq i16 %149, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 1, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %152, label %214, label %153, !dbg !565

153:                                              ; preds = %151
  call void @llvm.dbg.value(metadata i32 2, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 2, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 2, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %154 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %154, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %155 = icmp eq i8* %154, null, !dbg !554
  br i1 %155, label %213, label %156, !dbg !556

156:                                              ; preds = %153
  %157 = bitcast i8* %154 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %157, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %158 = load i16, i16* %157, align 2, !dbg !557, !tbaa !559
  %159 = icmp eq i16 %158, 0, !dbg !560
  br i1 %159, label %213, label %160, !dbg !561

160:                                              ; preds = %156
  %161 = icmp eq i16 %158, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 2, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %161, label %214, label %162, !dbg !565

162:                                              ; preds = %160
  call void @llvm.dbg.value(metadata i32 3, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 3, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 3, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %163 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %163, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %164 = icmp eq i8* %163, null, !dbg !554
  br i1 %164, label %213, label %165, !dbg !556

165:                                              ; preds = %162
  %166 = bitcast i8* %163 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %166, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %167 = load i16, i16* %166, align 2, !dbg !557, !tbaa !559
  %168 = icmp eq i16 %167, 0, !dbg !560
  br i1 %168, label %213, label %169, !dbg !561

169:                                              ; preds = %165
  %170 = icmp eq i16 %167, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 3, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %170, label %214, label %171, !dbg !565

171:                                              ; preds = %169
  call void @llvm.dbg.value(metadata i32 4, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 4, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 4, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %172 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %172, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %173 = icmp eq i8* %172, null, !dbg !554
  br i1 %173, label %213, label %174, !dbg !556

174:                                              ; preds = %171
  %175 = bitcast i8* %172 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %175, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %176 = load i16, i16* %175, align 2, !dbg !557, !tbaa !559
  %177 = icmp eq i16 %176, 0, !dbg !560
  br i1 %177, label %213, label %178, !dbg !561

178:                                              ; preds = %174
  %179 = icmp eq i16 %176, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 4, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %179, label %214, label %180, !dbg !565

180:                                              ; preds = %178
  call void @llvm.dbg.value(metadata i32 5, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 5, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 5, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %181 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %181, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %182 = icmp eq i8* %181, null, !dbg !554
  br i1 %182, label %213, label %183, !dbg !556

183:                                              ; preds = %180
  %184 = bitcast i8* %181 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %184, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %185 = load i16, i16* %184, align 2, !dbg !557, !tbaa !559
  %186 = icmp eq i16 %185, 0, !dbg !560
  br i1 %186, label %213, label %187, !dbg !561

187:                                              ; preds = %183
  %188 = icmp eq i16 %185, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 5, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %188, label %214, label %189, !dbg !565

189:                                              ; preds = %187
  call void @llvm.dbg.value(metadata i32 6, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 6, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 6, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %190 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %190, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %191 = icmp eq i8* %190, null, !dbg !554
  br i1 %191, label %213, label %192, !dbg !556

192:                                              ; preds = %189
  %193 = bitcast i8* %190 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %193, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %194 = load i16, i16* %193, align 2, !dbg !557, !tbaa !559
  %195 = icmp eq i16 %194, 0, !dbg !560
  br i1 %195, label %213, label %196, !dbg !561

196:                                              ; preds = %192
  %197 = icmp eq i16 %194, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 6, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %197, label %214, label %198, !dbg !565

198:                                              ; preds = %196
  call void @llvm.dbg.value(metadata i32 7, metadata !541, metadata !DIExpression()) #10, !dbg !547
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %141) #10, !dbg !549
  call void @llvm.dbg.value(metadata i32 7, metadata !542, metadata !DIExpression()) #10, !dbg !550
  store i32 7, i32* %11, align 4, !dbg !551, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %11, metadata !542, metadata !DIExpression(DW_OP_deref)) #10, !dbg !550
  %199 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_ports to i8*), i8* noundef nonnull %141) #10, !dbg !553
  call void @llvm.dbg.value(metadata i8* %199, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %200 = icmp eq i8* %199, null, !dbg !554
  br i1 %200, label %213, label %201, !dbg !556

201:                                              ; preds = %198
  %202 = bitcast i8* %199 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %202, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %203 = load i16, i16* %202, align 2, !dbg !557, !tbaa !559
  %204 = icmp eq i16 %203, 0, !dbg !560
  br i1 %204, label %213, label %205, !dbg !561

205:                                              ; preds = %201
  %206 = icmp eq i16 %203, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 7, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %206, label %214, label %800, !dbg !565

207:                                              ; preds = %136
  %208 = bitcast i8* %142 to i16*, !dbg !553
  call void @llvm.dbg.value(metadata i16* %208, metadata !546, metadata !DIExpression()) #10, !dbg !550
  %209 = load i16, i16* %208, align 2, !dbg !557, !tbaa !559
  %210 = icmp eq i16 %209, 0, !dbg !560
  br i1 %210, label %213, label %211, !dbg !561

211:                                              ; preds = %207
  %212 = icmp eq i16 %209, %140, !dbg !562
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  call void @llvm.dbg.value(metadata i32 0, metadata !541, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #10, !dbg !547
  br i1 %212, label %214, label %144, !dbg !565

213:                                              ; preds = %207, %201, %198, %192, %189, %183, %180, %174, %171, %165, %162, %156, %153, %147, %144, %136
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %141) #10, !dbg !564
  br label %800

214:                                              ; preds = %211, %205, %196, %187, %178, %169, %160, %151
  %215 = load i16, i16* %68, align 4, !dbg !566
  %216 = lshr i16 %215, 9, !dbg !566
  %217 = lshr i16 %215, 12, !dbg !568
  %218 = xor i16 %216, %217, !dbg !569
  %219 = and i16 %218, 1, !dbg !569
  %220 = icmp eq i16 %219, 0, !dbg !570
  br i1 %220, label %800, label %221, !dbg !571

221:                                              ; preds = %214
  %222 = sub nuw nsw i16 60, %71, !dbg !572
  %223 = zext i16 %222 to i32, !dbg !572
  %224 = call i64 inttoptr (i64 65 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef %223) #10, !dbg !576
  %225 = icmp eq i64 %224, 0, !dbg !576
  br i1 %225, label %226, label %800, !dbg !369

226:                                              ; preds = %221
  call void @llvm.dbg.value(metadata %struct.iphdr* %62, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %61, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  call void @llvm.dbg.value(metadata i32 3, metadata !343, metadata !DIExpression()), !dbg !345
  %227 = load i32, i32* %14, align 4, !dbg !577, !tbaa !347
  %228 = zext i32 %227 to i64, !dbg !578
  %229 = inttoptr i64 %228 to i8*, !dbg !579
  call void @llvm.dbg.value(metadata i8* %229, metadata !323, metadata !DIExpression()), !dbg !345
  %230 = load i32, i32* %18, align 4, !dbg !580, !tbaa !355
  %231 = zext i32 %230 to i64, !dbg !581
  %232 = inttoptr i64 %231 to i8*, !dbg !582
  call void @llvm.dbg.value(metadata i8* %232, metadata !324, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !583, metadata !DIExpression()) #10, !dbg !591
  call void @llvm.dbg.value(metadata i8* %232, metadata !588, metadata !DIExpression()) #10, !dbg !591
  call void @llvm.dbg.value(metadata i8* %229, metadata !589, metadata !DIExpression()) #10, !dbg !591
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !590, metadata !DIExpression()) #10, !dbg !591
  br i1 %76, label %244, label %233, !dbg !593

233:                                              ; preds = %226
  call void @llvm.dbg.value(metadata i8* %232, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !345
  %234 = getelementptr i8, i8* %232, i64 14, !dbg !594
  call void @llvm.dbg.value(metadata i8* %234, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  %235 = getelementptr i8, i8* %232, i64 74, !dbg !597
  %236 = icmp ugt i8* %235, %229, !dbg !599
  br i1 %236, label %800, label %237, !dbg !600

237:                                              ; preds = %233
  %238 = bitcast i8* %234 to %struct.iphdr*, !dbg !601
  call void @llvm.dbg.value(metadata %struct.iphdr* %238, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  call void @llvm.dbg.value(metadata i64 %231, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !345
  %239 = load i8, i8* %234, align 4, !dbg !602
  %240 = shl i8 %239, 2, !dbg !603
  %241 = and i8 %240, 60, !dbg !603
  %242 = zext i8 %241 to i64
  %243 = getelementptr i8, i8* %234, i64 %242, !dbg !604
  br label %250, !dbg !605

244:                                              ; preds = %226
  %245 = icmp eq %struct.ipv6hdr* %61, null, !dbg !606
  br i1 %245, label %800, label %246, !dbg !608

246:                                              ; preds = %244
  call void @llvm.dbg.value(metadata i64 %231, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !345
  %247 = getelementptr i8, i8* %232, i64 14, !dbg !609
  %248 = bitcast i8* %247 to %struct.ipv6hdr*, !dbg !611
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %248, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  %249 = getelementptr i8, i8* %232, i64 54, !dbg !612
  br label %250

250:                                              ; preds = %246, %237
  %251 = phi %struct.ipv6hdr* [ %248, %246 ], [ %61, %237 ]
  %252 = phi %struct.iphdr* [ null, %246 ], [ %238, %237 ]
  %253 = phi i8* [ %249, %246 ], [ %243, %237 ]
  %254 = inttoptr i64 %231 to %struct.ethhdr*, !dbg !613
  call void @llvm.dbg.value(metadata %struct.ethhdr* %254, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 64)), !dbg !345
  call void @llvm.dbg.value(metadata %struct.iphdr* %252, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 64)), !dbg !345
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %251, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 64)), !dbg !345
  %255 = bitcast i8* %253 to %struct.tcphdr*, !dbg !613
  call void @llvm.dbg.value(metadata %struct.tcphdr* %255, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !345
  %256 = getelementptr i8, i8* %253, i64 60, !dbg !614
  %257 = icmp ugt i8* %256, %229, !dbg !616
  br i1 %257, label %800, label %258, !dbg !617

258:                                              ; preds = %250
  %259 = getelementptr inbounds i8, i8* %253, i64 12, !dbg !618
  %260 = bitcast i8* %259 to i16*, !dbg !618
  %261 = load i16, i16* %260, align 4, !dbg !618
  %262 = lshr i16 %261, 2, !dbg !619
  %263 = and i16 %262, 60, !dbg !619
  call void @llvm.dbg.value(metadata i16 %263, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 16)), !dbg !345
  %264 = icmp ult i16 %263, 20, !dbg !620
  br i1 %264, label %800, label %265, !dbg !622

265:                                              ; preds = %258
  %266 = and i16 %261, 512, !dbg !623
  %267 = icmp eq i16 %266, 0, !dbg !623
  br i1 %267, label %784, label %268, !dbg !623

268:                                              ; preds = %265
  %269 = bitcast i64* %10 to [2 x i32]*
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !624, metadata !DIExpression()) #10, !dbg !646
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !629, metadata !DIExpression()) #10, !dbg !646
  call void @llvm.dbg.value(metadata i8* %232, metadata !630, metadata !DIExpression()) #10, !dbg !646
  call void @llvm.dbg.value(metadata i8* %229, metadata !631, metadata !DIExpression()) #10, !dbg !646
  %270 = bitcast i32** %9 to i8*, !dbg !648
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %270), !dbg !648
  call void @llvm.dbg.declare(metadata i32** %9, metadata !634, metadata !DIExpression()) #10, !dbg !649
  store volatile i32* null, i32** %9, align 8, !dbg !649, !tbaa !650
  %271 = bitcast i64* %10 to i8*, !dbg !652
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %271) #10, !dbg !652
  call void @llvm.dbg.declare(metadata [2 x i32]* %269, metadata !636, metadata !DIExpression()) #10, !dbg !653
  store i64 0, i64* %10, align 8, !dbg !653
  %272 = and i16 %261, 1280, !dbg !654
  %273 = icmp eq i16 %272, 0, !dbg !654
  br i1 %273, label %274, label %782, !dbg !654

274:                                              ; preds = %268
  %275 = icmp eq %struct.iphdr* %252, null, !dbg !656
  br i1 %275, label %328, label %276, !dbg !658

276:                                              ; preds = %274
  %277 = getelementptr %struct.iphdr, %struct.iphdr* %252, i64 0, i32 0, !dbg !659
  %278 = bitcast %struct.iphdr* %252 to i32*, !dbg !659
  %279 = load i8, i8* %277, align 4, !dbg !661
  %280 = shl i8 %279, 2, !dbg !662
  %281 = and i8 %280, 60, !dbg !662
  %282 = zext i8 %281 to i32, !dbg !662
  %283 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef null, i32 noundef 0, i32* noundef nonnull %278, i32 noundef %282, i32 noundef 0) #10, !dbg !663
  call void @llvm.dbg.value(metadata i64 %283, metadata !640, metadata !DIExpression()) #10, !dbg !646
  %284 = icmp slt i64 %283, 0, !dbg !664
  br i1 %284, label %782, label %285, !dbg !666

285:                                              ; preds = %276
  %286 = trunc i64 %283 to i32, !dbg !667
  call void @llvm.dbg.value(metadata i32 %286, metadata !669, metadata !DIExpression()) #10, !dbg !674
  %287 = and i32 %286, 65535, !dbg !676
  %288 = lshr i32 %286, 16, !dbg !677
  %289 = add nuw nsw i32 %287, %288, !dbg !678
  call void @llvm.dbg.value(metadata i32 %289, metadata !669, metadata !DIExpression()) #10, !dbg !674
  %290 = lshr i32 %289, 16, !dbg !679
  %291 = add nuw nsw i32 %290, %289, !dbg !680
  call void @llvm.dbg.value(metadata !DIArgList(i32 %289, i32 %290), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !674
  %292 = trunc i32 %291 to i16, !dbg !681
  %293 = icmp eq i16 %292, -1, !dbg !682
  br i1 %293, label %294, label %782, !dbg !683

294:                                              ; preds = %285
  %295 = bitcast i8* %253 to i32*, !dbg !684
  %296 = zext i16 %263 to i32, !dbg !685
  %297 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef null, i32 noundef 0, i32* noundef %295, i32 noundef %296, i32 noundef 0) #10, !dbg !686
  call void @llvm.dbg.value(metadata i64 %297, metadata !640, metadata !DIExpression()) #10, !dbg !646
  %298 = icmp slt i64 %297, 0, !dbg !687
  br i1 %298, label %782, label %299, !dbg !689

299:                                              ; preds = %294
  %300 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 0, !dbg !690
  %301 = load i32, i32* %300, align 4, !dbg !690, !tbaa !483
  %302 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 1, !dbg !692
  %303 = load i32, i32* %302, align 4, !dbg !692, !tbaa !483
  call void @llvm.dbg.value(metadata i32 %301, metadata !693, metadata !DIExpression()) #10, !dbg !703
  call void @llvm.dbg.value(metadata i32 %303, metadata !698, metadata !DIExpression()) #10, !dbg !703
  call void @llvm.dbg.value(metadata i32 %296, metadata !699, metadata !DIExpression()) #10, !dbg !703
  call void @llvm.dbg.value(metadata i8 6, metadata !700, metadata !DIExpression()) #10, !dbg !703
  %304 = and i64 %297, 4294967295, !dbg !705
  call void @llvm.dbg.value(metadata i64 %297, metadata !701, metadata !DIExpression()) #10, !dbg !703
  call void @llvm.dbg.value(metadata i64 %304, metadata !702, metadata !DIExpression()) #10, !dbg !703
  %305 = zext i32 %301 to i64, !dbg !706
  call void @llvm.dbg.value(metadata i64 undef, metadata !702, metadata !DIExpression()) #10, !dbg !703
  %306 = zext i32 %303 to i64, !dbg !707
  %307 = shl nuw nsw i32 %296, 8, !dbg !708
  %308 = add nuw nsw i32 %307, 1536, !dbg !708
  %309 = zext i32 %308 to i64, !dbg !709
  %310 = add nuw nsw i64 %304, %309, !dbg !710
  %311 = add nuw nsw i64 %310, %305, !dbg !711
  %312 = add nuw nsw i64 %311, %306, !dbg !712
  call void @llvm.dbg.value(metadata i64 %312, metadata !702, metadata !DIExpression()) #10, !dbg !703
  %313 = and i64 %312, 4294967295, !dbg !713
  %314 = lshr i64 %312, 32, !dbg !714
  %315 = add nuw nsw i64 %313, %314, !dbg !715
  call void @llvm.dbg.value(metadata i64 %315, metadata !702, metadata !DIExpression()) #10, !dbg !703
  %316 = lshr i64 %315, 32, !dbg !716
  %317 = add nuw nsw i64 %316, %315, !dbg !717
  call void @llvm.dbg.value(metadata !DIArgList(i64 %315, i64 %316), metadata !702, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !703
  %318 = trunc i64 %317 to i32, !dbg !718
  call void @llvm.dbg.value(metadata i32 %318, metadata !669, metadata !DIExpression()) #10, !dbg !719
  %319 = and i32 %318, 65535, !dbg !721
  %320 = lshr i32 %318, 16, !dbg !722
  %321 = add nuw nsw i32 %319, %320, !dbg !723
  call void @llvm.dbg.value(metadata i32 %321, metadata !669, metadata !DIExpression()) #10, !dbg !719
  %322 = lshr i32 %321, 16, !dbg !724
  %323 = add nuw nsw i32 %322, %321, !dbg !725
  call void @llvm.dbg.value(metadata !DIArgList(i32 %321, i32 %322), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !719
  %324 = trunc i32 %323 to i16, !dbg !726
  %325 = icmp eq i16 %324, -1, !dbg !727
  br i1 %325, label %326, label %782, !dbg !728

326:                                              ; preds = %299
  call void @llvm.dbg.value(metadata i16 20, metadata !638, metadata !DIExpression()) #10, !dbg !646
  %327 = call i64 inttoptr (i64 204 to i64 (%struct.iphdr*, %struct.tcphdr*, i32)*)(%struct.iphdr* noundef nonnull %252, %struct.tcphdr* noundef nonnull %255, i32 noundef %296) #10, !dbg !729
  call void @llvm.dbg.value(metadata i64 %327, metadata !640, metadata !DIExpression()) #10, !dbg !646
  br label %388, !dbg !730

328:                                              ; preds = %274
  %329 = icmp eq %struct.ipv6hdr* %251, null, !dbg !731
  br i1 %329, label %782, label %330, !dbg !733

330:                                              ; preds = %328
  %331 = bitcast i8* %253 to i32*, !dbg !734
  %332 = zext i16 %263 to i32, !dbg !736
  %333 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef null, i32 noundef 0, i32* noundef %331, i32 noundef %332, i32 noundef 0) #10, !dbg !737
  call void @llvm.dbg.value(metadata i64 %333, metadata !640, metadata !DIExpression()) #10, !dbg !646
  %334 = icmp slt i64 %333, 0, !dbg !738
  br i1 %334, label %782, label %335, !dbg !740

335:                                              ; preds = %330
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %251, metadata !741, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)) #10, !dbg !754
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %251, metadata !748, metadata !DIExpression(DW_OP_plus_uconst, 24, DW_OP_stack_value)) #10, !dbg !754
  call void @llvm.dbg.value(metadata i32 %332, metadata !749, metadata !DIExpression()) #10, !dbg !754
  call void @llvm.dbg.value(metadata i8 6, metadata !750, metadata !DIExpression()) #10, !dbg !754
  %336 = and i64 %333, 4294967295, !dbg !757
  call void @llvm.dbg.value(metadata i64 %333, metadata !751, metadata !DIExpression()) #10, !dbg !754
  call void @llvm.dbg.value(metadata i64 0, metadata !753, metadata !DIExpression()) #10, !dbg !754
  call void @llvm.dbg.value(metadata i64 %336, metadata !752, metadata !DIExpression()) #10, !dbg !754
  %337 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 0, !dbg !758
  %338 = load i32, i32* %337, align 4, !dbg !758, !tbaa !483
  %339 = zext i32 %338 to i64, !dbg !761
  call void @llvm.dbg.value(metadata i64 1, metadata !753, metadata !DIExpression()) #10, !dbg !754
  call void @llvm.dbg.value(metadata i64 undef, metadata !752, metadata !DIExpression()) #10, !dbg !754
  %340 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !758
  %341 = load i32, i32* %340, align 4, !dbg !758, !tbaa !483
  %342 = zext i32 %341 to i64, !dbg !761
  call void @llvm.dbg.value(metadata i64 2, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %343 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !758
  %344 = load i32, i32* %343, align 4, !dbg !758, !tbaa !483
  %345 = zext i32 %344 to i64, !dbg !761
  call void @llvm.dbg.value(metadata i64 3, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %346 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !758
  %347 = load i32, i32* %346, align 4, !dbg !758, !tbaa !483
  %348 = zext i32 %347 to i64, !dbg !761
  call void @llvm.dbg.value(metadata i64 0, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %349 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 0, !dbg !762
  %350 = load i32, i32* %349, align 4, !dbg !762, !tbaa !483
  %351 = zext i32 %350 to i64, !dbg !765
  call void @llvm.dbg.value(metadata i64 1, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %352 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 1, !dbg !762
  %353 = load i32, i32* %352, align 4, !dbg !762, !tbaa !483
  %354 = zext i32 %353 to i64, !dbg !765
  call void @llvm.dbg.value(metadata i64 2, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %355 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 2, !dbg !762
  %356 = load i32, i32* %355, align 4, !dbg !762, !tbaa !483
  %357 = zext i32 %356 to i64, !dbg !765
  call void @llvm.dbg.value(metadata i64 3, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %358 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 3, !dbg !762
  %359 = load i32, i32* %358, align 4, !dbg !762, !tbaa !483
  %360 = zext i32 %359 to i64, !dbg !765
  call void @llvm.dbg.value(metadata i64 4, metadata !753, metadata !DIExpression()) #10, !dbg !754
  %361 = shl nuw nsw i32 %332, 24, !dbg !766
  call void @llvm.dbg.value(metadata !DIArgList(i64 undef, i32 %361), metadata !752, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !754
  call void @llvm.dbg.value(metadata i64 undef, metadata !752, metadata !DIExpression()) #10, !dbg !754
  %362 = add nuw nsw i32 %361, 100663296, !dbg !767
  %363 = zext i32 %362 to i64, !dbg !767
  %364 = add nuw nsw i64 %336, %363, !dbg !767
  %365 = add nuw nsw i64 %364, %339, !dbg !767
  %366 = add nuw nsw i64 %365, %342, !dbg !767
  %367 = add nuw nsw i64 %366, %345, !dbg !768
  %368 = add nuw nsw i64 %367, %348, !dbg !768
  %369 = add nuw nsw i64 %368, %351, !dbg !768
  %370 = add nuw nsw i64 %369, %354, !dbg !768
  %371 = add nuw nsw i64 %370, %357, !dbg !769
  %372 = add nuw nsw i64 %371, %360, !dbg !770
  call void @llvm.dbg.value(metadata i64 %372, metadata !752, metadata !DIExpression()) #10, !dbg !754
  %373 = and i64 %372, 4294967295, !dbg !771
  %374 = lshr i64 %372, 32, !dbg !772
  %375 = add nuw nsw i64 %373, %374, !dbg !773
  call void @llvm.dbg.value(metadata i64 %375, metadata !752, metadata !DIExpression()) #10, !dbg !754
  %376 = lshr i64 %375, 32, !dbg !774
  %377 = add nuw nsw i64 %376, %375, !dbg !775
  call void @llvm.dbg.value(metadata !DIArgList(i64 %375, i64 %376), metadata !752, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !754
  %378 = trunc i64 %377 to i32, !dbg !776
  call void @llvm.dbg.value(metadata i32 %378, metadata !669, metadata !DIExpression()) #10, !dbg !777
  %379 = and i32 %378, 65535, !dbg !779
  %380 = lshr i32 %378, 16, !dbg !780
  %381 = add nuw nsw i32 %379, %380, !dbg !781
  call void @llvm.dbg.value(metadata i32 %381, metadata !669, metadata !DIExpression()) #10, !dbg !777
  %382 = lshr i32 %381, 16, !dbg !782
  %383 = add nuw nsw i32 %382, %381, !dbg !783
  call void @llvm.dbg.value(metadata !DIArgList(i32 %381, i32 %382), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !777
  %384 = trunc i32 %383 to i16, !dbg !784
  %385 = icmp eq i16 %384, -1, !dbg !785
  br i1 %385, label %386, label %782, !dbg !786

386:                                              ; preds = %335
  call void @llvm.dbg.value(metadata i16 40, metadata !638, metadata !DIExpression()) #10, !dbg !646
  %387 = call i64 inttoptr (i64 205 to i64 (%struct.ipv6hdr*, %struct.tcphdr*, i32)*)(%struct.ipv6hdr* noundef nonnull %251, %struct.tcphdr* noundef nonnull %255, i32 noundef %332) #10, !dbg !787
  call void @llvm.dbg.value(metadata i64 %387, metadata !640, metadata !DIExpression()) #10, !dbg !646
  br label %388

388:                                              ; preds = %386, %326
  %389 = phi i64 [ 20, %326 ], [ 40, %386 ]
  %390 = phi i64 [ %327, %326 ], [ %387, %386 ], !dbg !788
  call void @llvm.dbg.value(metadata i64 %390, metadata !640, metadata !DIExpression()) #10, !dbg !646
  call void @llvm.dbg.value(metadata i16 undef, metadata !638, metadata !DIExpression()) #10, !dbg !646
  %391 = icmp slt i64 %390, 0, !dbg !789
  br i1 %391, label %782, label %392, !dbg !791

392:                                              ; preds = %388
  %393 = trunc i64 %390 to i32, !dbg !792
  call void @llvm.dbg.value(metadata i32 %393, metadata !639, metadata !DIExpression()) #10, !dbg !646
  %394 = bitcast i64* %10 to i32*, !dbg !793
  %395 = getelementptr inbounds [2 x i32], [2 x i32]* %269, i64 0, i64 1, !dbg !795
  call void @llvm.dbg.value(metadata %struct.tcphdr* %255, metadata !796, metadata !DIExpression()) #10, !dbg !807
  call void @llvm.dbg.value(metadata i16 %263, metadata !801, metadata !DIExpression()) #10, !dbg !807
  call void @llvm.dbg.value(metadata i32* %394, metadata !802, metadata !DIExpression()) #10, !dbg !807
  call void @llvm.dbg.value(metadata i32* %395, metadata !803, metadata !DIExpression()) #10, !dbg !807
  call void @llvm.dbg.value(metadata i8* %229, metadata !804, metadata !DIExpression()) #10, !dbg !807
  %396 = bitcast %struct.tcpopt_context* %8 to i8*, !dbg !809
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %396) #10, !dbg !809
  call void @llvm.dbg.declare(metadata %struct.tcpopt_context* %8, metadata !805, metadata !DIExpression()) #10, !dbg !810
  %397 = getelementptr inbounds i8, i8* %253, i64 20, !dbg !811
  %398 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 0, !dbg !812
  store i8* %397, i8** %398, align 8, !dbg !812, !tbaa !813
  %399 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 1, !dbg !812
  %400 = zext i16 %263 to i64
  %401 = getelementptr inbounds i8, i8* %253, i64 %400, !dbg !816
  store i8* %401, i8** %399, align 8, !dbg !812, !tbaa !817
  %402 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 2, !dbg !812
  store i8* %229, i8** %402, align 8, !dbg !812, !tbaa !818
  %403 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 3, !dbg !812
  store i32* %395, i32** %403, align 8, !dbg !812, !tbaa !819
  %404 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 4, !dbg !812
  store i8 15, i8* %404, align 8, !dbg !812, !tbaa !820
  %405 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 5, !dbg !812
  store i8 0, i8* %405, align 1, !dbg !812, !tbaa !821
  %406 = getelementptr inbounds %struct.tcpopt_context, %struct.tcpopt_context* %8, i64 0, i32 6, !dbg !812
  store i8 0, i8* %406, align 2, !dbg !812, !tbaa !822
  %407 = call i64 inttoptr (i64 181 to i64 (i32, i8*, i8*, i64)*)(i32 noundef 6, i8* noundef bitcast (i32 (i32, i8*)* @tscookie_tcpopt_parse_batch to i8*), i8* noundef nonnull %396, i64 noundef 0) #10, !dbg !823
  %408 = load i8, i8* %405, align 1, !dbg !824, !tbaa !821, !range !826
  %409 = icmp eq i8 %408, 0, !dbg !824
  br i1 %409, label %410, label %411, !dbg !827

410:                                              ; preds = %392
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %396) #10, !dbg !828
  br label %429

411:                                              ; preds = %392
  %412 = call i64 inttoptr (i64 5 to i64 ()*)() #10, !dbg !829
  call void @llvm.dbg.value(metadata i64 %412, metadata !837, metadata !DIExpression()) #10, !dbg !842
  %413 = udiv i64 %412, 1000000, !dbg !844
  %414 = trunc i64 %413 to i32, !dbg !845
  %415 = and i32 %414, -64, !dbg !846
  call void @llvm.dbg.value(metadata i32 %415, metadata !806, metadata !DIExpression()) #10, !dbg !807
  %416 = load i8, i8* %404, align 8, !dbg !847, !tbaa !820
  %417 = and i8 %416, 15, !dbg !848
  %418 = zext i8 %417 to i32, !dbg !848
  %419 = or i32 %415, %418, !dbg !849
  call void @llvm.dbg.value(metadata i32 %419, metadata !806, metadata !DIExpression()) #10, !dbg !807
  %420 = load i8, i8* %406, align 2, !dbg !850, !tbaa !822, !range !826
  %421 = icmp eq i8 %420, 0, !dbg !850
  %422 = or i32 %419, 16, !dbg !852
  %423 = select i1 %421, i32 %419, i32 %422, !dbg !852
  call void @llvm.dbg.value(metadata i32 %423, metadata !806, metadata !DIExpression()) #10, !dbg !807
  %424 = load i16, i16* %260, align 4, !dbg !853
  %425 = icmp ugt i16 %424, -16385, !dbg !855
  %426 = or i32 %423, 32, !dbg !855
  %427 = select i1 %425, i32 %426, i32 %423, !dbg !855
  call void @llvm.dbg.value(metadata i32 %427, metadata !806, metadata !DIExpression()) #10, !dbg !807
  %428 = call i32 @llvm.bswap.i32(i32 %427) #10, !dbg !856
  store i32 %428, i32* %394, align 8, !dbg !857, !tbaa !552
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %396) #10, !dbg !828
  store volatile i32* %394, i32** %9, align 8, !dbg !858, !tbaa !650
  br label %429, !dbg !859

429:                                              ; preds = %411, %410
  %430 = getelementptr i8, i8* %232, i64 14, !dbg !860
  %431 = getelementptr i8, i8* %430, i64 %389, !dbg !862
  %432 = getelementptr i8, i8* %431, i64 60, !dbg !863
  %433 = icmp ugt i8* %432, %229, !dbg !864
  br i1 %433, label %782, label %434, !dbg !865

434:                                              ; preds = %429
  br i1 %275, label %548, label %435, !dbg !866

435:                                              ; preds = %434
  %436 = getelementptr %struct.iphdr, %struct.iphdr* %252, i64 0, i32 0, !dbg !867
  %437 = load i8, i8* %436, align 4, !dbg !867
  %438 = and i8 %437, 14, !dbg !868
  %439 = icmp ugt i8 %438, 5, !dbg !868
  br i1 %439, label %440, label %446, !dbg !869

440:                                              ; preds = %435
  %441 = getelementptr i8, i8* %232, i64 34, !dbg !870
  call void @llvm.dbg.value(metadata i8* %441, metadata !641, metadata !DIExpression()) #10, !dbg !871
  call void @llvm.memmove.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %441, i8* noundef nonnull align 4 dereferenceable(20) %253, i64 20, i1 false) #10, !dbg !872
  %442 = bitcast i8* %441 to %struct.tcphdr*, !dbg !873
  call void @llvm.dbg.value(metadata %struct.tcphdr* %442, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !345
  %443 = load i8, i8* %436, align 4, !dbg !874
  %444 = and i8 %443, -16, !dbg !874
  %445 = or i8 %444, 5, !dbg !874
  store i8 %445, i8* %436, align 4, !dbg !874
  br label %446, !dbg !875

446:                                              ; preds = %440, %435
  %447 = phi %struct.tcphdr* [ %442, %440 ], [ %255, %435 ], !dbg !591
  call void @llvm.dbg.value(metadata %struct.tcphdr* %447, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !345
  %448 = load volatile i32*, i32** %9, align 8, !dbg !876, !tbaa !650
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !877, metadata !DIExpression()) #10, !dbg !889
  call void @llvm.dbg.value(metadata i32 %393, metadata !882, metadata !DIExpression()) #10, !dbg !889
  call void @llvm.dbg.value(metadata i32* %448, metadata !883, metadata !DIExpression()) #10, !dbg !889
  call void @llvm.dbg.value(metadata i16* undef, metadata !891, metadata !DIExpression()) #10, !dbg !901
  call void @llvm.dbg.value(metadata i8* undef, metadata !896, metadata !DIExpression()) #10, !dbg !901
  call void @llvm.dbg.value(metadata i8* undef, metadata !897, metadata !DIExpression()) #10, !dbg !901
  call void @llvm.dbg.value(metadata i1 false, metadata !898, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !901
  %449 = bitcast i32* %7 to i8*, !dbg !903
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %449) #10, !dbg !903
  call void @llvm.dbg.value(metadata i32 0, metadata !899, metadata !DIExpression()) #10, !dbg !901
  store i32 0, i32* %7, align 4, !dbg !904, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %7, metadata !899, metadata !DIExpression(DW_OP_deref)) #10, !dbg !901
  %450 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @values to i8*), i8* noundef nonnull %449) #10, !dbg !905
  call void @llvm.dbg.value(metadata i8* %450, metadata !900, metadata !DIExpression()) #10, !dbg !901
  %451 = icmp eq i8* %450, null, !dbg !906
  br i1 %451, label %465, label %452, !dbg !908

452:                                              ; preds = %446
  %453 = bitcast i8* %450 to i64*, !dbg !905
  call void @llvm.dbg.value(metadata i64* %453, metadata !900, metadata !DIExpression()) #10, !dbg !901
  %454 = load i64, i64* %453, align 8, !dbg !909, !tbaa !910
  %455 = icmp eq i64 %454, 0, !dbg !912
  br i1 %455, label %465, label %456, !dbg !913

456:                                              ; preds = %452
  %457 = trunc i64 %454 to i32, !dbg !914
  %458 = lshr i32 %457, 16, !dbg !917
  %459 = and i32 %458, 15, !dbg !917
  %460 = lshr i64 %454, 24, !dbg !918
  %461 = trunc i64 %460 to i8, !dbg !919
  %462 = and i32 %457, 65535, !dbg !920
  %463 = or i32 %462, 33816576, !dbg !920
  %464 = or i32 %459, 16974592, !dbg !920
  br label %465, !dbg !920

465:                                              ; preds = %456, %452, %446
  %466 = phi i32 [ %463, %456 ], [ 33818036, %452 ], [ 33818036, %446 ]
  %467 = phi i32 [ %464, %456 ], [ 16974599, %452 ], [ 16974599, %446 ]
  %468 = phi i8 [ %461, %456 ], [ 64, %452 ], [ 64, %446 ], !dbg !901
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %449) #10, !dbg !921
  %469 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %254, i64 0, i32 1, i64 0, !dbg !922
  %470 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %254, i64 0, i32 0, i64 0, !dbg !923
  call void @llvm.dbg.value(metadata i8* %469, metadata !924, metadata !DIExpression()) #10, !dbg !932
  call void @llvm.dbg.value(metadata i8* %470, metadata !929, metadata !DIExpression()) #10, !dbg !932
  %471 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 0, !dbg !934
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %471), !dbg !934
  call void @llvm.dbg.declare(metadata [6 x i8]* %6, metadata !930, metadata !DIExpression()) #10, !dbg !935
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %471, i8* noundef nonnull align 1 dereferenceable(6) %469, i64 6, i1 false) #10, !dbg !936
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %469, i8* noundef nonnull align 1 dereferenceable(6) %470, i64 6, i1 false) #10, !dbg !937
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %470, i8* noundef nonnull align 1 dereferenceable(6) %471, i64 6, i1 false) #10, !dbg !938
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %471), !dbg !939
  %472 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 0, !dbg !940
  %473 = load i32, i32* %472, align 4, !dbg !940, !tbaa !483
  call void @llvm.dbg.value(metadata i32 %473, metadata !887, metadata !DIExpression()) #10, !dbg !941
  %474 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 1, !dbg !940
  %475 = load i32, i32* %474, align 4, !dbg !940, !tbaa !483
  store i32 %475, i32* %472, align 4, !dbg !940, !tbaa !483
  store i32 %473, i32* %474, align 4, !dbg !940, !tbaa !483
  %476 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 7, !dbg !942
  store i16 0, i16* %476, align 2, !dbg !943, !tbaa !944
  %477 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 1, !dbg !945
  store i8 0, i8* %477, align 1, !dbg !946, !tbaa !947
  %478 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 3, !dbg !948
  store i16 0, i16* %478, align 4, !dbg !949, !tbaa !950
  call void @llvm.dbg.value(metadata i8 %468, metadata !886, metadata !DIExpression()) #10, !dbg !889
  %479 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 5, !dbg !951
  store i8 %468, i8* %479, align 4, !dbg !952, !tbaa !953
  call void @llvm.dbg.value(metadata i16 undef, metadata !885, metadata !DIExpression()) #10, !dbg !889
  call void @llvm.dbg.value(metadata i8 undef, metadata !884, metadata !DIExpression()) #10, !dbg !889
  call void @llvm.dbg.value(metadata %struct.tcphdr* %447, metadata !954, metadata !DIExpression()) #10, !dbg !966
  call void @llvm.dbg.value(metadata i32 %393, metadata !959, metadata !DIExpression()) #10, !dbg !966
  call void @llvm.dbg.value(metadata i32* %448, metadata !960, metadata !DIExpression()) #10, !dbg !966
  call void @llvm.dbg.value(metadata i16 undef, metadata !961, metadata !DIExpression()) #10, !dbg !966
  call void @llvm.dbg.value(metadata i8 undef, metadata !962, metadata !DIExpression()) #10, !dbg !966
  %480 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 4, !dbg !968
  %481 = bitcast i16* %480 to i32*, !dbg !968
  store i32 4608, i32* %481, align 4, !dbg !969, !tbaa !483
  %482 = icmp eq i32* %448, null, !dbg !970
  br i1 %482, label %488, label %483, !dbg !972

483:                                              ; preds = %465
  %484 = load i32, i32* %448, align 4, !dbg !973, !tbaa !552
  %485 = and i32 %484, 536870912, !dbg !974
  %486 = icmp eq i32 %485, 0, !dbg !974
  br i1 %486, label %488, label %487, !dbg !975

487:                                              ; preds = %483
  br label %488, !dbg !976

488:                                              ; preds = %487, %483, %465
  %489 = phi i16 [ 20992, %487 ], [ 4608, %483 ], [ 4608, %465 ], !dbg !977
  %490 = or i16 %489, 80, !dbg !977
  store i16 %490, i16* %480, align 4, !dbg !977
  %491 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 0, !dbg !978
  %492 = load i16, i16* %491, align 4, !dbg !978, !tbaa !491
  call void @llvm.dbg.value(metadata i16 %492, metadata !964, metadata !DIExpression()) #10, !dbg !979
  %493 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 1, !dbg !978
  %494 = load i16, i16* %493, align 2, !dbg !978, !tbaa !496
  store i16 %494, i16* %491, align 4, !dbg !978, !tbaa !491
  store i16 %492, i16* %493, align 2, !dbg !978, !tbaa !496
  %495 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 2, !dbg !980
  %496 = load i32, i32* %495, align 4, !dbg !980, !tbaa !981
  %497 = call i32 @llvm.bswap.i32(i32 %496) #10, !dbg !980
  %498 = add i32 %497, 1, !dbg !980
  %499 = call i32 @llvm.bswap.i32(i32 %498) #10, !dbg !980
  %500 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 3, !dbg !982
  store i32 %499, i32* %500, align 4, !dbg !983, !tbaa !984
  %501 = call i32 @llvm.bswap.i32(i32 %393) #10, !dbg !985
  store i32 %501, i32* %495, align 4, !dbg !986, !tbaa !981
  %502 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 5, !dbg !987
  store i16 0, i16* %502, align 2, !dbg !988, !tbaa !989
  %503 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 7, !dbg !990
  store i16 0, i16* %503, align 2, !dbg !991, !tbaa !992
  %504 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 0, i32 6, !dbg !993
  store i16 0, i16* %504, align 4, !dbg !994, !tbaa !995
  %505 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 1, !dbg !996
  %506 = bitcast %struct.tcphdr* %505 to i32*, !dbg !997
  call void @llvm.dbg.value(metadata i32* %506, metadata !963, metadata !DIExpression()) #10, !dbg !966
  call void @llvm.dbg.value(metadata i32* %506, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  call void @llvm.dbg.value(metadata i32* %448, metadata !1003, metadata !DIExpression()) #10, !dbg !1007
  call void @llvm.dbg.value(metadata i16 undef, metadata !1004, metadata !DIExpression()) #10, !dbg !1007
  call void @llvm.dbg.value(metadata i8 undef, metadata !1005, metadata !DIExpression()) #10, !dbg !1007
  call void @llvm.dbg.value(metadata i32* %506, metadata !1006, metadata !DIExpression()) #10, !dbg !1007
  %507 = call i32 @llvm.bswap.i32(i32 %466) #10, !dbg !1009
  call void @llvm.dbg.value(metadata i32* %506, metadata !998, metadata !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value)) #10, !dbg !1007
  store i32 %507, i32* %506, align 4, !dbg !1010, !tbaa !552
  br i1 %482, label %536, label %508, !dbg !1011

508:                                              ; preds = %488
  %509 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 1, i32 2, !dbg !1012
  call void @llvm.dbg.value(metadata i32* %509, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  %510 = load i32, i32* %448, align 4, !dbg !1013, !tbaa !552
  %511 = and i32 %510, 268435456, !dbg !1015
  %512 = icmp eq i32 %511, 0, !dbg !1015
  call void @llvm.dbg.value(metadata i32* %506, metadata !998, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)) #10, !dbg !1007
  %513 = select i1 %512, i32 168296705, i32 168296964
  %514 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 1, i32 3, !dbg !1016
  store i32 %513, i32* %509, align 4, !dbg !1016, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %514, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  %515 = load i32, i32* %448, align 4, !dbg !1017, !tbaa !552
  %516 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 1, i32 4, !dbg !1018
  %517 = bitcast i16* %516 to i32*, !dbg !1018
  call void @llvm.dbg.value(metadata i32* %517, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  store i32 %515, i32* %514, align 4, !dbg !1019, !tbaa !552
  %518 = getelementptr inbounds i32, i32* %448, i64 1, !dbg !1020
  %519 = load i32, i32* %518, align 4, !dbg !1020, !tbaa !552
  %520 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 1, i32 6, !dbg !1021
  %521 = bitcast i16* %520 to i32*, !dbg !1021
  call void @llvm.dbg.value(metadata i32* %521, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  store i32 %519, i32* %517, align 4, !dbg !1022, !tbaa !552
  %522 = load i32, i32* %448, align 4, !dbg !1023, !tbaa !552
  %523 = and i32 %522, 251658240, !dbg !1025
  %524 = icmp eq i32 %523, 251658240, !dbg !1026
  br i1 %524, label %529, label %525, !dbg !1027

525:                                              ; preds = %508
  %526 = call i32 @llvm.bswap.i32(i32 %467) #10, !dbg !1028
  %527 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %447, i64 2, !dbg !1029
  %528 = bitcast %struct.tcphdr* %527 to i32*, !dbg !1029
  call void @llvm.dbg.value(metadata i32* %528, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  store i32 %526, i32* %521, align 4, !dbg !1030, !tbaa !552
  br label %529, !dbg !1031

529:                                              ; preds = %525, %508
  %530 = phi i32* [ %528, %525 ], [ %521, %508 ], !dbg !1007
  call void @llvm.dbg.value(metadata i32* %530, metadata !998, metadata !DIExpression()) #10, !dbg !1007
  %531 = ptrtoint i32* %530 to i64, !dbg !1032
  %532 = ptrtoint %struct.tcphdr* %505 to i64, !dbg !1032
  %533 = sub i64 %531, %532, !dbg !1032
  %534 = lshr exact i64 %533, 2, !dbg !1032
  %535 = trunc i64 %534 to i8, !dbg !1033
  br label %536, !dbg !1034

536:                                              ; preds = %529, %488
  %537 = phi i8 [ %535, %529 ], [ 1, %488 ], !dbg !1007
  %538 = zext i8 %537 to i16, !dbg !1035
  %539 = shl nuw nsw i16 %538, 4, !dbg !1036
  %540 = add nuw nsw i16 %539, 80, !dbg !1036
  %541 = and i16 %540, 240, !dbg !1036
  %542 = or i16 %541, %489, !dbg !1036
  store i16 %542, i16* %480, align 4, !dbg !1036
  %543 = lshr exact i16 %540, 2, !dbg !1037
  %544 = and i16 %543, 60, !dbg !1037
  call void @llvm.dbg.value(metadata i16 %544, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 16)), !dbg !345
  %545 = shl nuw nsw i16 %544, 8, !dbg !1038
  %546 = add nuw nsw i16 %545, 5120, !dbg !1038
  %547 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 2, !dbg !1039
  store i16 %546, i16* %547, align 2, !dbg !1040, !tbaa !1041
  br label %659, !dbg !1042

548:                                              ; preds = %434
  %549 = icmp eq %struct.ipv6hdr* %251, null, !dbg !1043
  br i1 %549, label %782, label %550, !dbg !1045

550:                                              ; preds = %548
  %551 = load volatile i32*, i32** %9, align 8, !dbg !1046, !tbaa !650
  call void @llvm.dbg.declare(metadata [4 x i32]* %5, metadata !1048, metadata !DIExpression()) #10, !dbg !1058
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !1052, metadata !DIExpression()) #10, !dbg !1060
  call void @llvm.dbg.value(metadata i32 %393, metadata !1053, metadata !DIExpression()) #10, !dbg !1060
  call void @llvm.dbg.value(metadata i32* %551, metadata !1054, metadata !DIExpression()) #10, !dbg !1060
  call void @llvm.dbg.value(metadata i16* undef, metadata !891, metadata !DIExpression()) #10, !dbg !1061
  call void @llvm.dbg.value(metadata i8* undef, metadata !896, metadata !DIExpression()) #10, !dbg !1061
  call void @llvm.dbg.value(metadata i8* undef, metadata !897, metadata !DIExpression()) #10, !dbg !1061
  call void @llvm.dbg.value(metadata i1 true, metadata !898, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !1061
  %552 = bitcast i32* %4 to i8*, !dbg !1063
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %552) #10, !dbg !1063
  call void @llvm.dbg.value(metadata i32 0, metadata !899, metadata !DIExpression()) #10, !dbg !1061
  store i32 0, i32* %4, align 4, !dbg !1064, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %4, metadata !899, metadata !DIExpression(DW_OP_deref)) #10, !dbg !1061
  %553 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @values to i8*), i8* noundef nonnull %552) #10, !dbg !1065
  call void @llvm.dbg.value(metadata i8* %553, metadata !900, metadata !DIExpression()) #10, !dbg !1061
  %554 = icmp eq i8* %553, null, !dbg !1066
  br i1 %554, label %570, label %555, !dbg !1067

555:                                              ; preds = %550
  %556 = bitcast i8* %553 to i64*, !dbg !1065
  call void @llvm.dbg.value(metadata i64* %556, metadata !900, metadata !DIExpression()) #10, !dbg !1061
  %557 = load i64, i64* %556, align 8, !dbg !1068, !tbaa !910
  %558 = icmp eq i64 %557, 0, !dbg !1069
  br i1 %558, label %570, label %559, !dbg !1070

559:                                              ; preds = %555
  %560 = lshr i64 %557, 32, !dbg !1071
  %561 = trunc i64 %560 to i32, !dbg !1072
  %562 = trunc i64 %557 to i32, !dbg !1073
  %563 = lshr i32 %562, 16, !dbg !1073
  %564 = and i32 %563, 15, !dbg !1073
  %565 = lshr i64 %557, 24, !dbg !1074
  %566 = trunc i64 %565 to i8, !dbg !1075
  %567 = and i32 %561, 65535, !dbg !1076
  %568 = or i32 %567, 33816576, !dbg !1076
  %569 = or i32 %564, 16974592, !dbg !1076
  br label %570, !dbg !1076

570:                                              ; preds = %559, %555, %550
  %571 = phi i32 [ %568, %559 ], [ 33818016, %555 ], [ 33818016, %550 ]
  %572 = phi i32 [ %569, %559 ], [ 16974599, %555 ], [ 16974599, %550 ]
  %573 = phi i8 [ %566, %559 ], [ 64, %555 ], [ 64, %550 ], !dbg !1061
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %552) #10, !dbg !1077
  %574 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %254, i64 0, i32 1, i64 0, !dbg !1078
  %575 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %254, i64 0, i32 0, i64 0, !dbg !1079
  call void @llvm.dbg.value(metadata i8* %574, metadata !924, metadata !DIExpression()) #10, !dbg !1080
  call void @llvm.dbg.value(metadata i8* %575, metadata !929, metadata !DIExpression()) #10, !dbg !1080
  %576 = getelementptr inbounds [6 x i8], [6 x i8]* %3, i64 0, i64 0, !dbg !1082
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %576), !dbg !1082
  call void @llvm.dbg.declare(metadata [6 x i8]* %3, metadata !930, metadata !DIExpression()) #10, !dbg !1083
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %576, i8* noundef nonnull align 1 dereferenceable(6) %574, i64 6, i1 false) #10, !dbg !1084
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %574, i8* noundef nonnull align 1 dereferenceable(6) %575, i64 6, i1 false) #10, !dbg !1085
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %575, i8* noundef nonnull align 1 dereferenceable(6) %576, i64 6, i1 false) #10, !dbg !1086
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %576), !dbg !1087
  %577 = bitcast [4 x i32]* %5 to i8*, !dbg !1058
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %577), !dbg !1058
  %578 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, !dbg !1058
  %579 = bitcast %union.anon.1* %578 to i8*, !dbg !1058
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %577, i8* noundef nonnull align 4 dereferenceable(16) %579, i64 16, i1 false) #10, !dbg !1058, !tbaa.struct !1088
  %580 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, !dbg !1058
  %581 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, !dbg !1058
  %582 = bitcast %struct.anon.2* %580 to i8*, !dbg !1058
  %583 = bitcast %struct.in6_addr* %581 to i8*, !dbg !1058
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %582, i8* noundef nonnull align 4 dereferenceable(16) %583, i64 16, i1 false) #10, !dbg !1058, !tbaa.struct !1088
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %583, i8* noundef nonnull align 4 dereferenceable(16) %577, i64 16, i1 false) #10, !dbg !1058, !tbaa.struct !1088
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %577), !dbg !1089
  %584 = bitcast %struct.ipv6hdr* %251 to i32*, !dbg !1090
  store i32 96, i32* %584, align 4, !dbg !1091, !tbaa !552
  call void @llvm.dbg.value(metadata i8 %573, metadata !1057, metadata !DIExpression()) #10, !dbg !1060
  %585 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 4, !dbg !1092
  store i8 %573, i8* %585, align 1, !dbg !1093, !tbaa !1094
  call void @llvm.dbg.value(metadata i16 undef, metadata !1056, metadata !DIExpression()) #10, !dbg !1060
  call void @llvm.dbg.value(metadata i8 undef, metadata !1055, metadata !DIExpression()) #10, !dbg !1060
  call void @llvm.dbg.value(metadata %struct.tcphdr* %255, metadata !954, metadata !DIExpression()) #10, !dbg !1095
  call void @llvm.dbg.value(metadata i32 %393, metadata !959, metadata !DIExpression()) #10, !dbg !1095
  call void @llvm.dbg.value(metadata i32* %551, metadata !960, metadata !DIExpression()) #10, !dbg !1095
  call void @llvm.dbg.value(metadata i16 undef, metadata !961, metadata !DIExpression()) #10, !dbg !1095
  call void @llvm.dbg.value(metadata i8 undef, metadata !962, metadata !DIExpression()) #10, !dbg !1095
  %586 = bitcast i8* %259 to i32*, !dbg !1097
  store i32 4608, i32* %586, align 4, !dbg !1098, !tbaa !483
  %587 = icmp eq i32* %551, null, !dbg !1099
  br i1 %587, label %593, label %588, !dbg !1100

588:                                              ; preds = %570
  %589 = load i32, i32* %551, align 4, !dbg !1101, !tbaa !552
  %590 = and i32 %589, 536870912, !dbg !1102
  %591 = icmp eq i32 %590, 0, !dbg !1102
  br i1 %591, label %593, label %592, !dbg !1103

592:                                              ; preds = %588
  br label %593, !dbg !1104

593:                                              ; preds = %592, %588, %570
  %594 = phi i16 [ 20992, %592 ], [ 4608, %588 ], [ 4608, %570 ], !dbg !1105
  %595 = or i16 %594, 80, !dbg !1105
  store i16 %595, i16* %260, align 4, !dbg !1105
  %596 = bitcast i8* %253 to i16*, !dbg !1106
  %597 = load i16, i16* %596, align 4, !dbg !1106, !tbaa !491
  call void @llvm.dbg.value(metadata i16 %597, metadata !964, metadata !DIExpression()) #10, !dbg !1107
  %598 = getelementptr inbounds i8, i8* %253, i64 2, !dbg !1106
  %599 = bitcast i8* %598 to i16*, !dbg !1106
  %600 = load i16, i16* %599, align 2, !dbg !1106, !tbaa !496
  store i16 %600, i16* %596, align 4, !dbg !1106, !tbaa !491
  store i16 %597, i16* %599, align 2, !dbg !1106, !tbaa !496
  %601 = getelementptr inbounds i8, i8* %253, i64 4, !dbg !1108
  %602 = bitcast i8* %601 to i32*, !dbg !1108
  %603 = load i32, i32* %602, align 4, !dbg !1108, !tbaa !981
  %604 = call i32 @llvm.bswap.i32(i32 %603) #10, !dbg !1108
  %605 = add i32 %604, 1, !dbg !1108
  %606 = call i32 @llvm.bswap.i32(i32 %605) #10, !dbg !1108
  %607 = getelementptr inbounds i8, i8* %253, i64 8, !dbg !1109
  %608 = bitcast i8* %607 to i32*, !dbg !1109
  store i32 %606, i32* %608, align 4, !dbg !1110, !tbaa !984
  %609 = call i32 @llvm.bswap.i32(i32 %393) #10, !dbg !1111
  store i32 %609, i32* %602, align 4, !dbg !1112, !tbaa !981
  %610 = getelementptr inbounds i8, i8* %253, i64 14, !dbg !1113
  %611 = bitcast i8* %610 to i16*, !dbg !1113
  store i16 0, i16* %611, align 2, !dbg !1114, !tbaa !989
  %612 = getelementptr inbounds i8, i8* %253, i64 18, !dbg !1115
  %613 = bitcast i8* %612 to i16*, !dbg !1115
  store i16 0, i16* %613, align 2, !dbg !1116, !tbaa !992
  %614 = getelementptr inbounds i8, i8* %253, i64 16, !dbg !1117
  %615 = bitcast i8* %614 to i16*, !dbg !1117
  store i16 0, i16* %615, align 4, !dbg !1118, !tbaa !995
  %616 = bitcast i8* %397 to i32*, !dbg !1119
  call void @llvm.dbg.value(metadata i32* %616, metadata !963, metadata !DIExpression()) #10, !dbg !1095
  call void @llvm.dbg.value(metadata i32* %616, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  call void @llvm.dbg.value(metadata i32* %551, metadata !1003, metadata !DIExpression()) #10, !dbg !1120
  call void @llvm.dbg.value(metadata i16 undef, metadata !1004, metadata !DIExpression()) #10, !dbg !1120
  call void @llvm.dbg.value(metadata i8 undef, metadata !1005, metadata !DIExpression()) #10, !dbg !1120
  call void @llvm.dbg.value(metadata i32* %616, metadata !1006, metadata !DIExpression()) #10, !dbg !1120
  %617 = call i32 @llvm.bswap.i32(i32 %571) #10, !dbg !1122
  call void @llvm.dbg.value(metadata i32* %616, metadata !998, metadata !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value)) #10, !dbg !1120
  store i32 %617, i32* %616, align 4, !dbg !1123, !tbaa !552
  br i1 %587, label %648, label %618, !dbg !1124

618:                                              ; preds = %593
  %619 = getelementptr inbounds i8, i8* %253, i64 24, !dbg !1125
  %620 = bitcast i8* %619 to i32*, !dbg !1125
  call void @llvm.dbg.value(metadata i32* %620, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  %621 = load i32, i32* %551, align 4, !dbg !1126, !tbaa !552
  %622 = and i32 %621, 268435456, !dbg !1127
  %623 = icmp eq i32 %622, 0, !dbg !1127
  call void @llvm.dbg.value(metadata i32* %616, metadata !998, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)) #10, !dbg !1120
  %624 = select i1 %623, i32 168296705, i32 168296964
  %625 = getelementptr inbounds i8, i8* %253, i64 28, !dbg !1128
  %626 = bitcast i8* %625 to i32*, !dbg !1128
  store i32 %624, i32* %620, align 4, !dbg !1128, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %626, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  %627 = load i32, i32* %551, align 4, !dbg !1129, !tbaa !552
  %628 = getelementptr inbounds i8, i8* %253, i64 32, !dbg !1130
  %629 = bitcast i8* %628 to i32*, !dbg !1130
  call void @llvm.dbg.value(metadata i32* %629, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  store i32 %627, i32* %626, align 4, !dbg !1131, !tbaa !552
  %630 = getelementptr inbounds i32, i32* %551, i64 1, !dbg !1132
  %631 = load i32, i32* %630, align 4, !dbg !1132, !tbaa !552
  %632 = getelementptr inbounds i8, i8* %253, i64 36, !dbg !1133
  %633 = bitcast i8* %632 to i32*, !dbg !1133
  call void @llvm.dbg.value(metadata i32* %633, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  store i32 %631, i32* %629, align 4, !dbg !1134, !tbaa !552
  %634 = load i32, i32* %551, align 4, !dbg !1135, !tbaa !552
  %635 = and i32 %634, 251658240, !dbg !1136
  %636 = icmp eq i32 %635, 251658240, !dbg !1137
  br i1 %636, label %641, label %637, !dbg !1138

637:                                              ; preds = %618
  %638 = call i32 @llvm.bswap.i32(i32 %572) #10, !dbg !1139
  %639 = getelementptr inbounds i8, i8* %253, i64 40, !dbg !1140
  %640 = bitcast i8* %639 to i32*, !dbg !1140
  call void @llvm.dbg.value(metadata i32* %640, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  store i32 %638, i32* %633, align 4, !dbg !1141, !tbaa !552
  br label %641, !dbg !1142

641:                                              ; preds = %637, %618
  %642 = phi i32* [ %640, %637 ], [ %633, %618 ], !dbg !1120
  call void @llvm.dbg.value(metadata i32* %642, metadata !998, metadata !DIExpression()) #10, !dbg !1120
  %643 = ptrtoint i32* %642 to i64, !dbg !1143
  %644 = ptrtoint i8* %397 to i64, !dbg !1143
  %645 = sub i64 %643, %644, !dbg !1143
  %646 = lshr exact i64 %645, 2, !dbg !1143
  %647 = trunc i64 %646 to i8, !dbg !1144
  br label %648, !dbg !1145

648:                                              ; preds = %641, %593
  %649 = phi i8 [ %647, %641 ], [ 1, %593 ], !dbg !1120
  %650 = zext i8 %649 to i16, !dbg !1146
  %651 = shl nuw nsw i16 %650, 4, !dbg !1147
  %652 = add nuw nsw i16 %651, 80, !dbg !1147
  %653 = and i16 %652, 240, !dbg !1147
  %654 = or i16 %653, %594, !dbg !1147
  store i16 %654, i16* %260, align 4, !dbg !1147
  %655 = lshr exact i16 %652, 2, !dbg !1148
  %656 = and i16 %655, 60, !dbg !1148
  call void @llvm.dbg.value(metadata i16 %656, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 16)), !dbg !345
  %657 = shl nuw nsw i16 %656, 8, !dbg !1149
  %658 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 2, !dbg !1150
  store i16 %657, i16* %658, align 4, !dbg !1151, !tbaa !1152
  br label %659

659:                                              ; preds = %648, %536
  %660 = phi i16 [ %656, %648 ], [ %544, %536 ], !dbg !1153
  %661 = phi %struct.tcphdr* [ %255, %648 ], [ %447, %536 ], !dbg !591
  call void @llvm.dbg.value(metadata %struct.tcphdr* %661, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 64)), !dbg !345
  call void @llvm.dbg.value(metadata i16 %660, metadata !325, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 16)), !dbg !345
  %662 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %661, i64 0, i32 6, !dbg !1154
  store i16 0, i16* %662, align 4, !dbg !1155, !tbaa !995
  %663 = bitcast %struct.tcphdr* %661 to i32*, !dbg !1156
  %664 = zext i16 %660 to i32, !dbg !1157
  %665 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef null, i32 noundef 0, i32* noundef %663, i32 noundef %664, i32 noundef 0) #10, !dbg !1158
  call void @llvm.dbg.value(metadata i64 %665, metadata !640, metadata !DIExpression()) #10, !dbg !646
  %666 = icmp slt i64 %665, 0, !dbg !1159
  br i1 %666, label %782, label %667, !dbg !1161

667:                                              ; preds = %659
  br i1 %275, label %708, label %668, !dbg !1162

668:                                              ; preds = %667
  %669 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 0, !dbg !1163
  %670 = load i32, i32* %669, align 4, !dbg !1163, !tbaa !483
  %671 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 8, i32 0, i32 1, !dbg !1166
  %672 = load i32, i32* %671, align 4, !dbg !1166, !tbaa !483
  call void @llvm.dbg.value(metadata i32 %670, metadata !693, metadata !DIExpression()) #10, !dbg !1167
  call void @llvm.dbg.value(metadata i32 %672, metadata !698, metadata !DIExpression()) #10, !dbg !1167
  call void @llvm.dbg.value(metadata i16 %660, metadata !699, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !1167
  call void @llvm.dbg.value(metadata i8 6, metadata !700, metadata !DIExpression()) #10, !dbg !1167
  %673 = and i64 %665, 4294967295, !dbg !1169
  call void @llvm.dbg.value(metadata i64 %665, metadata !701, metadata !DIExpression()) #10, !dbg !1167
  call void @llvm.dbg.value(metadata i64 %673, metadata !702, metadata !DIExpression()) #10, !dbg !1167
  %674 = zext i32 %670 to i64, !dbg !1170
  call void @llvm.dbg.value(metadata i64 undef, metadata !702, metadata !DIExpression()) #10, !dbg !1167
  %675 = zext i32 %672 to i64, !dbg !1171
  %676 = shl nuw nsw i16 %660, 8, !dbg !1172
  %677 = add nuw nsw i16 %676, 1536, !dbg !1172
  %678 = zext i16 %677 to i64, !dbg !1172
  %679 = add nuw nsw i64 %673, %678, !dbg !1173
  %680 = add nuw nsw i64 %679, %674, !dbg !1174
  %681 = add nuw nsw i64 %680, %675, !dbg !1175
  call void @llvm.dbg.value(metadata i64 %681, metadata !702, metadata !DIExpression()) #10, !dbg !1167
  %682 = and i64 %681, 4294967295, !dbg !1176
  %683 = lshr i64 %681, 32, !dbg !1177
  %684 = add nuw nsw i64 %682, %683, !dbg !1178
  call void @llvm.dbg.value(metadata i64 %684, metadata !702, metadata !DIExpression()) #10, !dbg !1167
  %685 = lshr i64 %684, 32, !dbg !1179
  %686 = add nuw nsw i64 %685, %684, !dbg !1180
  call void @llvm.dbg.value(metadata !DIArgList(i64 %684, i64 %685), metadata !702, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1167
  %687 = trunc i64 %686 to i32, !dbg !1181
  call void @llvm.dbg.value(metadata i32 %687, metadata !669, metadata !DIExpression()) #10, !dbg !1182
  %688 = and i32 %687, 65535, !dbg !1184
  %689 = lshr i32 %687, 16, !dbg !1185
  %690 = add nuw nsw i32 %688, %689, !dbg !1186
  call void @llvm.dbg.value(metadata i32 %690, metadata !669, metadata !DIExpression()) #10, !dbg !1182
  %691 = lshr i32 %690, 16, !dbg !1187
  %692 = add nuw nsw i32 %691, %690, !dbg !1188
  call void @llvm.dbg.value(metadata !DIArgList(i32 %690, i32 %691), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1182
  %693 = trunc i32 %692 to i16, !dbg !1189
  %694 = xor i16 %693, -1, !dbg !1189
  store i16 %694, i16* %662, align 4, !dbg !1190, !tbaa !995
  %695 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %252, i64 0, i32 7, !dbg !1191
  store i16 0, i16* %695, align 2, !dbg !1192, !tbaa !944
  %696 = bitcast %struct.iphdr* %252 to i32*, !dbg !1193
  %697 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef null, i32 noundef 0, i32* noundef nonnull %696, i32 noundef 20, i32 noundef 0) #10, !dbg !1194
  call void @llvm.dbg.value(metadata i64 %697, metadata !640, metadata !DIExpression()) #10, !dbg !646
  %698 = icmp slt i64 %697, 0, !dbg !1195
  br i1 %698, label %782, label %699, !dbg !1197

699:                                              ; preds = %668
  %700 = trunc i64 %697 to i32, !dbg !1198
  call void @llvm.dbg.value(metadata i32 %700, metadata !669, metadata !DIExpression()) #10, !dbg !1199
  %701 = and i32 %700, 65535, !dbg !1201
  %702 = lshr i32 %700, 16, !dbg !1202
  %703 = add nuw nsw i32 %701, %702, !dbg !1203
  call void @llvm.dbg.value(metadata i32 %703, metadata !669, metadata !DIExpression()) #10, !dbg !1199
  %704 = lshr i32 %703, 16, !dbg !1204
  %705 = add nuw nsw i32 %704, %703, !dbg !1205
  call void @llvm.dbg.value(metadata !DIArgList(i32 %703, i32 %704), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1199
  %706 = trunc i32 %705 to i16, !dbg !1206
  %707 = xor i16 %706, -1, !dbg !1206
  store i16 %707, i16* %695, align 2, !dbg !1207, !tbaa !944
  br label %761, !dbg !1208

708:                                              ; preds = %667
  %709 = icmp eq %struct.ipv6hdr* %251, null, !dbg !1209
  br i1 %709, label %782, label %710, !dbg !1211

710:                                              ; preds = %708
  %711 = zext i16 %660 to i64, !dbg !1212
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %251, metadata !741, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)) #10, !dbg !1214
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %251, metadata !748, metadata !DIExpression(DW_OP_plus_uconst, 24, DW_OP_stack_value)) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i16 %660, metadata !749, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i8 6, metadata !750, metadata !DIExpression()) #10, !dbg !1214
  %712 = and i64 %665, 4294967295, !dbg !1216
  call void @llvm.dbg.value(metadata i64 %665, metadata !751, metadata !DIExpression()) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i64 0, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i64 %712, metadata !752, metadata !DIExpression()) #10, !dbg !1214
  %713 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 0, !dbg !1217
  %714 = load i32, i32* %713, align 4, !dbg !1217, !tbaa !483
  %715 = zext i32 %714 to i64, !dbg !1218
  call void @llvm.dbg.value(metadata i64 1, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i64 undef, metadata !752, metadata !DIExpression()) #10, !dbg !1214
  %716 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1217
  %717 = load i32, i32* %716, align 4, !dbg !1217, !tbaa !483
  %718 = zext i32 %717 to i64, !dbg !1218
  call void @llvm.dbg.value(metadata i64 2, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %719 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1217
  %720 = load i32, i32* %719, align 4, !dbg !1217, !tbaa !483
  %721 = zext i32 %720 to i64, !dbg !1218
  call void @llvm.dbg.value(metadata i64 3, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %722 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1217
  %723 = load i32, i32* %722, align 4, !dbg !1217, !tbaa !483
  %724 = zext i32 %723 to i64, !dbg !1218
  call void @llvm.dbg.value(metadata i64 0, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %725 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 0, !dbg !1219
  %726 = load i32, i32* %725, align 4, !dbg !1219, !tbaa !483
  %727 = zext i32 %726 to i64, !dbg !1220
  call void @llvm.dbg.value(metadata i64 1, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %728 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 1, !dbg !1219
  %729 = load i32, i32* %728, align 4, !dbg !1219, !tbaa !483
  %730 = zext i32 %729 to i64, !dbg !1220
  call void @llvm.dbg.value(metadata i64 2, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %731 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 2, !dbg !1219
  %732 = load i32, i32* %731, align 4, !dbg !1219, !tbaa !483
  %733 = zext i32 %732 to i64, !dbg !1220
  call void @llvm.dbg.value(metadata i64 3, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %734 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %251, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 3, !dbg !1219
  %735 = load i32, i32* %734, align 4, !dbg !1219, !tbaa !483
  %736 = zext i32 %735 to i64, !dbg !1220
  call void @llvm.dbg.value(metadata i64 4, metadata !753, metadata !DIExpression()) #10, !dbg !1214
  %737 = shl nuw nsw i64 %711, 24, !dbg !1221
  call void @llvm.dbg.value(metadata !DIArgList(i64 undef, i64 %737), metadata !752, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1214
  call void @llvm.dbg.value(metadata i64 undef, metadata !752, metadata !DIExpression()) #10, !dbg !1214
  %738 = add nuw nsw i64 %737, 100663296, !dbg !1222
  %739 = add nuw nsw i64 %738, %712, !dbg !1222
  %740 = add nuw nsw i64 %739, %715, !dbg !1222
  %741 = add nuw nsw i64 %740, %718, !dbg !1222
  %742 = add nuw nsw i64 %741, %721, !dbg !1223
  %743 = add nuw nsw i64 %742, %724, !dbg !1223
  %744 = add nuw nsw i64 %743, %727, !dbg !1223
  %745 = add nuw nsw i64 %744, %730, !dbg !1223
  %746 = add nuw nsw i64 %745, %733, !dbg !1224
  %747 = add nuw nsw i64 %746, %736, !dbg !1225
  call void @llvm.dbg.value(metadata i64 %747, metadata !752, metadata !DIExpression()) #10, !dbg !1214
  %748 = and i64 %747, 4294967295, !dbg !1226
  %749 = lshr i64 %747, 32, !dbg !1227
  %750 = add nuw nsw i64 %748, %749, !dbg !1228
  call void @llvm.dbg.value(metadata i64 %750, metadata !752, metadata !DIExpression()) #10, !dbg !1214
  %751 = lshr i64 %750, 32, !dbg !1229
  %752 = add nuw nsw i64 %751, %750, !dbg !1230
  call void @llvm.dbg.value(metadata !DIArgList(i64 %750, i64 %751), metadata !752, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1214
  %753 = trunc i64 %752 to i32, !dbg !1231
  call void @llvm.dbg.value(metadata i32 %753, metadata !669, metadata !DIExpression()) #10, !dbg !1232
  %754 = and i32 %753, 65535, !dbg !1234
  %755 = lshr i32 %753, 16, !dbg !1235
  %756 = add nuw nsw i32 %754, %755, !dbg !1236
  call void @llvm.dbg.value(metadata i32 %756, metadata !669, metadata !DIExpression()) #10, !dbg !1232
  %757 = lshr i32 %756, 16, !dbg !1237
  %758 = add nuw nsw i32 %757, %756, !dbg !1238
  call void @llvm.dbg.value(metadata !DIArgList(i32 %756, i32 %757), metadata !669, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)) #10, !dbg !1232
  %759 = trunc i32 %758 to i16, !dbg !1239
  %760 = xor i16 %759, -1, !dbg !1239
  store i16 %760, i16* %662, align 4, !dbg !1240, !tbaa !995
  br label %761

761:                                              ; preds = %710, %699
  %762 = sub i32 %230, %227, !dbg !1241
  call void @llvm.dbg.value(metadata !DIArgList(i64 %228, i64 %231), metadata !632, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !646
  %763 = add nuw nsw i64 %389, 14, !dbg !1242
  %764 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %661, i64 0, i32 4, !dbg !1243
  %765 = load i16, i16* %764, align 4, !dbg !1243
  %766 = lshr i16 %765, 2, !dbg !1244
  %767 = and i16 %766, 60, !dbg !1244
  %768 = zext i16 %767 to i64
  %769 = add nuw nsw i64 %763, %768, !dbg !1245
  %770 = trunc i64 %769 to i32, !dbg !1246
  call void @llvm.dbg.value(metadata i32 %770, metadata !633, metadata !DIExpression()) #10, !dbg !646
  %771 = add i32 %762, %770, !dbg !1247
  %772 = call i64 inttoptr (i64 65 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef %771) #10, !dbg !1249
  %773 = icmp eq i64 %772, 0, !dbg !1249
  br i1 %773, label %774, label %782, !dbg !1250

774:                                              ; preds = %761
  %775 = bitcast i32* %2 to i8*, !dbg !1251
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %775) #10, !dbg !1251
  call void @llvm.dbg.value(metadata i32 1, metadata !1256, metadata !DIExpression()) #10, !dbg !1259
  store i32 1, i32* %2, align 4, !dbg !1260, !tbaa !552
  call void @llvm.dbg.value(metadata i32* %2, metadata !1256, metadata !DIExpression(DW_OP_deref)) #10, !dbg !1259
  %776 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @values to i8*), i8* noundef nonnull %775) #10, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %776, metadata !1257, metadata !DIExpression()) #10, !dbg !1259
  %777 = icmp eq i8* %776, null, !dbg !1262
  br i1 %777, label %781, label %778, !dbg !1264

778:                                              ; preds = %774
  %779 = bitcast i8* %776 to i64*, !dbg !1261
  call void @llvm.dbg.value(metadata i64* %779, metadata !1257, metadata !DIExpression()) #10, !dbg !1259
  %780 = atomicrmw add i64* %779, i64 1 seq_cst, align 8, !dbg !1265
  br label %781, !dbg !1265

781:                                              ; preds = %778, %774
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %775) #10, !dbg !1266
  br label %782, !dbg !1267

782:                                              ; preds = %781, %761, %708, %668, %659, %548, %429, %388, %335, %330, %328, %299, %294, %285, %276, %268
  %783 = phi i32 [ 3, %781 ], [ 1, %268 ], [ 0, %276 ], [ 1, %285 ], [ 0, %294 ], [ 1, %299 ], [ 0, %330 ], [ 1, %335 ], [ 0, %328 ], [ 0, %388 ], [ 0, %429 ], [ 0, %548 ], [ 0, %659 ], [ 0, %668 ], [ 0, %708 ], [ 0, %761 ], !dbg !646
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %271) #10, !dbg !1268
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %270), !dbg !1268
  br label %800, !dbg !623

784:                                              ; preds = %265
  call void @llvm.dbg.value(metadata %struct.header_pointers* undef, metadata !1269, metadata !DIExpression()) #10, !dbg !1275
  %785 = and i16 %261, 1024, !dbg !1277
  %786 = icmp eq i16 %785, 0, !dbg !1277
  br i1 %786, label %787, label %800, !dbg !1279

787:                                              ; preds = %784
  %788 = icmp eq %struct.iphdr* %252, null, !dbg !1280
  br i1 %788, label %791, label %789, !dbg !1282

789:                                              ; preds = %787
  %790 = call i64 inttoptr (i64 206 to i64 (%struct.iphdr*, %struct.tcphdr*)*)(%struct.iphdr* noundef nonnull %252, %struct.tcphdr* noundef nonnull %255) #10, !dbg !1283
  call void @llvm.dbg.value(metadata i64 %790, metadata !1274, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !1275
  br label %795, !dbg !1284

791:                                              ; preds = %787
  %792 = icmp eq %struct.ipv6hdr* %251, null, !dbg !1285
  br i1 %792, label %800, label %793, !dbg !1287

793:                                              ; preds = %791
  %794 = call i64 inttoptr (i64 207 to i64 (%struct.ipv6hdr*, %struct.tcphdr*)*)(%struct.ipv6hdr* noundef nonnull %251, %struct.tcphdr* noundef nonnull %255) #10, !dbg !1288
  call void @llvm.dbg.value(metadata i64 %794, metadata !1274, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #10, !dbg !1275
  br label %795

795:                                              ; preds = %793, %789
  %796 = phi i64 [ %790, %789 ], [ %794, %793 ]
  %797 = trunc i64 %796 to i32, !dbg !1289
  call void @llvm.dbg.value(metadata i32 %797, metadata !1274, metadata !DIExpression()) #10, !dbg !1275
  %798 = icmp eq i32 %797, 0, !dbg !1290
  %799 = select i1 %798, i32 2, i32 1, !dbg !1275
  br label %800, !dbg !1275

800:                                              ; preds = %205, %66, %1, %29, %33, %42, %48, %52, %56, %24, %60, %213, %134, %221, %214, %795, %791, %784, %782, %258, %250, %244, %233
  %801 = phi i32 [ 0, %233 ], [ 0, %244 ], [ 0, %250 ], [ 0, %258 ], [ %783, %782 ], [ 1, %784 ], [ 0, %791 ], [ %799, %795 ], [ 2, %205 ], [ 1, %66 ], [ 1, %1 ], [ 1, %29 ], [ 1, %33 ], [ 2, %42 ], [ 1, %48 ], [ 1, %52 ], [ 2, %56 ], [ 2, %24 ], [ 1, %60 ], [ 2, %213 ], [ %135, %134 ], [ 0, %221 ], [ 1, %214 ], !dbg !345
  ret i32 %801, !dbg !1292
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare !dbg !1293 dso_local %struct.nf_conn* @bpf_xdp_ct_lookup(%struct.xdp_md* noundef, %struct.bpf_sock_tuple* noundef, i32 noundef, %struct.bpf_ct_opts___local* noundef, i32 noundef) local_unnamed_addr #6 section ".ksyms"

declare !dbg !1298 dso_local void @bpf_ct_release(%struct.nf_conn* noundef) local_unnamed_addr #6 section ".ksyms"

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #2

; Function Attrs: nofree norecurse nosync nounwind
define internal i32 @tscookie_tcpopt_parse_batch(i32 noundef %0, i8* nocapture noundef %1) #7 !dbg !1301 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !1305, metadata !DIExpression()), !dbg !1308
  call void @llvm.dbg.value(metadata i8* %1, metadata !1306, metadata !DIExpression()), !dbg !1308
  call void @llvm.dbg.value(metadata i32 0, metadata !1307, metadata !DIExpression()), !dbg !1308
  %3 = bitcast i8* %1 to i8**, !dbg !1309
  %4 = getelementptr inbounds i8, i8* %1, i64 16, !dbg !1315
  %5 = bitcast i8* %4 to i8**, !dbg !1315
  call void @llvm.dbg.value(metadata i32 0, metadata !1307, metadata !DIExpression()), !dbg !1308
  %6 = getelementptr inbounds i8, i8* %1, i64 8
  %7 = bitcast i8* %6 to i8**
  %8 = load i8*, i8** %7, align 8, !tbaa !817
  %9 = getelementptr inbounds i8, i8* %1, i64 34
  %10 = getelementptr inbounds i8, i8* %1, i64 33
  %11 = getelementptr inbounds i8, i8* %1, i64 24
  %12 = bitcast i8* %11 to i32**
  %13 = getelementptr inbounds i8, i8* %1, i64 32
  %14 = load i8*, i8** %3, align 8, !dbg !1309, !tbaa !813
  br label %15, !dbg !1317

15:                                               ; preds = %2, %62
  %16 = phi i8* [ %14, %2 ], [ %63, %62 ], !dbg !1309
  %17 = phi i32 [ 0, %2 ], [ %64, %62 ]
  call void @llvm.dbg.value(metadata i32 %17, metadata !1307, metadata !DIExpression()), !dbg !1308
  call void @llvm.dbg.value(metadata i8* %1, metadata !101, metadata !DIExpression()), !dbg !1318
  %18 = icmp ult i8* %16, %8, !dbg !1319
  br i1 %18, label %19, label %66, !dbg !1320

19:                                               ; preds = %15
  %20 = load i8*, i8** %5, align 8, !dbg !1315, !tbaa !818
  %21 = icmp ult i8* %16, %20, !dbg !1321
  br i1 %21, label %22, label %66, !dbg !1322

22:                                               ; preds = %19
  %23 = load i8, i8* %16, align 1, !dbg !1323, !tbaa !483
  call void @llvm.dbg.value(metadata i8 %23, metadata !102, metadata !DIExpression()), !dbg !1318
  switch i8 %23, label %26 [
    i8 0, label %66
    i8 1, label %24
  ], !dbg !1324

24:                                               ; preds = %22
  %25 = getelementptr inbounds i8, i8* %16, i64 1, !dbg !1325
  br label %62, !dbg !1328

26:                                               ; preds = %22
  %27 = getelementptr inbounds i8, i8* %16, i64 1, !dbg !1329
  %28 = icmp ult i8* %27, %8, !dbg !1331
  %29 = icmp ult i8* %27, %20
  %30 = select i1 %28, i1 %29, i1 false, !dbg !1332
  br i1 %30, label %31, label %66, !dbg !1332

31:                                               ; preds = %26
  %32 = load i8, i8* %27, align 1, !dbg !1333, !tbaa !483
  call void @llvm.dbg.value(metadata i8 %32, metadata !103, metadata !DIExpression()), !dbg !1318
  %33 = icmp ult i8 %32, 2, !dbg !1334
  br i1 %33, label %66, label %34, !dbg !1336

34:                                               ; preds = %31
  %35 = zext i8 %32 to i64, !dbg !1337
  %36 = getelementptr inbounds i8, i8* %16, i64 %35, !dbg !1337
  %37 = icmp ugt i8* %36, %8, !dbg !1339
  br i1 %37, label %66, label %38, !dbg !1340

38:                                               ; preds = %34
  switch i8 %23, label %62 [
    i8 3, label %39
    i8 8, label %49
    i8 4, label %59
  ], !dbg !1341

39:                                               ; preds = %38
  %40 = icmp ne i8 %32, 3, !dbg !1342
  %41 = getelementptr inbounds i8, i8* %16, i64 3
  %42 = icmp ugt i8* %41, %20
  %43 = select i1 %40, i1 true, i1 %42, !dbg !1344
  br i1 %43, label %62, label %44, !dbg !1344

44:                                               ; preds = %39
  %45 = getelementptr inbounds i8, i8* %16, i64 2, !dbg !1345
  %46 = load i8, i8* %45, align 1, !dbg !1345, !tbaa !483
  %47 = icmp ult i8 %46, 14, !dbg !1346
  %48 = select i1 %47, i8 %46, i8 14, !dbg !1345
  store i8 %48, i8* %13, align 8, !dbg !1347, !tbaa !820
  br label %62, !dbg !1348

49:                                               ; preds = %38
  %50 = icmp ne i8 %32, 10, !dbg !1349
  %51 = getelementptr inbounds i8, i8* %16, i64 10
  %52 = icmp ugt i8* %51, %20
  %53 = select i1 %50, i1 true, i1 %52, !dbg !1350
  br i1 %53, label %62, label %54, !dbg !1350

54:                                               ; preds = %49
  store i8 1, i8* %10, align 1, !dbg !1351, !tbaa !821
  %55 = getelementptr inbounds i8, i8* %16, i64 2, !dbg !1352
  call void @llvm.dbg.value(metadata i8* %55, metadata !104, metadata !DIExpression()), !dbg !1353
  %56 = bitcast i8* %55 to i32*, !dbg !1352
  %57 = load i32, i32* %56, align 1, !dbg !1352, !tbaa !1354
  %58 = load i32*, i32** %12, align 8, !dbg !1356, !tbaa !819
  store i32 %57, i32* %58, align 4, !dbg !1357, !tbaa !552
  br label %62, !dbg !1358

59:                                               ; preds = %38
  %60 = icmp eq i8 %32, 2, !dbg !1359
  br i1 %60, label %61, label %62, !dbg !1361

61:                                               ; preds = %59
  store i8 1, i8* %9, align 2, !dbg !1362, !tbaa !822
  br label %62, !dbg !1363

62:                                               ; preds = %61, %59, %54, %49, %44, %39, %38, %24
  %63 = phi i8* [ %25, %24 ], [ %36, %59 ], [ %36, %61 ], [ %36, %49 ], [ %36, %54 ], [ %36, %39 ], [ %36, %44 ], [ %36, %38 ]
  store i8* %63, i8** %3, align 8, !dbg !1318, !tbaa !813
  %64 = add nuw nsw i32 %17, 1, !dbg !1364
  call void @llvm.dbg.value(metadata i32 %64, metadata !1307, metadata !DIExpression()), !dbg !1308
  %65 = icmp eq i32 %64, 7, !dbg !1365
  br i1 %65, label %66, label %15, !dbg !1317, !llvm.loop !1366

66:                                               ; preds = %34, %31, %26, %22, %19, %15, %62
  %67 = phi i32 [ 0, %62 ], [ 1, %15 ], [ 1, %19 ], [ 1, %22 ], [ 1, %26 ], [ 1, %31 ], [ 1, %34 ], !dbg !1308
  ret i32 %67, !dbg !1369
}

; Function Attrs: nofree nosync nounwind readnone
declare i64* @llvm.bpf.passthrough.p0i64.p0i64(i32, i64*) #8

; Function Attrs: nofree nosync nounwind readnone
declare i32* @llvm.bpf.passthrough.p0i32.p0i32(i32, i32*) #8

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #9

attributes #0 = { "btf_ama" }
attributes #1 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #8 = { nofree nosync nounwind readnone }
attributes #9 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!313, !314, !315, !316}
!llvm.ident = !{!317}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 801, type: !299, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !68, globals: !140, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_synproxy_kern.c", directory: "/home/nir_ophir/code/bpf-examples/xdp-synproxy", checksumkind: CSK_MD5, checksum: "4481f413c45527ba68ad08252d125c02")
!4 = !{!5, !11, !19, !50, !55}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/vmlinux/vmlinux_common.h", directory: "/home/nir_ophir/code/bpf-examples/xdp-synproxy", checksumkind: CSK_MD5, checksum: "fe54e2fe2896290c2e19cb453f905c6e")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "false", value: 0)
!10 = !DIEnumerator(name: "true", value: 1)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !12, line: 4363, baseType: !7, size: 32, elements: !13)
!12 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/xdp-synproxy", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!13 = !{!14, !15, !16, !17, !18}
!14 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!15 = !DIEnumerator(name: "XDP_DROP", value: 1)
!16 = !DIEnumerator(name: "XDP_PASS", value: 2)
!17 = !DIEnumerator(name: "XDP_TX", value: 3)
!18 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !20, line: 28, baseType: !7, size: 32, elements: !21)
!20 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49}
!22 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!23 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!24 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!25 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!26 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!27 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!28 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!29 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!30 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!31 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!32 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!33 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!34 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!35 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!36 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!37 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!38 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!39 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!40 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!41 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!42 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!43 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!44 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!45 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!46 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!47 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!48 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!49 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!50 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "ip_conntrack_status", file: !51, line: 142, baseType: !7, size: 32, elements: !52)
!51 = !DIFile(filename: "../lib/../headers/vmlinux/vmlinux_net.h", directory: "/home/nir_ophir/code/bpf-examples/xdp-synproxy", checksumkind: CSK_MD5, checksum: "6dd6460408b99e70437a781d8b60ad8c")
!52 = !{!53, !54}
!53 = !DIEnumerator(name: "IPS_CONFIRMED_BIT", value: 3)
!54 = !DIEnumerator(name: "IPS_CONFIRMED", value: 8)
!55 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !56, line: 72, baseType: !7, size: 32, elements: !57)
!56 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!57 = !{!58, !59, !60, !61, !62, !63, !64, !65, !66, !67}
!58 = !DIEnumerator(name: "TCP_FLAG_CWR", value: 32768)
!59 = !DIEnumerator(name: "TCP_FLAG_ECE", value: 16384)
!60 = !DIEnumerator(name: "TCP_FLAG_URG", value: 8192)
!61 = !DIEnumerator(name: "TCP_FLAG_ACK", value: 4096)
!62 = !DIEnumerator(name: "TCP_FLAG_PSH", value: 2048)
!63 = !DIEnumerator(name: "TCP_FLAG_RST", value: 1024)
!64 = !DIEnumerator(name: "TCP_FLAG_SYN", value: 512)
!65 = !DIEnumerator(name: "TCP_FLAG_FIN", value: 256)
!66 = !DIEnumerator(name: "TCP_RESERVED_BITS", value: 15)
!67 = !DIEnumerator(name: "TCP_DATA_OFFSET", value: 240)
!68 = !{!69, !70, !71, !74, !75, !78, !92, !111}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!70 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !72, line: 24, baseType: !73)
!72 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!73 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !72, line: 27, baseType: !7)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !72, line: 21, baseType: !77)
!77 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !81, file: !3, line: 235, size: 32, elements: !109)
!81 = distinct !DISubprogram(name: "tscookie_tcpopt_parse", scope: !3, file: !3, line: 197, type: !82, scopeLine: 198, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !100)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcpopt_context", file: !3, line: 187, size: 320, elements: !87)
!87 = !{!88, !89, !90, !91, !95, !96, !99}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !86, file: !3, line: 188, baseType: !75, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !86, file: !3, line: 189, baseType: !75, size: 64, offset: 64)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !86, file: !3, line: 190, baseType: !69, size: 64, offset: 128)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "tsecr", scope: !86, file: !3, line: 191, baseType: !92, size: 64, offset: 192)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !94, line: 27, baseType: !74)
!94 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!95 = !DIDerivedType(tag: DW_TAG_member, name: "wscale", scope: !86, file: !3, line: 192, baseType: !76, size: 8, offset: 256)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "option_timestamp", scope: !86, file: !3, line: 193, baseType: !97, size: 8, offset: 264)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 9, baseType: !98)
!98 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "option_sack", scope: !86, file: !3, line: 194, baseType: !97, size: 8, offset: 272)
!100 = !{!101, !102, !103, !104}
!101 = !DILocalVariable(name: "ctx", arg: 1, scope: !81, file: !3, line: 197, type: !85)
!102 = !DILocalVariable(name: "opcode", scope: !81, file: !3, line: 199, type: !76)
!103 = !DILocalVariable(name: "opsize", scope: !81, file: !3, line: 199, type: !76)
!104 = !DILocalVariable(name: "__pptr", scope: !105, file: !3, line: 235, type: !78)
!105 = distinct !DILexicalBlock(scope: !106, file: !3, line: 235, column: 18)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 232, column: 85)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 232, column: 7)
!108 = distinct !DILexicalBlock(scope: !81, file: !3, line: 226, column: 18)
!109 = !{!110}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !80, file: !3, line: 235, baseType: !93, size: 32)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "tcp_word_hdr", file: !56, line: 65, size: 160, elements: !113)
!113 = !{!114, !136}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "hdr", scope: !112, file: !56, line: 66, baseType: !115, size: 160)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !56, line: 25, size: 160, elements: !116)
!116 = !{!117, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !135}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !115, file: !56, line: 26, baseType: !118, size: 16)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !94, line: 25, baseType: !71)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !115, file: !56, line: 27, baseType: !118, size: 16, offset: 16)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !115, file: !56, line: 28, baseType: !93, size: 32, offset: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !115, file: !56, line: 29, baseType: !93, size: 32, offset: 64)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !115, file: !56, line: 31, baseType: !71, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !115, file: !56, line: 32, baseType: !71, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !115, file: !56, line: 33, baseType: !71, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !115, file: !56, line: 34, baseType: !71, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !115, file: !56, line: 35, baseType: !71, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !115, file: !56, line: 36, baseType: !71, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !115, file: !56, line: 37, baseType: !71, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !115, file: !56, line: 38, baseType: !71, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !115, file: !56, line: 39, baseType: !71, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !115, file: !56, line: 40, baseType: !71, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !115, file: !56, line: 55, baseType: !118, size: 16, offset: 112)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !115, file: !56, line: 56, baseType: !134, size: 16, offset: 128)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !94, line: 31, baseType: !71)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !115, file: !56, line: 57, baseType: !118, size: 16, offset: 144)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "words", scope: !112, file: !56, line: 67, baseType: !137, size: 160)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 160, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 5)
!140 = !{!0, !141, !157, !170, !178, !192, !200, !232, !279, !284, !289, !294}
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(name: "values", scope: !2, file: !3, line: 79, type: !143, isLocal: false, isDefinition: true)
!143 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 74, size: 256, elements: !144)
!144 = !{!145, !150, !152, !156}
!145 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !143, file: !3, line: 75, baseType: !146, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 64, elements: !148)
!148 = !{!149}
!149 = !DISubrange(count: 2)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !143, file: !3, line: 76, baseType: !151, size: 64, offset: 64)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !143, file: !3, line: 77, baseType: !153, size: 64, offset: 128)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !72, line: 31, baseType: !155)
!155 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !143, file: !3, line: 78, baseType: !146, size: 64, offset: 192)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(name: "allowed_ports", scope: !2, file: !3, line: 86, type: !159, isLocal: false, isDefinition: true)
!159 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 81, size: 256, elements: !160)
!160 = !{!161, !162, !163, !165}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !159, file: !3, line: 82, baseType: !146, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !159, file: !3, line: 83, baseType: !151, size: 64, offset: 64)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !159, file: !3, line: 84, baseType: !164, size: 64, offset: 128)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !159, file: !3, line: 85, baseType: !166, size: 64, offset: 192)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 256, elements: !168)
!168 = !{!169}
!169 = !DISubrange(count: 8)
!170 = !DIGlobalVariableExpression(var: !171, expr: !DIExpression())
!171 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !172, line: 55, type: !173, isLocal: true, isDefinition: true)
!172 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/xdp-synproxy", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DISubroutineType(types: !175)
!175 = !{!69, !69, !176}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_tail", scope: !2, file: !172, line: 1708, type: !180, isLocal: true, isDefinition: true)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = !DISubroutineType(types: !182)
!182 = !{!70, !183, !84}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !12, line: 4374, size: 192, elements: !185)
!185 = !{!186, !187, !188, !189, !190, !191}
!186 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !184, file: !12, line: 4375, baseType: !74, size: 32)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !184, file: !12, line: 4376, baseType: !74, size: 32, offset: 32)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !184, file: !12, line: 4377, baseType: !74, size: 32, offset: 64)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !184, file: !12, line: 4379, baseType: !74, size: 32, offset: 96)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !184, file: !12, line: 4380, baseType: !74, size: 32, offset: 128)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !184, file: !12, line: 4382, baseType: !74, size: 32, offset: 160)
!192 = !DIGlobalVariableExpression(var: !193, expr: !DIExpression())
!193 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !2, file: !172, line: 790, type: !194, isLocal: true, isDefinition: true)
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!195 = !DISubroutineType(types: !196)
!196 = !{!197, !92, !74, !92, !74, !199}
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !72, line: 30, baseType: !198)
!198 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !51, line: 4, baseType: !74)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(name: "bpf_tcp_raw_gen_syncookie_ipv4", scope: !2, file: !172, line: 4526, type: !202, isLocal: true, isDefinition: true)
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DISubroutineType(types: !204)
!204 = !{!197, !205, !231, !74}
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !207, line: 87, size: 160, elements: !208)
!207 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!208 = !{!209, !210, !211, !212, !213, !214, !215, !216, !217, !218}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !206, file: !207, line: 89, baseType: !76, size: 4, flags: DIFlagBitField, extraData: i64 0)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !206, file: !207, line: 90, baseType: !76, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !206, file: !207, line: 97, baseType: !76, size: 8, offset: 8)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !206, file: !207, line: 98, baseType: !118, size: 16, offset: 16)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !206, file: !207, line: 99, baseType: !118, size: 16, offset: 32)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !206, file: !207, line: 100, baseType: !118, size: 16, offset: 48)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !206, file: !207, line: 101, baseType: !76, size: 8, offset: 64)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !206, file: !207, line: 102, baseType: !76, size: 8, offset: 72)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !206, file: !207, line: 103, baseType: !134, size: 16, offset: 80)
!218 = !DIDerivedType(tag: DW_TAG_member, scope: !206, file: !207, line: 104, baseType: !219, size: 64, offset: 96)
!219 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !206, file: !207, line: 104, size: 64, elements: !220)
!220 = !{!221, !226}
!221 = !DIDerivedType(tag: DW_TAG_member, scope: !219, file: !207, line: 104, baseType: !222, size: 64)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 104, size: 64, elements: !223)
!223 = !{!224, !225}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !222, file: !207, line: 104, baseType: !93, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !222, file: !207, line: 104, baseType: !93, size: 32, offset: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !219, file: !207, line: 104, baseType: !227, size: 64)
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !219, file: !207, line: 104, size: 64, elements: !228)
!228 = !{!229, !230}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !227, file: !207, line: 104, baseType: !93, size: 32)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !227, file: !207, line: 104, baseType: !93, size: 32, offset: 32)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression())
!233 = distinct !DIGlobalVariable(name: "bpf_tcp_raw_gen_syncookie_ipv6", scope: !2, file: !172, line: 4552, type: !234, isLocal: true, isDefinition: true)
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DISubroutineType(types: !236)
!236 = !{!197, !237, !231, !74}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !239, line: 118, size: 320, elements: !240)
!239 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!240 = !{!241, !242, !243, !247, !248, !249, !250}
!241 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !238, file: !239, line: 120, baseType: !76, size: 4, flags: DIFlagBitField, extraData: i64 0)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !238, file: !239, line: 121, baseType: !76, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !238, file: !239, line: 128, baseType: !244, size: 24, offset: 8)
!244 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 24, elements: !245)
!245 = !{!246}
!246 = !DISubrange(count: 3)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !238, file: !239, line: 130, baseType: !118, size: 16, offset: 32)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !238, file: !239, line: 131, baseType: !76, size: 8, offset: 48)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !238, file: !239, line: 132, baseType: !76, size: 8, offset: 56)
!250 = !DIDerivedType(tag: DW_TAG_member, scope: !238, file: !239, line: 134, baseType: !251, size: 256, offset: 64)
!251 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !238, file: !239, line: 134, size: 256, elements: !252)
!252 = !{!253, !274}
!253 = !DIDerivedType(tag: DW_TAG_member, scope: !251, file: !239, line: 134, baseType: !254, size: 256)
!254 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !251, file: !239, line: 134, size: 256, elements: !255)
!255 = !{!256, !273}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !254, file: !239, line: 134, baseType: !257, size: 128)
!257 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !258, line: 33, size: 128, elements: !259)
!258 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!259 = !{!260}
!260 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !257, file: !258, line: 40, baseType: !261, size: 128)
!261 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !257, file: !258, line: 34, size: 128, elements: !262)
!262 = !{!263, !267, !269}
!263 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !261, file: !258, line: 35, baseType: !264, size: 128)
!264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 128, elements: !265)
!265 = !{!266}
!266 = !DISubrange(count: 16)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !261, file: !258, line: 37, baseType: !268, size: 128)
!268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 128, elements: !168)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !261, file: !258, line: 38, baseType: !270, size: 128)
!270 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 128, elements: !271)
!271 = !{!272}
!272 = !DISubrange(count: 4)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !254, file: !239, line: 134, baseType: !257, size: 128, offset: 128)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !251, file: !239, line: 134, baseType: !275, size: 256)
!275 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !251, file: !239, line: 134, size: 256, elements: !276)
!276 = !{!277, !278}
!277 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !275, file: !239, line: 134, baseType: !257, size: 128)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !275, file: !239, line: 134, baseType: !257, size: 128, offset: 128)
!279 = !DIGlobalVariableExpression(var: !280, expr: !DIExpression())
!280 = distinct !DIGlobalVariable(name: "bpf_loop", scope: !2, file: !172, line: 4192, type: !281, isLocal: true, isDefinition: true)
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64)
!282 = !DISubroutineType(types: !283)
!283 = !{!70, !74, !69, !69, !154}
!284 = !DIGlobalVariableExpression(var: !285, expr: !DIExpression())
!285 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !172, line: 113, type: !286, isLocal: true, isDefinition: true)
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!287 = !DISubroutineType(types: !288)
!288 = !{!154}
!289 = !DIGlobalVariableExpression(var: !290, expr: !DIExpression())
!290 = distinct !DIGlobalVariable(name: "bpf_tcp_raw_check_syncookie_ipv4", scope: !2, file: !172, line: 4571, type: !291, isLocal: true, isDefinition: true)
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !292, size: 64)
!292 = !DISubroutineType(types: !293)
!293 = !{!70, !205, !231}
!294 = !DIGlobalVariableExpression(var: !295, expr: !DIExpression())
!295 = distinct !DIGlobalVariable(name: "bpf_tcp_raw_check_syncookie_ipv6", scope: !2, file: !172, line: 4592, type: !296, isLocal: true, isDefinition: true)
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !297, size: 64)
!297 = !DISubroutineType(types: !298)
!298 = !{!70, !237, !231}
!299 = !DICompositeType(tag: DW_TAG_array_type, baseType: !300, size: 32, elements: !271)
!300 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nf_conn", file: !51, line: 138, size: 64, elements: !302)
!302 = !{!303}
!303 = !DIDerivedType(tag: DW_TAG_member, name: "status", scope: !301, file: !51, line: 139, baseType: !304, size: 64)
!304 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_ct_opts___local", file: !3, line: 92, size: 96, elements: !306)
!306 = !{!307, !308, !309, !310, !311}
!307 = !DIDerivedType(tag: DW_TAG_member, name: "netns_id", scope: !305, file: !3, line: 93, baseType: !84, size: 32)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "error", scope: !305, file: !3, line: 94, baseType: !84, size: 32, offset: 32)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "l4proto", scope: !305, file: !3, line: 95, baseType: !76, size: 8, offset: 64)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "dir", scope: !305, file: !3, line: 96, baseType: !76, size: 8, offset: 72)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !305, file: !3, line: 97, baseType: !312, size: 16, offset: 80)
!312 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 16, elements: !148)
!313 = !{i32 7, !"Dwarf Version", i32 5}
!314 = !{i32 2, !"Debug Info Version", i32 3}
!315 = !{i32 1, !"wchar_size", i32 4}
!316 = !{i32 7, !"frame-pointer", i32 2}
!317 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!318 = distinct !DISubprogram(name: "syncookie_xdp", scope: !3, file: !3, line: 784, type: !319, scopeLine: 785, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !321)
!319 = !DISubroutineType(types: !320)
!320 = !{!84, !183}
!321 = !{!322, !323, !324, !325, !343}
!322 = !DILocalVariable(name: "ctx", arg: 1, scope: !318, file: !3, line: 784, type: !183)
!323 = !DILocalVariable(name: "data_end", scope: !318, file: !3, line: 786, type: !69)
!324 = !DILocalVariable(name: "data", scope: !318, file: !3, line: 787, type: !69)
!325 = !DILocalVariable(name: "hdr", scope: !318, file: !3, line: 788, type: !326)
!326 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "header_pointers", file: !3, line: 347, size: 320, elements: !327)
!327 = !{!328, !339, !340, !341, !342}
!328 = !DIDerivedType(tag: DW_TAG_member, name: "eth", scope: !326, file: !3, line: 348, baseType: !329, size: 64)
!329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !330, size: 64)
!330 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !331, line: 168, size: 112, elements: !332)
!331 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!332 = !{!333, !337, !338}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !330, file: !331, line: 169, baseType: !334, size: 48)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 48, elements: !335)
!335 = !{!336}
!336 = !DISubrange(count: 6)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !330, file: !331, line: 170, baseType: !334, size: 48, offset: 48)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !330, file: !331, line: 171, baseType: !118, size: 16, offset: 96)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4", scope: !326, file: !3, line: 349, baseType: !205, size: 64, offset: 64)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6", scope: !326, file: !3, line: 350, baseType: !237, size: 64, offset: 128)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "tcp", scope: !326, file: !3, line: 351, baseType: !231, size: 64, offset: 192)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_len", scope: !326, file: !3, line: 352, baseType: !71, size: 16, offset: 256)
!343 = !DILocalVariable(name: "ret", scope: !318, file: !3, line: 789, type: !84)
!344 = !DILocation(line: 788, column: 25, scope: !318)
!345 = !DILocation(line: 0, scope: !318)
!346 = !DILocation(line: 786, column: 38, scope: !318)
!347 = !{!348, !349, i64 4}
!348 = !{!"xdp_md", !349, i64 0, !349, i64 4, !349, i64 8, !349, i64 12, !349, i64 16, !349, i64 20}
!349 = !{!"int", !350, i64 0}
!350 = !{!"omnipotent char", !351, i64 0}
!351 = !{!"Simple C/C++ TBAA"}
!352 = !DILocation(line: 786, column: 27, scope: !318)
!353 = !DILocation(line: 786, column: 19, scope: !318)
!354 = !DILocation(line: 787, column: 34, scope: !318)
!355 = !{!348, !349, i64 0}
!356 = !DILocation(line: 787, column: 23, scope: !318)
!357 = !DILocation(line: 787, column: 15, scope: !318)
!358 = !DILocalVariable(name: "ctx", arg: 1, scope: !359, file: !3, line: 716, type: !69)
!359 = distinct !DISubprogram(name: "syncookie_part1", scope: !3, file: !3, line: 716, type: !360, scopeLine: 718, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !363)
!360 = !DISubroutineType(types: !361)
!361 = !{!84, !69, !69, !69, !362, !97}
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!363 = !{!358, !364, !365, !366, !367, !368}
!364 = !DILocalVariable(name: "data", arg: 2, scope: !359, file: !3, line: 716, type: !69)
!365 = !DILocalVariable(name: "data_end", arg: 3, scope: !359, file: !3, line: 716, type: !69)
!366 = !DILocalVariable(name: "hdr", arg: 4, scope: !359, file: !3, line: 717, type: !362)
!367 = !DILocalVariable(name: "xdp", arg: 5, scope: !359, file: !3, line: 717, type: !97)
!368 = !DILocalVariable(name: "ret", scope: !359, file: !3, line: 719, type: !84)
!369 = !DILocation(line: 0, scope: !359, inlinedAt: !370)
!370 = distinct !DILocation(line: 791, column: 8, scope: !318)
!371 = !DILocalVariable(name: "data", arg: 1, scope: !372, file: !3, line: 355, type: !69)
!372 = distinct !DISubprogram(name: "tcp_dissect", scope: !3, file: !3, line: 355, type: !373, scopeLine: 357, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !375)
!373 = !DISubroutineType(types: !374)
!374 = !{!84, !69, !69, !362}
!375 = !{!371, !376, !377}
!376 = !DILocalVariable(name: "data_end", arg: 2, scope: !372, file: !3, line: 355, type: !69)
!377 = !DILocalVariable(name: "hdr", arg: 3, scope: !372, file: !3, line: 356, type: !362)
!378 = !DILocation(line: 0, scope: !372, inlinedAt: !379)
!379 = distinct !DILocation(line: 721, column: 8, scope: !359, inlinedAt: !370)
!380 = !DILocation(line: 359, column: 15, scope: !381, inlinedAt: !379)
!381 = distinct !DILexicalBlock(scope: !372, file: !3, line: 359, column: 6)
!382 = !DILocation(line: 359, column: 19, scope: !381, inlinedAt: !379)
!383 = !DILocation(line: 359, column: 6, scope: !372, inlinedAt: !379)
!384 = !DILocation(line: 362, column: 10, scope: !372, inlinedAt: !379)
!385 = !{!386, !387, i64 12}
!386 = !{!"ethhdr", !350, i64 0, !350, i64 6, !387, i64 12}
!387 = !{!"short", !350, i64 0}
!388 = !DILocation(line: 362, column: 2, scope: !372, inlinedAt: !379)
!389 = !DILocation(line: 366, column: 13, scope: !390, inlinedAt: !379)
!390 = distinct !DILexicalBlock(scope: !372, file: !3, line: 362, column: 40)
!391 = !DILocation(line: 367, column: 17, scope: !392, inlinedAt: !379)
!392 = distinct !DILexicalBlock(scope: !390, file: !3, line: 367, column: 7)
!393 = !DILocation(line: 367, column: 21, scope: !392, inlinedAt: !379)
!394 = !DILocation(line: 367, column: 7, scope: !390, inlinedAt: !379)
!395 = !DILocation(line: 369, column: 18, scope: !396, inlinedAt: !379)
!396 = distinct !DILexicalBlock(scope: !390, file: !3, line: 369, column: 7)
!397 = !DILocation(line: 369, column: 22, scope: !396, inlinedAt: !379)
!398 = !DILocation(line: 369, column: 26, scope: !396, inlinedAt: !379)
!399 = !DILocation(line: 369, column: 7, scope: !390, inlinedAt: !379)
!400 = !DILocation(line: 374, column: 18, scope: !401, inlinedAt: !379)
!401 = distinct !DILexicalBlock(scope: !390, file: !3, line: 374, column: 7)
!402 = !{!403, !350, i64 9}
!403 = !{!"iphdr", !350, i64 0, !350, i64 0, !350, i64 1, !387, i64 2, !387, i64 4, !387, i64 6, !350, i64 8, !350, i64 9, !387, i64 10, !350, i64 12}
!404 = !DILocation(line: 374, column: 27, scope: !401, inlinedAt: !379)
!405 = !DILocation(line: 374, column: 7, scope: !390, inlinedAt: !379)
!406 = !DILocation(line: 377, column: 32, scope: !390, inlinedAt: !379)
!407 = !DILocation(line: 378, column: 3, scope: !390, inlinedAt: !379)
!408 = !DILocation(line: 382, column: 13, scope: !390, inlinedAt: !379)
!409 = !DILocation(line: 383, column: 17, scope: !410, inlinedAt: !379)
!410 = distinct !DILexicalBlock(scope: !390, file: !3, line: 383, column: 7)
!411 = !DILocation(line: 383, column: 21, scope: !410, inlinedAt: !379)
!412 = !DILocation(line: 383, column: 7, scope: !390, inlinedAt: !379)
!413 = !DILocation(line: 385, column: 18, scope: !414, inlinedAt: !379)
!414 = distinct !DILexicalBlock(scope: !390, file: !3, line: 385, column: 7)
!415 = !DILocation(line: 385, column: 26, scope: !414, inlinedAt: !379)
!416 = !DILocation(line: 385, column: 7, scope: !390, inlinedAt: !379)
!417 = !DILocation(line: 391, column: 18, scope: !418, inlinedAt: !379)
!418 = distinct !DILexicalBlock(scope: !390, file: !3, line: 391, column: 7)
!419 = !{!420, !350, i64 6}
!420 = !{!"ipv6hdr", !350, i64 0, !350, i64 0, !350, i64 1, !387, i64 4, !350, i64 6, !350, i64 7, !350, i64 8}
!421 = !DILocation(line: 391, column: 26, scope: !418, inlinedAt: !379)
!422 = !DILocation(line: 391, column: 7, scope: !390, inlinedAt: !379)
!423 = !DILocation(line: 0, scope: !390, inlinedAt: !379)
!424 = !DILocation(line: 401, column: 15, scope: !425, inlinedAt: !379)
!425 = distinct !DILexicalBlock(scope: !372, file: !3, line: 401, column: 6)
!426 = !DILocation(line: 401, column: 19, scope: !425, inlinedAt: !379)
!427 = !DILocation(line: 401, column: 6, scope: !372, inlinedAt: !379)
!428 = !DILocation(line: 403, column: 27, scope: !372, inlinedAt: !379)
!429 = !DILocation(line: 403, column: 32, scope: !372, inlinedAt: !379)
!430 = !DILocation(line: 404, column: 19, scope: !431, inlinedAt: !379)
!431 = distinct !DILexicalBlock(scope: !372, file: !3, line: 404, column: 6)
!432 = !DILocalVariable(name: "ctx", arg: 1, scope: !433, file: !3, line: 410, type: !69)
!433 = distinct !DISubprogram(name: "tcp_lookup", scope: !3, file: !3, line: 410, type: !434, scopeLine: 411, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !436)
!434 = !DISubroutineType(types: !435)
!435 = !{!84, !69, !362, !97}
!436 = !{!432, !437, !438, !439, !440, !460, !462, !463}
!437 = !DILocalVariable(name: "hdr", arg: 2, scope: !433, file: !3, line: 410, type: !362)
!438 = !DILocalVariable(name: "xdp", arg: 3, scope: !433, file: !3, line: 410, type: !97)
!439 = !DILocalVariable(name: "ct_lookup_opts", scope: !433, file: !3, line: 412, type: !305)
!440 = !DILocalVariable(name: "tup", scope: !433, file: !3, line: 416, type: !441)
!441 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock_tuple", file: !12, line: 4335, size: 288, elements: !442)
!442 = !{!443}
!443 = !DIDerivedType(tag: DW_TAG_member, scope: !441, file: !12, line: 4336, baseType: !444, size: 288)
!444 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !441, file: !12, line: 4336, size: 288, elements: !445)
!445 = !{!446, !453}
!446 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4", scope: !444, file: !12, line: 4342, baseType: !447, size: 96)
!447 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !444, file: !12, line: 4337, size: 96, elements: !448)
!448 = !{!449, !450, !451, !452}
!449 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !447, file: !12, line: 4338, baseType: !93, size: 32)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !447, file: !12, line: 4339, baseType: !93, size: 32, offset: 32)
!451 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !447, file: !12, line: 4340, baseType: !118, size: 16, offset: 64)
!452 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !447, file: !12, line: 4341, baseType: !118, size: 16, offset: 80)
!453 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6", scope: !444, file: !12, line: 4348, baseType: !454, size: 288)
!454 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !444, file: !12, line: 4343, size: 288, elements: !455)
!455 = !{!456, !457, !458, !459}
!456 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !454, file: !12, line: 4344, baseType: !270, size: 128)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !454, file: !12, line: 4345, baseType: !270, size: 128, offset: 128)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !454, file: !12, line: 4346, baseType: !118, size: 16, offset: 256)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !454, file: !12, line: 4347, baseType: !118, size: 16, offset: 272)
!460 = !DILocalVariable(name: "ct", scope: !433, file: !3, line: 417, type: !461)
!461 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!462 = !DILocalVariable(name: "tup_size", scope: !433, file: !3, line: 418, type: !74)
!463 = !DILocalVariable(name: "status", scope: !464, file: !3, line: 447, type: !304)
!464 = distinct !DILexicalBlock(scope: !465, file: !3, line: 446, column: 10)
!465 = distinct !DILexicalBlock(scope: !433, file: !3, line: 446, column: 6)
!466 = !DILocation(line: 0, scope: !433, inlinedAt: !467)
!467 = distinct !DILocation(line: 725, column: 8, scope: !359, inlinedAt: !370)
!468 = !DILocation(line: 412, column: 2, scope: !433, inlinedAt: !467)
!469 = !DILocation(line: 412, column: 29, scope: !433, inlinedAt: !467)
!470 = !DILocation(line: 416, column: 2, scope: !433, inlinedAt: !467)
!471 = !DILocation(line: 416, column: 24, scope: !433, inlinedAt: !467)
!472 = !DILocation(line: 420, column: 6, scope: !473, inlinedAt: !467)
!473 = distinct !DILexicalBlock(scope: !433, file: !3, line: 420, column: 6)
!474 = !DILocation(line: 420, column: 6, scope: !433, inlinedAt: !467)
!475 = !DILocation(line: 424, column: 19, scope: !476, inlinedAt: !467)
!476 = distinct !DILexicalBlock(scope: !477, file: !3, line: 424, column: 7)
!477 = distinct !DILexicalBlock(scope: !473, file: !3, line: 420, column: 17)
!478 = !{!403, !387, i64 6}
!479 = !DILocation(line: 424, column: 28, scope: !476, inlinedAt: !467)
!480 = !DILocation(line: 424, column: 68, scope: !476, inlinedAt: !467)
!481 = !DILocation(line: 424, column: 7, scope: !477, inlinedAt: !467)
!482 = !DILocation(line: 427, column: 31, scope: !477, inlinedAt: !467)
!483 = !{!350, !350, i64 0}
!484 = !DILocation(line: 427, column: 7, scope: !477, inlinedAt: !467)
!485 = !DILocation(line: 427, column: 12, scope: !477, inlinedAt: !467)
!486 = !DILocation(line: 427, column: 18, scope: !477, inlinedAt: !467)
!487 = !DILocation(line: 428, column: 31, scope: !477, inlinedAt: !467)
!488 = !DILocation(line: 428, column: 12, scope: !477, inlinedAt: !467)
!489 = !DILocation(line: 428, column: 18, scope: !477, inlinedAt: !467)
!490 = !DILocation(line: 429, column: 30, scope: !477, inlinedAt: !467)
!491 = !{!492, !387, i64 0}
!492 = !{!"tcphdr", !387, i64 0, !387, i64 2, !349, i64 4, !349, i64 8, !387, i64 12, !387, i64 12, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 13, !387, i64 14, !387, i64 16, !387, i64 18}
!493 = !DILocation(line: 429, column: 12, scope: !477, inlinedAt: !467)
!494 = !DILocation(line: 429, column: 18, scope: !477, inlinedAt: !467)
!495 = !DILocation(line: 430, column: 30, scope: !477, inlinedAt: !467)
!496 = !{!492, !387, i64 2}
!497 = !DILocation(line: 430, column: 12, scope: !477, inlinedAt: !467)
!498 = !DILocation(line: 430, column: 18, scope: !477, inlinedAt: !467)
!499 = !DILocation(line: 432, column: 2, scope: !477, inlinedAt: !467)
!500 = !DILocation(line: 432, column: 13, scope: !501, inlinedAt: !467)
!501 = distinct !DILexicalBlock(scope: !473, file: !3, line: 432, column: 13)
!502 = !DILocation(line: 432, column: 13, scope: !473, inlinedAt: !467)
!503 = !DILocation(line: 433, column: 48, scope: !504, inlinedAt: !467)
!504 = distinct !DILexicalBlock(scope: !501, file: !3, line: 432, column: 24)
!505 = !DILocation(line: 433, column: 3, scope: !504, inlinedAt: !467)
!506 = !DILocation(line: 434, column: 3, scope: !504, inlinedAt: !467)
!507 = !DILocation(line: 434, column: 48, scope: !504, inlinedAt: !467)
!508 = !DILocation(line: 435, column: 30, scope: !504, inlinedAt: !467)
!509 = !DILocation(line: 435, column: 12, scope: !504, inlinedAt: !467)
!510 = !DILocation(line: 435, column: 18, scope: !504, inlinedAt: !467)
!511 = !DILocation(line: 436, column: 30, scope: !504, inlinedAt: !467)
!512 = !DILocation(line: 436, column: 12, scope: !504, inlinedAt: !467)
!513 = !DILocation(line: 436, column: 18, scope: !504, inlinedAt: !467)
!514 = !DILocation(line: 0, scope: !473, inlinedAt: !467)
!515 = !DILocation(line: 445, column: 7, scope: !433, inlinedAt: !467)
!516 = !DILocation(line: 446, column: 6, scope: !465, inlinedAt: !467)
!517 = !DILocation(line: 446, column: 6, scope: !433, inlinedAt: !467)
!518 = !DILocation(line: 447, column: 30, scope: !464, inlinedAt: !467)
!519 = !{!520, !521, i64 0}
!520 = !{!"nf_conn", !521, i64 0}
!521 = !{!"long", !350, i64 0}
!522 = !DILocation(line: 0, scope: !464, inlinedAt: !467)
!523 = !DILocation(line: 449, column: 3, scope: !464, inlinedAt: !467)
!524 = !DILocation(line: 450, column: 14, scope: !525, inlinedAt: !467)
!525 = distinct !DILexicalBlock(scope: !464, file: !3, line: 450, column: 7)
!526 = !DILocation(line: 452, column: 28, scope: !527, inlinedAt: !467)
!527 = distinct !DILexicalBlock(scope: !465, file: !3, line: 452, column: 13)
!528 = !{!529, !349, i64 4}
!529 = !{!"bpf_ct_opts___local", !349, i64 0, !349, i64 4, !350, i64 8, !350, i64 9, !350, i64 10}
!530 = !DILocation(line: 452, column: 34, scope: !527, inlinedAt: !467)
!531 = !DILocation(line: 452, column: 13, scope: !465, inlinedAt: !467)
!532 = !DILocation(line: 458, column: 1, scope: !433, inlinedAt: !467)
!533 = !DILocation(line: 726, column: 6, scope: !359, inlinedAt: !370)
!534 = !DILocation(line: 730, column: 26, scope: !535, inlinedAt: !370)
!535 = distinct !DILexicalBlock(scope: !359, file: !3, line: 730, column: 6)
!536 = !DILocalVariable(name: "port", arg: 1, scope: !537, file: !3, line: 322, type: !71)
!537 = distinct !DISubprogram(name: "check_port_allowed", scope: !3, file: !3, line: 322, type: !538, scopeLine: 323, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !540)
!538 = !DISubroutineType(types: !539)
!539 = !{!97, !71}
!540 = !{!536, !541, !542, !546}
!541 = !DILocalVariable(name: "i", scope: !537, file: !3, line: 324, type: !74)
!542 = !DILocalVariable(name: "key", scope: !543, file: !3, line: 327, type: !74)
!543 = distinct !DILexicalBlock(scope: !544, file: !3, line: 326, column: 42)
!544 = distinct !DILexicalBlock(scope: !545, file: !3, line: 326, column: 2)
!545 = distinct !DILexicalBlock(scope: !537, file: !3, line: 326, column: 2)
!546 = !DILocalVariable(name: "value", scope: !543, file: !3, line: 328, type: !164)
!547 = !DILocation(line: 0, scope: !537, inlinedAt: !548)
!548 = distinct !DILocation(line: 730, column: 7, scope: !535, inlinedAt: !370)
!549 = !DILocation(line: 327, column: 3, scope: !543, inlinedAt: !548)
!550 = !DILocation(line: 0, scope: !543, inlinedAt: !548)
!551 = !DILocation(line: 327, column: 9, scope: !543, inlinedAt: !548)
!552 = !{!349, !349, i64 0}
!553 = !DILocation(line: 330, column: 11, scope: !543, inlinedAt: !548)
!554 = !DILocation(line: 332, column: 8, scope: !555, inlinedAt: !548)
!555 = distinct !DILexicalBlock(scope: !543, file: !3, line: 332, column: 7)
!556 = !DILocation(line: 332, column: 7, scope: !543, inlinedAt: !548)
!557 = !DILocation(line: 337, column: 7, scope: !558, inlinedAt: !548)
!558 = distinct !DILexicalBlock(scope: !543, file: !3, line: 337, column: 7)
!559 = !{!387, !387, i64 0}
!560 = !DILocation(line: 337, column: 14, scope: !558, inlinedAt: !548)
!561 = !DILocation(line: 337, column: 7, scope: !543, inlinedAt: !548)
!562 = !DILocation(line: 340, column: 14, scope: !563, inlinedAt: !548)
!563 = distinct !DILexicalBlock(scope: !543, file: !3, line: 340, column: 7)
!564 = !DILocation(line: 342, column: 2, scope: !544, inlinedAt: !548)
!565 = !DILocation(line: 0, scope: !544, inlinedAt: !548)
!566 = !DILocation(line: 735, column: 17, scope: !567, inlinedAt: !370)
!567 = distinct !DILexicalBlock(scope: !359, file: !3, line: 735, column: 6)
!568 = !DILocation(line: 735, column: 33, scope: !567, inlinedAt: !370)
!569 = !DILocation(line: 735, column: 21, scope: !567, inlinedAt: !370)
!570 = !DILocation(line: 735, column: 38, scope: !567, inlinedAt: !370)
!571 = !DILocation(line: 735, column: 6, scope: !359, inlinedAt: !370)
!572 = !DILocation(line: 742, column: 43, scope: !573, inlinedAt: !370)
!573 = distinct !DILexicalBlock(scope: !574, file: !3, line: 742, column: 7)
!574 = distinct !DILexicalBlock(scope: !575, file: !3, line: 741, column: 11)
!575 = distinct !DILexicalBlock(scope: !359, file: !3, line: 741, column: 6)
!576 = !DILocation(line: 742, column: 7, scope: !573, inlinedAt: !370)
!577 = !DILocation(line: 795, column: 32, scope: !318)
!578 = !DILocation(line: 795, column: 21, scope: !318)
!579 = !DILocation(line: 795, column: 13, scope: !318)
!580 = !DILocation(line: 796, column: 28, scope: !318)
!581 = !DILocation(line: 796, column: 17, scope: !318)
!582 = !DILocation(line: 796, column: 9, scope: !318)
!583 = !DILocalVariable(name: "ctx", arg: 1, scope: !584, file: !3, line: 749, type: !69)
!584 = distinct !DISubprogram(name: "syncookie_part2", scope: !3, file: !3, line: 749, type: !585, scopeLine: 751, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !587)
!585 = !DISubroutineType(types: !586)
!586 = !{!84, !69, !69, !69, !362}
!587 = !{!583, !588, !589, !590}
!588 = !DILocalVariable(name: "data", arg: 2, scope: !584, file: !3, line: 749, type: !69)
!589 = !DILocalVariable(name: "data_end", arg: 3, scope: !584, file: !3, line: 749, type: !69)
!590 = !DILocalVariable(name: "hdr", arg: 4, scope: !584, file: !3, line: 750, type: !362)
!591 = !DILocation(line: 0, scope: !584, inlinedAt: !592)
!592 = distinct !DILocation(line: 798, column: 9, scope: !318)
!593 = !DILocation(line: 752, column: 6, scope: !584, inlinedAt: !592)
!594 = !DILocation(line: 754, column: 32, scope: !595, inlinedAt: !592)
!595 = distinct !DILexicalBlock(scope: !596, file: !3, line: 752, column: 17)
!596 = distinct !DILexicalBlock(scope: !584, file: !3, line: 752, column: 6)
!597 = !DILocation(line: 758, column: 25, scope: !598, inlinedAt: !592)
!598 = distinct !DILexicalBlock(scope: !595, file: !3, line: 758, column: 7)
!599 = !DILocation(line: 758, column: 39, scope: !598, inlinedAt: !592)
!600 = !DILocation(line: 758, column: 7, scope: !595, inlinedAt: !592)
!601 = !DILocation(line: 754, column: 13, scope: !595, inlinedAt: !592)
!602 = !DILocation(line: 760, column: 45, scope: !595, inlinedAt: !592)
!603 = !DILocation(line: 760, column: 49, scope: !595, inlinedAt: !592)
!604 = !DILocation(line: 760, column: 32, scope: !595, inlinedAt: !592)
!605 = !DILocation(line: 761, column: 2, scope: !595, inlinedAt: !592)
!606 = !DILocation(line: 761, column: 13, scope: !607, inlinedAt: !592)
!607 = distinct !DILexicalBlock(scope: !596, file: !3, line: 761, column: 13)
!608 = !DILocation(line: 761, column: 13, scope: !596, inlinedAt: !592)
!609 = !DILocation(line: 763, column: 32, scope: !610, inlinedAt: !592)
!610 = distinct !DILexicalBlock(scope: !607, file: !3, line: 761, column: 24)
!611 = !DILocation(line: 763, column: 13, scope: !610, inlinedAt: !592)
!612 = !DILocation(line: 764, column: 32, scope: !610, inlinedAt: !592)
!613 = !DILocation(line: 0, scope: !596, inlinedAt: !592)
!614 = !DILocation(line: 769, column: 23, scope: !615, inlinedAt: !592)
!615 = distinct !DILexicalBlock(scope: !584, file: !3, line: 769, column: 6)
!616 = !DILocation(line: 769, column: 36, scope: !615, inlinedAt: !592)
!617 = !DILocation(line: 769, column: 6, scope: !584, inlinedAt: !592)
!618 = !DILocation(line: 775, column: 27, scope: !584, inlinedAt: !592)
!619 = !DILocation(line: 775, column: 32, scope: !584, inlinedAt: !592)
!620 = !DILocation(line: 776, column: 19, scope: !621, inlinedAt: !592)
!621 = distinct !DILexicalBlock(scope: !584, file: !3, line: 776, column: 6)
!622 = !DILocation(line: 776, column: 6, scope: !584, inlinedAt: !592)
!623 = !DILocation(line: 779, column: 9, scope: !584, inlinedAt: !592)
!624 = !DILocalVariable(name: "hdr", arg: 1, scope: !625, file: !3, line: 557, type: !362)
!625 = distinct !DISubprogram(name: "syncookie_handle_syn", scope: !3, file: !3, line: 557, type: !626, scopeLine: 560, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !628)
!626 = !DISubroutineType(types: !627)
!627 = !{!84, !362, !69, !69, !69}
!628 = !{!624, !629, !630, !631, !632, !633, !634, !636, !638, !639, !640, !641}
!629 = !DILocalVariable(name: "ctx", arg: 2, scope: !625, file: !3, line: 558, type: !69)
!630 = !DILocalVariable(name: "data", arg: 3, scope: !625, file: !3, line: 559, type: !69)
!631 = !DILocalVariable(name: "data_end", arg: 4, scope: !625, file: !3, line: 559, type: !69)
!632 = !DILocalVariable(name: "old_pkt_size", scope: !625, file: !3, line: 561, type: !74)
!633 = !DILocalVariable(name: "new_pkt_size", scope: !625, file: !3, line: 561, type: !74)
!634 = !DILocalVariable(name: "tsopt", scope: !625, file: !3, line: 578, type: !635)
!635 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !92)
!636 = !DILocalVariable(name: "tsopt_buf", scope: !625, file: !3, line: 579, type: !637)
!637 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 64, elements: !148)
!638 = !DILocalVariable(name: "ip_len", scope: !625, file: !3, line: 580, type: !71)
!639 = !DILocalVariable(name: "cookie", scope: !625, file: !3, line: 581, type: !74)
!640 = !DILocalVariable(name: "value", scope: !625, file: !3, line: 582, type: !197)
!641 = !DILocalVariable(name: "new_tcp_header", scope: !642, file: !3, line: 643, type: !231)
!642 = distinct !DILexicalBlock(scope: !643, file: !3, line: 642, column: 48)
!643 = distinct !DILexicalBlock(scope: !644, file: !3, line: 642, column: 7)
!644 = distinct !DILexicalBlock(scope: !645, file: !3, line: 641, column: 17)
!645 = distinct !DILexicalBlock(scope: !625, file: !3, line: 641, column: 6)
!646 = !DILocation(line: 0, scope: !625, inlinedAt: !647)
!647 = distinct !DILocation(line: 779, column: 25, scope: !584, inlinedAt: !592)
!648 = !DILocation(line: 578, column: 2, scope: !625, inlinedAt: !647)
!649 = !DILocation(line: 578, column: 20, scope: !625, inlinedAt: !647)
!650 = !{!651, !651, i64 0}
!651 = !{!"any pointer", !350, i64 0}
!652 = !DILocation(line: 579, column: 2, scope: !625, inlinedAt: !647)
!653 = !DILocation(line: 579, column: 9, scope: !625, inlinedAt: !647)
!654 = !DILocation(line: 587, column: 20, scope: !655, inlinedAt: !647)
!655 = distinct !DILexicalBlock(scope: !625, file: !3, line: 587, column: 6)
!656 = !DILocation(line: 590, column: 6, scope: !657, inlinedAt: !647)
!657 = distinct !DILexicalBlock(scope: !625, file: !3, line: 590, column: 6)
!658 = !DILocation(line: 590, column: 6, scope: !625, inlinedAt: !647)
!659 = !DILocation(line: 592, column: 31, scope: !660, inlinedAt: !647)
!660 = distinct !DILexicalBlock(scope: !657, file: !3, line: 590, column: 17)
!661 = !DILocation(line: 592, column: 61, scope: !660, inlinedAt: !647)
!662 = !DILocation(line: 592, column: 65, scope: !660, inlinedAt: !647)
!663 = !DILocation(line: 592, column: 11, scope: !660, inlinedAt: !647)
!664 = !DILocation(line: 593, column: 13, scope: !665, inlinedAt: !647)
!665 = distinct !DILexicalBlock(scope: !660, file: !3, line: 593, column: 7)
!666 = !DILocation(line: 593, column: 7, scope: !660, inlinedAt: !647)
!667 = !DILocation(line: 595, column: 17, scope: !668, inlinedAt: !647)
!668 = distinct !DILexicalBlock(scope: !660, file: !3, line: 595, column: 7)
!669 = !DILocalVariable(name: "csum", arg: 1, scope: !670, file: !3, line: 119, type: !74)
!670 = distinct !DISubprogram(name: "csum_fold", scope: !3, file: !3, line: 119, type: !671, scopeLine: 120, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !673)
!671 = !DISubroutineType(types: !672)
!672 = !{!71, !74}
!673 = !{!669}
!674 = !DILocation(line: 0, scope: !670, inlinedAt: !675)
!675 = distinct !DILocation(line: 595, column: 7, scope: !668, inlinedAt: !647)
!676 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !675)
!677 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !675)
!678 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !675)
!679 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !675)
!680 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !675)
!681 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !675)
!682 = !DILocation(line: 595, column: 24, scope: !668, inlinedAt: !647)
!683 = !DILocation(line: 595, column: 7, scope: !660, inlinedAt: !647)
!684 = !DILocation(line: 598, column: 44, scope: !660, inlinedAt: !647)
!685 = !DILocation(line: 598, column: 49, scope: !660, inlinedAt: !647)
!686 = !DILocation(line: 598, column: 11, scope: !660, inlinedAt: !647)
!687 = !DILocation(line: 599, column: 13, scope: !688, inlinedAt: !647)
!688 = distinct !DILexicalBlock(scope: !660, file: !3, line: 599, column: 7)
!689 = !DILocation(line: 599, column: 7, scope: !660, inlinedAt: !647)
!690 = !DILocation(line: 601, column: 36, scope: !691, inlinedAt: !647)
!691 = distinct !DILexicalBlock(scope: !660, file: !3, line: 601, column: 7)
!692 = !DILocation(line: 601, column: 54, scope: !691, inlinedAt: !647)
!693 = !DILocalVariable(name: "saddr", arg: 1, scope: !694, file: !3, line: 126, type: !74)
!694 = distinct !DISubprogram(name: "csum_tcpudp_magic", scope: !3, file: !3, line: 126, type: !695, scopeLine: 129, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !697)
!695 = !DISubroutineType(types: !696)
!696 = !{!71, !74, !74, !74, !76, !74}
!697 = !{!693, !698, !699, !700, !701, !702}
!698 = !DILocalVariable(name: "daddr", arg: 2, scope: !694, file: !3, line: 126, type: !74)
!699 = !DILocalVariable(name: "len", arg: 3, scope: !694, file: !3, line: 127, type: !74)
!700 = !DILocalVariable(name: "proto", arg: 4, scope: !694, file: !3, line: 127, type: !76)
!701 = !DILocalVariable(name: "csum", arg: 5, scope: !694, file: !3, line: 128, type: !74)
!702 = !DILocalVariable(name: "s", scope: !694, file: !3, line: 130, type: !154)
!703 = !DILocation(line: 0, scope: !694, inlinedAt: !704)
!704 = distinct !DILocation(line: 601, column: 7, scope: !691, inlinedAt: !647)
!705 = !DILocation(line: 130, column: 12, scope: !694, inlinedAt: !704)
!706 = !DILocation(line: 132, column: 7, scope: !694, inlinedAt: !704)
!707 = !DILocation(line: 133, column: 7, scope: !694, inlinedAt: !704)
!708 = !DILocation(line: 137, column: 21, scope: !694, inlinedAt: !704)
!709 = !DILocation(line: 137, column: 7, scope: !694, inlinedAt: !704)
!710 = !DILocation(line: 132, column: 4, scope: !694, inlinedAt: !704)
!711 = !DILocation(line: 133, column: 4, scope: !694, inlinedAt: !704)
!712 = !DILocation(line: 137, column: 4, scope: !694, inlinedAt: !704)
!713 = !DILocation(line: 141, column: 9, scope: !694, inlinedAt: !704)
!714 = !DILocation(line: 141, column: 28, scope: !694, inlinedAt: !704)
!715 = !DILocation(line: 141, column: 23, scope: !694, inlinedAt: !704)
!716 = !DILocation(line: 142, column: 28, scope: !694, inlinedAt: !704)
!717 = !DILocation(line: 142, column: 23, scope: !694, inlinedAt: !704)
!718 = !DILocation(line: 144, column: 19, scope: !694, inlinedAt: !704)
!719 = !DILocation(line: 0, scope: !670, inlinedAt: !720)
!720 = distinct !DILocation(line: 144, column: 9, scope: !694, inlinedAt: !704)
!721 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !720)
!722 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !720)
!723 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !720)
!724 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !720)
!725 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !720)
!726 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !720)
!727 = !DILocation(line: 602, column: 45, scope: !691, inlinedAt: !647)
!728 = !DILocation(line: 601, column: 7, scope: !660, inlinedAt: !647)
!729 = !DILocation(line: 607, column: 11, scope: !660, inlinedAt: !647)
!730 = !DILocation(line: 609, column: 2, scope: !660, inlinedAt: !647)
!731 = !DILocation(line: 609, column: 13, scope: !732, inlinedAt: !647)
!732 = distinct !DILexicalBlock(scope: !657, file: !3, line: 609, column: 13)
!733 = !DILocation(line: 609, column: 13, scope: !657, inlinedAt: !647)
!734 = !DILocation(line: 611, column: 31, scope: !735, inlinedAt: !647)
!735 = distinct !DILexicalBlock(scope: !732, file: !3, line: 609, column: 24)
!736 = !DILocation(line: 611, column: 49, scope: !735, inlinedAt: !647)
!737 = !DILocation(line: 611, column: 11, scope: !735, inlinedAt: !647)
!738 = !DILocation(line: 612, column: 13, scope: !739, inlinedAt: !647)
!739 = distinct !DILexicalBlock(scope: !735, file: !3, line: 612, column: 7)
!740 = !DILocation(line: 612, column: 7, scope: !735, inlinedAt: !647)
!741 = !DILocalVariable(name: "saddr", arg: 1, scope: !742, file: !3, line: 147, type: !745)
!742 = distinct !DISubprogram(name: "csum_ipv6_magic", scope: !3, file: !3, line: 147, type: !743, scopeLine: 150, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !747)
!743 = !DISubroutineType(types: !744)
!744 = !{!71, !745, !745, !74, !76, !74}
!745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !746, size: 64)
!746 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !257)
!747 = !{!741, !748, !749, !750, !751, !752, !753}
!748 = !DILocalVariable(name: "daddr", arg: 2, scope: !742, file: !3, line: 148, type: !745)
!749 = !DILocalVariable(name: "len", arg: 3, scope: !742, file: !3, line: 149, type: !74)
!750 = !DILocalVariable(name: "proto", arg: 4, scope: !742, file: !3, line: 149, type: !76)
!751 = !DILocalVariable(name: "csum", arg: 5, scope: !742, file: !3, line: 149, type: !74)
!752 = !DILocalVariable(name: "sum", scope: !742, file: !3, line: 151, type: !154)
!753 = !DILocalVariable(name: "i", scope: !742, file: !3, line: 152, type: !84)
!754 = !DILocation(line: 0, scope: !742, inlinedAt: !755)
!755 = distinct !DILocation(line: 614, column: 7, scope: !756, inlinedAt: !647)
!756 = distinct !DILexicalBlock(scope: !735, file: !3, line: 614, column: 7)
!757 = !DILocation(line: 151, column: 14, scope: !742, inlinedAt: !755)
!758 = !DILocation(line: 156, column: 17, scope: !759, inlinedAt: !755)
!759 = distinct !DILexicalBlock(scope: !760, file: !3, line: 155, column: 2)
!760 = distinct !DILexicalBlock(scope: !742, file: !3, line: 155, column: 2)
!761 = !DILocation(line: 156, column: 10, scope: !759, inlinedAt: !755)
!762 = !DILocation(line: 160, column: 17, scope: !763, inlinedAt: !755)
!763 = distinct !DILexicalBlock(scope: !764, file: !3, line: 159, column: 2)
!764 = distinct !DILexicalBlock(scope: !742, file: !3, line: 159, column: 2)
!765 = !DILocation(line: 160, column: 10, scope: !763, inlinedAt: !755)
!766 = !DILocation(line: 163, column: 9, scope: !742, inlinedAt: !755)
!767 = !DILocation(line: 156, column: 7, scope: !759, inlinedAt: !755)
!768 = !DILocation(line: 160, column: 7, scope: !763, inlinedAt: !755)
!769 = !DILocation(line: 163, column: 6, scope: !742, inlinedAt: !755)
!770 = !DILocation(line: 164, column: 6, scope: !742, inlinedAt: !755)
!771 = !DILocation(line: 166, column: 13, scope: !742, inlinedAt: !755)
!772 = !DILocation(line: 166, column: 34, scope: !742, inlinedAt: !755)
!773 = !DILocation(line: 166, column: 27, scope: !742, inlinedAt: !755)
!774 = !DILocation(line: 167, column: 34, scope: !742, inlinedAt: !755)
!775 = !DILocation(line: 167, column: 27, scope: !742, inlinedAt: !755)
!776 = !DILocation(line: 169, column: 19, scope: !742, inlinedAt: !755)
!777 = !DILocation(line: 0, scope: !670, inlinedAt: !778)
!778 = distinct !DILocation(line: 169, column: 9, scope: !742, inlinedAt: !755)
!779 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !778)
!780 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !778)
!781 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !778)
!782 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !778)
!783 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !778)
!784 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !778)
!785 = !DILocation(line: 615, column: 43, scope: !756, inlinedAt: !647)
!786 = !DILocation(line: 614, column: 7, scope: !735, inlinedAt: !647)
!787 = !DILocation(line: 620, column: 11, scope: !735, inlinedAt: !647)
!788 = !DILocation(line: 0, scope: !657, inlinedAt: !647)
!789 = !DILocation(line: 626, column: 12, scope: !790, inlinedAt: !647)
!790 = distinct !DILexicalBlock(scope: !625, file: !3, line: 626, column: 6)
!791 = !DILocation(line: 626, column: 6, scope: !625, inlinedAt: !647)
!792 = !DILocation(line: 628, column: 11, scope: !625, inlinedAt: !647)
!793 = !DILocation(line: 631, column: 7, scope: !794, inlinedAt: !647)
!794 = distinct !DILexicalBlock(scope: !625, file: !3, line: 630, column: 6)
!795 = !DILocation(line: 631, column: 22, scope: !794, inlinedAt: !647)
!796 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !797, file: !3, line: 259, type: !231)
!797 = distinct !DISubprogram(name: "tscookie_init", scope: !3, file: !3, line: 259, type: !798, scopeLine: 262, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !800)
!798 = !DISubroutineType(types: !799)
!799 = !{!97, !231, !71, !92, !92, !69}
!800 = !{!796, !801, !802, !803, !804, !805, !806}
!801 = !DILocalVariable(name: "tcp_len", arg: 2, scope: !797, file: !3, line: 260, type: !71)
!802 = !DILocalVariable(name: "tsval", arg: 3, scope: !797, file: !3, line: 260, type: !92)
!803 = !DILocalVariable(name: "tsecr", arg: 4, scope: !797, file: !3, line: 261, type: !92)
!804 = !DILocalVariable(name: "data_end", arg: 5, scope: !797, file: !3, line: 261, type: !69)
!805 = !DILocalVariable(name: "loop_ctx", scope: !797, file: !3, line: 263, type: !86)
!806 = !DILocalVariable(name: "cookie", scope: !797, file: !3, line: 272, type: !74)
!807 = !DILocation(line: 0, scope: !797, inlinedAt: !808)
!808 = distinct !DILocation(line: 630, column: 6, scope: !794, inlinedAt: !647)
!809 = !DILocation(line: 263, column: 2, scope: !797, inlinedAt: !808)
!810 = !DILocation(line: 263, column: 24, scope: !797, inlinedAt: !808)
!811 = !DILocation(line: 264, column: 30, scope: !797, inlinedAt: !808)
!812 = !DILocation(line: 263, column: 35, scope: !797, inlinedAt: !808)
!813 = !{!814, !651, i64 0}
!814 = !{!"tcpopt_context", !651, i64 0, !651, i64 8, !651, i64 16, !651, i64 24, !350, i64 32, !815, i64 33, !815, i64 34}
!815 = !{!"_Bool", !350, i64 0}
!816 = !DILocation(line: 265, column: 29, scope: !797, inlinedAt: !808)
!817 = !{!814, !651, i64 8}
!818 = !{!814, !651, i64 16}
!819 = !{!814, !651, i64 24}
!820 = !{!814, !350, i64 32}
!821 = !{!814, !815, i64 33}
!822 = !{!814, !815, i64 34}
!823 = !DILocation(line: 274, column: 2, scope: !797, inlinedAt: !808)
!824 = !DILocation(line: 276, column: 16, scope: !825, inlinedAt: !808)
!825 = distinct !DILexicalBlock(scope: !797, file: !3, line: 276, column: 6)
!826 = !{i8 0, i8 2}
!827 = !DILocation(line: 276, column: 6, scope: !797, inlinedAt: !808)
!828 = !DILocation(line: 288, column: 1, scope: !797, inlinedAt: !808)
!829 = !DILocation(line: 174, column: 9, scope: !830, inlinedAt: !832)
!830 = distinct !DISubprogram(name: "tcp_clock_ns", scope: !3, file: !3, line: 172, type: !287, scopeLine: 173, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !831)
!831 = !{}
!832 = distinct !DILocation(line: 184, column: 22, scope: !833, inlinedAt: !836)
!833 = distinct !DISubprogram(name: "tcp_time_stamp_raw", scope: !3, file: !3, line: 182, type: !834, scopeLine: 183, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !831)
!834 = !DISubroutineType(types: !835)
!835 = !{!74}
!836 = distinct !DILocation(line: 279, column: 11, scope: !797, inlinedAt: !808)
!837 = !DILocalVariable(name: "ns", arg: 1, scope: !838, file: !3, line: 177, type: !154)
!838 = distinct !DISubprogram(name: "tcp_ns_to_ts", scope: !3, file: !3, line: 177, type: !839, scopeLine: 178, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !841)
!839 = !DISubroutineType(types: !840)
!840 = !{!74, !154}
!841 = !{!837}
!842 = !DILocation(line: 0, scope: !838, inlinedAt: !843)
!843 = distinct !DILocation(line: 184, column: 9, scope: !833, inlinedAt: !836)
!844 = !DILocation(line: 179, column: 12, scope: !838, inlinedAt: !843)
!845 = !DILocation(line: 179, column: 9, scope: !838, inlinedAt: !843)
!846 = !DILocation(line: 279, column: 32, scope: !797, inlinedAt: !808)
!847 = !DILocation(line: 280, column: 21, scope: !797, inlinedAt: !808)
!848 = !DILocation(line: 280, column: 28, scope: !797, inlinedAt: !808)
!849 = !DILocation(line: 280, column: 9, scope: !797, inlinedAt: !808)
!850 = !DILocation(line: 281, column: 15, scope: !851, inlinedAt: !808)
!851 = distinct !DILexicalBlock(scope: !797, file: !3, line: 281, column: 6)
!852 = !DILocation(line: 281, column: 6, scope: !797, inlinedAt: !808)
!853 = !DILocation(line: 283, column: 18, scope: !854, inlinedAt: !808)
!854 = distinct !DILexicalBlock(scope: !797, file: !3, line: 283, column: 6)
!855 = !DILocation(line: 283, column: 22, scope: !854, inlinedAt: !808)
!856 = !DILocation(line: 285, column: 11, scope: !797, inlinedAt: !808)
!857 = !DILocation(line: 285, column: 9, scope: !797, inlinedAt: !808)
!858 = !DILocation(line: 632, column: 9, scope: !794, inlinedAt: !647)
!859 = !DILocation(line: 632, column: 3, scope: !794, inlinedAt: !647)
!860 = !DILocation(line: 638, column: 11, scope: !861, inlinedAt: !647)
!861 = distinct !DILexicalBlock(scope: !625, file: !3, line: 638, column: 6)
!862 = !DILocation(line: 638, column: 31, scope: !861, inlinedAt: !647)
!863 = !DILocation(line: 638, column: 40, scope: !861, inlinedAt: !647)
!864 = !DILocation(line: 638, column: 53, scope: !861, inlinedAt: !647)
!865 = !DILocation(line: 638, column: 6, scope: !625, inlinedAt: !647)
!866 = !DILocation(line: 641, column: 6, scope: !625, inlinedAt: !647)
!867 = !DILocation(line: 642, column: 18, scope: !643, inlinedAt: !647)
!868 = !DILocation(line: 642, column: 26, scope: !643, inlinedAt: !647)
!869 = !DILocation(line: 642, column: 7, scope: !644, inlinedAt: !647)
!870 = !DILocation(line: 645, column: 46, scope: !642, inlinedAt: !647)
!871 = !DILocation(line: 0, scope: !642, inlinedAt: !647)
!872 = !DILocation(line: 646, column: 4, scope: !642, inlinedAt: !647)
!873 = !DILocation(line: 647, column: 13, scope: !642, inlinedAt: !647)
!874 = !DILocation(line: 649, column: 19, scope: !642, inlinedAt: !647)
!875 = !DILocation(line: 650, column: 3, scope: !642, inlinedAt: !647)
!876 = !DILocation(line: 652, column: 33, scope: !644, inlinedAt: !647)
!877 = !DILocalVariable(name: "hdr", arg: 1, scope: !878, file: !3, line: 513, type: !362)
!878 = distinct !DISubprogram(name: "tcpv4_gen_synack", scope: !3, file: !3, line: 513, type: !879, scopeLine: 515, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !881)
!879 = !DISubroutineType(types: !880)
!880 = !{null, !362, !74, !92}
!881 = !{!877, !882, !883, !884, !885, !886, !887}
!882 = !DILocalVariable(name: "cookie", arg: 2, scope: !878, file: !3, line: 514, type: !74)
!883 = !DILocalVariable(name: "tsopt", arg: 3, scope: !878, file: !3, line: 514, type: !92)
!884 = !DILocalVariable(name: "wscale", scope: !878, file: !3, line: 516, type: !76)
!885 = !DILocalVariable(name: "mss", scope: !878, file: !3, line: 517, type: !71)
!886 = !DILocalVariable(name: "ttl", scope: !878, file: !3, line: 518, type: !76)
!887 = !DILocalVariable(name: "__tmp", scope: !888, file: !3, line: 524, type: !93)
!888 = distinct !DILexicalBlock(scope: !878, file: !3, line: 524, column: 2)
!889 = !DILocation(line: 0, scope: !878, inlinedAt: !890)
!890 = distinct !DILocation(line: 652, column: 3, scope: !644, inlinedAt: !647)
!891 = !DILocalVariable(name: "mss", arg: 1, scope: !892, file: !3, line: 290, type: !164)
!892 = distinct !DISubprogram(name: "values_get_tcpipopts", scope: !3, file: !3, line: 290, type: !893, scopeLine: 292, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !895)
!893 = !DISubroutineType(types: !894)
!894 = !{null, !164, !75, !75, !97}
!895 = !{!891, !896, !897, !898, !899, !900}
!896 = !DILocalVariable(name: "wscale", arg: 2, scope: !892, file: !3, line: 290, type: !75)
!897 = !DILocalVariable(name: "ttl", arg: 3, scope: !892, file: !3, line: 291, type: !75)
!898 = !DILocalVariable(name: "ipv6", arg: 4, scope: !892, file: !3, line: 291, type: !97)
!899 = !DILocalVariable(name: "key", scope: !892, file: !3, line: 293, type: !74)
!900 = !DILocalVariable(name: "value", scope: !892, file: !3, line: 294, type: !153)
!901 = !DILocation(line: 0, scope: !892, inlinedAt: !902)
!902 = distinct !DILocation(line: 520, column: 2, scope: !878, inlinedAt: !890)
!903 = !DILocation(line: 293, column: 2, scope: !892, inlinedAt: !902)
!904 = !DILocation(line: 293, column: 8, scope: !892, inlinedAt: !902)
!905 = !DILocation(line: 296, column: 10, scope: !892, inlinedAt: !902)
!906 = !DILocation(line: 297, column: 6, scope: !907, inlinedAt: !902)
!907 = distinct !DILexicalBlock(scope: !892, file: !3, line: 297, column: 6)
!908 = !DILocation(line: 297, column: 12, scope: !907, inlinedAt: !902)
!909 = !DILocation(line: 297, column: 15, scope: !907, inlinedAt: !902)
!910 = !{!911, !911, i64 0}
!911 = !{!"long long", !350, i64 0}
!912 = !DILocation(line: 297, column: 22, scope: !907, inlinedAt: !902)
!913 = !DILocation(line: 297, column: 6, scope: !892, inlinedAt: !902)
!914 = !DILocation(line: 0, scope: !915, inlinedAt: !902)
!915 = distinct !DILexicalBlock(scope: !916, file: !3, line: 298, column: 7)
!916 = distinct !DILexicalBlock(scope: !907, file: !3, line: 297, column: 28)
!917 = !DILocation(line: 302, column: 13, scope: !916, inlinedAt: !902)
!918 = !DILocation(line: 303, column: 18, scope: !916, inlinedAt: !902)
!919 = !DILocation(line: 303, column: 10, scope: !916, inlinedAt: !902)
!920 = !DILocation(line: 304, column: 3, scope: !916, inlinedAt: !902)
!921 = !DILocation(line: 310, column: 1, scope: !892, inlinedAt: !902)
!922 = !DILocation(line: 522, column: 16, scope: !878, inlinedAt: !890)
!923 = !DILocation(line: 522, column: 36, scope: !878, inlinedAt: !890)
!924 = !DILocalVariable(name: "a", arg: 1, scope: !925, file: !3, line: 110, type: !75)
!925 = distinct !DISubprogram(name: "swap_eth_addr", scope: !3, file: !3, line: 110, type: !926, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !928)
!926 = !DISubroutineType(types: !927)
!927 = !{null, !75, !75}
!928 = !{!924, !929, !930}
!929 = !DILocalVariable(name: "b", arg: 2, scope: !925, file: !3, line: 110, type: !75)
!930 = !DILocalVariable(name: "tmp", scope: !925, file: !3, line: 112, type: !931)
!931 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 48, elements: !335)
!932 = !DILocation(line: 0, scope: !925, inlinedAt: !933)
!933 = distinct !DILocation(line: 522, column: 2, scope: !878, inlinedAt: !890)
!934 = !DILocation(line: 112, column: 2, scope: !925, inlinedAt: !933)
!935 = !DILocation(line: 112, column: 7, scope: !925, inlinedAt: !933)
!936 = !DILocation(line: 114, column: 2, scope: !925, inlinedAt: !933)
!937 = !DILocation(line: 115, column: 2, scope: !925, inlinedAt: !933)
!938 = !DILocation(line: 116, column: 2, scope: !925, inlinedAt: !933)
!939 = !DILocation(line: 117, column: 1, scope: !925, inlinedAt: !933)
!940 = !DILocation(line: 524, column: 2, scope: !888, inlinedAt: !890)
!941 = !DILocation(line: 0, scope: !888, inlinedAt: !890)
!942 = !DILocation(line: 525, column: 13, scope: !878, inlinedAt: !890)
!943 = !DILocation(line: 525, column: 19, scope: !878, inlinedAt: !890)
!944 = !{!403, !387, i64 10}
!945 = !DILocation(line: 526, column: 13, scope: !878, inlinedAt: !890)
!946 = !DILocation(line: 526, column: 17, scope: !878, inlinedAt: !890)
!947 = !{!403, !350, i64 1}
!948 = !DILocation(line: 527, column: 13, scope: !878, inlinedAt: !890)
!949 = !DILocation(line: 527, column: 16, scope: !878, inlinedAt: !890)
!950 = !{!403, !387, i64 4}
!951 = !DILocation(line: 528, column: 13, scope: !878, inlinedAt: !890)
!952 = !DILocation(line: 528, column: 17, scope: !878, inlinedAt: !890)
!953 = !{!403, !350, i64 8}
!954 = !DILocalVariable(name: "tcp_header", arg: 1, scope: !955, file: !3, line: 492, type: !231)
!955 = distinct !DISubprogram(name: "tcp_gen_synack", scope: !3, file: !3, line: 492, type: !956, scopeLine: 495, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !958)
!956 = !DISubroutineType(types: !957)
!957 = !{null, !231, !74, !92, !71, !76}
!958 = !{!954, !959, !960, !961, !962, !963, !964}
!959 = !DILocalVariable(name: "cookie", arg: 2, scope: !955, file: !3, line: 493, type: !74)
!960 = !DILocalVariable(name: "tsopt", arg: 3, scope: !955, file: !3, line: 493, type: !92)
!961 = !DILocalVariable(name: "mss", arg: 4, scope: !955, file: !3, line: 494, type: !71)
!962 = !DILocalVariable(name: "wscale", arg: 5, scope: !955, file: !3, line: 494, type: !76)
!963 = !DILocalVariable(name: "tcp_options", scope: !955, file: !3, line: 496, type: !69)
!964 = !DILocalVariable(name: "__tmp", scope: !965, file: !3, line: 502, type: !118)
!965 = distinct !DILexicalBlock(scope: !955, file: !3, line: 502, column: 2)
!966 = !DILocation(line: 0, scope: !955, inlinedAt: !967)
!967 = distinct !DILocation(line: 530, column: 2, scope: !878, inlinedAt: !890)
!968 = !DILocation(line: 498, column: 2, scope: !955, inlinedAt: !967)
!969 = !DILocation(line: 498, column: 28, scope: !955, inlinedAt: !967)
!970 = !DILocation(line: 499, column: 6, scope: !971, inlinedAt: !967)
!971 = distinct !DILexicalBlock(scope: !955, file: !3, line: 499, column: 6)
!972 = !DILocation(line: 499, column: 12, scope: !971, inlinedAt: !967)
!973 = !DILocation(line: 499, column: 16, scope: !971, inlinedAt: !967)
!974 = !DILocation(line: 499, column: 25, scope: !971, inlinedAt: !967)
!975 = !DILocation(line: 499, column: 6, scope: !955, inlinedAt: !967)
!976 = !DILocation(line: 500, column: 3, scope: !971, inlinedAt: !967)
!977 = !DILocation(line: 501, column: 19, scope: !955, inlinedAt: !967)
!978 = !DILocation(line: 502, column: 2, scope: !965, inlinedAt: !967)
!979 = !DILocation(line: 0, scope: !965, inlinedAt: !967)
!980 = !DILocation(line: 503, column: 24, scope: !955, inlinedAt: !967)
!981 = !{!492, !349, i64 4}
!982 = !DILocation(line: 503, column: 14, scope: !955, inlinedAt: !967)
!983 = !DILocation(line: 503, column: 22, scope: !955, inlinedAt: !967)
!984 = !{!492, !349, i64 8}
!985 = !DILocation(line: 504, column: 20, scope: !955, inlinedAt: !967)
!986 = !DILocation(line: 504, column: 18, scope: !955, inlinedAt: !967)
!987 = !DILocation(line: 505, column: 14, scope: !955, inlinedAt: !967)
!988 = !DILocation(line: 505, column: 21, scope: !955, inlinedAt: !967)
!989 = !{!492, !387, i64 14}
!990 = !DILocation(line: 506, column: 14, scope: !955, inlinedAt: !967)
!991 = !DILocation(line: 506, column: 22, scope: !955, inlinedAt: !967)
!992 = !{!492, !387, i64 18}
!993 = !DILocation(line: 507, column: 14, scope: !955, inlinedAt: !967)
!994 = !DILocation(line: 507, column: 20, scope: !955, inlinedAt: !967)
!995 = !{!492, !387, i64 16}
!996 = !DILocation(line: 509, column: 36, scope: !955, inlinedAt: !967)
!997 = !DILocation(line: 510, column: 36, scope: !955, inlinedAt: !967)
!998 = !DILocalVariable(name: "buf", arg: 1, scope: !999, file: !3, line: 460, type: !92)
!999 = distinct !DISubprogram(name: "tcp_mkoptions", scope: !3, file: !3, line: 460, type: !1000, scopeLine: 462, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1002)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!76, !92, !92, !71, !76}
!1002 = !{!998, !1003, !1004, !1005, !1006}
!1003 = !DILocalVariable(name: "tsopt", arg: 2, scope: !999, file: !3, line: 460, type: !92)
!1004 = !DILocalVariable(name: "mss", arg: 3, scope: !999, file: !3, line: 460, type: !71)
!1005 = !DILocalVariable(name: "wscale", arg: 4, scope: !999, file: !3, line: 461, type: !76)
!1006 = !DILocalVariable(name: "start", scope: !999, file: !3, line: 463, type: !92)
!1007 = !DILocation(line: 0, scope: !999, inlinedAt: !1008)
!1008 = distinct !DILocation(line: 510, column: 22, scope: !955, inlinedAt: !967)
!1009 = !DILocation(line: 465, column: 11, scope: !999, inlinedAt: !1008)
!1010 = !DILocation(line: 465, column: 9, scope: !999, inlinedAt: !1008)
!1011 = !DILocation(line: 467, column: 6, scope: !999, inlinedAt: !1008)
!1012 = !DILocation(line: 465, column: 6, scope: !999, inlinedAt: !1008)
!1013 = !DILocation(line: 470, column: 6, scope: !1014, inlinedAt: !1008)
!1014 = distinct !DILexicalBlock(scope: !999, file: !3, line: 470, column: 6)
!1015 = !DILocation(line: 470, column: 15, scope: !1014, inlinedAt: !1008)
!1016 = !DILocation(line: 0, scope: !1014, inlinedAt: !1008)
!1017 = !DILocation(line: 480, column: 11, scope: !999, inlinedAt: !1008)
!1018 = !DILocation(line: 480, column: 6, scope: !999, inlinedAt: !1008)
!1019 = !DILocation(line: 480, column: 9, scope: !999, inlinedAt: !1008)
!1020 = !DILocation(line: 481, column: 11, scope: !999, inlinedAt: !1008)
!1021 = !DILocation(line: 481, column: 6, scope: !999, inlinedAt: !1008)
!1022 = !DILocation(line: 481, column: 9, scope: !999, inlinedAt: !1008)
!1023 = !DILocation(line: 483, column: 7, scope: !1024, inlinedAt: !1008)
!1024 = distinct !DILexicalBlock(scope: !999, file: !3, line: 483, column: 6)
!1025 = !DILocation(line: 483, column: 16, scope: !1024, inlinedAt: !1008)
!1026 = !DILocation(line: 483, column: 34, scope: !1024, inlinedAt: !1008)
!1027 = !DILocation(line: 483, column: 6, scope: !999, inlinedAt: !1008)
!1028 = !DILocation(line: 484, column: 12, scope: !1024, inlinedAt: !1008)
!1029 = !DILocation(line: 484, column: 7, scope: !1024, inlinedAt: !1008)
!1030 = !DILocation(line: 484, column: 10, scope: !1024, inlinedAt: !1008)
!1031 = !DILocation(line: 484, column: 3, scope: !1024, inlinedAt: !1008)
!1032 = !DILocation(line: 489, column: 13, scope: !999, inlinedAt: !1008)
!1033 = !DILocation(line: 489, column: 9, scope: !999, inlinedAt: !1008)
!1034 = !DILocation(line: 489, column: 2, scope: !999, inlinedAt: !1008)
!1035 = !DILocation(line: 510, column: 22, scope: !955, inlinedAt: !967)
!1036 = !DILocation(line: 510, column: 19, scope: !955, inlinedAt: !967)
!1037 = !DILocation(line: 532, column: 32, scope: !878, inlinedAt: !890)
!1038 = !DILocation(line: 533, column: 23, scope: !878, inlinedAt: !890)
!1039 = !DILocation(line: 533, column: 13, scope: !878, inlinedAt: !890)
!1040 = !DILocation(line: 533, column: 21, scope: !878, inlinedAt: !890)
!1041 = !{!403, !387, i64 2}
!1042 = !DILocation(line: 653, column: 2, scope: !644, inlinedAt: !647)
!1043 = !DILocation(line: 653, column: 13, scope: !1044, inlinedAt: !647)
!1044 = distinct !DILexicalBlock(scope: !645, file: !3, line: 653, column: 13)
!1045 = !DILocation(line: 653, column: 13, scope: !645, inlinedAt: !647)
!1046 = !DILocation(line: 654, column: 33, scope: !1047, inlinedAt: !647)
!1047 = distinct !DILexicalBlock(scope: !1044, file: !3, line: 653, column: 24)
!1048 = !DILocalVariable(name: "__tmp", scope: !1049, file: !3, line: 547, type: !257)
!1049 = distinct !DILexicalBlock(scope: !1050, file: !3, line: 547, column: 2)
!1050 = distinct !DISubprogram(name: "tcpv6_gen_synack", scope: !3, file: !3, line: 536, type: !879, scopeLine: 538, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1051)
!1051 = !{!1052, !1053, !1054, !1055, !1056, !1057, !1048}
!1052 = !DILocalVariable(name: "hdr", arg: 1, scope: !1050, file: !3, line: 536, type: !362)
!1053 = !DILocalVariable(name: "cookie", arg: 2, scope: !1050, file: !3, line: 537, type: !74)
!1054 = !DILocalVariable(name: "tsopt", arg: 3, scope: !1050, file: !3, line: 537, type: !92)
!1055 = !DILocalVariable(name: "wscale", scope: !1050, file: !3, line: 539, type: !76)
!1056 = !DILocalVariable(name: "mss", scope: !1050, file: !3, line: 540, type: !71)
!1057 = !DILocalVariable(name: "ttl", scope: !1050, file: !3, line: 541, type: !76)
!1058 = !DILocation(line: 547, column: 2, scope: !1049, inlinedAt: !1059)
!1059 = distinct !DILocation(line: 654, column: 3, scope: !1047, inlinedAt: !647)
!1060 = !DILocation(line: 0, scope: !1050, inlinedAt: !1059)
!1061 = !DILocation(line: 0, scope: !892, inlinedAt: !1062)
!1062 = distinct !DILocation(line: 543, column: 2, scope: !1050, inlinedAt: !1059)
!1063 = !DILocation(line: 293, column: 2, scope: !892, inlinedAt: !1062)
!1064 = !DILocation(line: 293, column: 8, scope: !892, inlinedAt: !1062)
!1065 = !DILocation(line: 296, column: 10, scope: !892, inlinedAt: !1062)
!1066 = !DILocation(line: 297, column: 6, scope: !907, inlinedAt: !1062)
!1067 = !DILocation(line: 297, column: 12, scope: !907, inlinedAt: !1062)
!1068 = !DILocation(line: 297, column: 15, scope: !907, inlinedAt: !1062)
!1069 = !DILocation(line: 297, column: 22, scope: !907, inlinedAt: !1062)
!1070 = !DILocation(line: 297, column: 6, scope: !892, inlinedAt: !1062)
!1071 = !DILocation(line: 298, column: 7, scope: !916, inlinedAt: !1062)
!1072 = !DILocation(line: 0, scope: !915, inlinedAt: !1062)
!1073 = !DILocation(line: 302, column: 13, scope: !916, inlinedAt: !1062)
!1074 = !DILocation(line: 303, column: 18, scope: !916, inlinedAt: !1062)
!1075 = !DILocation(line: 303, column: 10, scope: !916, inlinedAt: !1062)
!1076 = !DILocation(line: 304, column: 3, scope: !916, inlinedAt: !1062)
!1077 = !DILocation(line: 310, column: 1, scope: !892, inlinedAt: !1062)
!1078 = !DILocation(line: 545, column: 16, scope: !1050, inlinedAt: !1059)
!1079 = !DILocation(line: 545, column: 36, scope: !1050, inlinedAt: !1059)
!1080 = !DILocation(line: 0, scope: !925, inlinedAt: !1081)
!1081 = distinct !DILocation(line: 545, column: 2, scope: !1050, inlinedAt: !1059)
!1082 = !DILocation(line: 112, column: 2, scope: !925, inlinedAt: !1081)
!1083 = !DILocation(line: 112, column: 7, scope: !925, inlinedAt: !1081)
!1084 = !DILocation(line: 114, column: 2, scope: !925, inlinedAt: !1081)
!1085 = !DILocation(line: 115, column: 2, scope: !925, inlinedAt: !1081)
!1086 = !DILocation(line: 116, column: 2, scope: !925, inlinedAt: !1081)
!1087 = !DILocation(line: 117, column: 1, scope: !925, inlinedAt: !1081)
!1088 = !{i64 0, i64 16, !483, i64 0, i64 16, !483, i64 0, i64 16, !483}
!1089 = !DILocation(line: 547, column: 2, scope: !1050, inlinedAt: !1059)
!1090 = !DILocation(line: 548, column: 18, scope: !1050, inlinedAt: !1059)
!1091 = !DILocation(line: 548, column: 23, scope: !1050, inlinedAt: !1059)
!1092 = !DILocation(line: 549, column: 13, scope: !1050, inlinedAt: !1059)
!1093 = !DILocation(line: 549, column: 23, scope: !1050, inlinedAt: !1059)
!1094 = !{!420, !350, i64 7}
!1095 = !DILocation(line: 0, scope: !955, inlinedAt: !1096)
!1096 = distinct !DILocation(line: 551, column: 2, scope: !1050, inlinedAt: !1059)
!1097 = !DILocation(line: 498, column: 2, scope: !955, inlinedAt: !1096)
!1098 = !DILocation(line: 498, column: 28, scope: !955, inlinedAt: !1096)
!1099 = !DILocation(line: 499, column: 6, scope: !971, inlinedAt: !1096)
!1100 = !DILocation(line: 499, column: 12, scope: !971, inlinedAt: !1096)
!1101 = !DILocation(line: 499, column: 16, scope: !971, inlinedAt: !1096)
!1102 = !DILocation(line: 499, column: 25, scope: !971, inlinedAt: !1096)
!1103 = !DILocation(line: 499, column: 6, scope: !955, inlinedAt: !1096)
!1104 = !DILocation(line: 500, column: 3, scope: !971, inlinedAt: !1096)
!1105 = !DILocation(line: 501, column: 19, scope: !955, inlinedAt: !1096)
!1106 = !DILocation(line: 502, column: 2, scope: !965, inlinedAt: !1096)
!1107 = !DILocation(line: 0, scope: !965, inlinedAt: !1096)
!1108 = !DILocation(line: 503, column: 24, scope: !955, inlinedAt: !1096)
!1109 = !DILocation(line: 503, column: 14, scope: !955, inlinedAt: !1096)
!1110 = !DILocation(line: 503, column: 22, scope: !955, inlinedAt: !1096)
!1111 = !DILocation(line: 504, column: 20, scope: !955, inlinedAt: !1096)
!1112 = !DILocation(line: 504, column: 18, scope: !955, inlinedAt: !1096)
!1113 = !DILocation(line: 505, column: 14, scope: !955, inlinedAt: !1096)
!1114 = !DILocation(line: 505, column: 21, scope: !955, inlinedAt: !1096)
!1115 = !DILocation(line: 506, column: 14, scope: !955, inlinedAt: !1096)
!1116 = !DILocation(line: 506, column: 22, scope: !955, inlinedAt: !1096)
!1117 = !DILocation(line: 507, column: 14, scope: !955, inlinedAt: !1096)
!1118 = !DILocation(line: 507, column: 20, scope: !955, inlinedAt: !1096)
!1119 = !DILocation(line: 510, column: 36, scope: !955, inlinedAt: !1096)
!1120 = !DILocation(line: 0, scope: !999, inlinedAt: !1121)
!1121 = distinct !DILocation(line: 510, column: 22, scope: !955, inlinedAt: !1096)
!1122 = !DILocation(line: 465, column: 11, scope: !999, inlinedAt: !1121)
!1123 = !DILocation(line: 465, column: 9, scope: !999, inlinedAt: !1121)
!1124 = !DILocation(line: 467, column: 6, scope: !999, inlinedAt: !1121)
!1125 = !DILocation(line: 465, column: 6, scope: !999, inlinedAt: !1121)
!1126 = !DILocation(line: 470, column: 6, scope: !1014, inlinedAt: !1121)
!1127 = !DILocation(line: 470, column: 15, scope: !1014, inlinedAt: !1121)
!1128 = !DILocation(line: 0, scope: !1014, inlinedAt: !1121)
!1129 = !DILocation(line: 480, column: 11, scope: !999, inlinedAt: !1121)
!1130 = !DILocation(line: 480, column: 6, scope: !999, inlinedAt: !1121)
!1131 = !DILocation(line: 480, column: 9, scope: !999, inlinedAt: !1121)
!1132 = !DILocation(line: 481, column: 11, scope: !999, inlinedAt: !1121)
!1133 = !DILocation(line: 481, column: 6, scope: !999, inlinedAt: !1121)
!1134 = !DILocation(line: 481, column: 9, scope: !999, inlinedAt: !1121)
!1135 = !DILocation(line: 483, column: 7, scope: !1024, inlinedAt: !1121)
!1136 = !DILocation(line: 483, column: 16, scope: !1024, inlinedAt: !1121)
!1137 = !DILocation(line: 483, column: 34, scope: !1024, inlinedAt: !1121)
!1138 = !DILocation(line: 483, column: 6, scope: !999, inlinedAt: !1121)
!1139 = !DILocation(line: 484, column: 12, scope: !1024, inlinedAt: !1121)
!1140 = !DILocation(line: 484, column: 7, scope: !1024, inlinedAt: !1121)
!1141 = !DILocation(line: 484, column: 10, scope: !1024, inlinedAt: !1121)
!1142 = !DILocation(line: 484, column: 3, scope: !1024, inlinedAt: !1121)
!1143 = !DILocation(line: 489, column: 13, scope: !999, inlinedAt: !1121)
!1144 = !DILocation(line: 489, column: 9, scope: !999, inlinedAt: !1121)
!1145 = !DILocation(line: 489, column: 2, scope: !999, inlinedAt: !1121)
!1146 = !DILocation(line: 510, column: 22, scope: !955, inlinedAt: !1096)
!1147 = !DILocation(line: 510, column: 19, scope: !955, inlinedAt: !1096)
!1148 = !DILocation(line: 553, column: 32, scope: !1050, inlinedAt: !1059)
!1149 = !DILocation(line: 554, column: 27, scope: !1050, inlinedAt: !1059)
!1150 = !DILocation(line: 554, column: 13, scope: !1050, inlinedAt: !1059)
!1151 = !DILocation(line: 554, column: 25, scope: !1050, inlinedAt: !1059)
!1152 = !{!420, !387, i64 4}
!1153 = !DILocation(line: 0, scope: !645, inlinedAt: !647)
!1154 = !DILocation(line: 660, column: 12, scope: !625, inlinedAt: !647)
!1155 = !DILocation(line: 660, column: 18, scope: !625, inlinedAt: !647)
!1156 = !DILocation(line: 661, column: 43, scope: !625, inlinedAt: !647)
!1157 = !DILocation(line: 661, column: 48, scope: !625, inlinedAt: !647)
!1158 = !DILocation(line: 661, column: 10, scope: !625, inlinedAt: !647)
!1159 = !DILocation(line: 662, column: 12, scope: !1160, inlinedAt: !647)
!1160 = distinct !DILexicalBlock(scope: !625, file: !3, line: 662, column: 6)
!1161 = !DILocation(line: 662, column: 6, scope: !625, inlinedAt: !647)
!1162 = !DILocation(line: 664, column: 6, scope: !625, inlinedAt: !647)
!1163 = !DILocation(line: 665, column: 50, scope: !1164, inlinedAt: !647)
!1164 = distinct !DILexicalBlock(scope: !1165, file: !3, line: 664, column: 17)
!1165 = distinct !DILexicalBlock(scope: !625, file: !3, line: 664, column: 6)
!1166 = !DILocation(line: 666, column: 22, scope: !1164, inlinedAt: !647)
!1167 = !DILocation(line: 0, scope: !694, inlinedAt: !1168)
!1168 = distinct !DILocation(line: 665, column: 21, scope: !1164, inlinedAt: !647)
!1169 = !DILocation(line: 130, column: 12, scope: !694, inlinedAt: !1168)
!1170 = !DILocation(line: 132, column: 7, scope: !694, inlinedAt: !1168)
!1171 = !DILocation(line: 133, column: 7, scope: !694, inlinedAt: !1168)
!1172 = !DILocation(line: 137, column: 21, scope: !694, inlinedAt: !1168)
!1173 = !DILocation(line: 132, column: 4, scope: !694, inlinedAt: !1168)
!1174 = !DILocation(line: 133, column: 4, scope: !694, inlinedAt: !1168)
!1175 = !DILocation(line: 137, column: 4, scope: !694, inlinedAt: !1168)
!1176 = !DILocation(line: 141, column: 9, scope: !694, inlinedAt: !1168)
!1177 = !DILocation(line: 141, column: 28, scope: !694, inlinedAt: !1168)
!1178 = !DILocation(line: 141, column: 23, scope: !694, inlinedAt: !1168)
!1179 = !DILocation(line: 142, column: 28, scope: !694, inlinedAt: !1168)
!1180 = !DILocation(line: 142, column: 23, scope: !694, inlinedAt: !1168)
!1181 = !DILocation(line: 144, column: 19, scope: !694, inlinedAt: !1168)
!1182 = !DILocation(line: 0, scope: !670, inlinedAt: !1183)
!1183 = distinct !DILocation(line: 144, column: 9, scope: !694, inlinedAt: !1168)
!1184 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !1183)
!1185 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !1183)
!1186 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !1183)
!1187 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !1183)
!1188 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !1183)
!1189 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !1183)
!1190 = !DILocation(line: 665, column: 19, scope: !1164, inlinedAt: !647)
!1191 = !DILocation(line: 671, column: 14, scope: !1164, inlinedAt: !647)
!1192 = !DILocation(line: 671, column: 20, scope: !1164, inlinedAt: !647)
!1193 = !DILocation(line: 672, column: 44, scope: !1164, inlinedAt: !647)
!1194 = !DILocation(line: 672, column: 11, scope: !1164, inlinedAt: !647)
!1195 = !DILocation(line: 673, column: 13, scope: !1196, inlinedAt: !647)
!1196 = distinct !DILexicalBlock(scope: !1164, file: !3, line: 673, column: 7)
!1197 = !DILocation(line: 673, column: 7, scope: !1164, inlinedAt: !647)
!1198 = !DILocation(line: 675, column: 32, scope: !1164, inlinedAt: !647)
!1199 = !DILocation(line: 0, scope: !670, inlinedAt: !1200)
!1200 = distinct !DILocation(line: 675, column: 22, scope: !1164, inlinedAt: !647)
!1201 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !1200)
!1202 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !1200)
!1203 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !1200)
!1204 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !1200)
!1205 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !1200)
!1206 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !1200)
!1207 = !DILocation(line: 675, column: 20, scope: !1164, inlinedAt: !647)
!1208 = !DILocation(line: 676, column: 2, scope: !1164, inlinedAt: !647)
!1209 = !DILocation(line: 676, column: 13, scope: !1210, inlinedAt: !647)
!1210 = distinct !DILexicalBlock(scope: !1165, file: !3, line: 676, column: 13)
!1211 = !DILocation(line: 676, column: 13, scope: !1165, inlinedAt: !647)
!1212 = !DILocation(line: 679, column: 9, scope: !1213, inlinedAt: !647)
!1213 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 676, column: 24)
!1214 = !DILocation(line: 0, scope: !742, inlinedAt: !1215)
!1215 = distinct !DILocation(line: 677, column: 21, scope: !1213, inlinedAt: !647)
!1216 = !DILocation(line: 151, column: 14, scope: !742, inlinedAt: !1215)
!1217 = !DILocation(line: 156, column: 17, scope: !759, inlinedAt: !1215)
!1218 = !DILocation(line: 156, column: 10, scope: !759, inlinedAt: !1215)
!1219 = !DILocation(line: 160, column: 17, scope: !763, inlinedAt: !1215)
!1220 = !DILocation(line: 160, column: 10, scope: !763, inlinedAt: !1215)
!1221 = !DILocation(line: 163, column: 9, scope: !742, inlinedAt: !1215)
!1222 = !DILocation(line: 156, column: 7, scope: !759, inlinedAt: !1215)
!1223 = !DILocation(line: 160, column: 7, scope: !763, inlinedAt: !1215)
!1224 = !DILocation(line: 163, column: 6, scope: !742, inlinedAt: !1215)
!1225 = !DILocation(line: 164, column: 6, scope: !742, inlinedAt: !1215)
!1226 = !DILocation(line: 166, column: 13, scope: !742, inlinedAt: !1215)
!1227 = !DILocation(line: 166, column: 34, scope: !742, inlinedAt: !1215)
!1228 = !DILocation(line: 166, column: 27, scope: !742, inlinedAt: !1215)
!1229 = !DILocation(line: 167, column: 34, scope: !742, inlinedAt: !1215)
!1230 = !DILocation(line: 167, column: 27, scope: !742, inlinedAt: !1215)
!1231 = !DILocation(line: 169, column: 19, scope: !742, inlinedAt: !1215)
!1232 = !DILocation(line: 0, scope: !670, inlinedAt: !1233)
!1233 = distinct !DILocation(line: 169, column: 9, scope: !742, inlinedAt: !1215)
!1234 = !DILocation(line: 121, column: 15, scope: !670, inlinedAt: !1233)
!1235 = !DILocation(line: 121, column: 33, scope: !670, inlinedAt: !1233)
!1236 = !DILocation(line: 121, column: 25, scope: !670, inlinedAt: !1233)
!1237 = !DILocation(line: 122, column: 33, scope: !670, inlinedAt: !1233)
!1238 = !DILocation(line: 122, column: 25, scope: !670, inlinedAt: !1233)
!1239 = !DILocation(line: 123, column: 9, scope: !670, inlinedAt: !1233)
!1240 = !DILocation(line: 677, column: 19, scope: !1213, inlinedAt: !647)
!1241 = !DILocation(line: 687, column: 26, scope: !625, inlinedAt: !647)
!1242 = !DILocation(line: 688, column: 35, scope: !625, inlinedAt: !647)
!1243 = !DILocation(line: 688, column: 56, scope: !625, inlinedAt: !647)
!1244 = !DILocation(line: 688, column: 61, scope: !625, inlinedAt: !647)
!1245 = !DILocation(line: 688, column: 44, scope: !625, inlinedAt: !647)
!1246 = !DILocation(line: 688, column: 17, scope: !625, inlinedAt: !647)
!1247 = !DILocation(line: 689, column: 44, scope: !1248, inlinedAt: !647)
!1248 = distinct !DILexicalBlock(scope: !625, file: !3, line: 689, column: 6)
!1249 = !DILocation(line: 689, column: 6, scope: !1248, inlinedAt: !647)
!1250 = !DILocation(line: 689, column: 6, scope: !625, inlinedAt: !647)
!1251 = !DILocation(line: 314, column: 2, scope: !1252, inlinedAt: !1258)
!1252 = distinct !DISubprogram(name: "values_inc_synacks", scope: !3, file: !3, line: 312, type: !1253, scopeLine: 313, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1255)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{null}
!1255 = !{!1256, !1257}
!1256 = !DILocalVariable(name: "key", scope: !1252, file: !3, line: 314, type: !74)
!1257 = !DILocalVariable(name: "value", scope: !1252, file: !3, line: 315, type: !153)
!1258 = distinct !DILocation(line: 692, column: 2, scope: !625, inlinedAt: !647)
!1259 = !DILocation(line: 0, scope: !1252, inlinedAt: !1258)
!1260 = !DILocation(line: 314, column: 8, scope: !1252, inlinedAt: !1258)
!1261 = !DILocation(line: 317, column: 10, scope: !1252, inlinedAt: !1258)
!1262 = !DILocation(line: 318, column: 6, scope: !1263, inlinedAt: !1258)
!1263 = distinct !DILexicalBlock(scope: !1252, file: !3, line: 318, column: 6)
!1264 = !DILocation(line: 318, column: 6, scope: !1252, inlinedAt: !1258)
!1265 = !DILocation(line: 319, column: 3, scope: !1263, inlinedAt: !1258)
!1266 = !DILocation(line: 320, column: 1, scope: !1252, inlinedAt: !1258)
!1267 = !DILocation(line: 694, column: 2, scope: !625, inlinedAt: !647)
!1268 = !DILocation(line: 695, column: 1, scope: !625, inlinedAt: !647)
!1269 = !DILocalVariable(name: "hdr", arg: 1, scope: !1270, file: !3, line: 697, type: !362)
!1270 = distinct !DISubprogram(name: "syncookie_handle_ack", scope: !3, file: !3, line: 697, type: !1271, scopeLine: 698, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1273)
!1271 = !DISubroutineType(types: !1272)
!1272 = !{!84, !362}
!1273 = !{!1269, !1274}
!1274 = !DILocalVariable(name: "err", scope: !1270, file: !3, line: 699, type: !84)
!1275 = !DILocation(line: 0, scope: !1270, inlinedAt: !1276)
!1276 = distinct !DILocation(line: 780, column: 11, scope: !584, inlinedAt: !592)
!1277 = !DILocation(line: 701, column: 6, scope: !1278, inlinedAt: !1276)
!1278 = distinct !DILexicalBlock(scope: !1270, file: !3, line: 701, column: 6)
!1279 = !DILocation(line: 701, column: 6, scope: !1270, inlinedAt: !1276)
!1280 = !DILocation(line: 704, column: 6, scope: !1281, inlinedAt: !1276)
!1281 = distinct !DILexicalBlock(scope: !1270, file: !3, line: 704, column: 6)
!1282 = !DILocation(line: 704, column: 6, scope: !1270, inlinedAt: !1276)
!1283 = !DILocation(line: 705, column: 9, scope: !1281, inlinedAt: !1276)
!1284 = !DILocation(line: 705, column: 3, scope: !1281, inlinedAt: !1276)
!1285 = !DILocation(line: 706, column: 11, scope: !1286, inlinedAt: !1276)
!1286 = distinct !DILexicalBlock(scope: !1281, file: !3, line: 706, column: 11)
!1287 = !DILocation(line: 706, column: 11, scope: !1281, inlinedAt: !1276)
!1288 = !DILocation(line: 707, column: 9, scope: !1286, inlinedAt: !1276)
!1289 = !DILocation(line: 0, scope: !1281, inlinedAt: !1276)
!1290 = !DILocation(line: 710, column: 6, scope: !1291, inlinedAt: !1276)
!1291 = distinct !DILexicalBlock(scope: !1270, file: !3, line: 710, column: 6)
!1292 = !DILocation(line: 799, column: 1, scope: !318)
!1293 = !DISubprogram(name: "bpf_xdp_ct_lookup", scope: !3, file: !3, line: 102, type: !1294, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !831)
!1294 = !DISubroutineType(types: !1295)
!1295 = !{!461, !183, !1296, !74, !1297, !74}
!1296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64)
!1297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64)
!1298 = !DISubprogram(name: "bpf_ct_release", scope: !3, file: !3, line: 108, type: !1299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !831)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{null, !461}
!1301 = distinct !DISubprogram(name: "tscookie_tcpopt_parse_batch", scope: !3, file: !3, line: 249, type: !1302, scopeLine: 250, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1304)
!1302 = !DISubroutineType(types: !1303)
!1303 = !{!84, !74, !69}
!1304 = !{!1305, !1306, !1307}
!1305 = !DILocalVariable(name: "index", arg: 1, scope: !1301, file: !3, line: 249, type: !74)
!1306 = !DILocalVariable(name: "context", arg: 2, scope: !1301, file: !3, line: 249, type: !69)
!1307 = !DILocalVariable(name: "i", scope: !1301, file: !3, line: 251, type: !84)
!1308 = !DILocation(line: 0, scope: !1301)
!1309 = !DILocation(line: 201, column: 11, scope: !1310, inlinedAt: !1311)
!1310 = distinct !DILexicalBlock(scope: !81, file: !3, line: 201, column: 6)
!1311 = distinct !DILocation(line: 254, column: 7, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !3, line: 254, column: 7)
!1313 = distinct !DILexicalBlock(scope: !1314, file: !3, line: 253, column: 2)
!1314 = distinct !DILexicalBlock(scope: !1301, file: !3, line: 253, column: 2)
!1315 = !DILocation(line: 203, column: 23, scope: !1316, inlinedAt: !1311)
!1316 = distinct !DILexicalBlock(scope: !81, file: !3, line: 203, column: 6)
!1317 = !DILocation(line: 253, column: 2, scope: !1314)
!1318 = !DILocation(line: 0, scope: !81, inlinedAt: !1311)
!1319 = !DILocation(line: 201, column: 15, scope: !1310, inlinedAt: !1311)
!1320 = !DILocation(line: 201, column: 6, scope: !81, inlinedAt: !1311)
!1321 = !DILocation(line: 203, column: 15, scope: !1316, inlinedAt: !1311)
!1322 = !DILocation(line: 203, column: 6, scope: !81, inlinedAt: !1311)
!1323 = !DILocation(line: 206, column: 11, scope: !81, inlinedAt: !1311)
!1324 = !DILocation(line: 208, column: 6, scope: !81, inlinedAt: !1311)
!1325 = !DILocation(line: 211, column: 3, scope: !1326, inlinedAt: !1311)
!1326 = distinct !DILexicalBlock(scope: !1327, file: !3, line: 210, column: 28)
!1327 = distinct !DILexicalBlock(scope: !81, file: !3, line: 210, column: 6)
!1328 = !DILocation(line: 212, column: 3, scope: !1326, inlinedAt: !1311)
!1329 = !DILocation(line: 215, column: 15, scope: !1330, inlinedAt: !1311)
!1330 = distinct !DILexicalBlock(scope: !81, file: !3, line: 215, column: 6)
!1331 = !DILocation(line: 215, column: 19, scope: !1330, inlinedAt: !1311)
!1332 = !DILocation(line: 215, column: 6, scope: !81, inlinedAt: !1311)
!1333 = !DILocation(line: 219, column: 11, scope: !81, inlinedAt: !1311)
!1334 = !DILocation(line: 220, column: 13, scope: !1335, inlinedAt: !1311)
!1335 = distinct !DILexicalBlock(scope: !81, file: !3, line: 220, column: 6)
!1336 = !DILocation(line: 220, column: 6, scope: !81, inlinedAt: !1311)
!1337 = !DILocation(line: 223, column: 15, scope: !1338, inlinedAt: !1311)
!1338 = distinct !DILexicalBlock(scope: !81, file: !3, line: 223, column: 6)
!1339 = !DILocation(line: 223, column: 24, scope: !1338, inlinedAt: !1311)
!1340 = !DILocation(line: 223, column: 6, scope: !81, inlinedAt: !1311)
!1341 = !DILocation(line: 226, column: 2, scope: !81, inlinedAt: !1311)
!1342 = !DILocation(line: 228, column: 14, scope: !1343, inlinedAt: !1311)
!1343 = distinct !DILexicalBlock(scope: !108, file: !3, line: 228, column: 7)
!1344 = !DILocation(line: 228, column: 32, scope: !1343, inlinedAt: !1311)
!1345 = !DILocation(line: 229, column: 18, scope: !1343, inlinedAt: !1311)
!1346 = !DILocation(line: 229, column: 30, scope: !1343, inlinedAt: !1311)
!1347 = !DILocation(line: 229, column: 16, scope: !1343, inlinedAt: !1311)
!1348 = !DILocation(line: 229, column: 4, scope: !1343, inlinedAt: !1311)
!1349 = !DILocation(line: 232, column: 14, scope: !107, inlinedAt: !1311)
!1350 = !DILocation(line: 232, column: 35, scope: !107, inlinedAt: !1311)
!1351 = !DILocation(line: 233, column: 26, scope: !106, inlinedAt: !1311)
!1352 = !DILocation(line: 235, column: 18, scope: !105, inlinedAt: !1311)
!1353 = !DILocation(line: 0, scope: !105, inlinedAt: !1311)
!1354 = !{!1355, !349, i64 0}
!1355 = !{!"", !349, i64 0}
!1356 = !DILocation(line: 235, column: 10, scope: !106, inlinedAt: !1311)
!1357 = !DILocation(line: 235, column: 16, scope: !106, inlinedAt: !1311)
!1358 = !DILocation(line: 236, column: 3, scope: !106, inlinedAt: !1311)
!1359 = !DILocation(line: 239, column: 14, scope: !1360, inlinedAt: !1311)
!1360 = distinct !DILexicalBlock(scope: !108, file: !3, line: 239, column: 7)
!1361 = !DILocation(line: 239, column: 7, scope: !108, inlinedAt: !1311)
!1362 = !DILocation(line: 240, column: 21, scope: !1360, inlinedAt: !1311)
!1363 = !DILocation(line: 240, column: 4, scope: !1360, inlinedAt: !1311)
!1364 = !DILocation(line: 253, column: 22, scope: !1313)
!1365 = !DILocation(line: 253, column: 16, scope: !1313)
!1366 = distinct !{!1366, !1317, !1367, !1368}
!1367 = !DILocation(line: 255, column: 11, scope: !1314)
!1368 = !{!"llvm.loop.mustprogress"}
!1369 = !DILocation(line: 257, column: 1, scope: !1301)
