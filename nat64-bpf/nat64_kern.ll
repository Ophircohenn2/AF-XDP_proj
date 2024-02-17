; ModuleID = 'nat64_kern.c'
source_filename = "nat64_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.nat64_config = type { %struct.in6_addr, i64, i64, i32, i32 }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.anon.4 = type { [1 x i32]*, %struct.in6_addr*, %struct.v6_addr_state*, [1 x i32]*, [1 x i32]* }
%struct.v6_addr_state = type { i64, i32, i32 }
%struct.anon.5 = type { [1 x i32]*, i32*, %struct.in6_addr*, [1 x i32]*, [1 x i32]* }
%struct.anon.6 = type { [11 x i32]*, [16 x i32]*, [4 x i32]*, [1 x i32]*, [1 x i32]* }
%struct.anon.7 = type { [22 x i32]*, [0 x i32]*, [4 x i32]*, [1 x i32]* }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.11 }
%union.anon.11 = type { %struct.anon.12 }
%struct.anon.12 = type { i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.v6_trie_key = type { %struct.bpf_lpm_trie_key, %struct.in6_addr }
%struct.bpf_lpm_trie_key = type { i32, [0 x i8] }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.8 }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { %struct.in6_addr, %struct.in6_addr }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.bpf_redir_neigh = type { i32, %union.anon.14 }
%union.anon.14 = type { [4 x i32] }
%struct.icmpv6_pseudo = type { %struct.in6_addr, %struct.in6_addr, i32, [3 x i8], i8 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.15 }
%union.anon.15 = type { i32 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.18 }
%union.anon.18 = type { [1 x i32] }
%struct.bpf_map = type opaque

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@config = dso_local global %struct.nat64_config zeroinitializer, align 8, !dbg !69
@v6_state_map = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8, !dbg !100
@v4_reversemap = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !121
@allowed_v6_src = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !130
@reclaimed_addrs = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !147
@__const.nat64_handle_v6.dst_hdr = private unnamed_addr constant %struct.iphdr { i8 69, i8 0, i16 0, i16 0, i16 64, i8 0, i8 0, i16 0, %union.anon.11 zeroinitializer }, align 4
@llvm.compiler.used = appending global [7 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.6* @allowed_v6_src to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @nat64_egress to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @nat64_ingress to i8*), i8* bitcast (%struct.anon.7* @reclaimed_addrs to i8*), i8* bitcast (%struct.anon.5* @v4_reversemap to i8*), i8* bitcast (%struct.anon.4* @v6_state_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @nat64_egress(%struct.__sk_buff* noundef %0) #0 section "tc" !dbg !336 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !340, metadata !DIExpression()), !dbg !341
  %2 = tail call fastcc i32 @nat64_handler(%struct.__sk_buff* noundef %0, i1 noundef zeroext true), !dbg !342
  ret i32 %2, !dbg !343
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
define internal fastcc i32 @nat64_handler(%struct.__sk_buff* noundef %0, i1 noundef zeroext %1) unnamed_addr #0 !dbg !344 {
  %3 = alloca %struct.v6_trie_key, align 4
  %4 = alloca %struct.iphdr, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.ipv6hdr, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !349, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i1 %1, metadata !350, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !370
  %7 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !371
  %8 = load i32, i32* %7, align 8, !dbg !371, !tbaa !372
  %9 = zext i32 %8 to i64, !dbg !378
  %10 = inttoptr i64 %9 to i8*, !dbg !379
  call void @llvm.dbg.value(metadata i8* %10, metadata !351, metadata !DIExpression()), !dbg !370
  %11 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !380
  %12 = load i32, i32* %11, align 4, !dbg !380, !tbaa !381
  %13 = zext i32 %12 to i64, !dbg !382
  %14 = inttoptr i64 %13 to i8*, !dbg !383
  call void @llvm.dbg.value(metadata i8* %14, metadata !352, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %14, metadata !353, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !358, metadata !DIExpression(DW_OP_deref)), !dbg !370
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !384, metadata !DIExpression()) #7, !dbg !393
  call void @llvm.dbg.value(metadata i8* %10, metadata !391, metadata !DIExpression()) #7, !dbg !393
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !392, metadata !DIExpression()) #7, !dbg !393
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !395, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i8* %10, metadata !407, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !408, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !409, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i8* %14, metadata !410, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i32 14, metadata !411, metadata !DIExpression()) #7, !dbg !420
  %15 = getelementptr i8, i8* %14, i64 14, !dbg !422
  %16 = icmp ugt i8* %15, %10, !dbg !424
  br i1 %16, label %419, label %17, !dbg !425

17:                                               ; preds = %2
  call void @llvm.dbg.value(metadata i8* %14, metadata !410, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i8* %15, metadata !353, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i8* %15, metadata !412, metadata !DIExpression()) #7, !dbg !420
  %18 = getelementptr inbounds i8, i8* %14, i64 12, !dbg !426
  %19 = bitcast i8* %18 to i16*, !dbg !426
  call void @llvm.dbg.value(metadata i16 undef, metadata !418, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i32 0, metadata !419, metadata !DIExpression()) #7, !dbg !420
  %20 = load i16, i16* %19, align 1, !dbg !420, !tbaa !427
  call void @llvm.dbg.value(metadata i16 %20, metadata !418, metadata !DIExpression()) #7, !dbg !420
  %21 = inttoptr i64 %9 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %20, metadata !429, metadata !DIExpression()) #7, !dbg !434
  %22 = icmp eq i16 %20, 129, !dbg !440
  %23 = icmp eq i16 %20, -22392, !dbg !441
  %24 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %22) #7
  %25 = or i1 %23, %24, !dbg !441
  %26 = xor i1 %25, true, !dbg !442
  %27 = getelementptr i8, i8* %14, i64 18
  %28 = bitcast i8* %27 to %struct.vlan_hdr*
  %29 = icmp ugt %struct.vlan_hdr* %28, %21
  %30 = select i1 %26, i1 true, i1 %29, !dbg !443
  br i1 %30, label %48, label %31, !dbg !443

31:                                               ; preds = %17
  call void @llvm.dbg.value(metadata i16 undef, metadata !418, metadata !DIExpression()) #7, !dbg !420
  %32 = getelementptr i8, i8* %14, i64 16, !dbg !444
  %33 = bitcast i8* %32 to i16*, !dbg !444
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %28, metadata !412, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i32 1, metadata !419, metadata !DIExpression()) #7, !dbg !420
  %34 = load i16, i16* %33, align 1, !dbg !420, !tbaa !427
  call void @llvm.dbg.value(metadata i16 %34, metadata !418, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i16 %34, metadata !429, metadata !DIExpression()) #7, !dbg !434
  %35 = icmp eq i16 %34, 129, !dbg !440
  %36 = icmp eq i16 %34, -22392, !dbg !441
  %37 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %35) #7
  %38 = or i1 %36, %37, !dbg !441
  %39 = xor i1 %38, true, !dbg !442
  %40 = getelementptr i8, i8* %14, i64 22
  %41 = bitcast i8* %40 to %struct.vlan_hdr*
  %42 = icmp ugt %struct.vlan_hdr* %41, %21
  %43 = select i1 %39, i1 true, i1 %42, !dbg !443
  br i1 %43, label %48, label %44, !dbg !443

44:                                               ; preds = %31
  call void @llvm.dbg.value(metadata i16 undef, metadata !418, metadata !DIExpression()) #7, !dbg !420
  %45 = getelementptr i8, i8* %14, i64 20, !dbg !444
  %46 = bitcast i8* %45 to i16*, !dbg !444
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %41, metadata !412, metadata !DIExpression()) #7, !dbg !420
  call void @llvm.dbg.value(metadata i32 2, metadata !419, metadata !DIExpression()) #7, !dbg !420
  %47 = load i16, i16* %46, align 1, !dbg !420, !tbaa !427
  call void @llvm.dbg.value(metadata i16 %47, metadata !418, metadata !DIExpression()) #7, !dbg !420
  br label %48

48:                                               ; preds = %17, %31, %44
  %49 = phi i8* [ %15, %17 ], [ %27, %31 ], [ %40, %44 ], !dbg !420
  %50 = phi i16 [ %20, %17 ], [ %34, %31 ], [ %47, %44 ], !dbg !420
  call void @llvm.dbg.value(metadata i8* %49, metadata !353, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata i16 %50, metadata !369, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !370
  %51 = icmp eq i16 %50, 8, !dbg !445
  %52 = and i1 %51, %1, !dbg !447
  br i1 %52, label %53, label %180, !dbg !447

53:                                               ; preds = %48
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !448, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !453, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata i8* %10, metadata !454, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata i32 %12, metadata !455, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !520
  call void @llvm.dbg.value(metadata i32 0, metadata !487, metadata !DIExpression()) #7, !dbg !520
  %54 = bitcast i32* %5 to i8*, !dbg !522
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %54) #7, !dbg !522
  %55 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 0, !dbg !523
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %55) #7, !dbg !523
  call void @llvm.dbg.declare(metadata %struct.ipv6hdr* %6, metadata !518, metadata !DIExpression()) #7, !dbg !524
  %56 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 1, i64 0, !dbg !525
  %57 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 2, !dbg !525
  %58 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 3, !dbg !525
  %59 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 4, !dbg !525
  %60 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 5, i32 0, !dbg !526
  %61 = bitcast %struct.anon.9* %60 to i8*, !dbg !527
  %62 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 1, i64 1, !dbg !525
  %63 = bitcast i8* %62 to i16*, !dbg !525
  store i16 0, i16* %63, align 2, !dbg !525
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %61, i8* noundef nonnull align 8 dereferenceable(16) bitcast (%struct.nat64_config* @config to i8*), i64 12, i1 false) #7, !dbg !527, !tbaa.struct !528
  %64 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 5, i32 0, i32 1, !dbg !526
  %65 = bitcast %struct.in6_addr* %64 to i8*, !dbg !526
  %66 = ptrtoint i8* %49 to i64, !dbg !530
  %67 = trunc i64 %66 to i32, !dbg !531
  %68 = sub i32 %67, %12, !dbg !531
  %69 = and i32 %68, 8191, !dbg !531
  call void @llvm.dbg.value(metadata i32 %69, metadata !458, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !532, metadata !DIExpression()) #7, !dbg !542
  call void @llvm.dbg.value(metadata i8* %10, metadata !538, metadata !DIExpression()) #7, !dbg !542
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !539, metadata !DIExpression()) #7, !dbg !542
  call void @llvm.dbg.value(metadata i8* %49, metadata !540, metadata !DIExpression()) #7, !dbg !542
  %70 = getelementptr inbounds i8, i8* %49, i64 20, !dbg !544
  %71 = icmp ugt i8* %70, %10, !dbg !546
  br i1 %71, label %178, label %72, !dbg !547

72:                                               ; preds = %53
  %73 = load i8, i8* %49, align 4, !dbg !548
  %74 = and i8 %73, -16, !dbg !550
  %75 = icmp eq i8 %74, 64, !dbg !550
  br i1 %75, label %76, label %178, !dbg !551

76:                                               ; preds = %72
  %77 = shl i8 %73, 2, !dbg !552
  %78 = and i8 %77, 60, !dbg !552
  call void @llvm.dbg.value(metadata i8 %78, metadata !541, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !542
  %79 = icmp ult i8 %78, 20, !dbg !553
  br i1 %79, label %178, label %80, !dbg !555

80:                                               ; preds = %76
  %81 = zext i8 %78 to i64
  call void @llvm.dbg.value(metadata i64 %81, metadata !541, metadata !DIExpression()) #7, !dbg !542
  %82 = getelementptr i8, i8* %49, i64 %81, !dbg !556
  %83 = icmp ugt i8* %82, %10, !dbg !558
  br i1 %83, label %178, label %84, !dbg !559

84:                                               ; preds = %80
  call void @llvm.dbg.value(metadata i8* %82, metadata !353, metadata !DIExpression()), !dbg !370
  %85 = bitcast i8* %49 to %struct.iphdr*, !dbg !560
  call void @llvm.dbg.value(metadata i8 undef, metadata !456, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !520
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !488, metadata !DIExpression()) #7, !dbg !520
  %86 = getelementptr inbounds i8, i8* %49, i64 16, !dbg !561
  %87 = bitcast i8* %86 to i32*, !dbg !561
  %88 = load i32, i32* %87, align 4, !dbg !561, !tbaa !529
  %89 = tail call i32 @llvm.bswap.i32(i32 %88) #7, !dbg !561
  call void @llvm.dbg.value(metadata i32 %89, metadata !517, metadata !DIExpression()) #7, !dbg !520
  store i32 %89, i32* %5, align 4, !dbg !562, !tbaa !563
  %90 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 4), align 4, !dbg !564, !tbaa !566
  %91 = and i32 %90, %89, !dbg !569
  %92 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !570, !tbaa !571
  %93 = icmp eq i32 %91, %92, !dbg !572
  br i1 %93, label %94, label %178, !dbg !573

94:                                               ; preds = %84
  call void @llvm.dbg.value(metadata i32 2, metadata !487, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !488, metadata !DIExpression()) #7, !dbg !520
  %95 = load i8, i8* %49, align 4, !dbg !574
  call void @llvm.dbg.value(metadata i8 %95, metadata !457, metadata !DIExpression(DW_OP_constu, 2, DW_OP_shl, DW_OP_constu, 60, DW_OP_and, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !520
  %96 = and i8 %95, 15, !dbg !575
  %97 = icmp eq i8 %96, 5, !dbg !575
  br i1 %97, label %98, label %178, !dbg !577

98:                                               ; preds = %94
  %99 = getelementptr inbounds i8, i8* %49, i64 6, !dbg !578
  %100 = bitcast i8* %99 to i16*, !dbg !578
  %101 = load i16, i16* %100, align 2, !dbg !578, !tbaa !579
  %102 = and i16 %101, -65, !dbg !581
  %103 = icmp eq i16 %102, 0, !dbg !581
  br i1 %103, label %104, label %178, !dbg !582

104:                                              ; preds = %98
  call void @llvm.dbg.value(metadata i32* %5, metadata !517, metadata !DIExpression(DW_OP_deref)) #7, !dbg !520
  %105 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @v4_reversemap to i8*), i8* noundef nonnull %54) #7, !dbg !583
  call void @llvm.dbg.value(metadata i8* %105, metadata !459, metadata !DIExpression()) #7, !dbg !520
  %106 = icmp eq i8* %105, null, !dbg !584
  br i1 %106, label %178, label %107, !dbg !586

107:                                              ; preds = %104
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !488, metadata !DIExpression()) #7, !dbg !520
  %108 = getelementptr inbounds i8, i8* %49, i64 12, !dbg !587
  %109 = bitcast i8* %108 to i32*, !dbg !587
  %110 = load i32, i32* %109, align 4, !dbg !587, !tbaa !529
  %111 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !588
  store i32 %110, i32* %111, align 4, !dbg !589, !tbaa !529
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %65, i8* noundef nonnull align 4 dereferenceable(16) %105, i64 16, i1 false) #7, !dbg !590, !tbaa.struct !528
  %112 = getelementptr inbounds i8, i8* %49, i64 9, !dbg !591
  %113 = load i8, i8* %112, align 1, !dbg !591, !tbaa !592
  store i8 %113, i8* %58, align 2, !dbg !593, !tbaa !594
  %114 = getelementptr inbounds i8, i8* %49, i64 8, !dbg !596
  %115 = load i8, i8* %114, align 4, !dbg !596, !tbaa !597
  store i8 %115, i8* %59, align 1, !dbg !598, !tbaa !599
  %116 = getelementptr inbounds i8, i8* %49, i64 1, !dbg !600
  %117 = load i8, i8* %116, align 1, !dbg !600, !tbaa !601
  %118 = lshr i8 %117, 4, !dbg !602
  %119 = and i8 %118, 7, !dbg !602
  %120 = or i8 %119, 96, !dbg !603
  store i8 %120, i8* %55, align 4, !dbg !603
  %121 = shl i8 %117, 4, !dbg !604
  store i8 %121, i8* %56, align 1, !dbg !605, !tbaa !529
  %122 = getelementptr inbounds i8, i8* %49, i64 2, !dbg !606
  %123 = bitcast i8* %122 to i16*, !dbg !606
  %124 = load i16, i16* %123, align 2, !dbg !606, !tbaa !607
  %125 = call i16 @llvm.bswap.i16(i16 %124) #7, !dbg !606
  %126 = add i16 %125, -20, !dbg !606
  %127 = call i16 @llvm.bswap.i16(i16 %126) #7, !dbg !606
  store i16 %127, i16* %57, align 4, !dbg !608, !tbaa !609
  switch i8 %113, label %152 [
    i8 1, label %128
    i8 6, label %132
    i8 17, label %132
  ], !dbg !610

128:                                              ; preds = %107
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !488, metadata !DIExpression()) #7, !dbg !520
  %129 = call fastcc i32 @rewrite_icmp(%struct.iphdr* noundef nonnull %85, %struct.ipv6hdr* noundef nonnull %6, %struct.__sk_buff* noundef nonnull %0) #7, !dbg !611
  %130 = icmp eq i32 %129, 0, !dbg !611
  br i1 %130, label %131, label %178, !dbg !614

131:                                              ; preds = %128
  store i8 58, i8* %58, align 2, !dbg !615, !tbaa !594
  br label %152, !dbg !616

132:                                              ; preds = %107, %107
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !488, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !617, metadata !DIExpression()) #7, !dbg !630
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %6, metadata !622, metadata !DIExpression()) #7, !dbg !630
  call void @llvm.dbg.value(metadata %struct.iphdr* %85, metadata !623, metadata !DIExpression()) #7, !dbg !630
  call void @llvm.dbg.value(metadata i8 %113, metadata !624, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  call void @llvm.dbg.value(metadata i1 true, metadata !625, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  %133 = load i32, i32* %11, align 4, !dbg !632, !tbaa !381
  %134 = zext i32 %133 to i64, !dbg !633
  call void @llvm.dbg.value(metadata i64 %134, metadata !626, metadata !DIExpression()) #7, !dbg !630
  call void @llvm.dbg.value(metadata i32 16, metadata !627, metadata !DIExpression()) #7, !dbg !630
  %135 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %6, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 0, !dbg !634
  %136 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %109, i32 noundef 8, i32* noundef nonnull %135, i32 noundef 32, i32 noundef 0) #7, !dbg !637
  call void @llvm.dbg.value(metadata i64 %136, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  call void @llvm.dbg.value(metadata !DIArgList(i8* %70, i64 %134), metadata !628, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  %137 = ptrtoint i8* %70 to i64, !dbg !638
  %138 = sub i64 %137, %134, !dbg !638
  call void @llvm.dbg.value(metadata i64 %138, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  switch i8 %113, label %152 [
    i8 6, label %139
    i8 17, label %143
  ], !dbg !639

139:                                              ; preds = %132
  %140 = trunc i64 %138 to i32, !dbg !638
  %141 = and i32 %140, 65535, !dbg !640
  call void @llvm.dbg.value(metadata i32 %140, metadata !628, metadata !DIExpression()) #7, !dbg !630
  %142 = add nuw nsw i32 %141, 16, !dbg !640
  call void @llvm.dbg.value(metadata i32 %140, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 16, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !630
  br label %146, !dbg !642

143:                                              ; preds = %132
  %144 = trunc i64 %138 to i32, !dbg !643
  %145 = add i32 %144, 6, !dbg !643
  call void @llvm.dbg.value(metadata i64 %138, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_plus_uconst, 6, DW_OP_stack_value)) #7, !dbg !630
  call void @llvm.dbg.value(metadata i32 48, metadata !627, metadata !DIExpression()) #7, !dbg !630
  br label %146, !dbg !644

146:                                              ; preds = %143, %139
  %147 = phi i64 [ 48, %143 ], [ 16, %139 ]
  %148 = phi i32 [ %145, %143 ], [ %142, %139 ], !dbg !645
  call void @llvm.dbg.value(metadata i32 undef, metadata !627, metadata !DIExpression()) #7, !dbg !630
  %149 = and i32 %148, 65535, !dbg !646
  call void @llvm.dbg.value(metadata i32 %148, metadata !628, metadata !DIExpression()) #7, !dbg !630
  %150 = and i64 %136, 4294967295, !dbg !647
  %151 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %0, i32 noundef %149, i64 noundef 0, i64 noundef %150, i64 noundef %147) #7, !dbg !648
  br label %152, !dbg !649

152:                                              ; preds = %146, %132, %131, %107
  %153 = call i64 inttoptr (i64 31 to i64 (%struct.__sk_buff*, i16, i64)*)(%struct.__sk_buff* noundef nonnull %0, i16 noundef zeroext -8826, i64 noundef 0) #7, !dbg !650
  %154 = icmp eq i64 %153, 0, !dbg !650
  br i1 %154, label %155, label %178, !dbg !652

155:                                              ; preds = %152
  %156 = load i32, i32* %11, align 4, !dbg !653, !tbaa !381
  %157 = zext i32 %156 to i64, !dbg !654
  %158 = inttoptr i64 %157 to i8*, !dbg !655
  call void @llvm.dbg.value(metadata i8* %158, metadata !455, metadata !DIExpression()) #7, !dbg !520
  %159 = load i32, i32* %7, align 8, !dbg !656, !tbaa !372
  %160 = zext i32 %159 to i64, !dbg !657
  call void @llvm.dbg.value(metadata i64 %160, metadata !454, metadata !DIExpression()) #7, !dbg !520
  %161 = inttoptr i64 %157 to %struct.ethhdr*, !dbg !658
  call void @llvm.dbg.value(metadata %struct.ethhdr* %161, metadata !516, metadata !DIExpression()) #7, !dbg !520
  %162 = zext i32 %69 to i64
  %163 = getelementptr i8, i8* %158, i64 %162, !dbg !659
  call void @llvm.dbg.value(metadata i8* %163, metadata !460, metadata !DIExpression()) #7, !dbg !520
  %164 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %161, i64 1, !dbg !660
  %165 = inttoptr i64 %160 to %struct.ethhdr*, !dbg !662
  %166 = icmp ugt %struct.ethhdr* %164, %165, !dbg !663
  %167 = getelementptr inbounds i8, i8* %163, i64 40
  %168 = bitcast i8* %167 to %struct.ipv6hdr*
  %169 = inttoptr i64 %160 to %struct.ipv6hdr*
  %170 = icmp ugt %struct.ipv6hdr* %168, %169
  %171 = select i1 %166, i1 true, i1 %170, !dbg !664
  br i1 %171, label %178, label %172, !dbg !664

172:                                              ; preds = %155
  %173 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %161, i64 0, i32 2, !dbg !665
  store i16 -8826, i16* %173, align 1, !dbg !666, !tbaa !667
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(40) %163, i8* noundef nonnull align 4 dereferenceable(40) %55, i64 40, i1 false) #7, !dbg !669, !tbaa.struct !670
  %174 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 10, !dbg !671
  %175 = load i32, i32* %174, align 8, !dbg !671, !tbaa !672
  %176 = call i64 inttoptr (i64 152 to i64 (i32, %struct.bpf_redir_neigh*, i32, i64)*)(i32 noundef %175, %struct.bpf_redir_neigh* noundef null, i32 noundef 0, i64 noundef 0) #7, !dbg !673
  %177 = trunc i64 %176 to i32, !dbg !673
  call void @llvm.dbg.value(metadata i32 %177, metadata !487, metadata !DIExpression()) #7, !dbg !520
  br label %178, !dbg !674

178:                                              ; preds = %53, %72, %76, %80, %84, %94, %98, %104, %128, %152, %155, %172
  %179 = phi i32 [ 0, %84 ], [ 2, %152 ], [ 2, %155 ], [ %177, %172 ], [ 2, %128 ], [ 2, %98 ], [ 2, %94 ], [ 2, %104 ], [ 0, %53 ], [ 0, %72 ], [ 0, %76 ], [ 0, %80 ], !dbg !520
  call void @llvm.dbg.value(metadata i32 %179, metadata !487, metadata !DIExpression()) #7, !dbg !520
  call void @llvm.dbg.label(metadata !519) #7, !dbg !675
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %55) #7, !dbg !676
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %54) #7, !dbg !676
  br label %419, !dbg !677

180:                                              ; preds = %48
  call void @llvm.dbg.value(metadata i16 %50, metadata !369, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !370
  %181 = icmp ne i16 %50, -8826, !dbg !678
  %182 = or i1 %181, %1, !dbg !680
  br i1 %182, label %419, label %183, !dbg !680

183:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !681, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !684, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata i8* %10, metadata !685, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 %12, metadata !686, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !711
  %184 = bitcast %struct.v6_trie_key* %3 to i8*, !dbg !713
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %184) #7, !dbg !713
  call void @llvm.dbg.declare(metadata %struct.v6_trie_key* %3, metadata !687, metadata !DIExpression()) #7, !dbg !714
  %185 = getelementptr inbounds %struct.v6_trie_key, %struct.v6_trie_key* %3, i64 0, i32 0, i32 0, !dbg !714
  store i32 128, i32* %185, align 4, !dbg !714
  call void @llvm.dbg.value(metadata i32 0, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 0, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 0, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 0, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 0, metadata !705, metadata !DIExpression()) #7, !dbg !711
  %186 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 0, !dbg !715
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %186) #7, !dbg !715
  call void @llvm.dbg.declare(metadata %struct.iphdr* %4, metadata !709, metadata !DIExpression()) #7, !dbg !716
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %186, i8* noundef nonnull align 4 dereferenceable(20) getelementptr inbounds (%struct.iphdr, %struct.iphdr* @__const.nat64_handle_v6.dst_hdr, i64 0, i32 0), i64 12, i1 false) #7, !dbg !716
  %187 = ptrtoint i8* %49 to i64, !dbg !717
  %188 = trunc i64 %187 to i32, !dbg !718
  %189 = sub i32 %188, %12, !dbg !718
  %190 = and i32 %189, 8191, !dbg !718
  call void @llvm.dbg.value(metadata i32 %190, metadata !703, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !719, metadata !DIExpression()) #7, !dbg !728
  call void @llvm.dbg.value(metadata i8* %10, metadata !725, metadata !DIExpression()) #7, !dbg !728
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !726, metadata !DIExpression()) #7, !dbg !728
  call void @llvm.dbg.value(metadata i8* %49, metadata !727, metadata !DIExpression()) #7, !dbg !728
  %191 = getelementptr inbounds i8, i8* %49, i64 40, !dbg !730
  %192 = icmp ugt i8* %191, %10, !dbg !732
  br i1 %192, label %417, label %193, !dbg !733

193:                                              ; preds = %183
  %194 = load i8, i8* %49, align 4, !dbg !734
  %195 = and i8 %194, -16, !dbg !736
  %196 = icmp eq i8 %195, 96, !dbg !736
  br i1 %196, label %197, label %417, !dbg !737

197:                                              ; preds = %193
  call void @llvm.dbg.value(metadata i8* %191, metadata !353, metadata !DIExpression()), !dbg !370
  %198 = bitcast i8* %49 to %struct.ipv6hdr*, !dbg !738
  %199 = getelementptr inbounds i8, i8* %49, i64 6, !dbg !739
  %200 = load i8, i8* %199, align 2, !dbg !739, !tbaa !594
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !740, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %10, metadata !745, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i32 0, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %200, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %191, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %201 = getelementptr inbounds i8, i8* %49, i64 42, !dbg !761
  %202 = icmp ugt i8* %201, %10, !dbg !763
  br i1 %202, label %417, label %203, !dbg !764

203:                                              ; preds = %197
  switch i8 %200, label %279 [
    i8 0, label %205
    i8 60, label %205
    i8 43, label %205
    i8 -121, label %205
    i8 51, label %204
    i8 44, label %212
  ], !dbg !765

204:                                              ; preds = %203
  call void @llvm.dbg.value(metadata i8 undef, metadata !746, metadata !DIExpression()) #7, !dbg !757
  br label %205, !dbg !766

205:                                              ; preds = %204, %203, %203, %203, %203
  %206 = phi i64 [ 2, %204 ], [ 3, %203 ], [ 3, %203 ], [ 3, %203 ], [ 3, %203 ]
  %207 = getelementptr inbounds i8, i8* %49, i64 41, !dbg !768
  %208 = load i8, i8* %207, align 1, !dbg !768, !tbaa !769
  %209 = zext i8 %208 to i64, !dbg !768
  %210 = shl nuw nsw i64 %209, %206, !dbg !768
  %211 = add nuw nsw i64 %210, 8, !dbg !768
  br label %212, !dbg !768

212:                                              ; preds = %205, %203
  %213 = phi i64 [ 8, %203 ], [ %211, %205 ]
  %214 = getelementptr inbounds i8, i8* %191, i64 %213, !dbg !768
  call void @llvm.dbg.value(metadata i8* %214, metadata !353, metadata !DIExpression()), !dbg !370
  %215 = load i8, i8* %191, align 1, !dbg !768, !tbaa !771
  call void @llvm.dbg.value(metadata i32 1, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %215, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %214, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %216 = getelementptr inbounds i8, i8* %214, i64 2, !dbg !761
  %217 = icmp ugt i8* %216, %10, !dbg !763
  br i1 %217, label %417, label %218, !dbg !764

218:                                              ; preds = %212
  switch i8 %215, label %279 [
    i8 0, label %219
    i8 60, label %219
    i8 43, label %219
    i8 -121, label %219
    i8 51, label %220
    i8 44, label %227
  ], !dbg !765

219:                                              ; preds = %218, %218, %218, %218
  call void @llvm.dbg.value(metadata i8 undef, metadata !746, metadata !DIExpression()) #7, !dbg !757
  br label %220, !dbg !772

220:                                              ; preds = %219, %218
  %221 = phi i64 [ 3, %219 ], [ 2, %218 ]
  %222 = getelementptr inbounds i8, i8* %214, i64 1, !dbg !768
  %223 = load i8, i8* %222, align 1, !dbg !768, !tbaa !769
  %224 = zext i8 %223 to i64, !dbg !768
  %225 = shl nuw nsw i64 %224, %221, !dbg !768
  %226 = add nuw nsw i64 %225, 8, !dbg !768
  br label %227, !dbg !768

227:                                              ; preds = %220, %218
  %228 = phi i64 [ 8, %218 ], [ %226, %220 ]
  %229 = getelementptr inbounds i8, i8* %214, i64 %228, !dbg !768
  call void @llvm.dbg.value(metadata i8* %229, metadata !353, metadata !DIExpression()), !dbg !370
  %230 = load i8, i8* %214, align 1, !dbg !768, !tbaa !771
  call void @llvm.dbg.value(metadata i32 2, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %230, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %229, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %231 = getelementptr inbounds i8, i8* %229, i64 2, !dbg !761
  %232 = icmp ugt i8* %231, %10, !dbg !763
  br i1 %232, label %417, label %233, !dbg !764

233:                                              ; preds = %227
  switch i8 %230, label %279 [
    i8 0, label %234
    i8 60, label %234
    i8 43, label %234
    i8 -121, label %234
    i8 51, label %235
    i8 44, label %242
  ], !dbg !765

234:                                              ; preds = %233, %233, %233, %233
  call void @llvm.dbg.value(metadata i8 undef, metadata !746, metadata !DIExpression()) #7, !dbg !757
  br label %235, !dbg !772

235:                                              ; preds = %234, %233
  %236 = phi i64 [ 3, %234 ], [ 2, %233 ]
  %237 = getelementptr inbounds i8, i8* %229, i64 1, !dbg !768
  %238 = load i8, i8* %237, align 1, !dbg !768, !tbaa !769
  %239 = zext i8 %238 to i64, !dbg !768
  %240 = shl nuw nsw i64 %239, %236, !dbg !768
  %241 = add nuw nsw i64 %240, 8, !dbg !768
  br label %242, !dbg !768

242:                                              ; preds = %235, %233
  %243 = phi i64 [ 8, %233 ], [ %241, %235 ]
  %244 = getelementptr inbounds i8, i8* %229, i64 %243, !dbg !768
  call void @llvm.dbg.value(metadata i8* %244, metadata !353, metadata !DIExpression()), !dbg !370
  %245 = load i8, i8* %229, align 1, !dbg !768, !tbaa !771
  call void @llvm.dbg.value(metadata i32 3, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %245, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %244, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %246 = getelementptr inbounds i8, i8* %244, i64 2, !dbg !761
  %247 = icmp ugt i8* %246, %10, !dbg !763
  br i1 %247, label %417, label %248, !dbg !764

248:                                              ; preds = %242
  switch i8 %245, label %279 [
    i8 0, label %249
    i8 60, label %249
    i8 43, label %249
    i8 -121, label %249
    i8 51, label %250
    i8 44, label %257
  ], !dbg !765

249:                                              ; preds = %248, %248, %248, %248
  call void @llvm.dbg.value(metadata i8 undef, metadata !746, metadata !DIExpression()) #7, !dbg !757
  br label %250, !dbg !772

250:                                              ; preds = %249, %248
  %251 = phi i64 [ 3, %249 ], [ 2, %248 ]
  %252 = getelementptr inbounds i8, i8* %244, i64 1, !dbg !768
  %253 = load i8, i8* %252, align 1, !dbg !768, !tbaa !769
  %254 = zext i8 %253 to i64, !dbg !768
  %255 = shl nuw nsw i64 %254, %251, !dbg !768
  %256 = add nuw nsw i64 %255, 8, !dbg !768
  br label %257, !dbg !768

257:                                              ; preds = %250, %248
  %258 = phi i64 [ 8, %248 ], [ %256, %250 ]
  %259 = getelementptr inbounds i8, i8* %244, i64 %258, !dbg !768
  call void @llvm.dbg.value(metadata i8* %259, metadata !353, metadata !DIExpression()), !dbg !370
  %260 = load i8, i8* %244, align 1, !dbg !768, !tbaa !771
  call void @llvm.dbg.value(metadata i32 4, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %260, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %259, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %261 = getelementptr inbounds i8, i8* %259, i64 2, !dbg !761
  %262 = icmp ugt i8* %261, %10, !dbg !763
  br i1 %262, label %417, label %263, !dbg !764

263:                                              ; preds = %257
  switch i8 %260, label %279 [
    i8 0, label %264
    i8 60, label %264
    i8 43, label %264
    i8 -121, label %264
    i8 51, label %265
    i8 44, label %272
  ], !dbg !765

264:                                              ; preds = %263, %263, %263, %263
  call void @llvm.dbg.value(metadata i8 undef, metadata !746, metadata !DIExpression()) #7, !dbg !757
  br label %265, !dbg !772

265:                                              ; preds = %264, %263
  %266 = phi i64 [ 3, %264 ], [ 2, %263 ]
  %267 = getelementptr inbounds i8, i8* %259, i64 1, !dbg !768
  %268 = load i8, i8* %267, align 1, !dbg !768, !tbaa !769
  %269 = zext i8 %268 to i64, !dbg !768
  %270 = shl nuw nsw i64 %269, %266, !dbg !768
  %271 = add nuw nsw i64 %270, 8, !dbg !768
  br label %272, !dbg !768

272:                                              ; preds = %265, %263
  %273 = phi i64 [ 8, %263 ], [ %271, %265 ]
  %274 = getelementptr inbounds i8, i8* %259, i64 %273, !dbg !768
  call void @llvm.dbg.value(metadata i8* %274, metadata !353, metadata !DIExpression()), !dbg !370
  %275 = load i8, i8* %259, align 1, !dbg !768, !tbaa !771
  call void @llvm.dbg.value(metadata i32 5, metadata !747, metadata !DIExpression()) #7, !dbg !759
  call void @llvm.dbg.value(metadata i8 %275, metadata !746, metadata !DIExpression()) #7, !dbg !757
  call void @llvm.dbg.value(metadata i8* %274, metadata !749, metadata !DIExpression()) #7, !dbg !760
  %276 = getelementptr inbounds i8, i8* %274, i64 2, !dbg !761
  %277 = icmp ugt i8* %276, %10, !dbg !763
  br i1 %277, label %417, label %278, !dbg !764

278:                                              ; preds = %272
  switch i8 %275, label %279 [
    i8 0, label %417
    i8 60, label %417
    i8 43, label %417
    i8 -121, label %417
    i8 51, label %417
    i8 44, label %417
  ], !dbg !765

279:                                              ; preds = %278, %263, %248, %233, %218, %203
  %280 = phi i8 [ %200, %203 ], [ %215, %218 ], [ %230, %233 ], [ %245, %248 ], [ %260, %263 ], [ %275, %278 ]
  call void @llvm.dbg.value(metadata i8 %280, metadata !702, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.in6_addr* undef, metadata !697, metadata !DIExpression()) #7, !dbg !711
  %281 = getelementptr inbounds i8, i8* %49, i64 24, !dbg !773
  %282 = bitcast i8* %281 to i32*, !dbg !773
  %283 = load i32, i32* %282, align 4, !dbg !773, !tbaa.struct !528
  call void @llvm.dbg.value(metadata i32 %283, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i32 undef, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)) #7, !dbg !711
  %284 = getelementptr inbounds i8, i8* %49, i64 32, !dbg !773
  %285 = bitcast i8* %284 to i32*, !dbg !773
  %286 = load i32, i32* %285, align 4, !dbg !773, !tbaa.struct !774
  call void @llvm.dbg.value(metadata i32 %286, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)) #7, !dbg !711
  %287 = getelementptr inbounds i8, i8* %49, i64 36, !dbg !773
  %288 = bitcast i8* %287 to i32*, !dbg !773
  call void @llvm.dbg.value(metadata i32 0, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.in6_addr* undef, metadata !775, metadata !DIExpression()) #7, !dbg !782
  call void @llvm.dbg.value(metadata i64 0, metadata !781, metadata !DIExpression()) #7, !dbg !782
  %289 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 0, i32 0, i32 0, i64 0), align 8, !dbg !785, !tbaa !529
  %290 = icmp eq i32 %283, %289, !dbg !790
  call void @llvm.dbg.value(metadata i64 0, metadata !781, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !782
  br i1 %290, label %291, label %417, !dbg !790

291:                                              ; preds = %279
  %292 = getelementptr inbounds i8, i8* %49, i64 28, !dbg !773
  %293 = bitcast i8* %292 to i32*, !dbg !773
  %294 = load i32, i32* %293, align 4, !dbg !773, !tbaa.struct !791
  call void @llvm.dbg.value(metadata i32 %294, metadata !698, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)) #7, !dbg !711
  call void @llvm.dbg.value(metadata i64 1, metadata !781, metadata !DIExpression()) #7, !dbg !782
  %295 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 0, i32 0, i32 0, i64 1), align 4, !dbg !785, !tbaa !529
  %296 = icmp eq i32 %294, %295, !dbg !790
  call void @llvm.dbg.value(metadata i64 1, metadata !781, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !782
  br i1 %296, label %297, label %417, !dbg !790

297:                                              ; preds = %291
  call void @llvm.dbg.value(metadata i64 2, metadata !781, metadata !DIExpression()) #7, !dbg !782
  %298 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 0, i32 0, i32 0, i64 2), align 8, !dbg !785, !tbaa !529
  %299 = icmp ne i32 %286, %298, !dbg !790
  call void @llvm.dbg.value(metadata i64 2, metadata !781, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !782
  %300 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 0, i32 0, i32 0, i64 3), align 4
  %301 = icmp ne i32 %300, 0
  %302 = select i1 %299, i1 true, i1 %301, !dbg !790
  call void @llvm.dbg.value(metadata i64 3, metadata !781, metadata !DIExpression()) #7, !dbg !782
  br i1 %302, label %417, label %303, !dbg !790

303:                                              ; preds = %297
  call void @llvm.dbg.value(metadata i64 3, metadata !781, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !782
  call void @llvm.dbg.value(metadata i32 2, metadata !705, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %304 = icmp eq i8 %280, %200, !dbg !792
  br i1 %304, label %305, label %417, !dbg !794

305:                                              ; preds = %303
  %306 = load i32, i32* %288, align 4, !dbg !795, !tbaa !529
  call void @llvm.dbg.value(metadata i32 %306, metadata !701, metadata !DIExpression()) #7, !dbg !711
  %307 = icmp eq i32 %306, 0, !dbg !796
  %308 = and i32 %306, 255
  %309 = icmp eq i32 %308, 127
  %310 = or i1 %307, %309, !dbg !798
  %311 = and i32 %306, 240
  %312 = icmp eq i32 %311, 224
  %313 = or i1 %312, %310, !dbg !798
  br i1 %313, label %417, label %314, !dbg !798

314:                                              ; preds = %305
  %315 = getelementptr inbounds %struct.v6_trie_key, %struct.v6_trie_key* %3, i64 0, i32 1, !dbg !799
  %316 = getelementptr inbounds i8, i8* %49, i64 8, !dbg !800
  %317 = bitcast i8* %316 to %struct.in6_addr*, !dbg !800
  %318 = bitcast %struct.in6_addr* %315 to i8*, !dbg !800
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %318, i8* noundef nonnull align 4 dereferenceable(16) %316, i64 16, i1 false) #7, !dbg !800, !tbaa.struct !528
  %319 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @allowed_v6_src to i8*), i8* noundef nonnull %184) #7, !dbg !801
  call void @llvm.dbg.value(metadata i8* %319, metadata !699, metadata !DIExpression()) #7, !dbg !711
  %320 = icmp eq i8* %319, null, !dbg !802
  br i1 %320, label %417, label %321, !dbg !804

321:                                              ; preds = %314
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %322 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef nonnull %316) #7, !dbg !805
  call void @llvm.dbg.value(metadata i8* %322, metadata !708, metadata !DIExpression()) #7, !dbg !711
  %323 = icmp eq i8* %322, null, !dbg !806
  br i1 %323, label %324, label %327, !dbg !808

324:                                              ; preds = %321
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %325 = call fastcc %struct.v6_addr_state* @alloc_new_state(%struct.in6_addr* noundef nonnull %317) #7, !dbg !809
  call void @llvm.dbg.value(metadata %struct.v6_addr_state* %325, metadata !708, metadata !DIExpression()) #7, !dbg !711
  %326 = icmp eq %struct.v6_addr_state* %325, null, !dbg !811
  br i1 %326, label %417, label %332, !dbg !813

327:                                              ; preds = %321
  %328 = bitcast i8* %322 to %struct.v6_addr_state*, !dbg !805
  call void @llvm.dbg.value(metadata %struct.v6_addr_state* %328, metadata !708, metadata !DIExpression()) #7, !dbg !711
  %329 = call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !814
  %330 = bitcast i8* %322 to i64*, !dbg !816
  store i64 %329, i64* %330, align 8, !dbg !817, !tbaa !818
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %331 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef nonnull %316, i8* noundef nonnull %322, i64 noundef 2) #7, !dbg !820
  call void @llvm.dbg.value(metadata i32 undef, metadata !700, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* undef, metadata !704, metadata !DIExpression()) #7, !dbg !711
  br label %332

332:                                              ; preds = %327, %324
  %333 = phi %struct.v6_addr_state* [ %328, %327 ], [ %325, %324 ], !dbg !711
  call void @llvm.dbg.value(metadata %struct.v6_addr_state* %333, metadata !708, metadata !DIExpression()) #7, !dbg !711
  %334 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 8, i32 0, i32 1, !dbg !821
  store i32 %306, i32* %334, align 4, !dbg !822, !tbaa !529
  %335 = getelementptr inbounds %struct.v6_addr_state, %struct.v6_addr_state* %333, i64 0, i32 1, !dbg !823
  %336 = load i32, i32* %335, align 8, !dbg !823, !tbaa !824
  %337 = call i32 @llvm.bswap.i32(i32 %336) #7, !dbg !823
  %338 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 8, i32 0, i32 0, !dbg !825
  store i32 %337, i32* %338, align 4, !dbg !826, !tbaa !529
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %339 = load i8, i8* %199, align 2, !dbg !827, !tbaa !594
  %340 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 6, !dbg !828
  store i8 %339, i8* %340, align 1, !dbg !829, !tbaa !592
  %341 = getelementptr inbounds i8, i8* %49, i64 7, !dbg !830
  %342 = load i8, i8* %341, align 1, !dbg !830, !tbaa !599
  %343 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 5, !dbg !831
  store i8 %342, i8* %343, align 4, !dbg !832, !tbaa !597
  %344 = load i8, i8* %49, align 4, !dbg !833
  %345 = getelementptr inbounds i8, i8* %49, i64 1, !dbg !834
  %346 = load i8, i8* %345, align 1, !dbg !834, !tbaa !529
  %347 = call i8 @llvm.fshl.i8(i8 %344, i8 %346, i8 4) #7, !dbg !835
  %348 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 1, !dbg !836
  store i8 %347, i8* %348, align 1, !dbg !837, !tbaa !601
  %349 = getelementptr inbounds i8, i8* %49, i64 4, !dbg !838
  %350 = bitcast i8* %349 to i16*, !dbg !838
  %351 = load i16, i16* %350, align 4, !dbg !838, !tbaa !609
  %352 = call i16 @llvm.bswap.i16(i16 %351) #7, !dbg !838
  %353 = add i16 %352, 20, !dbg !838
  %354 = call i16 @llvm.bswap.i16(i16 %353) #7, !dbg !838
  %355 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 2, !dbg !839
  store i16 %354, i16* %355, align 2, !dbg !840, !tbaa !607
  switch i8 %339, label %380 [
    i8 58, label %356
    i8 6, label %360
    i8 17, label %360
  ], !dbg !841

356:                                              ; preds = %332
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  %357 = call fastcc i32 @rewrite_icmpv6(%struct.ipv6hdr* noundef nonnull %198, %struct.__sk_buff* noundef nonnull %0) #7, !dbg !842
  %358 = icmp eq i32 %357, 0, !dbg !842
  br i1 %358, label %359, label %417, !dbg !845

359:                                              ; preds = %356
  store i8 1, i8* %340, align 1, !dbg !846, !tbaa !592
  br label %380, !dbg !847

360:                                              ; preds = %332, %332
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !704, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !617, metadata !DIExpression()) #7, !dbg !848
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %198, metadata !622, metadata !DIExpression()) #7, !dbg !848
  call void @llvm.dbg.value(metadata %struct.iphdr* %4, metadata !623, metadata !DIExpression()) #7, !dbg !848
  call void @llvm.dbg.value(metadata i8 %339, metadata !624, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  call void @llvm.dbg.value(metadata i1 false, metadata !625, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  %361 = load i32, i32* %11, align 4, !dbg !850, !tbaa !381
  %362 = zext i32 %361 to i64, !dbg !851
  call void @llvm.dbg.value(metadata i64 %362, metadata !626, metadata !DIExpression()) #7, !dbg !848
  call void @llvm.dbg.value(metadata i32 16, metadata !627, metadata !DIExpression()) #7, !dbg !848
  %363 = bitcast i8* %316 to i32*, !dbg !852
  %364 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %363, i32 noundef 32, i32* noundef nonnull %338, i32 noundef 8, i32 noundef 0) #7, !dbg !854
  call void @llvm.dbg.value(metadata i64 %364, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  call void @llvm.dbg.value(metadata !DIArgList(i8* %191, i64 %362), metadata !628, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  %365 = ptrtoint i8* %191 to i64, !dbg !855
  %366 = sub i64 %365, %362, !dbg !855
  call void @llvm.dbg.value(metadata i64 %366, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  switch i8 %339, label %380 [
    i8 6, label %367
    i8 17, label %371
  ], !dbg !856

367:                                              ; preds = %360
  %368 = trunc i64 %366 to i32, !dbg !855
  %369 = and i32 %368, 65535, !dbg !857
  call void @llvm.dbg.value(metadata i32 %368, metadata !628, metadata !DIExpression()) #7, !dbg !848
  %370 = add nuw nsw i32 %369, 16, !dbg !857
  call void @llvm.dbg.value(metadata i32 %368, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 16, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !848
  br label %374, !dbg !858

371:                                              ; preds = %360
  %372 = trunc i64 %366 to i32, !dbg !859
  %373 = add i32 %372, 6, !dbg !859
  call void @llvm.dbg.value(metadata i64 %366, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_plus_uconst, 6, DW_OP_stack_value)) #7, !dbg !848
  call void @llvm.dbg.value(metadata i32 48, metadata !627, metadata !DIExpression()) #7, !dbg !848
  br label %374, !dbg !860

374:                                              ; preds = %371, %367
  %375 = phi i64 [ 48, %371 ], [ 16, %367 ]
  %376 = phi i32 [ %373, %371 ], [ %370, %367 ], !dbg !861
  call void @llvm.dbg.value(metadata i32 undef, metadata !627, metadata !DIExpression()) #7, !dbg !848
  %377 = and i32 %376, 65535, !dbg !862
  call void @llvm.dbg.value(metadata i32 %376, metadata !628, metadata !DIExpression()) #7, !dbg !848
  %378 = and i64 %364, 4294967295, !dbg !863
  %379 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %0, i32 noundef %377, i64 noundef 0, i64 noundef %378, i64 noundef %375) #7, !dbg !864
  br label %380, !dbg !865

380:                                              ; preds = %374, %360, %359, %332
  %381 = bitcast %struct.iphdr* %4 to i32*, !dbg !866
  %382 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %381, i32 noundef 0, i32* noundef nonnull %381, i32 noundef 20, i32 noundef 0) #7, !dbg !867
  %383 = trunc i64 %382 to i32, !dbg !867
  call void @llvm.dbg.value(metadata i32 %383, metadata !868, metadata !DIExpression()) #7, !dbg !874
  %384 = lshr i32 %383, 16, !dbg !876
  %385 = and i32 %383, 65535, !dbg !877
  %386 = add nuw nsw i32 %384, %385, !dbg !878
  call void @llvm.dbg.value(metadata i32 %386, metadata !873, metadata !DIExpression()) #7, !dbg !874
  %387 = lshr i32 %386, 16, !dbg !879
  %388 = add nuw nsw i32 %387, %386, !dbg !880
  call void @llvm.dbg.value(metadata i32 %388, metadata !873, metadata !DIExpression()) #7, !dbg !874
  %389 = trunc i32 %388 to i16, !dbg !881
  %390 = xor i16 %389, -1, !dbg !881
  %391 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %4, i64 0, i32 7, !dbg !882
  store i16 %390, i16* %391, align 2, !dbg !883, !tbaa !884
  %392 = call i64 inttoptr (i64 31 to i64 (%struct.__sk_buff*, i16, i64)*)(%struct.__sk_buff* noundef nonnull %0, i16 noundef zeroext 8, i64 noundef 0) #7, !dbg !885
  %393 = icmp eq i64 %392, 0, !dbg !885
  br i1 %393, label %394, label %417, !dbg !887

394:                                              ; preds = %380
  %395 = load i32, i32* %11, align 4, !dbg !888, !tbaa !381
  %396 = zext i32 %395 to i64, !dbg !889
  %397 = inttoptr i64 %396 to i8*, !dbg !890
  call void @llvm.dbg.value(metadata i8* %397, metadata !686, metadata !DIExpression()) #7, !dbg !711
  %398 = load i32, i32* %7, align 8, !dbg !891, !tbaa !372
  %399 = zext i32 %398 to i64, !dbg !892
  call void @llvm.dbg.value(metadata i64 %399, metadata !685, metadata !DIExpression()) #7, !dbg !711
  %400 = inttoptr i64 %396 to %struct.ethhdr*, !dbg !893
  call void @llvm.dbg.value(metadata %struct.ethhdr* %400, metadata !706, metadata !DIExpression()) #7, !dbg !711
  %401 = zext i32 %190 to i64
  %402 = getelementptr i8, i8* %397, i64 %401, !dbg !894
  call void @llvm.dbg.value(metadata i8* %402, metadata !707, metadata !DIExpression()) #7, !dbg !711
  %403 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %400, i64 1, !dbg !895
  %404 = inttoptr i64 %399 to %struct.ethhdr*, !dbg !897
  %405 = icmp ugt %struct.ethhdr* %403, %404, !dbg !898
  %406 = getelementptr inbounds i8, i8* %402, i64 20
  %407 = bitcast i8* %406 to %struct.iphdr*
  %408 = inttoptr i64 %399 to %struct.iphdr*
  %409 = icmp ugt %struct.iphdr* %407, %408
  %410 = select i1 %405, i1 true, i1 %409, !dbg !899
  br i1 %410, label %417, label %411, !dbg !899

411:                                              ; preds = %394
  %412 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %400, i64 0, i32 2, !dbg !900
  store i16 8, i16* %412, align 1, !dbg !901, !tbaa !667
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %402, i8* noundef nonnull align 4 dereferenceable(20) %186, i64 20, i1 false) #7, !dbg !902, !tbaa.struct !903
  %413 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 10, !dbg !904
  %414 = load i32, i32* %413, align 8, !dbg !904, !tbaa !672
  %415 = call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 noundef %414, i64 noundef 1) #7, !dbg !905
  %416 = trunc i64 %415 to i32, !dbg !905
  call void @llvm.dbg.value(metadata i32 %416, metadata !705, metadata !DIExpression()) #7, !dbg !711
  br label %417, !dbg !906

417:                                              ; preds = %278, %278, %278, %278, %278, %278, %183, %193, %197, %212, %227, %242, %257, %272, %279, %291, %297, %303, %305, %314, %324, %356, %380, %394, %411
  %418 = phi i32 [ 2, %380 ], [ 2, %394 ], [ %416, %411 ], [ 2, %356 ], [ 2, %303 ], [ 2, %305 ], [ 2, %314 ], [ 2, %324 ], [ 0, %183 ], [ 0, %193 ], [ 0, %272 ], [ 0, %257 ], [ 0, %242 ], [ 0, %227 ], [ 0, %212 ], [ 0, %197 ], [ 0, %279 ], [ 0, %291 ], [ 0, %297 ], [ 0, %278 ], [ 0, %278 ], [ 0, %278 ], [ 0, %278 ], [ 0, %278 ], [ 0, %278 ], !dbg !711
  call void @llvm.dbg.value(metadata i32 %418, metadata !705, metadata !DIExpression()) #7, !dbg !711
  call void @llvm.dbg.label(metadata !710) #7, !dbg !907
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %186) #7, !dbg !908
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %184) #7, !dbg !908
  br label %419, !dbg !909

419:                                              ; preds = %2, %180, %417, %178
  %420 = phi i32 [ %179, %178 ], [ %418, %417 ], [ 0, %180 ], [ 0, %2 ], !dbg !370
  ret i32 %420, !dbg !910
}

; Function Attrs: nounwind
define dso_local i32 @nat64_ingress(%struct.__sk_buff* noundef %0) #0 section "tc" !dbg !911 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !913, metadata !DIExpression()), !dbg !914
  %2 = tail call fastcc i32 @nat64_handler(%struct.__sk_buff* noundef %0, i1 noundef zeroext false), !dbg !915
  ret i32 %2, !dbg !916
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #1

; Function Attrs: nounwind
define internal fastcc i32 @rewrite_icmp(%struct.iphdr* noundef %0, %struct.ipv6hdr* nocapture noundef readonly %1, %struct.__sk_buff* noundef %2) unnamed_addr #0 !dbg !917 {
  %4 = alloca %struct.icmpv6_pseudo, align 1
  call void @llvm.dbg.value(metadata %struct.iphdr* %0, metadata !921, metadata !DIExpression()), !dbg !991
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1, metadata !922, metadata !DIExpression()), !dbg !991
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %2, metadata !923, metadata !DIExpression()), !dbg !991
  %5 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %2, i64 0, i32 16, !dbg !992
  %6 = load i32, i32* %5, align 8, !dbg !992, !tbaa !372
  %7 = zext i32 %6 to i64, !dbg !993
  call void @llvm.dbg.value(metadata i64 %7, metadata !924, metadata !DIExpression()), !dbg !991
  %8 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %0, i64 1, i32 0, !dbg !994
  call void @llvm.dbg.value(metadata i8* %8, metadata !948, metadata !DIExpression()), !dbg !991
  %9 = getelementptr inbounds i8, i8* %8, i64 8, !dbg !995
  %10 = bitcast i8* %9 to %struct.icmphdr*, !dbg !995
  %11 = inttoptr i64 %7 to %struct.icmphdr*, !dbg !997
  %12 = icmp ugt %struct.icmphdr* %10, %11, !dbg !998
  br i1 %12, label %69, label %13, !dbg !999

13:                                               ; preds = %3
  %14 = bitcast i8* %8 to i64*, !dbg !1000
  %15 = load i64, i64* %14, align 4, !dbg !1000
  call void @llvm.dbg.value(metadata i64 %15, metadata !925, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value, DW_OP_LLVM_fragment, 0, 16)), !dbg !991
  call void @llvm.dbg.value(metadata i64 %15, metadata !925, metadata !DIExpression(DW_OP_constu, 16, DW_OP_shr, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value, DW_OP_LLVM_fragment, 16, 16)), !dbg !991
  %16 = lshr i64 %15, 32, !dbg !1000
  %17 = trunc i64 %16 to i32, !dbg !1000
  call void @llvm.dbg.value(metadata i32 %17, metadata !925, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !991
  call void @llvm.dbg.value(metadata i8* %8, metadata !988, metadata !DIExpression()), !dbg !991
  call void @llvm.dbg.value(metadata i8 undef, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  %18 = getelementptr inbounds i8, i8* %8, i64 1, !dbg !1001
  %19 = lshr i64 %15, 8, !dbg !1001
  %20 = trunc i64 %19 to i8, !dbg !1001
  call void @llvm.dbg.value(metadata i8 %20, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i16 undef, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !991
  %21 = getelementptr inbounds i8, i8* %8, i64 4, !dbg !1001
  %22 = bitcast i8* %21 to i32*, !dbg !1001
  call void @llvm.dbg.value(metadata i32 %17, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !991
  %23 = trunc i64 %15 to i8, !dbg !1002
  switch i8 %23, label %69 [
    i8 8, label %30
    i8 0, label %24
    i8 3, label %25
  ], !dbg !1003

24:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i8 -127, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  br label %30, !dbg !1004

25:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i8 1, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  switch i8 %20, label %69 [
    i8 0, label %30
    i8 1, label %30
    i8 5, label %30
    i8 6, label %30
    i8 7, label %30
    i8 8, label %30
    i8 11, label %30
    i8 12, label %30
    i8 2, label %26
    i8 3, label %27
  ], !dbg !1006

26:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i8 4, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i8 1, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i32 100663296, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !991
  br label %27, !dbg !1007

27:                                               ; preds = %25, %26
  %28 = phi i32 [ %17, %25 ], [ 100663296, %26 ], !dbg !991
  %29 = phi i8 [ 1, %25 ], [ 4, %26 ], !dbg !1009
  call void @llvm.dbg.value(metadata i8 %29, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i32 %28, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !991
  call void @llvm.dbg.value(metadata i8 4, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !991
  br label %30, !dbg !1010

30:                                               ; preds = %25, %25, %25, %25, %25, %25, %25, %25, %13, %27, %24
  %31 = phi i32 [ %28, %27 ], [ %17, %24 ], [ %17, %13 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], [ %17, %25 ], !dbg !1001
  %32 = phi i8 [ 4, %27 ], [ %20, %24 ], [ %20, %13 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], [ 0, %25 ], !dbg !991
  %33 = phi i8 [ %29, %27 ], [ -127, %24 ], [ -128, %13 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], [ 1, %25 ], !dbg !1009
  call void @llvm.dbg.value(metadata i8 %33, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i8 %32, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !991
  call void @llvm.dbg.value(metadata i32 %31, metadata !950, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !991
  store i8 %33, i8* %8, align 4, !dbg !1011, !tbaa.struct !1012
  store i8 %32, i8* %18, align 1, !dbg !1011, !tbaa.struct !1013
  store i32 %31, i32* %22, align 4, !dbg !1011, !tbaa.struct !1014
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %2, metadata !1015, metadata !DIExpression()) #7, !dbg !1039
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1, metadata !1020, metadata !DIExpression()) #7, !dbg !1039
  call void @llvm.dbg.value(metadata i8* undef, metadata !1021, metadata !DIExpression()) #7, !dbg !1039
  call void @llvm.dbg.value(metadata i8* %8, metadata !1022, metadata !DIExpression()) #7, !dbg !1039
  call void @llvm.dbg.value(metadata i1 true, metadata !1023, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1039
  %34 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %2, i64 0, i32 15, !dbg !1041
  %35 = load i32, i32* %34, align 4, !dbg !1041, !tbaa !381
  call void @llvm.dbg.value(metadata i32 %35, metadata !1024, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1039
  %36 = bitcast %struct.icmpv6_pseudo* %4 to i8*, !dbg !1042
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %36) #7, !dbg !1042
  call void @llvm.dbg.declare(metadata %struct.icmpv6_pseudo* %4, metadata !1025, metadata !DIExpression()) #7, !dbg !1043
  %37 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %1, i64 0, i32 5, i32 0, !dbg !1044
  %38 = bitcast %struct.anon.9* %37 to i8*, !dbg !1044
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %36, i8* noundef nonnull align 4 dereferenceable(16) %38, i64 16, i1 false) #7, !dbg !1044, !tbaa.struct !528
  %39 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %4, i64 0, i32 1, !dbg !1045
  %40 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %1, i64 0, i32 5, i32 0, i32 1, !dbg !1046
  %41 = bitcast %struct.in6_addr* %39 to i8*, !dbg !1046
  %42 = bitcast %struct.in6_addr* %40 to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %41, i8* noundef nonnull align 4 dereferenceable(16) %42, i64 16, i1 false) #7, !dbg !1046, !tbaa.struct !528
  %43 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %4, i64 0, i32 2, !dbg !1045
  %44 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %1, i64 0, i32 2, !dbg !1047
  %45 = load i16, i16* %44, align 4, !dbg !1047, !tbaa !609
  %46 = zext i16 %45 to i32, !dbg !1048
  store i32 %46, i32* %43, align 1, !dbg !1045, !tbaa !1049
  %47 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %4, i64 0, i32 3, i64 0, !dbg !1045
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(3) %47, i8 0, i64 3, i1 false) #7, !dbg !1045
  %48 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %4, i64 0, i32 4, !dbg !1045
  store i8 58, i8* %48, align 1, !dbg !1045, !tbaa !1051
  %49 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %4, i64 0, i32 0, i32 0, i32 0, i64 0, !dbg !1052
  %50 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %49, i32 noundef 0, i32* noundef nonnull %49, i32 noundef 40, i32 noundef 0) #7, !dbg !1053
  call void @llvm.dbg.value(metadata i64 %50, metadata !1036, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1039
  %51 = ptrtoint i8* %8 to i64, !dbg !1054
  %52 = trunc i64 %51 to i32, !dbg !1055
  %53 = add i32 %52, 2, !dbg !1055
  %54 = sub i32 %53, %35, !dbg !1055
  call void @llvm.dbg.value(metadata !DIArgList(i64 %51, i32 %35), metadata !1035, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_plus_uconst, 2, DW_OP_stack_value)) #7, !dbg !1039
  call void @llvm.dbg.value(metadata i64 %15, metadata !1033, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1039
  %55 = bitcast i8* %8 to i16*, !dbg !1056
  %56 = load i16, i16* %55, align 2, !dbg !1057, !tbaa !427
  call void @llvm.dbg.value(metadata i16 %56, metadata !1034, metadata !DIExpression()) #7, !dbg !1039
  call void @llvm.dbg.value(metadata i32 %17, metadata !1037, metadata !DIExpression()) #7, !dbg !1039
  %57 = load i32, i32* %22, align 4, !dbg !1058, !tbaa !563
  call void @llvm.dbg.value(metadata i32 %57, metadata !1038, metadata !DIExpression()) #7, !dbg !1039
  %58 = and i32 %54, 65535, !dbg !1059
  %59 = and i64 %50, 4294967295, !dbg !1060
  %60 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %2, i32 noundef %58, i64 noundef 0, i64 noundef %59, i64 noundef 16) #7, !dbg !1061
  %61 = and i64 %15, 65535, !dbg !1062
  %62 = zext i16 %56 to i64, !dbg !1063
  %63 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %2, i32 noundef %58, i64 noundef %61, i64 noundef %62, i64 noundef 2) #7, !dbg !1064
  %64 = icmp eq i32 %57, %17, !dbg !1065
  br i1 %64, label %68, label %65, !dbg !1067

65:                                               ; preds = %30
  %66 = zext i32 %57 to i64, !dbg !1068
  %67 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %2, i32 noundef %58, i64 noundef %16, i64 noundef %66, i64 noundef 4) #7, !dbg !1069
  br label %68, !dbg !1069

68:                                               ; preds = %30, %65
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %36) #7, !dbg !1070
  br label %69, !dbg !1071

69:                                               ; preds = %13, %25, %3, %68
  %70 = phi i32 [ 0, %68 ], [ -1, %3 ], [ -1, %13 ], [ -1, %25 ], !dbg !991
  ret i32 %70, !dbg !1072
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
define internal fastcc %struct.v6_addr_state* @alloc_new_state(%struct.in6_addr* noundef %0) unnamed_addr #0 !dbg !1073 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.v6_addr_state, align 8
  %5 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.in6_addr* %0, metadata !1077, metadata !DIExpression()), !dbg !1089
  %6 = bitcast %struct.v6_addr_state* %4 to i8*, !dbg !1090
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #7, !dbg !1090
  call void @llvm.dbg.declare(metadata %struct.v6_addr_state* %4, metadata !1078, metadata !DIExpression()), !dbg !1091
  %7 = getelementptr inbounds %struct.v6_addr_state, %struct.v6_addr_state* %4, i64 0, i32 0, !dbg !1092
  %8 = tail call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !1093
  store i64 %8, i64* %7, align 8, !dbg !1092, !tbaa !818
  %9 = getelementptr inbounds %struct.v6_addr_state, %struct.v6_addr_state* %4, i64 0, i32 1, !dbg !1092
  store i32 0, i32* %9, align 8, !dbg !1092, !tbaa !824
  %10 = getelementptr inbounds %struct.v6_addr_state, %struct.v6_addr_state* %4, i64 0, i32 2, !dbg !1092
  store i32 0, i32* %10, align 4, !dbg !1092, !tbaa !1094
  %11 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1095, !tbaa !571
  %12 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 4), align 4, !dbg !1096, !tbaa !566
  %13 = xor i32 %12, -1, !dbg !1097
  %14 = or i32 %11, %13, !dbg !1098
  %15 = add i32 %14, -1, !dbg !1099
  call void @llvm.dbg.value(metadata i32 %15, metadata !1079, metadata !DIExpression()), !dbg !1089
  %16 = bitcast i32* %5 to i8*, !dbg !1100
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #7, !dbg !1100
  call void @llvm.dbg.value(metadata i32 0, metadata !1080, metadata !DIExpression()), !dbg !1089
  store i32 0, i32* %5, align 4, !dbg !1101, !tbaa !563
  call void @llvm.dbg.value(metadata i32 0, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 0, metadata !1081, metadata !DIExpression()), !dbg !1089
  %17 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %18 = trunc i64 %17 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %18, metadata !1086, metadata !DIExpression()), !dbg !1103
  %19 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %20 = add i32 %19, %18, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %20, metadata !1082, metadata !DIExpression()), !dbg !1103
  %21 = icmp ult i32 %20, %15, !dbg !1106
  br i1 %21, label %150, label %132, !dbg !1108

22:                                               ; preds = %150
  call void @llvm.dbg.value(metadata i32 1, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 0, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 1, metadata !1081, metadata !DIExpression()), !dbg !1089
  %23 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %24 = trunc i64 %23 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %24, metadata !1086, metadata !DIExpression()), !dbg !1103
  %25 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %26 = add i32 %25, %24, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %26, metadata !1082, metadata !DIExpression()), !dbg !1103
  %27 = icmp ult i32 %26, %15, !dbg !1106
  br i1 %27, label %28, label %132, !dbg !1108

28:                                               ; preds = %22
  %29 = and i64 %23, 4294967295, !dbg !1109
  %30 = add i64 %23, 1, !dbg !1111
  %31 = and i64 %30, 4294967295, !dbg !1112
  %32 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %29, i64 %31 seq_cst seq_cst, align 8, !dbg !1113
  %33 = extractvalue { i64, i1 } %32, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 1, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %33, label %156, label %34, !dbg !1115

34:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i32 2, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 1, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 2, metadata !1081, metadata !DIExpression()), !dbg !1089
  %35 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %36 = trunc i64 %35 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %36, metadata !1086, metadata !DIExpression()), !dbg !1103
  %37 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %38 = add i32 %37, %36, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %38, metadata !1082, metadata !DIExpression()), !dbg !1103
  %39 = icmp ult i32 %38, %15, !dbg !1106
  br i1 %39, label %40, label %132, !dbg !1108

40:                                               ; preds = %34
  %41 = and i64 %35, 4294967295, !dbg !1109
  %42 = add i64 %35, 1, !dbg !1111
  %43 = and i64 %42, 4294967295, !dbg !1112
  %44 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %41, i64 %43 seq_cst seq_cst, align 8, !dbg !1113
  %45 = extractvalue { i64, i1 } %44, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 2, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %45, label %156, label %46, !dbg !1115

46:                                               ; preds = %40
  call void @llvm.dbg.value(metadata i32 3, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 2, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 3, metadata !1081, metadata !DIExpression()), !dbg !1089
  %47 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %48 = trunc i64 %47 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %48, metadata !1086, metadata !DIExpression()), !dbg !1103
  %49 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %50 = add i32 %49, %48, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %50, metadata !1082, metadata !DIExpression()), !dbg !1103
  %51 = icmp ult i32 %50, %15, !dbg !1106
  br i1 %51, label %52, label %132, !dbg !1108

52:                                               ; preds = %46
  %53 = and i64 %47, 4294967295, !dbg !1109
  %54 = add i64 %47, 1, !dbg !1111
  %55 = and i64 %54, 4294967295, !dbg !1112
  %56 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %53, i64 %55 seq_cst seq_cst, align 8, !dbg !1113
  %57 = extractvalue { i64, i1 } %56, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 3, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %57, label %156, label %58, !dbg !1115

58:                                               ; preds = %52
  call void @llvm.dbg.value(metadata i32 4, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 3, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 4, metadata !1081, metadata !DIExpression()), !dbg !1089
  %59 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %60 = trunc i64 %59 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %60, metadata !1086, metadata !DIExpression()), !dbg !1103
  %61 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %62 = add i32 %61, %60, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %62, metadata !1082, metadata !DIExpression()), !dbg !1103
  %63 = icmp ult i32 %62, %15, !dbg !1106
  br i1 %63, label %64, label %132, !dbg !1108

64:                                               ; preds = %58
  %65 = and i64 %59, 4294967295, !dbg !1109
  %66 = add i64 %59, 1, !dbg !1111
  %67 = and i64 %66, 4294967295, !dbg !1112
  %68 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %65, i64 %67 seq_cst seq_cst, align 8, !dbg !1113
  %69 = extractvalue { i64, i1 } %68, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 4, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %69, label %156, label %70, !dbg !1115

70:                                               ; preds = %64
  call void @llvm.dbg.value(metadata i32 5, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 4, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 5, metadata !1081, metadata !DIExpression()), !dbg !1089
  %71 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %72 = trunc i64 %71 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %72, metadata !1086, metadata !DIExpression()), !dbg !1103
  %73 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %74 = add i32 %73, %72, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %74, metadata !1082, metadata !DIExpression()), !dbg !1103
  %75 = icmp ult i32 %74, %15, !dbg !1106
  br i1 %75, label %76, label %132, !dbg !1108

76:                                               ; preds = %70
  %77 = and i64 %71, 4294967295, !dbg !1109
  %78 = add i64 %71, 1, !dbg !1111
  %79 = and i64 %78, 4294967295, !dbg !1112
  %80 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %77, i64 %79 seq_cst seq_cst, align 8, !dbg !1113
  %81 = extractvalue { i64, i1 } %80, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 5, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %81, label %156, label %82, !dbg !1115

82:                                               ; preds = %76
  call void @llvm.dbg.value(metadata i32 6, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 5, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 6, metadata !1081, metadata !DIExpression()), !dbg !1089
  %83 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %84 = trunc i64 %83 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %84, metadata !1086, metadata !DIExpression()), !dbg !1103
  %85 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %86 = add i32 %85, %84, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %86, metadata !1082, metadata !DIExpression()), !dbg !1103
  %87 = icmp ult i32 %86, %15, !dbg !1106
  br i1 %87, label %88, label %132, !dbg !1108

88:                                               ; preds = %82
  %89 = and i64 %83, 4294967295, !dbg !1109
  %90 = add i64 %83, 1, !dbg !1111
  %91 = and i64 %90, 4294967295, !dbg !1112
  %92 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %89, i64 %91 seq_cst seq_cst, align 8, !dbg !1113
  %93 = extractvalue { i64, i1 } %92, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 6, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %93, label %156, label %94, !dbg !1115

94:                                               ; preds = %88
  call void @llvm.dbg.value(metadata i32 7, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 6, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 7, metadata !1081, metadata !DIExpression()), !dbg !1089
  %95 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %96 = trunc i64 %95 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %96, metadata !1086, metadata !DIExpression()), !dbg !1103
  %97 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %98 = add i32 %97, %96, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %98, metadata !1082, metadata !DIExpression()), !dbg !1103
  %99 = icmp ult i32 %98, %15, !dbg !1106
  br i1 %99, label %100, label %132, !dbg !1108

100:                                              ; preds = %94
  %101 = and i64 %95, 4294967295, !dbg !1109
  %102 = add i64 %95, 1, !dbg !1111
  %103 = and i64 %102, 4294967295, !dbg !1112
  %104 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %101, i64 %103 seq_cst seq_cst, align 8, !dbg !1113
  %105 = extractvalue { i64, i1 } %104, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 7, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %105, label %156, label %106, !dbg !1115

106:                                              ; preds = %100
  call void @llvm.dbg.value(metadata i32 8, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 7, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 8, metadata !1081, metadata !DIExpression()), !dbg !1089
  %107 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %108 = trunc i64 %107 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %108, metadata !1086, metadata !DIExpression()), !dbg !1103
  %109 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %110 = add i32 %109, %108, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %110, metadata !1082, metadata !DIExpression()), !dbg !1103
  %111 = icmp ult i32 %110, %15, !dbg !1106
  br i1 %111, label %112, label %132, !dbg !1108

112:                                              ; preds = %106
  %113 = and i64 %107, 4294967295, !dbg !1109
  %114 = add i64 %107, 1, !dbg !1111
  %115 = and i64 %114, 4294967295, !dbg !1112
  %116 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %113, i64 %115 seq_cst seq_cst, align 8, !dbg !1113
  %117 = extractvalue { i64, i1 } %116, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 8, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %117, label %156, label %118, !dbg !1115

118:                                              ; preds = %112
  call void @llvm.dbg.value(metadata i32 9, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 8, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  call void @llvm.dbg.value(metadata i32 9, metadata !1081, metadata !DIExpression()), !dbg !1089
  %119 = atomicrmw or i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 0 seq_cst, align 8, !dbg !1102
  %120 = trunc i64 %119 to i32, !dbg !1102
  call void @llvm.dbg.value(metadata i32 %120, metadata !1086, metadata !DIExpression()), !dbg !1103
  %121 = load i32, i32* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 3), align 8, !dbg !1104, !tbaa !571
  %122 = add i32 %121, %120, !dbg !1105
  call void @llvm.dbg.value(metadata i32 %122, metadata !1082, metadata !DIExpression()), !dbg !1103
  %123 = icmp ult i32 %122, %15, !dbg !1106
  br i1 %123, label %124, label %132, !dbg !1108

124:                                              ; preds = %118
  %125 = and i64 %119, 4294967295, !dbg !1109
  %126 = add i64 %119, 1, !dbg !1111
  %127 = and i64 %126, 4294967295, !dbg !1112
  %128 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %125, i64 %127 seq_cst seq_cst, align 8, !dbg !1113
  %129 = extractvalue { i64, i1 } %128, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 9, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %129, label %156, label %130, !dbg !1115

130:                                              ; preds = %124
  call void @llvm.dbg.value(metadata i32 10, metadata !1081, metadata !DIExpression()), !dbg !1089
  call void @llvm.dbg.value(metadata i32 9, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  %131 = load i32, i32* %5, align 4, !dbg !1116, !tbaa !563
  br label %158, !dbg !1116

132:                                              ; preds = %118, %106, %94, %82, %70, %58, %46, %34, %22, %1
  %133 = bitcast i64* %2 to i8*, !dbg !1118
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %133) #7, !dbg !1118
  %134 = tail call i64 inttoptr (i64 5 to i64 ()*)() #7, !dbg !1127
  %135 = load i64, i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 1), align 8, !dbg !1128, !tbaa !1129
  %136 = sub i64 %134, %135, !dbg !1130
  call void @llvm.dbg.value(metadata i64 %136, metadata !1123, metadata !DIExpression()) #7, !dbg !1131
  store i64 %136, i64* %2, align 8, !dbg !1132, !tbaa !1133
  %137 = bitcast i32* %3 to i8*, !dbg !1134
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %137) #7, !dbg !1134
  call void @llvm.dbg.value(metadata i32* %3, metadata !1124, metadata !DIExpression(DW_OP_deref)) #7, !dbg !1131
  %138 = call i64 inttoptr (i64 88 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.7* @reclaimed_addrs to i8*), i8* noundef nonnull %137) #7, !dbg !1135
  %139 = icmp eq i64 %138, 0, !dbg !1137
  br i1 %139, label %140, label %142, !dbg !1138

140:                                              ; preds = %132
  %141 = load i32, i32* %3, align 4, !dbg !1139, !tbaa !563
  call void @llvm.dbg.value(metadata i32 %141, metadata !1124, metadata !DIExpression()) #7, !dbg !1131
  br label %148, !dbg !1140

142:                                              ; preds = %132
  call void @llvm.dbg.value(metadata i64* %2, metadata !1123, metadata !DIExpression(DW_OP_deref)) #7, !dbg !1131
  %143 = call i64 inttoptr (i64 164 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef bitcast (i64 (%struct.bpf_map*, i8*, i8*, i8*)* @check_item to i8*), i8* noundef nonnull %133, i64 noundef 0) #7, !dbg !1141
  call void @llvm.dbg.value(metadata i32* %3, metadata !1124, metadata !DIExpression(DW_OP_deref)) #7, !dbg !1131
  %144 = call i64 inttoptr (i64 88 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.7* @reclaimed_addrs to i8*), i8* noundef nonnull %137) #7, !dbg !1142
  %145 = icmp eq i64 %144, 0, !dbg !1142
  %146 = load i32, i32* %3, align 4, !dbg !1142
  call void @llvm.dbg.value(metadata i32 %146, metadata !1124, metadata !DIExpression()) #7, !dbg !1131
  %147 = select i1 %145, i32 %146, i32 0, !dbg !1142
  br label %148, !dbg !1143

148:                                              ; preds = %140, %142
  %149 = phi i32 [ %141, %140 ], [ %147, %142 ], !dbg !1131
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %137) #7, !dbg !1144
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %133) #7, !dbg !1144
  call void @llvm.dbg.value(metadata i32 %149, metadata !1080, metadata !DIExpression()), !dbg !1089
  store i32 %149, i32* %5, align 4, !dbg !1145, !tbaa !563
  br label %158, !dbg !1146

150:                                              ; preds = %1
  %151 = and i64 %17, 4294967295, !dbg !1109
  %152 = add i64 %17, 1, !dbg !1111
  %153 = and i64 %152, 4294967295, !dbg !1112
  %154 = cmpxchg i64* getelementptr inbounds (%struct.nat64_config, %struct.nat64_config* @config, i64 0, i32 2), i64 %151, i64 %153 seq_cst seq_cst, align 8, !dbg !1113
  %155 = extractvalue { i64, i1 } %154, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 0, metadata !1081, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1089
  br i1 %155, label %156, label %22, !dbg !1115

156:                                              ; preds = %124, %112, %100, %88, %76, %64, %52, %40, %28, %150
  %157 = phi i32 [ %20, %150 ], [ %26, %28 ], [ %38, %40 ], [ %50, %52 ], [ %62, %64 ], [ %74, %76 ], [ %86, %88 ], [ %98, %100 ], [ %110, %112 ], [ %122, %124 ], !dbg !1105
  call void @llvm.dbg.value(metadata i32 %157, metadata !1080, metadata !DIExpression()), !dbg !1089
  store i32 %157, i32* %5, align 4, !dbg !1147, !tbaa !563
  br label %158, !dbg !1149

158:                                              ; preds = %130, %156, %148
  %159 = phi i32 [ %131, %130 ], [ %157, %156 ], [ %149, %148 ], !dbg !1116
  call void @llvm.dbg.value(metadata i32 %159, metadata !1080, metadata !DIExpression()), !dbg !1089
  %160 = icmp eq i32 %159, 0, !dbg !1116
  br i1 %160, label %175, label %161, !dbg !1150

161:                                              ; preds = %158
  store i32 %159, i32* %9, align 8, !dbg !1151, !tbaa !824
  %162 = bitcast %struct.in6_addr* %0 to i8*, !dbg !1152
  %163 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef %162, i8* noundef nonnull %6, i64 noundef 1) #7, !dbg !1154
  %164 = icmp eq i64 %163, 0, !dbg !1154
  br i1 %164, label %165, label %173, !dbg !1155

165:                                              ; preds = %161
  call void @llvm.dbg.value(metadata i32* %5, metadata !1080, metadata !DIExpression(DW_OP_deref)), !dbg !1089
  %166 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.5* @v4_reversemap to i8*), i8* noundef nonnull %16, i8* noundef %162, i64 noundef 1) #7, !dbg !1156
  %167 = icmp eq i64 %166, 0, !dbg !1156
  br i1 %167, label %168, label %171, !dbg !1158

168:                                              ; preds = %165
  %169 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef %162) #7, !dbg !1159
  %170 = bitcast i8* %169 to %struct.v6_addr_state*, !dbg !1159
  br label %175, !dbg !1160

171:                                              ; preds = %165
  call void @llvm.dbg.label(metadata !1087), !dbg !1161
  %172 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.4* @v6_state_map to i8*), i8* noundef %162) #7, !dbg !1162
  br label %173, !dbg !1162

173:                                              ; preds = %161, %171
  call void @llvm.dbg.label(metadata !1088), !dbg !1163
  call void @llvm.dbg.value(metadata i32* %5, metadata !1080, metadata !DIExpression(DW_OP_deref)), !dbg !1089
  %174 = call i64 inttoptr (i64 87 to i64 (i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.7* @reclaimed_addrs to i8*), i8* noundef nonnull %16, i64 noundef 0) #7, !dbg !1164
  br label %175, !dbg !1165

175:                                              ; preds = %158, %173, %168
  %176 = phi %struct.v6_addr_state* [ null, %173 ], [ %170, %168 ], [ null, %158 ], !dbg !1089
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #7, !dbg !1166
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #7, !dbg !1166
  ret %struct.v6_addr_state* %176, !dbg !1166
}

; Function Attrs: nounwind
define internal fastcc i32 @rewrite_icmpv6(%struct.ipv6hdr* noundef %0, %struct.__sk_buff* noundef %1) unnamed_addr #0 !dbg !1167 {
  %3 = alloca %struct.icmpv6_pseudo, align 1
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %0, metadata !1171, metadata !DIExpression()), !dbg !1180
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %1, metadata !1172, metadata !DIExpression()), !dbg !1180
  %4 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %1, i64 0, i32 16, !dbg !1181
  %5 = load i32, i32* %4, align 8, !dbg !1181, !tbaa !372
  %6 = zext i32 %5 to i64, !dbg !1182
  call void @llvm.dbg.value(metadata i64 %6, metadata !1173, metadata !DIExpression()), !dbg !1180
  %7 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %0, i64 1, i32 0, !dbg !1183
  call void @llvm.dbg.value(metadata i8* %7, metadata !1175, metadata !DIExpression()), !dbg !1180
  %8 = getelementptr inbounds i8, i8* %7, i64 8, !dbg !1184
  %9 = bitcast i8* %8 to %struct.icmp6hdr*, !dbg !1184
  %10 = inttoptr i64 %6 to %struct.icmp6hdr*, !dbg !1186
  %11 = icmp ugt %struct.icmp6hdr* %9, %10, !dbg !1187
  br i1 %11, label %102, label %12, !dbg !1188

12:                                               ; preds = %2
  %13 = bitcast i8* %7 to i64*, !dbg !1189
  %14 = load i64, i64* %13, align 4, !dbg !1189
  call void @llvm.dbg.value(metadata i64 %14, metadata !1174, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value, DW_OP_LLVM_fragment, 0, 16)), !dbg !1180
  call void @llvm.dbg.value(metadata i64 %14, metadata !1174, metadata !DIExpression(DW_OP_constu, 16, DW_OP_shr, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value, DW_OP_LLVM_fragment, 16, 16)), !dbg !1180
  %15 = lshr i64 %14, 32, !dbg !1189
  %16 = trunc i64 %15 to i32, !dbg !1189
  call void @llvm.dbg.value(metadata i32 %16, metadata !1174, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !1180
  call void @llvm.dbg.value(metadata i8* %7, metadata !1177, metadata !DIExpression()), !dbg !1180
  call void @llvm.dbg.value(metadata i8 undef, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  %17 = getelementptr inbounds i8, i8* %7, i64 1, !dbg !1190
  %18 = lshr i64 %14, 8, !dbg !1190
  %19 = trunc i64 %18 to i8, !dbg !1190
  call void @llvm.dbg.value(metadata i8 %19, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i16 undef, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !1180
  %20 = getelementptr inbounds i8, i8* %7, i64 4, !dbg !1190
  %21 = trunc i64 %15 to i8, !dbg !1190
  call void @llvm.dbg.value(metadata i8 %21, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 undef, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !1180
  %22 = getelementptr inbounds i8, i8* %7, i64 6, !dbg !1190
  %23 = bitcast i8* %22 to i16*, !dbg !1190
  %24 = lshr i64 %14, 48, !dbg !1190
  %25 = trunc i64 %24 to i16, !dbg !1190
  call void @llvm.dbg.value(metadata i16 %25, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !1180
  %26 = trunc i64 %14 to i8, !dbg !1191
  switch i8 %26, label %102 [
    i8 -128, label %61
    i8 -127, label %27
    i8 1, label %28
    i8 2, label %31
    i8 3, label %38
    i8 4, label %39
  ], !dbg !1192

27:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i8 0, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  br label %61, !dbg !1193

28:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i8 3, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  switch i8 %19, label %102 [
    i8 0, label %61
    i8 2, label %61
    i8 3, label %61
    i8 1, label %29
    i8 4, label %30
  ], !dbg !1195

29:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i8 10, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  br label %61, !dbg !1196

30:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i8 3, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  br label %61, !dbg !1198

31:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i8 3, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 4, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  %32 = tail call i32 @llvm.bswap.i32(i32 %16), !dbg !1199
  %33 = add i32 %32, -20, !dbg !1200
  call void @llvm.dbg.value(metadata i32 %33, metadata !1178, metadata !DIExpression()), !dbg !1180
  %34 = icmp ugt i32 %33, 65535, !dbg !1201
  br i1 %34, label %102, label %35, !dbg !1203

35:                                               ; preds = %31
  %36 = trunc i32 %33 to i16, !dbg !1204
  %37 = tail call i16 @llvm.bswap.i16(i16 %36), !dbg !1204
  br label %61, !dbg !1204

38:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i8 11, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  br label %61, !dbg !1205

39:                                               ; preds = %12
  switch i8 %19, label %102 [
    i8 0, label %61
    i8 1, label %40
  ], !dbg !1206

40:                                               ; preds = %39
  call void @llvm.dbg.value(metadata i8 3, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 2, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  %41 = tail call i32 @llvm.bswap.i32(i32 %16), !dbg !1207
  call void @llvm.dbg.value(metadata i32 %41, metadata !1179, metadata !DIExpression()), !dbg !1180
  %42 = icmp eq i32 %16, 0, !dbg !1209
  %43 = icmp eq i32 %16, 16777216
  %44 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %42)
  %45 = select i1 %44, i1 true, i1 %43, !dbg !1211
  br i1 %45, label %46, label %48, !dbg !1211

46:                                               ; preds = %40
  %47 = trunc i32 %41 to i8, !dbg !1212
  call void @llvm.dbg.value(metadata i8 %47, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1180
  br label %61, !dbg !1213

48:                                               ; preds = %40
  %49 = icmp eq i32 %16, 67108864, !dbg !1214
  %50 = icmp eq i32 %16, 83886080
  %51 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %49)
  %52 = select i1 %51, i1 true, i1 %50, !dbg !1216
  br i1 %52, label %61, label %53, !dbg !1216

53:                                               ; preds = %48
  switch i32 %41, label %55 [
    i32 6, label %61
    i32 7, label %54
  ], !dbg !1217

54:                                               ; preds = %53
  call void @llvm.dbg.value(metadata i8 8, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1180
  br label %61, !dbg !1218

55:                                               ; preds = %53
  %56 = add i32 %41, -8, !dbg !1221
  %57 = icmp ult i32 %56, 16, !dbg !1221
  br i1 %57, label %61, label %58, !dbg !1221

58:                                               ; preds = %55
  %59 = add i32 %41, -24, !dbg !1223
  %60 = icmp ult i32 %59, 16, !dbg !1223
  br i1 %60, label %61, label %102, !dbg !1223

61:                                               ; preds = %58, %55, %53, %48, %39, %35, %28, %28, %28, %12, %54, %46, %29, %30, %38, %27
  %62 = phi i8 [ 2, %46 ], [ 2, %54 ], [ %19, %38 ], [ 3, %30 ], [ 10, %29 ], [ %19, %27 ], [ %19, %12 ], [ 1, %28 ], [ 1, %28 ], [ 1, %28 ], [ 4, %35 ], [ %19, %39 ], [ 2, %48 ], [ 2, %53 ], [ 2, %55 ], [ 2, %58 ], !dbg !1180
  %63 = phi i8 [ 3, %46 ], [ 3, %54 ], [ 11, %38 ], [ 3, %30 ], [ 3, %29 ], [ 0, %27 ], [ 8, %12 ], [ 3, %28 ], [ 3, %28 ], [ 3, %28 ], [ 3, %35 ], [ 12, %39 ], [ 3, %48 ], [ 3, %53 ], [ 3, %55 ], [ 3, %58 ], !dbg !1225
  %64 = phi i8 [ %47, %46 ], [ 8, %54 ], [ %21, %38 ], [ %21, %30 ], [ %21, %29 ], [ %21, %27 ], [ %21, %12 ], [ %21, %28 ], [ %21, %28 ], [ %21, %28 ], [ %21, %35 ], [ %21, %39 ], [ 2, %48 ], [ 9, %53 ], [ 12, %55 ], [ 16, %58 ], !dbg !1180
  %65 = phi i16 [ %25, %46 ], [ %25, %54 ], [ %25, %38 ], [ %25, %30 ], [ %25, %29 ], [ %25, %27 ], [ %25, %12 ], [ %25, %28 ], [ %25, %28 ], [ %25, %28 ], [ %37, %35 ], [ %25, %39 ], [ %25, %48 ], [ %25, %53 ], [ %25, %55 ], [ %25, %58 ], !dbg !1180
  call void @llvm.dbg.value(metadata i16 %65, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 %64, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 %63, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1180
  call void @llvm.dbg.value(metadata i8 %62, metadata !1176, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1180
  store i8 %63, i8* %7, align 4, !dbg !1226, !tbaa.struct !1227
  store i8 %62, i8* %17, align 1, !dbg !1226, !tbaa.struct !1228
  store i8 %64, i8* %20, align 4, !dbg !1226, !tbaa.struct !1229
  store i16 %65, i16* %23, align 2, !dbg !1226, !tbaa.struct !1230
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %1, metadata !1015, metadata !DIExpression()) #7, !dbg !1231
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %0, metadata !1020, metadata !DIExpression()) #7, !dbg !1231
  call void @llvm.dbg.value(metadata i8* undef, metadata !1021, metadata !DIExpression()) #7, !dbg !1231
  call void @llvm.dbg.value(metadata i8* %7, metadata !1022, metadata !DIExpression()) #7, !dbg !1231
  call void @llvm.dbg.value(metadata i1 false, metadata !1023, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1231
  %66 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %1, i64 0, i32 15, !dbg !1233
  %67 = load i32, i32* %66, align 4, !dbg !1233, !tbaa !381
  call void @llvm.dbg.value(metadata i32 %67, metadata !1024, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1231
  %68 = bitcast %struct.icmpv6_pseudo* %3 to i8*, !dbg !1234
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %68) #7, !dbg !1234
  call void @llvm.dbg.declare(metadata %struct.icmpv6_pseudo* %3, metadata !1025, metadata !DIExpression()) #7, !dbg !1235
  %69 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %0, i64 0, i32 5, i32 0, !dbg !1236
  %70 = bitcast %struct.anon.9* %69 to i8*, !dbg !1236
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %68, i8* noundef nonnull align 4 dereferenceable(16) %70, i64 16, i1 false) #7, !dbg !1236, !tbaa.struct !528
  %71 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %3, i64 0, i32 1, !dbg !1237
  %72 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %0, i64 0, i32 5, i32 0, i32 1, !dbg !1238
  %73 = bitcast %struct.in6_addr* %71 to i8*, !dbg !1238
  %74 = bitcast %struct.in6_addr* %72 to i8*, !dbg !1238
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %73, i8* noundef nonnull align 4 dereferenceable(16) %74, i64 16, i1 false) #7, !dbg !1238, !tbaa.struct !528
  %75 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %3, i64 0, i32 2, !dbg !1237
  %76 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %0, i64 0, i32 2, !dbg !1239
  %77 = load i16, i16* %76, align 4, !dbg !1239, !tbaa !609
  %78 = zext i16 %77 to i32, !dbg !1240
  store i32 %78, i32* %75, align 1, !dbg !1237, !tbaa !1049
  %79 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %3, i64 0, i32 3, i64 0, !dbg !1237
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(3) %79, i8 0, i64 3, i1 false) #7, !dbg !1237
  %80 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %3, i64 0, i32 4, !dbg !1237
  store i8 58, i8* %80, align 1, !dbg !1237, !tbaa !1051
  %81 = getelementptr inbounds %struct.icmpv6_pseudo, %struct.icmpv6_pseudo* %3, i64 0, i32 0, i32 0, i32 0, i64 0, !dbg !1241
  %82 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %81, i32 noundef 40, i32* noundef nonnull %81, i32 noundef 0, i32 noundef 0) #7, !dbg !1242
  call void @llvm.dbg.value(metadata i64 %82, metadata !1036, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1231
  %83 = ptrtoint i8* %7 to i64, !dbg !1243
  %84 = trunc i64 %83 to i32, !dbg !1244
  %85 = add i32 %84, 2, !dbg !1244
  %86 = sub i32 %85, %67, !dbg !1244
  call void @llvm.dbg.value(metadata !DIArgList(i64 %83, i32 %67), metadata !1035, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_minus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_plus_uconst, 2, DW_OP_stack_value)) #7, !dbg !1231
  call void @llvm.dbg.value(metadata i64 %14, metadata !1033, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1231
  %87 = bitcast i8* %7 to i16*, !dbg !1245
  %88 = load i16, i16* %87, align 2, !dbg !1246, !tbaa !427
  call void @llvm.dbg.value(metadata i16 %88, metadata !1034, metadata !DIExpression()) #7, !dbg !1231
  call void @llvm.dbg.value(metadata i32 %16, metadata !1037, metadata !DIExpression()) #7, !dbg !1231
  %89 = bitcast i8* %20 to i32*, !dbg !1247
  %90 = load i32, i32* %89, align 4, !dbg !1248, !tbaa !563
  call void @llvm.dbg.value(metadata i32 %90, metadata !1038, metadata !DIExpression()) #7, !dbg !1231
  %91 = and i32 %86, 65535, !dbg !1249
  %92 = and i64 %82, 4294967295, !dbg !1250
  %93 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %1, i32 noundef %91, i64 noundef 0, i64 noundef %92, i64 noundef 16) #7, !dbg !1251
  %94 = and i64 %14, 65535, !dbg !1252
  %95 = zext i16 %88 to i64, !dbg !1253
  %96 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %1, i32 noundef %91, i64 noundef %94, i64 noundef %95, i64 noundef 2) #7, !dbg !1254
  %97 = icmp eq i32 %90, %16, !dbg !1255
  br i1 %97, label %101, label %98, !dbg !1256

98:                                               ; preds = %61
  %99 = zext i32 %90 to i64, !dbg !1257
  %100 = call i64 inttoptr (i64 11 to i64 (%struct.__sk_buff*, i32, i64, i64, i64)*)(%struct.__sk_buff* noundef nonnull %1, i32 noundef %91, i64 noundef %15, i64 noundef %99, i64 noundef 4) #7, !dbg !1258
  br label %101, !dbg !1258

101:                                              ; preds = %61, %98
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %68) #7, !dbg !1259
  br label %102, !dbg !1260

102:                                              ; preds = %12, %39, %58, %31, %28, %2, %101
  %103 = phi i32 [ 0, %101 ], [ -1, %2 ], [ -1, %28 ], [ -1, %31 ], [ -1, %58 ], [ -1, %39 ], [ -1, %12 ], !dbg !1180
  ret i32 %103, !dbg !1261
}

; Function Attrs: nounwind
define internal i64 @check_item(%struct.bpf_map* noundef %0, i8* noundef %1, i8* nocapture noundef readonly %2, i8* nocapture noundef readonly %3) #0 !dbg !1262 {
  %5 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_map* %0, metadata !1268, metadata !DIExpression()), !dbg !1277
  call void @llvm.dbg.value(metadata i8* %1, metadata !1269, metadata !DIExpression()), !dbg !1277
  call void @llvm.dbg.value(metadata i8* %2, metadata !1270, metadata !DIExpression()), !dbg !1277
  call void @llvm.dbg.value(metadata i8* %3, metadata !1271, metadata !DIExpression()), !dbg !1277
  call void @llvm.dbg.value(metadata i8* %2, metadata !1272, metadata !DIExpression()), !dbg !1277
  %6 = bitcast i8* %3 to i64*, !dbg !1278
  %7 = load i64, i64* %6, align 8, !dbg !1279, !tbaa !1133
  call void @llvm.dbg.value(metadata i64 %7, metadata !1273, metadata !DIExpression()), !dbg !1277
  %8 = bitcast i8* %2 to i64*, !dbg !1280
  %9 = load i64, i64* %8, align 8, !dbg !1280, !tbaa !818
  %10 = icmp ult i64 %9, %7, !dbg !1281
  br i1 %10, label %11, label %25, !dbg !1282

11:                                               ; preds = %4
  %12 = getelementptr inbounds i8, i8* %2, i64 12, !dbg !1283
  %13 = bitcast i8* %12 to i32*, !dbg !1283
  %14 = load i32, i32* %13, align 4, !dbg !1283, !tbaa !1094
  %15 = icmp eq i32 %14, 0, !dbg !1284
  br i1 %15, label %16, label %25, !dbg !1285

16:                                               ; preds = %11
  %17 = bitcast i32* %5 to i8*, !dbg !1286
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %17) #7, !dbg !1286
  %18 = getelementptr inbounds i8, i8* %2, i64 8, !dbg !1287
  %19 = bitcast i8* %18 to i32*, !dbg !1287
  %20 = load i32, i32* %19, align 8, !dbg !1287, !tbaa !824
  call void @llvm.dbg.value(metadata i32 %20, metadata !1274, metadata !DIExpression()), !dbg !1288
  store i32 %20, i32* %5, align 4, !dbg !1289, !tbaa !563
  %21 = bitcast %struct.bpf_map* %0 to i8*, !dbg !1290
  %22 = tail call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef %21, i8* noundef %1) #7, !dbg !1291
  call void @llvm.dbg.value(metadata i32* %5, metadata !1274, metadata !DIExpression(DW_OP_deref)), !dbg !1288
  %23 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.5* @v4_reversemap to i8*), i8* noundef nonnull %17) #7, !dbg !1292
  %24 = call i64 inttoptr (i64 87 to i64 (i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.7* @reclaimed_addrs to i8*), i8* noundef nonnull %17, i64 noundef 0) #7, !dbg !1293
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %17) #7, !dbg !1294
  br label %25

25:                                               ; preds = %4, %11, %16
  %26 = phi i64 [ 1, %16 ], [ 0, %11 ], [ 0, %4 ], !dbg !1277
  ret i64 %26, !dbg !1295
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.fshl.i8(i8, i8, i8) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!331, !332, !333, !334}
!llvm.ident = !{!335}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 14, type: !330, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !68, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "nat64_kern.c", directory: "/home/nir_ophir/code/bpf-examples/nat64-bpf", checksumkind: CSK_MD5, checksum: "5a511ec626e5b9077a8d36f9e030b1dd")
!4 = !{!5, !12, !18, !49}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4026, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/nat64-bpf", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "BPF_F_PSEUDO_HDR", value: 16)
!10 = !DIEnumerator(name: "BPF_F_MARK_MANGLED_0", value: 32)
!11 = !DIEnumerator(name: "BPF_F_MARK_ENFORCE", value: 64)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 397, baseType: !7, size: 32, elements: !13)
!13 = !{!14, !15, !16, !17}
!14 = !DIEnumerator(name: "BPF_ANY", value: 0)
!15 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!16 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!17 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 28, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!46 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!47 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!48 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!49 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4033, baseType: !7, size: 32, elements: !50)
!50 = !{!51}
!51 = !DIEnumerator(name: "BPF_F_INGRESS", value: 1)
!52 = !{!53, !54, !55, !58, !59, !62, !63, !64, !66}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !56, line: 24, baseType: !57)
!56 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!57 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !56, line: 27, baseType: !7)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !61, line: 27, baseType: !58)
!61 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !56, line: 31, baseType: !54)
!68 = !{!0, !69, !100, !121, !130, !147, !163, !171, !179, !276, !281, !295, !300, !305, !310, !315, !320, !325}
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "config", scope: !2, file: !3, line: 16, type: !71, isLocal: false, isDefinition: true)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nat64_config", file: !72, line: 6, size: 320, elements: !73)
!72 = !DIFile(filename: "./nat64.h", directory: "/home/nir_ophir/code/bpf-examples/nat64-bpf", checksumkind: CSK_MD5, checksum: "2017d4b75cfd9fec767e31bfa7ae6bde")
!73 = !{!74, !96, !97, !98, !99}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "v6_prefix", scope: !71, file: !72, line: 7, baseType: !75, size: 128)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !76, line: 33, size: 128, elements: !77)
!76 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!77 = !{!78}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !75, file: !76, line: 40, baseType: !79, size: 128)
!79 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !75, file: !76, line: 34, size: 128, elements: !80)
!80 = !{!81, !87, !92}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !79, file: !76, line: 35, baseType: !82, size: 128)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 128, elements: !85)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !56, line: 21, baseType: !84)
!84 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!85 = !{!86}
!86 = !DISubrange(count: 16)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !79, file: !76, line: 37, baseType: !88, size: 128)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 128, elements: !90)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !61, line: 25, baseType: !55)
!90 = !{!91}
!91 = !DISubrange(count: 8)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !79, file: !76, line: 38, baseType: !93, size: 128)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 128, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 4)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "timeout_ns", scope: !71, file: !72, line: 8, baseType: !67, size: 64, offset: 128)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "next_addr", scope: !71, file: !72, line: 9, baseType: !67, size: 64, offset: 192)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "v4_prefix", scope: !71, file: !72, line: 10, baseType: !58, size: 32, offset: 256)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "v4_mask", scope: !71, file: !72, line: 11, baseType: !58, size: 32, offset: 288)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "v6_state_map", scope: !2, file: !3, line: 24, type: !102, isLocal: false, isDefinition: true)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 18, size: 320, elements: !103)
!103 = !{!104, !110, !112, !119, !120}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !102, file: !3, line: 19, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 32, elements: !108)
!107 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!108 = !{!109}
!109 = !DISubrange(count: 1)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !102, file: !3, line: 20, baseType: !111, size: 64, offset: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !102, file: !3, line: 21, baseType: !113, size: 64, offset: 128)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v6_addr_state", file: !72, line: 14, size: 128, elements: !115)
!115 = !{!116, !117, !118}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "last_seen", scope: !114, file: !72, line: 15, baseType: !67, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "v4_addr", scope: !114, file: !72, line: 16, baseType: !58, size: 32, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "static_conf", scope: !114, file: !72, line: 17, baseType: !58, size: 32, offset: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !102, file: !3, line: 22, baseType: !105, size: 64, offset: 192)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !102, file: !3, line: 23, baseType: !105, size: 64, offset: 256)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "v4_reversemap", scope: !2, file: !3, line: 32, type: !123, isLocal: false, isDefinition: true)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 26, size: 320, elements: !124)
!124 = !{!125, !126, !127, !128, !129}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !123, file: !3, line: 27, baseType: !105, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !123, file: !3, line: 28, baseType: !63, size: 64, offset: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !123, file: !3, line: 29, baseType: !111, size: 64, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !123, file: !3, line: 30, baseType: !105, size: 64, offset: 192)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !123, file: !3, line: 31, baseType: !105, size: 64, offset: 256)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(name: "allowed_v6_src", scope: !2, file: !3, line: 40, type: !132, isLocal: false, isDefinition: true)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 34, size: 320, elements: !133)
!133 = !{!134, !139, !142, !145, !146}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !132, file: !3, line: 35, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 352, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 11)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !132, file: !3, line: 36, baseType: !140, size: 64, offset: 64)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 512, elements: !85)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !132, file: !3, line: 37, baseType: !143, size: 64, offset: 128)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 128, elements: !94)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !132, file: !3, line: 38, baseType: !105, size: 64, offset: 192)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !132, file: !3, line: 39, baseType: !105, size: 64, offset: 256)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(name: "reclaimed_addrs", scope: !2, file: !3, line: 47, type: !149, isLocal: false, isDefinition: true)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 42, size: 256, elements: !150)
!150 = !{!151, !156, !161, !162}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !149, file: !3, line: 43, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 704, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 22)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !149, file: !3, line: 44, baseType: !157, size: 64, offset: 64)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 0)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !149, file: !3, line: 45, baseType: !143, size: 64, offset: 128)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !149, file: !3, line: 46, baseType: !105, size: 64, offset: 192)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression())
!164 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !165, line: 55, type: !166, isLocal: true, isDefinition: true)
!165 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/nat64-bpf", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DISubroutineType(types: !168)
!168 = !{!53, !53, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression())
!172 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !2, file: !165, line: 790, type: !173, isLocal: true, isDefinition: true)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DISubroutineType(types: !175)
!175 = !{!176, !59, !58, !59, !58, !178}
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !56, line: 30, baseType: !177)
!177 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !61, line: 32, baseType: !58)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "bpf_l4_csum_replace", scope: !2, file: !165, line: 291, type: !181, isLocal: true, isDefinition: true)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = !DISubroutineType(types: !183)
!183 = !{!184, !185, !58, !67, !67, !67}
!184 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !187)
!187 = !{!188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !204, !205, !206, !207, !208, !209, !210, !211, !212, !214, !215, !216, !217, !218, !250, !251, !252, !253, !275}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !186, file: !6, line: 4184, baseType: !58, size: 32)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !186, file: !6, line: 4185, baseType: !58, size: 32, offset: 32)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !186, file: !6, line: 4186, baseType: !58, size: 32, offset: 64)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !186, file: !6, line: 4187, baseType: !58, size: 32, offset: 96)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !186, file: !6, line: 4188, baseType: !58, size: 32, offset: 128)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !186, file: !6, line: 4189, baseType: !58, size: 32, offset: 160)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !186, file: !6, line: 4190, baseType: !58, size: 32, offset: 192)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !186, file: !6, line: 4191, baseType: !58, size: 32, offset: 224)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !186, file: !6, line: 4192, baseType: !58, size: 32, offset: 256)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !186, file: !6, line: 4193, baseType: !58, size: 32, offset: 288)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !186, file: !6, line: 4194, baseType: !58, size: 32, offset: 320)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !186, file: !6, line: 4195, baseType: !58, size: 32, offset: 352)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !186, file: !6, line: 4196, baseType: !201, size: 160, offset: 384)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 160, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 5)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !186, file: !6, line: 4197, baseType: !58, size: 32, offset: 544)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !186, file: !6, line: 4198, baseType: !58, size: 32, offset: 576)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !186, file: !6, line: 4199, baseType: !58, size: 32, offset: 608)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !186, file: !6, line: 4200, baseType: !58, size: 32, offset: 640)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !186, file: !6, line: 4201, baseType: !58, size: 32, offset: 672)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !186, file: !6, line: 4204, baseType: !58, size: 32, offset: 704)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !186, file: !6, line: 4205, baseType: !58, size: 32, offset: 736)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !186, file: !6, line: 4206, baseType: !58, size: 32, offset: 768)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !186, file: !6, line: 4207, baseType: !213, size: 128, offset: 800)
!213 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 128, elements: !94)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !186, file: !6, line: 4208, baseType: !213, size: 128, offset: 928)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !186, file: !6, line: 4209, baseType: !58, size: 32, offset: 1056)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !186, file: !6, line: 4210, baseType: !58, size: 32, offset: 1088)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !186, file: !6, line: 4213, baseType: !58, size: 32, offset: 1120)
!218 = !DIDerivedType(tag: DW_TAG_member, scope: !186, file: !6, line: 4214, baseType: !219, size: 64, align: 64, offset: 1152)
!219 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !186, file: !6, line: 4214, size: 64, align: 64, elements: !220)
!220 = !{!221}
!221 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !219, file: !6, line: 4214, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !224)
!224 = !{!225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !248, !249}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !223, file: !6, line: 5042, baseType: !55, size: 16)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !223, file: !6, line: 5043, baseType: !55, size: 16, offset: 16)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !223, file: !6, line: 5044, baseType: !55, size: 16, offset: 32)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !223, file: !6, line: 5045, baseType: !83, size: 8, offset: 48)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !223, file: !6, line: 5046, baseType: !83, size: 8, offset: 56)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !223, file: !6, line: 5047, baseType: !83, size: 8, offset: 64)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !223, file: !6, line: 5048, baseType: !83, size: 8, offset: 72)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !223, file: !6, line: 5049, baseType: !89, size: 16, offset: 80)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !223, file: !6, line: 5050, baseType: !89, size: 16, offset: 96)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !223, file: !6, line: 5051, baseType: !89, size: 16, offset: 112)
!235 = !DIDerivedType(tag: DW_TAG_member, scope: !223, file: !6, line: 5052, baseType: !236, size: 256, offset: 128)
!236 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !223, file: !6, line: 5052, size: 256, elements: !237)
!237 = !{!238, !243}
!238 = !DIDerivedType(tag: DW_TAG_member, scope: !236, file: !6, line: 5053, baseType: !239, size: 64)
!239 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !236, file: !6, line: 5053, size: 64, elements: !240)
!240 = !{!241, !242}
!241 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !239, file: !6, line: 5054, baseType: !60, size: 32)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !239, file: !6, line: 5055, baseType: !60, size: 32, offset: 32)
!243 = !DIDerivedType(tag: DW_TAG_member, scope: !236, file: !6, line: 5057, baseType: !244, size: 256)
!244 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !236, file: !6, line: 5057, size: 256, elements: !245)
!245 = !{!246, !247}
!246 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !244, file: !6, line: 5058, baseType: !213, size: 128)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !244, file: !6, line: 5059, baseType: !213, size: 128, offset: 128)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !223, file: !6, line: 5062, baseType: !58, size: 32, offset: 384)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !223, file: !6, line: 5063, baseType: !60, size: 32, offset: 416)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !186, file: !6, line: 4215, baseType: !67, size: 64, offset: 1216)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !186, file: !6, line: 4216, baseType: !58, size: 32, offset: 1280)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !186, file: !6, line: 4217, baseType: !58, size: 32, offset: 1312)
!253 = !DIDerivedType(tag: DW_TAG_member, scope: !186, file: !6, line: 4218, baseType: !254, size: 64, align: 64, offset: 1344)
!254 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !186, file: !6, line: 4218, size: 64, align: 64, elements: !255)
!255 = !{!256}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !254, file: !6, line: 4218, baseType: !257, size: 64)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !259)
!259 = !{!260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273}
!260 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !258, file: !6, line: 4273, baseType: !58, size: 32)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !258, file: !6, line: 4274, baseType: !58, size: 32, offset: 32)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !258, file: !6, line: 4275, baseType: !58, size: 32, offset: 64)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !258, file: !6, line: 4276, baseType: !58, size: 32, offset: 96)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !258, file: !6, line: 4277, baseType: !58, size: 32, offset: 128)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !258, file: !6, line: 4278, baseType: !58, size: 32, offset: 160)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !258, file: !6, line: 4280, baseType: !58, size: 32, offset: 192)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !258, file: !6, line: 4281, baseType: !213, size: 128, offset: 224)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !258, file: !6, line: 4282, baseType: !58, size: 32, offset: 352)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !258, file: !6, line: 4283, baseType: !58, size: 32, offset: 384)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !258, file: !6, line: 4284, baseType: !58, size: 32, offset: 416)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !258, file: !6, line: 4285, baseType: !213, size: 128, offset: 448)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !258, file: !6, line: 4286, baseType: !58, size: 32, offset: 576)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !258, file: !6, line: 4287, baseType: !274, size: 32, offset: 608)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !56, line: 26, baseType: !107)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !186, file: !6, line: 4219, baseType: !58, size: 32, offset: 1408)
!276 = !DIGlobalVariableExpression(var: !277, expr: !DIExpression())
!277 = distinct !DIGlobalVariable(name: "bpf_skb_change_proto", scope: !2, file: !165, line: 857, type: !278, isLocal: true, isDefinition: true)
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!279 = !DISubroutineType(types: !280)
!280 = !{!184, !185, !89, !67}
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(name: "bpf_redirect_neigh", scope: !2, file: !165, line: 3621, type: !283, isLocal: true, isDefinition: true)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!284 = !DISubroutineType(types: !285)
!285 = !{!184, !58, !286, !107, !67}
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!287 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_redir_neigh", file: !6, line: 5016, size: 160, elements: !288)
!288 = !{!289, !290}
!289 = !DIDerivedType(tag: DW_TAG_member, name: "nh_family", scope: !287, file: !6, line: 5018, baseType: !58, size: 32)
!290 = !DIDerivedType(tag: DW_TAG_member, scope: !287, file: !6, line: 5020, baseType: !291, size: 128, offset: 32)
!291 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !287, file: !6, line: 5020, size: 128, elements: !292)
!292 = !{!293, !294}
!293 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_nh", scope: !291, file: !6, line: 5021, baseType: !60, size: 32)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_nh", scope: !291, file: !6, line: 5022, baseType: !213, size: 128)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(name: "bpf_map_pop_elem", scope: !2, file: !165, line: 2271, type: !297, isLocal: true, isDefinition: true)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!298 = !DISubroutineType(types: !299)
!299 = !{!184, !53, !53}
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(name: "bpf_for_each_map_elem", scope: !2, file: !165, line: 3892, type: !302, isLocal: true, isDefinition: true)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64)
!303 = !DISubroutineType(types: !304)
!304 = !{!184, !53, !53, !53, !67}
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression())
!306 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !165, line: 87, type: !307, isLocal: true, isDefinition: true)
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64)
!308 = !DISubroutineType(types: !309)
!309 = !{!184, !53, !169}
!310 = !DIGlobalVariableExpression(var: !311, expr: !DIExpression())
!311 = distinct !DIGlobalVariable(name: "bpf_map_push_elem", scope: !2, file: !165, line: 2261, type: !312, isLocal: true, isDefinition: true)
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64)
!313 = !DISubroutineType(types: !314)
!314 = !{!184, !53, !169, !67}
!315 = !DIGlobalVariableExpression(var: !316, expr: !DIExpression())
!316 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !165, line: 113, type: !317, isLocal: true, isDefinition: true)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64)
!318 = !DISubroutineType(types: !319)
!319 = !{!67}
!320 = !DIGlobalVariableExpression(var: !321, expr: !DIExpression())
!321 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !165, line: 77, type: !322, isLocal: true, isDefinition: true)
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!323 = !DISubroutineType(types: !324)
!324 = !{!184, !53, !169, !169, !67}
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !165, line: 615, type: !327, isLocal: true, isDefinition: true)
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!328 = !DISubroutineType(types: !329)
!329 = !{!184, !58, !67}
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 32, elements: !94)
!331 = !{i32 7, !"Dwarf Version", i32 5}
!332 = !{i32 2, !"Debug Info Version", i32 3}
!333 = !{i32 1, !"wchar_size", i32 4}
!334 = !{i32 7, !"frame-pointer", i32 2}
!335 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!336 = distinct !DISubprogram(name: "nat64_egress", scope: !3, file: !3, line: 713, type: !337, scopeLine: 714, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !339)
!337 = !DISubroutineType(types: !338)
!338 = !{!107, !185}
!339 = !{!340}
!340 = !DILocalVariable(name: "skb", arg: 1, scope: !336, file: !3, line: 713, type: !185)
!341 = !DILocation(line: 0, scope: !336)
!342 = !DILocation(line: 715, column: 16, scope: !336)
!343 = !DILocation(line: 715, column: 9, scope: !336)
!344 = distinct !DISubprogram(name: "nat64_handler", scope: !3, file: !3, line: 695, type: !345, scopeLine: 696, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !348)
!345 = !DISubroutineType(types: !346)
!346 = !{!107, !185, !347}
!347 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!348 = !{!349, !350, !351, !352, !353, !358, !369}
!349 = !DILocalVariable(name: "skb", arg: 1, scope: !344, file: !3, line: 695, type: !185)
!350 = !DILocalVariable(name: "egress", arg: 2, scope: !344, file: !3, line: 695, type: !347)
!351 = !DILocalVariable(name: "data_end", scope: !344, file: !3, line: 697, type: !53)
!352 = !DILocalVariable(name: "data", scope: !344, file: !3, line: 698, type: !53)
!353 = !DILocalVariable(name: "nh", scope: !344, file: !3, line: 699, type: !354)
!354 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !355, line: 35, size: 64, elements: !356)
!355 = !DIFile(filename: "./../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/nat64-bpf", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!356 = !{!357}
!357 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !354, file: !355, line: 36, baseType: !53, size: 64)
!358 = !DILocalVariable(name: "eth", scope: !344, file: !3, line: 700, type: !359)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !361, line: 168, size: 112, elements: !362)
!361 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!362 = !{!363, !367, !368}
!363 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !360, file: !361, line: 169, baseType: !364, size: 48)
!364 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 48, elements: !365)
!365 = !{!366}
!366 = !DISubrange(count: 6)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !360, file: !361, line: 170, baseType: !364, size: 48, offset: 48)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !360, file: !361, line: 171, baseType: !89, size: 16, offset: 96)
!369 = !DILocalVariable(name: "eth_type", scope: !344, file: !3, line: 701, type: !107)
!370 = !DILocation(line: 0, scope: !344)
!371 = !DILocation(line: 697, column: 52, scope: !344)
!372 = !{!373, !374, i64 80}
!373 = !{!"__sk_buff", !374, i64 0, !374, i64 4, !374, i64 8, !374, i64 12, !374, i64 16, !374, i64 20, !374, i64 24, !374, i64 28, !374, i64 32, !374, i64 36, !374, i64 40, !374, i64 44, !375, i64 48, !374, i64 68, !374, i64 72, !374, i64 76, !374, i64 80, !374, i64 84, !374, i64 88, !374, i64 92, !374, i64 96, !375, i64 100, !375, i64 116, !374, i64 132, !374, i64 136, !374, i64 140, !375, i64 144, !377, i64 152, !374, i64 160, !374, i64 164, !375, i64 168, !374, i64 176}
!374 = !{!"int", !375, i64 0}
!375 = !{!"omnipotent char", !376, i64 0}
!376 = !{!"Simple C/C++ TBAA"}
!377 = !{!"long long", !375, i64 0}
!378 = !DILocation(line: 697, column: 27, scope: !344)
!379 = !DILocation(line: 697, column: 19, scope: !344)
!380 = !DILocation(line: 698, column: 48, scope: !344)
!381 = !{!373, !374, i64 76}
!382 = !DILocation(line: 698, column: 23, scope: !344)
!383 = !DILocation(line: 698, column: 15, scope: !344)
!384 = !DILocalVariable(name: "nh", arg: 1, scope: !385, file: !355, line: 131, type: !388)
!385 = distinct !DISubprogram(name: "parse_ethhdr", scope: !355, file: !355, line: 131, type: !386, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !390)
!386 = !DISubroutineType(types: !387)
!387 = !{!107, !388, !53, !389}
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!390 = !{!384, !391, !392}
!391 = !DILocalVariable(name: "data_end", arg: 2, scope: !385, file: !355, line: 132, type: !53)
!392 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !385, file: !355, line: 133, type: !389)
!393 = !DILocation(line: 0, scope: !385, inlinedAt: !394)
!394 = distinct !DILocation(line: 704, column: 13, scope: !344)
!395 = !DILocalVariable(name: "nh", arg: 1, scope: !396, file: !355, line: 86, type: !388)
!396 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !355, file: !355, line: 86, type: !397, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !406)
!397 = !DISubroutineType(types: !398)
!398 = !{!107, !388, !53, !389, !399}
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!400 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !355, line: 71, size: 32, elements: !401)
!401 = !{!402}
!402 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !400, file: !355, line: 72, baseType: !403, size: 32)
!403 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 32, elements: !404)
!404 = !{!405}
!405 = !DISubrange(count: 2)
!406 = !{!395, !407, !408, !409, !410, !411, !412, !418, !419}
!407 = !DILocalVariable(name: "data_end", arg: 2, scope: !396, file: !355, line: 87, type: !53)
!408 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !396, file: !355, line: 88, type: !389)
!409 = !DILocalVariable(name: "vlans", arg: 4, scope: !396, file: !355, line: 89, type: !399)
!410 = !DILocalVariable(name: "eth", scope: !396, file: !355, line: 91, type: !359)
!411 = !DILocalVariable(name: "hdrsize", scope: !396, file: !355, line: 92, type: !107)
!412 = !DILocalVariable(name: "vlh", scope: !396, file: !355, line: 93, type: !413)
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 64)
!414 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !355, line: 44, size: 32, elements: !415)
!415 = !{!416, !417}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !414, file: !355, line: 45, baseType: !89, size: 16)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !414, file: !355, line: 46, baseType: !89, size: 16, offset: 16)
!418 = !DILocalVariable(name: "h_proto", scope: !396, file: !355, line: 94, type: !55)
!419 = !DILocalVariable(name: "i", scope: !396, file: !355, line: 95, type: !107)
!420 = !DILocation(line: 0, scope: !396, inlinedAt: !421)
!421 = distinct !DILocation(line: 136, column: 9, scope: !385, inlinedAt: !394)
!422 = !DILocation(line: 100, column: 14, scope: !423, inlinedAt: !421)
!423 = distinct !DILexicalBlock(scope: !396, file: !355, line: 100, column: 6)
!424 = !DILocation(line: 100, column: 24, scope: !423, inlinedAt: !421)
!425 = !DILocation(line: 100, column: 6, scope: !396, inlinedAt: !421)
!426 = !DILocation(line: 106, column: 17, scope: !396, inlinedAt: !421)
!427 = !{!428, !428, i64 0}
!428 = !{!"short", !375, i64 0}
!429 = !DILocalVariable(name: "h_proto", arg: 1, scope: !430, file: !355, line: 75, type: !55)
!430 = distinct !DISubprogram(name: "proto_is_vlan", scope: !355, file: !355, line: 75, type: !431, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !433)
!431 = !DISubroutineType(types: !432)
!432 = !{!107, !55}
!433 = !{!429}
!434 = !DILocation(line: 0, scope: !430, inlinedAt: !435)
!435 = distinct !DILocation(line: 113, column: 8, scope: !436, inlinedAt: !421)
!436 = distinct !DILexicalBlock(scope: !437, file: !355, line: 113, column: 7)
!437 = distinct !DILexicalBlock(scope: !438, file: !355, line: 112, column: 39)
!438 = distinct !DILexicalBlock(scope: !439, file: !355, line: 112, column: 2)
!439 = distinct !DILexicalBlock(scope: !396, file: !355, line: 112, column: 2)
!440 = !DILocation(line: 77, column: 20, scope: !430, inlinedAt: !435)
!441 = !DILocation(line: 77, column: 46, scope: !430, inlinedAt: !435)
!442 = !DILocation(line: 113, column: 8, scope: !436, inlinedAt: !421)
!443 = !DILocation(line: 113, column: 7, scope: !437, inlinedAt: !421)
!444 = !DILocation(line: 119, column: 18, scope: !437, inlinedAt: !421)
!445 = !DILocation(line: 705, column: 15, scope: !446)
!446 = distinct !DILexicalBlock(scope: !344, file: !3, line: 705, column: 6)
!447 = !DILocation(line: 705, column: 38, scope: !446)
!448 = !DILocalVariable(name: "skb", arg: 1, scope: !449, file: !3, line: 263, type: !185)
!449 = distinct !DISubprogram(name: "nat64_handle_v4", scope: !3, file: !3, line: 263, type: !450, scopeLine: 264, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !452)
!450 = !DISubroutineType(types: !451)
!451 = !{!107, !185, !388}
!452 = !{!448, !453, !454, !455, !456, !457, !458, !459, !460, !487, !488, !516, !517, !518, !519}
!453 = !DILocalVariable(name: "nh", arg: 2, scope: !449, file: !3, line: 263, type: !388)
!454 = !DILocalVariable(name: "data_end", scope: !449, file: !3, line: 265, type: !53)
!455 = !DILocalVariable(name: "data", scope: !449, file: !3, line: 266, type: !53)
!456 = !DILocalVariable(name: "ip_type", scope: !449, file: !3, line: 268, type: !107)
!457 = !DILocalVariable(name: "iphdr_len", scope: !449, file: !3, line: 268, type: !107)
!458 = !DILocalVariable(name: "ip_offset", scope: !449, file: !3, line: 268, type: !107)
!459 = !DILocalVariable(name: "dst_v6", scope: !449, file: !3, line: 269, type: !111)
!460 = !DILocalVariable(name: "ip6h", scope: !449, file: !3, line: 270, type: !461)
!461 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !462, size: 64)
!462 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !463, line: 118, size: 320, elements: !464)
!463 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!464 = !{!465, !466, !467, !471, !472, !473, !474}
!465 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !462, file: !463, line: 120, baseType: !83, size: 4, flags: DIFlagBitField, extraData: i64 0)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !462, file: !463, line: 121, baseType: !83, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !462, file: !463, line: 128, baseType: !468, size: 24, offset: 8)
!468 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 24, elements: !469)
!469 = !{!470}
!470 = !DISubrange(count: 3)
!471 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !462, file: !463, line: 130, baseType: !89, size: 16, offset: 32)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !462, file: !463, line: 131, baseType: !83, size: 8, offset: 48)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !462, file: !463, line: 132, baseType: !83, size: 8, offset: 56)
!474 = !DIDerivedType(tag: DW_TAG_member, scope: !462, file: !463, line: 134, baseType: !475, size: 256, offset: 64)
!475 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !462, file: !463, line: 134, size: 256, elements: !476)
!476 = !{!477, !482}
!477 = !DIDerivedType(tag: DW_TAG_member, scope: !475, file: !463, line: 134, baseType: !478, size: 256)
!478 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !475, file: !463, line: 134, size: 256, elements: !479)
!479 = !{!480, !481}
!480 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !478, file: !463, line: 134, baseType: !75, size: 128)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !478, file: !463, line: 134, baseType: !75, size: 128, offset: 128)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !475, file: !463, line: 134, baseType: !483, size: 256)
!483 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !475, file: !463, line: 134, size: 256, elements: !484)
!484 = !{!485, !486}
!485 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !483, file: !463, line: 134, baseType: !75, size: 128)
!486 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !483, file: !463, line: 134, baseType: !75, size: 128, offset: 128)
!487 = !DILocalVariable(name: "ret", scope: !449, file: !3, line: 271, type: !107)
!488 = !DILocalVariable(name: "iph", scope: !449, file: !3, line: 272, type: !489)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !490, size: 64)
!490 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !491, line: 87, size: 160, elements: !492)
!491 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!492 = !{!493, !494, !495, !496, !497, !498, !499, !500, !501, !503}
!493 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !490, file: !491, line: 89, baseType: !83, size: 4, flags: DIFlagBitField, extraData: i64 0)
!494 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !490, file: !491, line: 90, baseType: !83, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !490, file: !491, line: 97, baseType: !83, size: 8, offset: 8)
!496 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !490, file: !491, line: 98, baseType: !89, size: 16, offset: 16)
!497 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !490, file: !491, line: 99, baseType: !89, size: 16, offset: 32)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !490, file: !491, line: 100, baseType: !89, size: 16, offset: 48)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !490, file: !491, line: 101, baseType: !83, size: 8, offset: 64)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !490, file: !491, line: 102, baseType: !83, size: 8, offset: 72)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !490, file: !491, line: 103, baseType: !502, size: 16, offset: 80)
!502 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !61, line: 31, baseType: !55)
!503 = !DIDerivedType(tag: DW_TAG_member, scope: !490, file: !491, line: 104, baseType: !504, size: 64, offset: 96)
!504 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !490, file: !491, line: 104, size: 64, elements: !505)
!505 = !{!506, !511}
!506 = !DIDerivedType(tag: DW_TAG_member, scope: !504, file: !491, line: 104, baseType: !507, size: 64)
!507 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !504, file: !491, line: 104, size: 64, elements: !508)
!508 = !{!509, !510}
!509 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !507, file: !491, line: 104, baseType: !60, size: 32)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !507, file: !491, line: 104, baseType: !60, size: 32, offset: 32)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !504, file: !491, line: 104, baseType: !512, size: 64)
!512 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !504, file: !491, line: 104, size: 64, elements: !513)
!513 = !{!514, !515}
!514 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !512, file: !491, line: 104, baseType: !60, size: 32)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !512, file: !491, line: 104, baseType: !60, size: 32, offset: 32)
!516 = !DILocalVariable(name: "eth", scope: !449, file: !3, line: 273, type: !359)
!517 = !DILocalVariable(name: "dst_v4", scope: !449, file: !3, line: 274, type: !58)
!518 = !DILocalVariable(name: "dst_hdr", scope: !449, file: !3, line: 276, type: !462)
!519 = !DILabel(scope: !449, name: "out", file: !3, line: 360)
!520 = !DILocation(line: 0, scope: !449, inlinedAt: !521)
!521 = distinct !DILocation(line: 706, column: 10, scope: !446)
!522 = !DILocation(line: 274, column: 9, scope: !449, inlinedAt: !521)
!523 = !DILocation(line: 276, column: 2, scope: !449, inlinedAt: !521)
!524 = !DILocation(line: 276, column: 17, scope: !449, inlinedAt: !521)
!525 = !DILocation(line: 276, column: 27, scope: !449, inlinedAt: !521)
!526 = !DILocation(line: 278, column: 3, scope: !449, inlinedAt: !521)
!527 = !DILocation(line: 278, column: 19, scope: !449, inlinedAt: !521)
!528 = !{i64 0, i64 16, !529, i64 0, i64 16, !529, i64 0, i64 16, !529}
!529 = !{!375, !375, i64 0}
!530 = !DILocation(line: 281, column: 30, scope: !449, inlinedAt: !521)
!531 = !DILocation(line: 281, column: 21, scope: !449, inlinedAt: !521)
!532 = !DILocalVariable(name: "nh", arg: 1, scope: !533, file: !355, line: 196, type: !388)
!533 = distinct !DISubprogram(name: "parse_iphdr", scope: !355, file: !355, line: 196, type: !534, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !537)
!534 = !DISubroutineType(types: !535)
!535 = !{!107, !388, !53, !536}
!536 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !489, size: 64)
!537 = !{!532, !538, !539, !540, !541}
!538 = !DILocalVariable(name: "data_end", arg: 2, scope: !533, file: !355, line: 197, type: !53)
!539 = !DILocalVariable(name: "iphdr", arg: 3, scope: !533, file: !355, line: 198, type: !536)
!540 = !DILocalVariable(name: "iph", scope: !533, file: !355, line: 200, type: !489)
!541 = !DILocalVariable(name: "hdrsize", scope: !533, file: !355, line: 201, type: !107)
!542 = !DILocation(line: 0, scope: !533, inlinedAt: !543)
!543 = distinct !DILocation(line: 283, column: 19, scope: !449, inlinedAt: !521)
!544 = !DILocation(line: 203, column: 10, scope: !545, inlinedAt: !543)
!545 = distinct !DILexicalBlock(scope: !533, file: !355, line: 203, column: 6)
!546 = !DILocation(line: 203, column: 14, scope: !545, inlinedAt: !543)
!547 = !DILocation(line: 203, column: 6, scope: !533, inlinedAt: !543)
!548 = !DILocation(line: 206, column: 11, scope: !549, inlinedAt: !543)
!549 = distinct !DILexicalBlock(scope: !533, file: !355, line: 206, column: 6)
!550 = !DILocation(line: 206, column: 19, scope: !549, inlinedAt: !543)
!551 = !DILocation(line: 206, column: 6, scope: !533, inlinedAt: !543)
!552 = !DILocation(line: 209, column: 21, scope: !533, inlinedAt: !543)
!553 = !DILocation(line: 211, column: 13, scope: !554, inlinedAt: !543)
!554 = distinct !DILexicalBlock(scope: !533, file: !355, line: 211, column: 5)
!555 = !DILocation(line: 211, column: 5, scope: !533, inlinedAt: !543)
!556 = !DILocation(line: 215, column: 14, scope: !557, inlinedAt: !543)
!557 = distinct !DILexicalBlock(scope: !533, file: !355, line: 215, column: 6)
!558 = !DILocation(line: 215, column: 24, scope: !557, inlinedAt: !543)
!559 = !DILocation(line: 215, column: 6, scope: !533, inlinedAt: !543)
!560 = !DILocation(line: 219, column: 9, scope: !533, inlinedAt: !543)
!561 = !DILocation(line: 287, column: 18, scope: !449, inlinedAt: !521)
!562 = !DILocation(line: 287, column: 16, scope: !449, inlinedAt: !521)
!563 = !{!374, !374, i64 0}
!564 = !DILocation(line: 288, column: 30, scope: !565, inlinedAt: !521)
!565 = distinct !DILexicalBlock(scope: !449, file: !3, line: 288, column: 13)
!566 = !{!567, !374, i64 36}
!567 = !{!"nat64_config", !568, i64 0, !377, i64 16, !377, i64 24, !374, i64 32, !374, i64 36}
!568 = !{!"in6_addr", !375, i64 0}
!569 = !DILocation(line: 288, column: 21, scope: !565, inlinedAt: !521)
!570 = !DILocation(line: 288, column: 49, scope: !565, inlinedAt: !521)
!571 = !{!567, !374, i64 32}
!572 = !DILocation(line: 288, column: 39, scope: !565, inlinedAt: !521)
!573 = !DILocation(line: 288, column: 13, scope: !449, inlinedAt: !521)
!574 = !DILocation(line: 304, column: 26, scope: !449, inlinedAt: !521)
!575 = !DILocation(line: 305, column: 23, scope: !576, inlinedAt: !521)
!576 = distinct !DILexicalBlock(scope: !449, file: !3, line: 305, column: 13)
!577 = !DILocation(line: 305, column: 47, scope: !576, inlinedAt: !521)
!578 = !DILocation(line: 306, column: 19, scope: !576, inlinedAt: !521)
!579 = !{!580, !428, i64 6}
!580 = !{!"iphdr", !375, i64 0, !375, i64 0, !375, i64 1, !428, i64 2, !428, i64 4, !428, i64 6, !375, i64 8, !375, i64 9, !428, i64 10, !375, i64 12}
!581 = !DILocation(line: 306, column: 28, scope: !576, inlinedAt: !521)
!582 = !DILocation(line: 305, column: 13, scope: !449, inlinedAt: !521)
!583 = !DILocation(line: 313, column: 18, scope: !449, inlinedAt: !521)
!584 = !DILocation(line: 314, column: 14, scope: !585, inlinedAt: !521)
!585 = distinct !DILexicalBlock(scope: !449, file: !3, line: 314, column: 13)
!586 = !DILocation(line: 314, column: 13, scope: !449, inlinedAt: !521)
!587 = !DILocation(line: 322, column: 43, scope: !449, inlinedAt: !521)
!588 = !DILocation(line: 322, column: 9, scope: !449, inlinedAt: !521)
!589 = !DILocation(line: 322, column: 36, scope: !449, inlinedAt: !521)
!590 = !DILocation(line: 323, column: 25, scope: !449, inlinedAt: !521)
!591 = !DILocation(line: 324, column: 32, scope: !449, inlinedAt: !521)
!592 = !{!580, !375, i64 9}
!593 = !DILocation(line: 324, column: 25, scope: !449, inlinedAt: !521)
!594 = !{!595, !375, i64 6}
!595 = !{!"ipv6hdr", !375, i64 0, !375, i64 0, !375, i64 1, !428, i64 4, !375, i64 6, !375, i64 7, !375, i64 8}
!596 = !DILocation(line: 325, column: 34, scope: !449, inlinedAt: !521)
!597 = !{!580, !375, i64 8}
!598 = !DILocation(line: 325, column: 27, scope: !449, inlinedAt: !521)
!599 = !{!595, !375, i64 7}
!600 = !DILocation(line: 327, column: 34, scope: !449, inlinedAt: !521)
!601 = !{!580, !375, i64 1}
!602 = !DILocation(line: 327, column: 46, scope: !449, inlinedAt: !521)
!603 = !DILocation(line: 327, column: 26, scope: !449, inlinedAt: !521)
!604 = !DILocation(line: 328, column: 40, scope: !449, inlinedAt: !521)
!605 = !DILocation(line: 328, column: 29, scope: !449, inlinedAt: !521)
!606 = !DILocation(line: 329, column: 31, scope: !449, inlinedAt: !521)
!607 = !{!580, !428, i64 2}
!608 = !DILocation(line: 329, column: 29, scope: !449, inlinedAt: !521)
!609 = !{!595, !428, i64 4}
!610 = !DILocation(line: 331, column: 2, scope: !449, inlinedAt: !521)
!611 = !DILocation(line: 333, column: 7, scope: !612, inlinedAt: !521)
!612 = distinct !DILexicalBlock(scope: !613, file: !3, line: 333, column: 7)
!613 = distinct !DILexicalBlock(scope: !449, file: !3, line: 331, column: 27)
!614 = !DILocation(line: 333, column: 7, scope: !613, inlinedAt: !521)
!615 = !DILocation(line: 335, column: 19, scope: !613, inlinedAt: !521)
!616 = !DILocation(line: 336, column: 3, scope: !613, inlinedAt: !521)
!617 = !DILocalVariable(name: "skb", arg: 1, scope: !618, file: !3, line: 69, type: !185)
!618 = distinct !DISubprogram(name: "update_l4_checksum", scope: !3, file: !3, line: 69, type: !619, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !621)
!619 = !DISubroutineType(types: !620)
!620 = !{null, !185, !461, !489, !107, !347}
!621 = !{!617, !622, !623, !624, !625, !626, !627, !628, !629}
!622 = !DILocalVariable(name: "ip6h", arg: 2, scope: !618, file: !3, line: 69, type: !461)
!623 = !DILocalVariable(name: "iph", arg: 3, scope: !618, file: !3, line: 70, type: !489)
!624 = !DILocalVariable(name: "ip_type", arg: 4, scope: !618, file: !3, line: 70, type: !107)
!625 = !DILocalVariable(name: "v4to6", arg: 5, scope: !618, file: !3, line: 70, type: !347)
!626 = !DILocalVariable(name: "data", scope: !618, file: !3, line: 72, type: !53)
!627 = !DILocalVariable(name: "flags", scope: !618, file: !3, line: 73, type: !107)
!628 = !DILocalVariable(name: "offset", scope: !618, file: !3, line: 74, type: !55)
!629 = !DILocalVariable(name: "csum", scope: !618, file: !3, line: 75, type: !58)
!630 = !DILocation(line: 0, scope: !618, inlinedAt: !631)
!631 = distinct !DILocation(line: 339, column: 3, scope: !613, inlinedAt: !521)
!632 = !DILocation(line: 72, column: 48, scope: !618, inlinedAt: !631)
!633 = !DILocation(line: 72, column: 23, scope: !618, inlinedAt: !631)
!634 = !DILocation(line: 79, column: 10, scope: !635, inlinedAt: !631)
!635 = distinct !DILexicalBlock(scope: !636, file: !3, line: 77, column: 13)
!636 = distinct !DILexicalBlock(scope: !618, file: !3, line: 77, column: 6)
!637 = !DILocation(line: 78, column: 10, scope: !635, inlinedAt: !631)
!638 = !DILocation(line: 0, scope: !636, inlinedAt: !631)
!639 = !DILocation(line: 90, column: 2, scope: !618, inlinedAt: !631)
!640 = !DILocation(line: 92, column: 10, scope: !641, inlinedAt: !631)
!641 = distinct !DILexicalBlock(scope: !618, file: !3, line: 90, column: 19)
!642 = !DILocation(line: 93, column: 3, scope: !641, inlinedAt: !631)
!643 = !DILocation(line: 95, column: 10, scope: !641, inlinedAt: !631)
!644 = !DILocation(line: 97, column: 3, scope: !641, inlinedAt: !631)
!645 = !DILocation(line: 0, scope: !641, inlinedAt: !631)
!646 = !DILocation(line: 102, column: 34, scope: !618, inlinedAt: !631)
!647 = !DILocation(line: 102, column: 45, scope: !618, inlinedAt: !631)
!648 = !DILocation(line: 102, column: 9, scope: !618, inlinedAt: !631)
!649 = !DILocation(line: 103, column: 1, scope: !618, inlinedAt: !631)
!650 = !DILocation(line: 345, column: 6, scope: !651, inlinedAt: !521)
!651 = distinct !DILexicalBlock(scope: !449, file: !3, line: 345, column: 6)
!652 = !DILocation(line: 345, column: 6, scope: !449, inlinedAt: !521)
!653 = !DILocation(line: 348, column: 42, scope: !449, inlinedAt: !521)
!654 = !DILocation(line: 348, column: 17, scope: !449, inlinedAt: !521)
!655 = !DILocation(line: 348, column: 9, scope: !449, inlinedAt: !521)
!656 = !DILocation(line: 349, column: 46, scope: !449, inlinedAt: !521)
!657 = !DILocation(line: 349, column: 21, scope: !449, inlinedAt: !521)
!658 = !DILocation(line: 351, column: 15, scope: !449, inlinedAt: !521)
!659 = !DILocation(line: 352, column: 21, scope: !449, inlinedAt: !521)
!660 = !DILocation(line: 353, column: 17, scope: !661, inlinedAt: !521)
!661 = distinct !DILexicalBlock(scope: !449, file: !3, line: 353, column: 13)
!662 = !DILocation(line: 353, column: 23, scope: !661, inlinedAt: !521)
!663 = !DILocation(line: 353, column: 21, scope: !661, inlinedAt: !521)
!664 = !DILocation(line: 353, column: 32, scope: !661, inlinedAt: !521)
!665 = !DILocation(line: 356, column: 14, scope: !449, inlinedAt: !521)
!666 = !DILocation(line: 356, column: 22, scope: !449, inlinedAt: !521)
!667 = !{!668, !428, i64 12}
!668 = !{!"ethhdr", !375, i64 0, !375, i64 6, !428, i64 12}
!669 = !DILocation(line: 357, column: 17, scope: !449, inlinedAt: !521)
!670 = !{i64 0, i64 1, !529, i64 0, i64 1, !529, i64 1, i64 3, !529, i64 4, i64 2, !427, i64 6, i64 1, !529, i64 7, i64 1, !529, i64 8, i64 16, !529, i64 8, i64 16, !529, i64 8, i64 16, !529, i64 24, i64 16, !529, i64 24, i64 16, !529, i64 24, i64 16, !529, i64 8, i64 16, !529, i64 8, i64 16, !529, i64 8, i64 16, !529, i64 24, i64 16, !529, i64 24, i64 16, !529, i64 24, i64 16, !529}
!671 = !DILocation(line: 359, column: 39, scope: !449, inlinedAt: !521)
!672 = !{!373, !374, i64 40}
!673 = !DILocation(line: 359, column: 15, scope: !449, inlinedAt: !521)
!674 = !DILocation(line: 359, column: 9, scope: !449, inlinedAt: !521)
!675 = !DILocation(line: 360, column: 1, scope: !449, inlinedAt: !521)
!676 = !DILocation(line: 362, column: 1, scope: !449, inlinedAt: !521)
!677 = !DILocation(line: 706, column: 3, scope: !446)
!678 = !DILocation(line: 707, column: 20, scope: !679)
!679 = distinct !DILexicalBlock(scope: !446, file: !3, line: 707, column: 11)
!680 = !DILocation(line: 707, column: 45, scope: !679)
!681 = !DILocalVariable(name: "skb", arg: 1, scope: !682, file: !3, line: 563, type: !185)
!682 = distinct !DISubprogram(name: "nat64_handle_v6", scope: !3, file: !3, line: 563, type: !450, scopeLine: 564, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !683)
!683 = !{!681, !684, !685, !686, !687, !697, !698, !699, !700, !701, !702, !703, !704, !705, !706, !707, !708, !709, !710}
!684 = !DILocalVariable(name: "nh", arg: 2, scope: !682, file: !3, line: 563, type: !388)
!685 = !DILocalVariable(name: "data_end", scope: !682, file: !3, line: 565, type: !53)
!686 = !DILocalVariable(name: "data", scope: !682, file: !3, line: 566, type: !53)
!687 = !DILocalVariable(name: "saddr_key", scope: !682, file: !3, line: 568, type: !688)
!688 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v6_trie_key", file: !72, line: 20, size: 160, elements: !689)
!689 = !{!690, !696}
!690 = !DIDerivedType(tag: DW_TAG_member, name: "t", scope: !688, file: !72, line: 21, baseType: !691, size: 32)
!691 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_lpm_trie_key", file: !6, line: 74, size: 32, elements: !692)
!692 = !{!693, !694}
!693 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !691, file: !6, line: 75, baseType: !58, size: 32)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !691, file: !6, line: 76, baseType: !695, offset: 32)
!695 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, elements: !159)
!696 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !688, file: !72, line: 22, baseType: !75, size: 128, offset: 32)
!697 = !DILocalVariable(name: "dst_v6", scope: !682, file: !3, line: 569, type: !111)
!698 = !DILocalVariable(name: "subnet_v6", scope: !682, file: !3, line: 569, type: !75)
!699 = !DILocalVariable(name: "allowval", scope: !682, file: !3, line: 570, type: !63)
!700 = !DILocalVariable(name: "src_v4", scope: !682, file: !3, line: 570, type: !58)
!701 = !DILocalVariable(name: "dst_v4", scope: !682, file: !3, line: 570, type: !58)
!702 = !DILocalVariable(name: "ip_type", scope: !682, file: !3, line: 571, type: !107)
!703 = !DILocalVariable(name: "ip_offset", scope: !682, file: !3, line: 571, type: !107)
!704 = !DILocalVariable(name: "ip6h", scope: !682, file: !3, line: 572, type: !461)
!705 = !DILocalVariable(name: "ret", scope: !682, file: !3, line: 573, type: !107)
!706 = !DILocalVariable(name: "eth", scope: !682, file: !3, line: 574, type: !359)
!707 = !DILocalVariable(name: "iph", scope: !682, file: !3, line: 575, type: !489)
!708 = !DILocalVariable(name: "v6_state", scope: !682, file: !3, line: 577, type: !113)
!709 = !DILocalVariable(name: "dst_hdr", scope: !682, file: !3, line: 579, type: !490)
!710 = !DILabel(scope: !682, name: "out", file: !3, line: 691)
!711 = !DILocation(line: 0, scope: !682, inlinedAt: !712)
!712 = distinct !DILocation(line: 708, column: 10, scope: !679)
!713 = !DILocation(line: 568, column: 2, scope: !682, inlinedAt: !712)
!714 = !DILocation(line: 568, column: 21, scope: !682, inlinedAt: !712)
!715 = !DILocation(line: 579, column: 2, scope: !682, inlinedAt: !712)
!716 = !DILocation(line: 579, column: 15, scope: !682, inlinedAt: !712)
!717 = !DILocation(line: 585, column: 30, scope: !682, inlinedAt: !712)
!718 = !DILocation(line: 585, column: 21, scope: !682, inlinedAt: !712)
!719 = !DILocalVariable(name: "nh", arg: 1, scope: !720, file: !355, line: 174, type: !388)
!720 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !355, file: !355, line: 174, type: !721, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !724)
!721 = !DISubroutineType(types: !722)
!722 = !{!107, !388, !53, !723}
!723 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !461, size: 64)
!724 = !{!719, !725, !726, !727}
!725 = !DILocalVariable(name: "data_end", arg: 2, scope: !720, file: !355, line: 175, type: !53)
!726 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !720, file: !355, line: 176, type: !723)
!727 = !DILocalVariable(name: "ip6h", scope: !720, file: !355, line: 178, type: !461)
!728 = !DILocation(line: 0, scope: !720, inlinedAt: !729)
!729 = distinct !DILocation(line: 587, column: 19, scope: !682, inlinedAt: !712)
!730 = !DILocation(line: 184, column: 11, scope: !731, inlinedAt: !729)
!731 = distinct !DILexicalBlock(scope: !720, file: !355, line: 184, column: 6)
!732 = !DILocation(line: 184, column: 15, scope: !731, inlinedAt: !729)
!733 = !DILocation(line: 184, column: 6, scope: !720, inlinedAt: !729)
!734 = !DILocation(line: 187, column: 12, scope: !735, inlinedAt: !729)
!735 = distinct !DILexicalBlock(scope: !720, file: !355, line: 187, column: 6)
!736 = !DILocation(line: 187, column: 20, scope: !735, inlinedAt: !729)
!737 = !DILocation(line: 187, column: 6, scope: !720, inlinedAt: !729)
!738 = !DILocation(line: 191, column: 10, scope: !720, inlinedAt: !729)
!739 = !DILocation(line: 193, column: 44, scope: !720, inlinedAt: !729)
!740 = !DILocalVariable(name: "nh", arg: 1, scope: !741, file: !355, line: 139, type: !388)
!741 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !355, file: !355, line: 139, type: !742, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !744)
!742 = !DISubroutineType(types: !743)
!743 = !{!107, !388, !53, !83}
!744 = !{!740, !745, !746, !747, !749}
!745 = !DILocalVariable(name: "data_end", arg: 2, scope: !741, file: !355, line: 140, type: !53)
!746 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !741, file: !355, line: 141, type: !83)
!747 = !DILocalVariable(name: "i", scope: !748, file: !355, line: 143, type: !107)
!748 = distinct !DILexicalBlock(scope: !741, file: !355, line: 143, column: 2)
!749 = !DILocalVariable(name: "hdr", scope: !750, file: !355, line: 144, type: !752)
!750 = distinct !DILexicalBlock(scope: !751, file: !355, line: 143, column: 47)
!751 = distinct !DILexicalBlock(scope: !748, file: !355, line: 143, column: 2)
!752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !753, size: 64)
!753 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !463, line: 63, size: 16, elements: !754)
!754 = !{!755, !756}
!755 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !753, file: !463, line: 64, baseType: !83, size: 8)
!756 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !753, file: !463, line: 65, baseType: !83, size: 8, offset: 8)
!757 = !DILocation(line: 0, scope: !741, inlinedAt: !758)
!758 = distinct !DILocation(line: 193, column: 9, scope: !720, inlinedAt: !729)
!759 = !DILocation(line: 0, scope: !748, inlinedAt: !758)
!760 = !DILocation(line: 0, scope: !750, inlinedAt: !758)
!761 = !DILocation(line: 146, column: 11, scope: !762, inlinedAt: !758)
!762 = distinct !DILexicalBlock(scope: !750, file: !355, line: 146, column: 7)
!763 = !DILocation(line: 146, column: 15, scope: !762, inlinedAt: !758)
!764 = !DILocation(line: 146, column: 7, scope: !750, inlinedAt: !758)
!765 = !DILocation(line: 149, column: 3, scope: !750, inlinedAt: !758)
!766 = !DILocation(line: 160, column: 4, scope: !767, inlinedAt: !758)
!767 = distinct !DILexicalBlock(scope: !750, file: !355, line: 149, column: 26)
!768 = !DILocation(line: 0, scope: !767, inlinedAt: !758)
!769 = !{!770, !375, i64 1}
!770 = !{!"ipv6_opt_hdr", !375, i64 0, !375, i64 1}
!771 = !{!770, !375, i64 0}
!772 = !DILocation(line: 156, column: 4, scope: !767, inlinedAt: !758)
!773 = !DILocation(line: 592, column: 21, scope: !682, inlinedAt: !712)
!774 = !{i64 0, i64 8, !529, i64 0, i64 8, !529, i64 0, i64 8, !529}
!775 = !DILocalVariable(name: "a", arg: 1, scope: !776, file: !3, line: 445, type: !111)
!776 = distinct !DISubprogram(name: "cmp_v6addr", scope: !3, file: !3, line: 445, type: !777, scopeLine: 446, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !779)
!777 = !DISubroutineType(types: !778)
!778 = !{!107, !111, !111}
!779 = !{!775, !780, !781}
!780 = !DILocalVariable(name: "b", arg: 2, scope: !776, file: !3, line: 445, type: !111)
!781 = !DILocalVariable(name: "i", scope: !776, file: !3, line: 447, type: !107)
!782 = !DILocation(line: 0, scope: !776, inlinedAt: !783)
!783 = distinct !DILocation(line: 595, column: 13, scope: !784, inlinedAt: !712)
!784 = distinct !DILexicalBlock(scope: !682, file: !3, line: 595, column: 13)
!785 = !DILocation(line: 449, column: 39, scope: !786, inlinedAt: !783)
!786 = distinct !DILexicalBlock(scope: !787, file: !3, line: 449, column: 21)
!787 = distinct !DILexicalBlock(scope: !788, file: !3, line: 448, column: 33)
!788 = distinct !DILexicalBlock(scope: !789, file: !3, line: 448, column: 9)
!789 = distinct !DILexicalBlock(scope: !776, file: !3, line: 448, column: 9)
!790 = !DILocation(line: 449, column: 21, scope: !787, inlinedAt: !783)
!791 = !{i64 0, i64 12, !529, i64 0, i64 12, !529, i64 0, i64 12, !529}
!792 = !DILocation(line: 608, column: 21, scope: !793, inlinedAt: !712)
!793 = distinct !DILexicalBlock(scope: !682, file: !3, line: 608, column: 13)
!794 = !DILocation(line: 608, column: 13, scope: !682, inlinedAt: !712)
!795 = !DILocation(line: 615, column: 18, scope: !682, inlinedAt: !712)
!796 = !DILocation(line: 616, column: 14, scope: !797, inlinedAt: !712)
!797 = distinct !DILexicalBlock(scope: !682, file: !3, line: 616, column: 13)
!798 = !DILocation(line: 616, column: 21, scope: !797, inlinedAt: !712)
!799 = !DILocation(line: 624, column: 19, scope: !682, inlinedAt: !712)
!800 = !DILocation(line: 624, column: 32, scope: !682, inlinedAt: !712)
!801 = !DILocation(line: 625, column: 20, scope: !682, inlinedAt: !712)
!802 = !DILocation(line: 626, column: 14, scope: !803, inlinedAt: !712)
!803 = distinct !DILexicalBlock(scope: !682, file: !3, line: 626, column: 13)
!804 = !DILocation(line: 626, column: 13, scope: !682, inlinedAt: !712)
!805 = !DILocation(line: 631, column: 20, scope: !682, inlinedAt: !712)
!806 = !DILocation(line: 632, column: 14, scope: !807, inlinedAt: !712)
!807 = distinct !DILexicalBlock(scope: !682, file: !3, line: 632, column: 13)
!808 = !DILocation(line: 632, column: 13, scope: !682, inlinedAt: !712)
!809 = !DILocation(line: 633, column: 28, scope: !810, inlinedAt: !712)
!810 = distinct !DILexicalBlock(scope: !807, file: !3, line: 632, column: 24)
!811 = !DILocation(line: 634, column: 22, scope: !812, inlinedAt: !712)
!812 = distinct !DILexicalBlock(scope: !810, file: !3, line: 634, column: 21)
!813 = !DILocation(line: 634, column: 21, scope: !810, inlinedAt: !712)
!814 = !DILocation(line: 643, column: 39, scope: !815, inlinedAt: !712)
!815 = distinct !DILexicalBlock(scope: !807, file: !3, line: 642, column: 16)
!816 = !DILocation(line: 643, column: 27, scope: !815, inlinedAt: !712)
!817 = !DILocation(line: 643, column: 37, scope: !815, inlinedAt: !712)
!818 = !{!819, !377, i64 0}
!819 = !{!"v6_addr_state", !377, i64 0, !374, i64 8, !374, i64 12}
!820 = !DILocation(line: 644, column: 17, scope: !815, inlinedAt: !712)
!821 = !DILocation(line: 651, column: 17, scope: !682, inlinedAt: !712)
!822 = !DILocation(line: 651, column: 23, scope: !682, inlinedAt: !712)
!823 = !DILocation(line: 652, column: 25, scope: !682, inlinedAt: !712)
!824 = !{!819, !374, i64 8}
!825 = !DILocation(line: 652, column: 17, scope: !682, inlinedAt: !712)
!826 = !DILocation(line: 652, column: 23, scope: !682, inlinedAt: !712)
!827 = !DILocation(line: 653, column: 34, scope: !682, inlinedAt: !712)
!828 = !DILocation(line: 653, column: 17, scope: !682, inlinedAt: !712)
!829 = !DILocation(line: 653, column: 26, scope: !682, inlinedAt: !712)
!830 = !DILocation(line: 654, column: 29, scope: !682, inlinedAt: !712)
!831 = !DILocation(line: 654, column: 17, scope: !682, inlinedAt: !712)
!832 = !DILocation(line: 654, column: 21, scope: !682, inlinedAt: !712)
!833 = !DILocation(line: 655, column: 29, scope: !682, inlinedAt: !712)
!834 = !DILocation(line: 655, column: 46, scope: !682, inlinedAt: !712)
!835 = !DILocation(line: 655, column: 43, scope: !682, inlinedAt: !712)
!836 = !DILocation(line: 655, column: 17, scope: !682, inlinedAt: !712)
!837 = !DILocation(line: 655, column: 21, scope: !682, inlinedAt: !712)
!838 = !DILocation(line: 656, column: 27, scope: !682, inlinedAt: !712)
!839 = !DILocation(line: 656, column: 17, scope: !682, inlinedAt: !712)
!840 = !DILocation(line: 656, column: 25, scope: !682, inlinedAt: !712)
!841 = !DILocation(line: 658, column: 2, scope: !682, inlinedAt: !712)
!842 = !DILocation(line: 660, column: 7, scope: !843, inlinedAt: !712)
!843 = distinct !DILexicalBlock(scope: !844, file: !3, line: 660, column: 7)
!844 = distinct !DILexicalBlock(scope: !682, file: !3, line: 658, column: 28)
!845 = !DILocation(line: 660, column: 7, scope: !844, inlinedAt: !712)
!846 = !DILocation(line: 662, column: 20, scope: !844, inlinedAt: !712)
!847 = !DILocation(line: 663, column: 3, scope: !844, inlinedAt: !712)
!848 = !DILocation(line: 0, scope: !618, inlinedAt: !849)
!849 = distinct !DILocation(line: 666, column: 3, scope: !844, inlinedAt: !712)
!850 = !DILocation(line: 72, column: 48, scope: !618, inlinedAt: !849)
!851 = !DILocation(line: 72, column: 23, scope: !618, inlinedAt: !849)
!852 = !DILocation(line: 83, column: 24, scope: !853, inlinedAt: !849)
!853 = distinct !DILexicalBlock(scope: !636, file: !3, line: 82, column: 9)
!854 = !DILocation(line: 83, column: 10, scope: !853, inlinedAt: !849)
!855 = !DILocation(line: 0, scope: !636, inlinedAt: !849)
!856 = !DILocation(line: 90, column: 2, scope: !618, inlinedAt: !849)
!857 = !DILocation(line: 92, column: 10, scope: !641, inlinedAt: !849)
!858 = !DILocation(line: 93, column: 3, scope: !641, inlinedAt: !849)
!859 = !DILocation(line: 95, column: 10, scope: !641, inlinedAt: !849)
!860 = !DILocation(line: 97, column: 3, scope: !641, inlinedAt: !849)
!861 = !DILocation(line: 0, scope: !641, inlinedAt: !849)
!862 = !DILocation(line: 102, column: 34, scope: !618, inlinedAt: !849)
!863 = !DILocation(line: 102, column: 45, scope: !618, inlinedAt: !849)
!864 = !DILocation(line: 102, column: 9, scope: !618, inlinedAt: !849)
!865 = !DILocation(line: 103, column: 1, scope: !618, inlinedAt: !849)
!866 = !DILocation(line: 672, column: 56, scope: !682, inlinedAt: !712)
!867 = !DILocation(line: 672, column: 42, scope: !682, inlinedAt: !712)
!868 = !DILocalVariable(name: "csum", arg: 1, scope: !869, file: !3, line: 457, type: !58)
!869 = distinct !DISubprogram(name: "csum_fold_helper", scope: !3, file: !3, line: 457, type: !870, scopeLine: 458, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !872)
!870 = !DISubroutineType(types: !871)
!871 = !{!55, !58}
!872 = !{!868, !873}
!873 = !DILocalVariable(name: "sum", scope: !869, file: !3, line: 459, type: !58)
!874 = !DILocation(line: 0, scope: !869, inlinedAt: !875)
!875 = distinct !DILocation(line: 672, column: 25, scope: !682, inlinedAt: !712)
!876 = !DILocation(line: 460, column: 14, scope: !869, inlinedAt: !875)
!877 = !DILocation(line: 460, column: 29, scope: !869, inlinedAt: !875)
!878 = !DILocation(line: 460, column: 21, scope: !869, inlinedAt: !875)
!879 = !DILocation(line: 461, column: 14, scope: !869, inlinedAt: !875)
!880 = !DILocation(line: 461, column: 6, scope: !869, inlinedAt: !875)
!881 = !DILocation(line: 462, column: 9, scope: !869, inlinedAt: !875)
!882 = !DILocation(line: 672, column: 17, scope: !682, inlinedAt: !712)
!883 = !DILocation(line: 672, column: 23, scope: !682, inlinedAt: !712)
!884 = !{!580, !428, i64 10}
!885 = !DILocation(line: 676, column: 13, scope: !886, inlinedAt: !712)
!886 = distinct !DILexicalBlock(scope: !682, file: !3, line: 676, column: 13)
!887 = !DILocation(line: 676, column: 13, scope: !682, inlinedAt: !712)
!888 = !DILocation(line: 679, column: 42, scope: !682, inlinedAt: !712)
!889 = !DILocation(line: 679, column: 17, scope: !682, inlinedAt: !712)
!890 = !DILocation(line: 679, column: 9, scope: !682, inlinedAt: !712)
!891 = !DILocation(line: 680, column: 46, scope: !682, inlinedAt: !712)
!892 = !DILocation(line: 680, column: 21, scope: !682, inlinedAt: !712)
!893 = !DILocation(line: 682, column: 15, scope: !682, inlinedAt: !712)
!894 = !DILocation(line: 683, column: 20, scope: !682, inlinedAt: !712)
!895 = !DILocation(line: 684, column: 17, scope: !896, inlinedAt: !712)
!896 = distinct !DILexicalBlock(scope: !682, file: !3, line: 684, column: 13)
!897 = !DILocation(line: 684, column: 23, scope: !896, inlinedAt: !712)
!898 = !DILocation(line: 684, column: 21, scope: !896, inlinedAt: !712)
!899 = !DILocation(line: 684, column: 32, scope: !896, inlinedAt: !712)
!900 = !DILocation(line: 687, column: 14, scope: !682, inlinedAt: !712)
!901 = !DILocation(line: 687, column: 22, scope: !682, inlinedAt: !712)
!902 = !DILocation(line: 688, column: 16, scope: !682, inlinedAt: !712)
!903 = !{i64 0, i64 1, !529, i64 0, i64 1, !529, i64 1, i64 1, !529, i64 2, i64 2, !427, i64 4, i64 2, !427, i64 6, i64 2, !427, i64 8, i64 1, !529, i64 9, i64 1, !529, i64 10, i64 2, !427, i64 12, i64 4, !563, i64 16, i64 4, !563, i64 12, i64 4, !563, i64 16, i64 4, !563}
!904 = !DILocation(line: 690, column: 33, scope: !682, inlinedAt: !712)
!905 = !DILocation(line: 690, column: 15, scope: !682, inlinedAt: !712)
!906 = !DILocation(line: 690, column: 9, scope: !682, inlinedAt: !712)
!907 = !DILocation(line: 691, column: 1, scope: !682, inlinedAt: !712)
!908 = !DILocation(line: 693, column: 1, scope: !682, inlinedAt: !712)
!909 = !DILocation(line: 708, column: 3, scope: !679)
!910 = !DILocation(line: 711, column: 1, scope: !344)
!911 = distinct !DISubprogram(name: "nat64_ingress", scope: !3, file: !3, line: 719, type: !337, scopeLine: 720, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !912)
!912 = !{!913}
!913 = !DILocalVariable(name: "skb", arg: 1, scope: !911, file: !3, line: 719, type: !185)
!914 = !DILocation(line: 0, scope: !911)
!915 = !DILocation(line: 721, column: 16, scope: !911)
!916 = !DILocation(line: 721, column: 9, scope: !911)
!917 = distinct !DISubprogram(name: "rewrite_icmp", scope: !3, file: !3, line: 149, type: !918, scopeLine: 150, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !920)
!918 = !DISubroutineType(types: !919)
!919 = !{!107, !489, !461, !185}
!920 = !{!921, !922, !923, !924, !925, !948, !950, !988, !990}
!921 = !DILocalVariable(name: "iph", arg: 1, scope: !917, file: !3, line: 149, type: !489)
!922 = !DILocalVariable(name: "ip6h", arg: 2, scope: !917, file: !3, line: 149, type: !461)
!923 = !DILocalVariable(name: "skb", arg: 3, scope: !917, file: !3, line: 149, type: !185)
!924 = !DILocalVariable(name: "data_end", scope: !917, file: !3, line: 151, type: !53)
!925 = !DILocalVariable(name: "old_icmp", scope: !917, file: !3, line: 153, type: !926)
!926 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !927, line: 89, size: 64, elements: !928)
!927 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!928 = !{!929, !930, !931, !932}
!929 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !926, file: !927, line: 90, baseType: !83, size: 8)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !926, file: !927, line: 91, baseType: !83, size: 8, offset: 8)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !926, file: !927, line: 92, baseType: !502, size: 16, offset: 16)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !926, file: !927, line: 104, baseType: !933, size: 32, offset: 32)
!933 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !926, file: !927, line: 93, size: 32, elements: !934)
!934 = !{!935, !940, !941, !946}
!935 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !933, file: !927, line: 97, baseType: !936, size: 32)
!936 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !933, file: !927, line: 94, size: 32, elements: !937)
!937 = !{!938, !939}
!938 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !936, file: !927, line: 95, baseType: !89, size: 16)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !936, file: !927, line: 96, baseType: !89, size: 16, offset: 16)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !933, file: !927, line: 98, baseType: !60, size: 32)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !933, file: !927, line: 102, baseType: !942, size: 32)
!942 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !933, file: !927, line: 99, size: 32, elements: !943)
!943 = !{!944, !945}
!944 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !942, file: !927, line: 100, baseType: !89, size: 16)
!945 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !942, file: !927, line: 101, baseType: !89, size: 16, offset: 16)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !933, file: !927, line: 103, baseType: !947, size: 32)
!947 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 32, elements: !94)
!948 = !DILocalVariable(name: "icmp", scope: !917, file: !3, line: 153, type: !949)
!949 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64)
!950 = !DILocalVariable(name: "icmp6", scope: !917, file: !3, line: 154, type: !951)
!951 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !952, line: 8, size: 64, elements: !953)
!952 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!953 = !{!954, !955, !956, !957}
!954 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !951, file: !952, line: 10, baseType: !83, size: 8)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !951, file: !952, line: 11, baseType: !83, size: 8, offset: 8)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !951, file: !952, line: 12, baseType: !502, size: 16, offset: 16)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !951, file: !952, line: 63, baseType: !958, size: 32, offset: 32)
!958 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !951, file: !952, line: 15, size: 32, elements: !959)
!959 = !{!960, !962, !964, !965, !970, !978}
!960 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !958, file: !952, line: 16, baseType: !961, size: 32)
!961 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 32, elements: !108)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !958, file: !952, line: 17, baseType: !963, size: 32)
!963 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 32, elements: !404)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !958, file: !952, line: 18, baseType: !947, size: 32)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !958, file: !952, line: 23, baseType: !966, size: 32)
!966 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !952, line: 20, size: 32, elements: !967)
!967 = !{!968, !969}
!968 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !966, file: !952, line: 21, baseType: !89, size: 16)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !966, file: !952, line: 22, baseType: !89, size: 16, offset: 16)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !958, file: !952, line: 40, baseType: !971, size: 32)
!971 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !952, line: 25, size: 32, elements: !972)
!972 = !{!973, !974, !975, !976, !977}
!973 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !971, file: !952, line: 27, baseType: !58, size: 5, flags: DIFlagBitField, extraData: i64 0)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !971, file: !952, line: 28, baseType: !58, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !971, file: !952, line: 29, baseType: !58, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !971, file: !952, line: 30, baseType: !58, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !971, file: !952, line: 31, baseType: !58, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !958, file: !952, line: 61, baseType: !979, size: 32)
!979 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !952, line: 42, size: 32, elements: !980)
!980 = !{!981, !982, !983, !984, !985, !986, !987}
!981 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !979, file: !952, line: 43, baseType: !83, size: 8)
!982 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !979, file: !952, line: 45, baseType: !83, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !979, file: !952, line: 46, baseType: !83, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!984 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !979, file: !952, line: 47, baseType: !83, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !979, file: !952, line: 48, baseType: !83, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!986 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !979, file: !952, line: 49, baseType: !83, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!987 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !979, file: !952, line: 60, baseType: !89, size: 16, offset: 16)
!988 = !DILocalVariable(name: "new_icmp6", scope: !917, file: !3, line: 154, type: !989)
!989 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !951, size: 64)
!990 = !DILocalVariable(name: "mtu", scope: !917, file: !3, line: 155, type: !58)
!991 = !DILocation(line: 0, scope: !917)
!992 = !DILocation(line: 151, column: 52, scope: !917)
!993 = !DILocation(line: 151, column: 27, scope: !917)
!994 = !DILocation(line: 153, column: 35, scope: !917)
!995 = !DILocation(line: 157, column: 11, scope: !996)
!996 = distinct !DILexicalBlock(scope: !917, file: !3, line: 157, column: 6)
!997 = !DILocation(line: 157, column: 17, scope: !996)
!998 = !DILocation(line: 157, column: 15, scope: !996)
!999 = !DILocation(line: 157, column: 6, scope: !917)
!1000 = !DILocation(line: 160, column: 20, scope: !917)
!1001 = !DILocation(line: 162, column: 10, scope: !917)
!1002 = !DILocation(line: 165, column: 16, scope: !917)
!1003 = !DILocation(line: 165, column: 2, scope: !917)
!1004 = !DILocation(line: 171, column: 3, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !917, file: !3, line: 165, column: 22)
!1006 = !DILocation(line: 174, column: 3, scope: !1005)
!1007 = !DILocation(line: 188, column: 25, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1005, file: !3, line: 174, column: 22)
!1009 = !DILocation(line: 0, scope: !1005)
!1010 = !DILocation(line: 191, column: 4, scope: !1008)
!1011 = !DILocation(line: 255, column: 15, scope: !917)
!1012 = !{i64 0, i64 1, !529, i64 1, i64 1, !529, i64 2, i64 2, !427, i64 4, i64 4, !529, i64 4, i64 4, !529, i64 4, i64 4, !529, i64 4, i64 2, !427, i64 6, i64 2, !427, i64 4, i64 4, !563, i64 4, i64 4, !563, i64 4, i64 4, !563, i64 4, i64 4, !563, i64 5, i64 4, !563, i64 4, i64 1, !529, i64 5, i64 1, !529, i64 5, i64 1, !529, i64 5, i64 1, !529, i64 5, i64 1, !529, i64 5, i64 1, !529, i64 6, i64 2, !427}
!1013 = !{i64 0, i64 1, !529, i64 1, i64 2, !427, i64 3, i64 4, !529, i64 3, i64 4, !529, i64 3, i64 4, !529, i64 3, i64 2, !427, i64 5, i64 2, !427, i64 3, i64 4, !563, i64 3, i64 4, !563, i64 3, i64 4, !563, i64 3, i64 4, !563, i64 4, i64 4, !563, i64 3, i64 1, !529, i64 4, i64 1, !529, i64 4, i64 1, !529, i64 4, i64 1, !529, i64 4, i64 1, !529, i64 4, i64 1, !529, i64 5, i64 2, !427}
!1014 = !{i64 0, i64 4, !529, i64 0, i64 4, !529, i64 0, i64 4, !529, i64 0, i64 2, !427, i64 2, i64 2, !427, i64 0, i64 4, !563, i64 0, i64 4, !563, i64 0, i64 4, !563, i64 0, i64 4, !563, i64 1, i64 4, !563, i64 0, i64 1, !529, i64 1, i64 1, !529, i64 1, i64 1, !529, i64 1, i64 1, !529, i64 1, i64 1, !529, i64 1, i64 1, !529, i64 2, i64 2, !427}
!1015 = !DILocalVariable(name: "skb", arg: 1, scope: !1016, file: !3, line: 106, type: !185)
!1016 = distinct !DISubprogram(name: "update_icmp_checksum", scope: !3, file: !3, line: 106, type: !1017, scopeLine: 108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1019)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{null, !185, !461, !53, !53, !347}
!1019 = !{!1015, !1020, !1021, !1022, !1023, !1024, !1025, !1033, !1034, !1035, !1036, !1037, !1038}
!1020 = !DILocalVariable(name: "ip6h", arg: 2, scope: !1016, file: !3, line: 106, type: !461)
!1021 = !DILocalVariable(name: "icmp_before", arg: 3, scope: !1016, file: !3, line: 107, type: !53)
!1022 = !DILocalVariable(name: "icmp_after", arg: 4, scope: !1016, file: !3, line: 107, type: !53)
!1023 = !DILocalVariable(name: "add", arg: 5, scope: !1016, file: !3, line: 107, type: !347)
!1024 = !DILocalVariable(name: "data", scope: !1016, file: !3, line: 109, type: !53)
!1025 = !DILocalVariable(name: "ph", scope: !1016, file: !3, line: 110, type: !1026)
!1026 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_pseudo", file: !3, line: 60, size: 320, elements: !1027)
!1027 = !{!1028, !1029, !1030, !1031, !1032}
!1028 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !1026, file: !3, line: 61, baseType: !75, size: 128)
!1029 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !1026, file: !3, line: 62, baseType: !75, size: 128, offset: 128)
!1030 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !1026, file: !3, line: 63, baseType: !58, size: 32, offset: 256)
!1031 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !1026, file: !3, line: 64, baseType: !468, size: 24, offset: 288)
!1032 = !DIDerivedType(tag: DW_TAG_member, name: "nh", scope: !1026, file: !3, line: 65, baseType: !83, size: 8, offset: 312)
!1033 = !DILocalVariable(name: "h_before", scope: !1016, file: !3, line: 116, type: !55)
!1034 = !DILocalVariable(name: "h_after", scope: !1016, file: !3, line: 116, type: !55)
!1035 = !DILocalVariable(name: "offset", scope: !1016, file: !3, line: 116, type: !55)
!1036 = !DILocalVariable(name: "csum", scope: !1016, file: !3, line: 117, type: !58)
!1037 = !DILocalVariable(name: "u_before", scope: !1016, file: !3, line: 117, type: !58)
!1038 = !DILocalVariable(name: "u_after", scope: !1016, file: !3, line: 117, type: !58)
!1039 = !DILocation(line: 0, scope: !1016, inlinedAt: !1040)
!1040 = distinct !DILocation(line: 256, column: 9, scope: !917)
!1041 = !DILocation(line: 109, column: 48, scope: !1016, inlinedAt: !1040)
!1042 = !DILocation(line: 110, column: 2, scope: !1016, inlinedAt: !1040)
!1043 = !DILocation(line: 110, column: 23, scope: !1016, inlinedAt: !1040)
!1044 = !DILocation(line: 112, column: 18, scope: !1016, inlinedAt: !1040)
!1045 = !DILocation(line: 110, column: 28, scope: !1016, inlinedAt: !1040)
!1046 = !DILocation(line: 113, column: 18, scope: !1016, inlinedAt: !1040)
!1047 = !DILocation(line: 114, column: 16, scope: !1016, inlinedAt: !1040)
!1048 = !DILocation(line: 114, column: 10, scope: !1016, inlinedAt: !1040)
!1049 = !{!1050, !374, i64 32}
!1050 = !{!"icmpv6_pseudo", !568, i64 0, !568, i64 16, !374, i64 32, !375, i64 36, !375, i64 39}
!1051 = !{!1050, !375, i64 39}
!1052 = !DILocation(line: 128, column: 23, scope: !1016, inlinedAt: !1040)
!1053 = !DILocation(line: 128, column: 9, scope: !1016, inlinedAt: !1040)
!1054 = !DILocation(line: 132, column: 38, scope: !1016, inlinedAt: !1040)
!1055 = !DILocation(line: 132, column: 18, scope: !1016, inlinedAt: !1040)
!1056 = !DILocation(line: 135, column: 20, scope: !1016, inlinedAt: !1040)
!1057 = !DILocation(line: 135, column: 19, scope: !1016, inlinedAt: !1040)
!1058 = !DILocation(line: 139, column: 19, scope: !1016, inlinedAt: !1040)
!1059 = !DILocation(line: 141, column: 34, scope: !1016, inlinedAt: !1040)
!1060 = !DILocation(line: 141, column: 45, scope: !1016, inlinedAt: !1040)
!1061 = !DILocation(line: 141, column: 9, scope: !1016, inlinedAt: !1040)
!1062 = !DILocation(line: 142, column: 42, scope: !1016, inlinedAt: !1040)
!1063 = !DILocation(line: 142, column: 52, scope: !1016, inlinedAt: !1040)
!1064 = !DILocation(line: 142, column: 9, scope: !1016, inlinedAt: !1040)
!1065 = !DILocation(line: 144, column: 22, scope: !1066, inlinedAt: !1040)
!1066 = distinct !DILexicalBlock(scope: !1016, file: !3, line: 144, column: 13)
!1067 = !DILocation(line: 144, column: 13, scope: !1016, inlinedAt: !1040)
!1068 = !DILocation(line: 145, column: 60, scope: !1066, inlinedAt: !1040)
!1069 = !DILocation(line: 145, column: 17, scope: !1066, inlinedAt: !1040)
!1070 = !DILocation(line: 146, column: 1, scope: !1016, inlinedAt: !1040)
!1071 = !DILocation(line: 260, column: 2, scope: !917)
!1072 = !DILocation(line: 261, column: 1, scope: !917)
!1073 = distinct !DISubprogram(name: "alloc_new_state", scope: !3, file: !3, line: 397, type: !1074, scopeLine: 398, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1076)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!113, !111}
!1076 = !{!1077, !1078, !1079, !1080, !1081, !1082, !1086, !1087, !1088}
!1077 = !DILocalVariable(name: "src_v6", arg: 1, scope: !1073, file: !3, line: 397, type: !111)
!1078 = !DILocalVariable(name: "new_v6_state", scope: !1073, file: !3, line: 399, type: !114)
!1079 = !DILocalVariable(name: "max_v4", scope: !1073, file: !3, line: 400, type: !58)
!1080 = !DILocalVariable(name: "src_v4", scope: !1073, file: !3, line: 401, type: !58)
!1081 = !DILocalVariable(name: "i", scope: !1073, file: !3, line: 402, type: !107)
!1082 = !DILocalVariable(name: "next_v4", scope: !1083, file: !3, line: 405, type: !58)
!1083 = distinct !DILexicalBlock(scope: !1084, file: !3, line: 404, column: 34)
!1084 = distinct !DILexicalBlock(scope: !1085, file: !3, line: 404, column: 9)
!1085 = distinct !DILexicalBlock(scope: !1073, file: !3, line: 404, column: 9)
!1086 = !DILocalVariable(name: "next_addr", scope: !1083, file: !3, line: 405, type: !58)
!1087 = !DILabel(scope: !1073, name: "err_v4", file: !3, line: 435)
!1088 = !DILabel(scope: !1073, name: "err", file: !3, line: 437)
!1089 = !DILocation(line: 0, scope: !1073)
!1090 = !DILocation(line: 399, column: 9, scope: !1073)
!1091 = !DILocation(line: 399, column: 30, scope: !1073)
!1092 = !DILocation(line: 399, column: 45, scope: !1073)
!1093 = !DILocation(line: 399, column: 60, scope: !1073)
!1094 = !{!819, !374, i64 12}
!1095 = !DILocation(line: 400, column: 32, scope: !1073)
!1096 = !DILocation(line: 400, column: 52, scope: !1073)
!1097 = !DILocation(line: 400, column: 44, scope: !1073)
!1098 = !DILocation(line: 400, column: 42, scope: !1073)
!1099 = !DILocation(line: 400, column: 61, scope: !1073)
!1100 = !DILocation(line: 401, column: 9, scope: !1073)
!1101 = !DILocation(line: 401, column: 15, scope: !1073)
!1102 = !DILocation(line: 407, column: 29, scope: !1083)
!1103 = !DILocation(line: 0, scope: !1083)
!1104 = !DILocation(line: 408, column: 34, scope: !1083)
!1105 = !DILocation(line: 408, column: 44, scope: !1083)
!1106 = !DILocation(line: 410, column: 29, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1083, file: !3, line: 410, column: 21)
!1108 = !DILocation(line: 410, column: 21, scope: !1083)
!1109 = !DILocation(line: 416, column: 49, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1083, file: !3, line: 415, column: 21)
!1111 = !DILocation(line: 417, column: 59, scope: !1110)
!1112 = !DILocation(line: 417, column: 49, scope: !1110)
!1113 = !DILocation(line: 415, column: 21, scope: !1110)
!1114 = !DILocation(line: 417, column: 64, scope: !1110)
!1115 = !DILocation(line: 415, column: 21, scope: !1083)
!1116 = !DILocation(line: 424, column: 14, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1073, file: !3, line: 424, column: 13)
!1118 = !DILocation(line: 386, column: 9, scope: !1119, inlinedAt: !1125)
!1119 = distinct !DISubprogram(name: "reclaim_v4_addr", scope: !3, file: !3, line: 384, type: !1120, scopeLine: 385, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1122)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!58}
!1122 = !{!1123, !1124}
!1123 = !DILocalVariable(name: "timeout", scope: !1119, file: !3, line: 386, type: !67)
!1124 = !DILocalVariable(name: "src_v4", scope: !1119, file: !3, line: 387, type: !58)
!1125 = distinct !DILocation(line: 411, column: 34, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1107, file: !3, line: 410, column: 40)
!1127 = !DILocation(line: 386, column: 25, scope: !1119, inlinedAt: !1125)
!1128 = !DILocation(line: 386, column: 53, scope: !1119, inlinedAt: !1125)
!1129 = !{!567, !377, i64 16}
!1130 = !DILocation(line: 386, column: 44, scope: !1119, inlinedAt: !1125)
!1131 = !DILocation(line: 0, scope: !1119, inlinedAt: !1125)
!1132 = !DILocation(line: 386, column: 15, scope: !1119, inlinedAt: !1125)
!1133 = !{!377, !377, i64 0}
!1134 = !DILocation(line: 387, column: 9, scope: !1119, inlinedAt: !1125)
!1135 = !DILocation(line: 389, column: 13, scope: !1136, inlinedAt: !1125)
!1136 = distinct !DILexicalBlock(scope: !1119, file: !3, line: 389, column: 13)
!1137 = !DILocation(line: 389, column: 57, scope: !1136, inlinedAt: !1125)
!1138 = !DILocation(line: 389, column: 13, scope: !1119, inlinedAt: !1125)
!1139 = !DILocation(line: 390, column: 24, scope: !1136, inlinedAt: !1125)
!1140 = !DILocation(line: 390, column: 17, scope: !1136, inlinedAt: !1125)
!1141 = !DILocation(line: 392, column: 9, scope: !1119, inlinedAt: !1125)
!1142 = !DILocation(line: 394, column: 16, scope: !1119, inlinedAt: !1125)
!1143 = !DILocation(line: 394, column: 9, scope: !1119, inlinedAt: !1125)
!1144 = !DILocation(line: 395, column: 1, scope: !1119, inlinedAt: !1125)
!1145 = !DILocation(line: 411, column: 32, scope: !1126)
!1146 = !DILocation(line: 412, column: 25, scope: !1126)
!1147 = !DILocation(line: 418, column: 32, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1110, file: !3, line: 417, column: 78)
!1149 = !DILocation(line: 419, column: 25, scope: !1148)
!1150 = !DILocation(line: 424, column: 13, scope: !1073)
!1151 = !DILocation(line: 427, column: 30, scope: !1073)
!1152 = !DILocation(line: 428, column: 48, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1073, file: !3, line: 428, column: 13)
!1154 = !DILocation(line: 428, column: 13, scope: !1153)
!1155 = !DILocation(line: 428, column: 13, scope: !1073)
!1156 = !DILocation(line: 430, column: 13, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1073, file: !3, line: 430, column: 13)
!1158 = !DILocation(line: 430, column: 13, scope: !1073)
!1159 = !DILocation(line: 433, column: 16, scope: !1073)
!1160 = !DILocation(line: 433, column: 9, scope: !1073)
!1161 = !DILocation(line: 435, column: 1, scope: !1073)
!1162 = !DILocation(line: 436, column: 9, scope: !1073)
!1163 = !DILocation(line: 437, column: 1, scope: !1073)
!1164 = !DILocation(line: 441, column: 9, scope: !1073)
!1165 = !DILocation(line: 442, column: 9, scope: !1073)
!1166 = !DILocation(line: 443, column: 1, scope: !1073)
!1167 = distinct !DISubprogram(name: "rewrite_icmpv6", scope: !3, file: !3, line: 465, type: !1168, scopeLine: 466, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1170)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!107, !461, !185}
!1170 = !{!1171, !1172, !1173, !1174, !1175, !1176, !1177, !1178, !1179}
!1171 = !DILocalVariable(name: "ip6h", arg: 1, scope: !1167, file: !3, line: 465, type: !461)
!1172 = !DILocalVariable(name: "skb", arg: 2, scope: !1167, file: !3, line: 465, type: !185)
!1173 = !DILocalVariable(name: "data_end", scope: !1167, file: !3, line: 467, type: !53)
!1174 = !DILocalVariable(name: "old_icmp6", scope: !1167, file: !3, line: 469, type: !951)
!1175 = !DILocalVariable(name: "icmp6", scope: !1167, file: !3, line: 469, type: !989)
!1176 = !DILocalVariable(name: "icmp", scope: !1167, file: !3, line: 470, type: !926)
!1177 = !DILocalVariable(name: "new_icmp", scope: !1167, file: !3, line: 470, type: !949)
!1178 = !DILocalVariable(name: "mtu", scope: !1167, file: !3, line: 471, type: !58)
!1179 = !DILocalVariable(name: "ptr", scope: !1167, file: !3, line: 471, type: !58)
!1180 = !DILocation(line: 0, scope: !1167)
!1181 = !DILocation(line: 467, column: 52, scope: !1167)
!1182 = !DILocation(line: 467, column: 27, scope: !1167)
!1183 = !DILocation(line: 469, column: 38, scope: !1167)
!1184 = !DILocation(line: 473, column: 12, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1167, file: !3, line: 473, column: 6)
!1186 = !DILocation(line: 473, column: 18, scope: !1185)
!1187 = !DILocation(line: 473, column: 16, scope: !1185)
!1188 = !DILocation(line: 473, column: 6, scope: !1167)
!1189 = !DILocation(line: 476, column: 21, scope: !1167)
!1190 = !DILocation(line: 478, column: 9, scope: !1167)
!1191 = !DILocation(line: 481, column: 17, scope: !1167)
!1192 = !DILocation(line: 481, column: 2, scope: !1167)
!1193 = !DILocation(line: 487, column: 3, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1167, file: !3, line: 481, column: 29)
!1195 = !DILocation(line: 490, column: 3, scope: !1194)
!1196 = !DILocation(line: 498, column: 4, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 490, column: 29)
!1198 = !DILocation(line: 501, column: 4, scope: !1197)
!1199 = !DILocation(line: 510, column: 23, scope: !1194)
!1200 = !DILocation(line: 510, column: 51, scope: !1194)
!1201 = !DILocation(line: 511, column: 25, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 511, column: 21)
!1203 = !DILocation(line: 511, column: 21, scope: !1194)
!1204 = !DILocation(line: 513, column: 36, scope: !1194)
!1205 = !DILocation(line: 517, column: 3, scope: !1194)
!1206 = !DILocation(line: 519, column: 17, scope: !1194)
!1207 = !DILocation(line: 527, column: 31, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 519, column: 44)
!1209 = !DILocation(line: 531, column: 33, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1208, file: !3, line: 531, column: 29)
!1211 = !DILocation(line: 531, column: 38, scope: !1210)
!1212 = !DILocation(line: 532, column: 55, scope: !1210)
!1213 = !DILocation(line: 532, column: 33, scope: !1210)
!1214 = !DILocation(line: 533, column: 38, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 533, column: 34)
!1216 = !DILocation(line: 533, column: 43, scope: !1215)
!1217 = !DILocation(line: 535, column: 34, scope: !1215)
!1218 = !DILocation(line: 538, column: 33, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !3, line: 537, column: 34)
!1220 = distinct !DILexicalBlock(scope: !1215, file: !3, line: 535, column: 34)
!1221 = !DILocation(line: 539, column: 43, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1219, file: !3, line: 539, column: 34)
!1223 = !DILocation(line: 541, column: 44, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1222, file: !3, line: 541, column: 34)
!1225 = !DILocation(line: 0, scope: !1194)
!1226 = !DILocation(line: 554, column: 14, scope: !1167)
!1227 = !{i64 0, i64 1, !529, i64 1, i64 1, !529, i64 2, i64 2, !427, i64 4, i64 2, !427, i64 6, i64 2, !427, i64 4, i64 4, !563, i64 4, i64 2, !427, i64 6, i64 2, !427, i64 4, i64 4, !529}
!1228 = !{i64 0, i64 1, !529, i64 1, i64 2, !427, i64 3, i64 2, !427, i64 5, i64 2, !427, i64 3, i64 4, !563, i64 3, i64 2, !427, i64 5, i64 2, !427, i64 3, i64 4, !529}
!1229 = !{i64 0, i64 2, !427, i64 2, i64 2, !427, i64 0, i64 4, !563, i64 0, i64 2, !427, i64 2, i64 2, !427, i64 0, i64 4, !529}
!1230 = !{i64 0, i64 2, !427, i64 0, i64 2, !563, i64 0, i64 2, !427, i64 0, i64 2, !529}
!1231 = !DILocation(line: 0, scope: !1016, inlinedAt: !1232)
!1232 = distinct !DILocation(line: 555, column: 9, scope: !1167)
!1233 = !DILocation(line: 109, column: 48, scope: !1016, inlinedAt: !1232)
!1234 = !DILocation(line: 110, column: 2, scope: !1016, inlinedAt: !1232)
!1235 = !DILocation(line: 110, column: 23, scope: !1016, inlinedAt: !1232)
!1236 = !DILocation(line: 112, column: 18, scope: !1016, inlinedAt: !1232)
!1237 = !DILocation(line: 110, column: 28, scope: !1016, inlinedAt: !1232)
!1238 = !DILocation(line: 113, column: 18, scope: !1016, inlinedAt: !1232)
!1239 = !DILocation(line: 114, column: 16, scope: !1016, inlinedAt: !1232)
!1240 = !DILocation(line: 114, column: 10, scope: !1016, inlinedAt: !1232)
!1241 = !DILocation(line: 128, column: 23, scope: !1016, inlinedAt: !1232)
!1242 = !DILocation(line: 128, column: 9, scope: !1016, inlinedAt: !1232)
!1243 = !DILocation(line: 132, column: 38, scope: !1016, inlinedAt: !1232)
!1244 = !DILocation(line: 132, column: 18, scope: !1016, inlinedAt: !1232)
!1245 = !DILocation(line: 135, column: 20, scope: !1016, inlinedAt: !1232)
!1246 = !DILocation(line: 135, column: 19, scope: !1016, inlinedAt: !1232)
!1247 = !DILocation(line: 139, column: 20, scope: !1016, inlinedAt: !1232)
!1248 = !DILocation(line: 139, column: 19, scope: !1016, inlinedAt: !1232)
!1249 = !DILocation(line: 141, column: 34, scope: !1016, inlinedAt: !1232)
!1250 = !DILocation(line: 141, column: 45, scope: !1016, inlinedAt: !1232)
!1251 = !DILocation(line: 141, column: 9, scope: !1016, inlinedAt: !1232)
!1252 = !DILocation(line: 142, column: 42, scope: !1016, inlinedAt: !1232)
!1253 = !DILocation(line: 142, column: 52, scope: !1016, inlinedAt: !1232)
!1254 = !DILocation(line: 142, column: 9, scope: !1016, inlinedAt: !1232)
!1255 = !DILocation(line: 144, column: 22, scope: !1066, inlinedAt: !1232)
!1256 = !DILocation(line: 144, column: 13, scope: !1016, inlinedAt: !1232)
!1257 = !DILocation(line: 145, column: 60, scope: !1066, inlinedAt: !1232)
!1258 = !DILocation(line: 145, column: 17, scope: !1066, inlinedAt: !1232)
!1259 = !DILocation(line: 146, column: 1, scope: !1016, inlinedAt: !1232)
!1260 = !DILocation(line: 559, column: 2, scope: !1167)
!1261 = !DILocation(line: 560, column: 1, scope: !1167)
!1262 = distinct !DISubprogram(name: "check_item", scope: !3, file: !3, line: 364, type: !1263, scopeLine: 365, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1267)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!184, !1265, !169, !53, !53}
!1265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1266, size: 64)
!1266 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map", file: !3, line: 364, flags: DIFlagFwdDecl)
!1267 = !{!1268, !1269, !1270, !1271, !1272, !1273, !1274}
!1268 = !DILocalVariable(name: "map", arg: 1, scope: !1262, file: !3, line: 364, type: !1265)
!1269 = !DILocalVariable(name: "key", arg: 2, scope: !1262, file: !3, line: 364, type: !169)
!1270 = !DILocalVariable(name: "value", arg: 3, scope: !1262, file: !3, line: 364, type: !53)
!1271 = !DILocalVariable(name: "ctx", arg: 4, scope: !1262, file: !3, line: 364, type: !53)
!1272 = !DILocalVariable(name: "state", scope: !1262, file: !3, line: 366, type: !113)
!1273 = !DILocalVariable(name: "timeout", scope: !1262, file: !3, line: 367, type: !67)
!1274 = !DILocalVariable(name: "v4_addr", scope: !1275, file: !3, line: 370, type: !58)
!1275 = distinct !DILexicalBlock(scope: !1276, file: !3, line: 369, column: 64)
!1276 = distinct !DILexicalBlock(scope: !1262, file: !3, line: 369, column: 13)
!1277 = !DILocation(line: 0, scope: !1262)
!1278 = !DILocation(line: 367, column: 27, scope: !1262)
!1279 = !DILocation(line: 367, column: 25, scope: !1262)
!1280 = !DILocation(line: 369, column: 20, scope: !1276)
!1281 = !DILocation(line: 369, column: 30, scope: !1276)
!1282 = !DILocation(line: 369, column: 40, scope: !1276)
!1283 = !DILocation(line: 369, column: 51, scope: !1276)
!1284 = !DILocation(line: 369, column: 44, scope: !1276)
!1285 = !DILocation(line: 369, column: 13, scope: !1262)
!1286 = !DILocation(line: 370, column: 17, scope: !1275)
!1287 = !DILocation(line: 370, column: 40, scope: !1275)
!1288 = !DILocation(line: 0, scope: !1275)
!1289 = !DILocation(line: 370, column: 23, scope: !1275)
!1290 = !DILocation(line: 371, column: 37, scope: !1275)
!1291 = !DILocation(line: 371, column: 17, scope: !1275)
!1292 = !DILocation(line: 372, column: 17, scope: !1275)
!1293 = !DILocation(line: 373, column: 17, scope: !1275)
!1294 = !DILocation(line: 379, column: 9, scope: !1276)
!1295 = !DILocation(line: 382, column: 1, scope: !1262)
