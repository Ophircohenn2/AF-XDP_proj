; ModuleID = 'pkt-loop-filter.kern.c'
source_filename = "pkt-loop-filter.kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { [9 x i32]*, %struct.pkt_loop_key*, %struct.pkt_loop_data*, [1 x i32]* }
%struct.pkt_loop_key = type { [6 x i8], i16 }
%struct.pkt_loop_data = type { i64, i64, i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.5 }
%union.anon.5 = type { %struct.anon.6 }
%struct.anon.6 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.9 }
%union.anon.9 = type { %struct.anon.10 }
%struct.anon.10 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.11 }
%union.anon.11 = type { [4 x i32] }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.8 }
%union.anon.8 = type { [1 x i32] }
%struct.arphdr = type <{ i16, i16, i8, i8, i16, [6 x i8], i32, [6 x i8], i32 }>
%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.atomic64_t = type { i64 }
%struct.net_device = type { i32, %struct.anon.4 }
%struct.anon.4 = type { %struct.net* }
%struct.net = type { i64 }

@bond_ifindex = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@active_ifindex = dso_local local_unnamed_addr global i32 0, align 4, !dbg !99
@debug_output = dso_local constant i32 0, align 4, !dbg !101
@netns_cookie = dso_local constant i32 1, align 4, !dbg !105
@record_egress_pkt.____fmt = internal constant [39 x i8] c"Redirecting IGMP from %d to active %d\0A\00", align 1, !dbg !107
@iface_state = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !276
@filter_ingress_pkt.____fmt = internal constant [61 x i8] c"Received gratuitous ARP for SMAC/vlan %llx, expiring filter\0A\00", align 1, !dbg !239
@filter_ingress_pkt.___fmt = internal constant [99 x i8] c"Dropping packet type %d on ifindex %d with SMAC/vlan %llx - found in lookup table with ifindex %d\0A\00", align 1, !dbg !263
@filter_ingress_pkt.____fmt.1 = internal constant [53 x i8] c"Dropping multicast packet - ifindex %d != active %d\0A\00", align 1, !dbg !268
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !273
@____handle_change_slave.____fmt = internal constant [39 x i8] c"Active ifindex changed, new value: %d\0A\00", align 1, !dbg !326
@"llvm.net_device:0:8$0:1:0" = external global i64, !llvm.preserve.access.index !69 #0
@"llvm.net_device:0:0$0:0" = external global i64, !llvm.preserve.access.index !69 #0
@"llvm.net:2:1$0:0" = external global i32, !llvm.preserve.access.index !78 #0
@"llvm.net:0:0$0:0" = external global i64, !llvm.preserve.access.index !78 #0
@"llvm.net___old:0:0$0:0" = external global i64, !llvm.preserve.access.index !89 #0
@llvm.compiler.used = appending global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @filter_ingress_pkt to i8*), i8* bitcast (i32 (%struct.pt_regs*)* @handle_change_slave to i8*), i8* bitcast (%struct.anon.3* @iface_state to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @record_egress_pkt to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @record_egress_pkt(%struct.__sk_buff* nocapture noundef readonly %0) #1 section "tc" !dbg !109 {
  %2 = alloca %struct.pkt_loop_data, align 8
  %3 = alloca %struct.pkt_loop_key, align 2
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !212, metadata !DIExpression()), !dbg !391
  %4 = bitcast %struct.pkt_loop_data* %2 to i8*, !dbg !392
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #10, !dbg !392
  call void @llvm.dbg.declare(metadata %struct.pkt_loop_data* %2, metadata !213, metadata !DIExpression()), !dbg !393
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false), !dbg !393
  %5 = getelementptr inbounds %struct.pkt_loop_data, %struct.pkt_loop_data* %2, i64 0, i32 2, !dbg !394
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 10, !dbg !395
  %7 = load i32, i32* %6, align 8, !dbg !395, !tbaa !396
  store i32 %7, i32* %5, align 8, !dbg !394, !tbaa !402
  %8 = load i32, i32* @active_ifindex, align 4, !dbg !404, !tbaa !405
  call void @llvm.dbg.value(metadata i32 %8, metadata !224, metadata !DIExpression()), !dbg !391
  %9 = tail call i64 inttoptr (i64 125 to i64 ()*)() #10, !dbg !406
  call void @llvm.dbg.value(metadata i64 %9, metadata !225, metadata !DIExpression()), !dbg !391
  %10 = getelementptr inbounds %struct.pkt_loop_key, %struct.pkt_loop_key* %3, i64 0, i32 0, i64 0, !dbg !407
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #10, !dbg !407
  call void @llvm.dbg.declare(metadata %struct.pkt_loop_key* %3, metadata !226, metadata !DIExpression()), !dbg !408
  %11 = call fastcc i32 @parse_pkt(%struct.__sk_buff* noundef %0, %struct.pkt_loop_key* noundef nonnull %3), !dbg !409
  call void @llvm.dbg.value(metadata i32 %11, metadata !223, metadata !DIExpression()), !dbg !391
  %12 = icmp slt i32 %11, 0, !dbg !410
  br i1 %12, label %46, label %13, !dbg !412

13:                                               ; preds = %1
  %14 = icmp eq i32 %11, 3, !dbg !413
  br i1 %14, label %15, label %26, !dbg !415

15:                                               ; preds = %13
  %16 = load i32, i32* %6, align 8, !dbg !416, !tbaa !396
  %17 = icmp eq i32 %16, %8, !dbg !417
  br i1 %17, label %26, label %18, !dbg !418

18:                                               ; preds = %15
  %19 = load volatile i32, i32* @debug_output, align 4, !dbg !419, !tbaa !405
  %20 = icmp eq i32 %19, 0, !dbg !419
  br i1 %20, label %23, label %21, !dbg !422

21:                                               ; preds = %18
  %22 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @record_egress_pkt.____fmt, i64 0, i64 0), i32 noundef 39, i32 noundef %16, i32 noundef %8) #10, !dbg !423
  br label %23, !dbg !425

23:                                               ; preds = %21, %18
  %24 = tail call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 noundef %8, i64 noundef 0) #10, !dbg !426
  %25 = trunc i64 %24 to i32, !dbg !426
  br label %46, !dbg !427

26:                                               ; preds = %15, %13
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @iface_state to i8*), i8* noundef nonnull %10) #10, !dbg !428
  call void @llvm.dbg.value(metadata i8* %27, metadata !221, metadata !DIExpression()), !dbg !391
  %28 = icmp eq i8* %27, null, !dbg !429
  br i1 %28, label %29, label %33, !dbg !431

29:                                               ; preds = %26
  %30 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.3* @iface_state to i8*), i8* noundef nonnull %10, i8* noundef nonnull %4, i64 noundef 1) #10, !dbg !432
  %31 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @iface_state to i8*), i8* noundef nonnull %10) #10, !dbg !434
  call void @llvm.dbg.value(metadata i8* %31, metadata !221, metadata !DIExpression()), !dbg !391
  %32 = icmp eq i8* %31, null, !dbg !435
  br i1 %32, label %46, label %33, !dbg !437

33:                                               ; preds = %29, %26
  %34 = phi i8* [ %27, %26 ], [ %31, %29 ]
  call void @llvm.dbg.value(metadata i8* %34, metadata !221, metadata !DIExpression()), !dbg !391
  %35 = add i64 %9, 10000000000, !dbg !438
  %36 = bitcast i8* %34 to i64*, !dbg !439
  store i64 %35, i64* %36, align 8, !dbg !440, !tbaa !441
  %37 = icmp eq i32 %11, 4, !dbg !442
  br i1 %37, label %38, label %42, !dbg !444

38:                                               ; preds = %33
  call void @llvm.dbg.value(metadata i8* %34, metadata !221, metadata !DIExpression()), !dbg !391
  %39 = add i64 %9, 5000000000, !dbg !445
  %40 = getelementptr inbounds i8, i8* %34, i64 8, !dbg !446
  %41 = bitcast i8* %40 to i64*, !dbg !446
  store i64 %39, i64* %41, align 8, !dbg !447, !tbaa !448
  br label %42, !dbg !449

42:                                               ; preds = %38, %33
  %43 = load i32, i32* %6, align 8, !dbg !450, !tbaa !396
  %44 = getelementptr inbounds i8, i8* %34, i64 16, !dbg !451
  %45 = bitcast i8* %44 to i32*, !dbg !451
  store i32 %43, i32* %45, align 8, !dbg !452, !tbaa !402
  br label %46, !dbg !453

46:                                               ; preds = %42, %1, %29, %23
  %47 = phi i32 [ %25, %23 ], [ 0, %29 ], [ 0, %1 ], [ 0, %42 ], !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #10, !dbg !454
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #10, !dbg !454
  ret i32 %47, !dbg !454
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress nounwind willreturn
define internal fastcc i32 @parse_pkt(%struct.__sk_buff* nocapture noundef readonly %0, %struct.pkt_loop_key* nocapture noundef writeonly %1) unnamed_addr #5 !dbg !455 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !459, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.pkt_loop_key* %1, metadata !460, metadata !DIExpression()), !dbg !597
  %3 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !598
  %4 = load i32, i32* %3, align 8, !dbg !598, !tbaa !599
  %5 = zext i32 %4 to i64, !dbg !600
  %6 = inttoptr i64 %5 to i8*, !dbg !601
  call void @llvm.dbg.value(metadata i8* %6, metadata !461, metadata !DIExpression()), !dbg !597
  %7 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !602
  %8 = load i32, i32* %7, align 4, !dbg !602, !tbaa !603
  %9 = zext i32 %8 to i64, !dbg !604
  %10 = inttoptr i64 %9 to i8*, !dbg !605
  call void @llvm.dbg.value(metadata i8* %10, metadata !462, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i8* %10, metadata !463, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !606, metadata !DIExpression()) #10, !dbg !615
  call void @llvm.dbg.value(metadata i8* %6, metadata !613, metadata !DIExpression()) #10, !dbg !615
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !614, metadata !DIExpression()) #10, !dbg !615
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !617, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i8* %6, metadata !627, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !628, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !629, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i8* %10, metadata !630, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i32 14, metadata !631, metadata !DIExpression()) #10, !dbg !640
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !642
  %12 = icmp ugt i8* %11, %6, !dbg !644
  br i1 %12, label %207, label %13, !dbg !645

13:                                               ; preds = %2
  call void @llvm.dbg.value(metadata i8* %10, metadata !630, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i8* %11, metadata !463, metadata !DIExpression()), !dbg !597
  %14 = inttoptr i64 %9 to %struct.ethhdr*, !dbg !646
  call void @llvm.dbg.value(metadata i8* %11, metadata !632, metadata !DIExpression()) #10, !dbg !640
  %15 = getelementptr inbounds i8, i8* %10, i64 12, !dbg !647
  %16 = bitcast i8* %15 to i16*, !dbg !647
  call void @llvm.dbg.value(metadata i16 undef, metadata !638, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i32 0, metadata !639, metadata !DIExpression()) #10, !dbg !640
  %17 = load i16, i16* %16, align 1, !dbg !640, !tbaa !648
  call void @llvm.dbg.value(metadata i16 %17, metadata !638, metadata !DIExpression()) #10, !dbg !640
  %18 = inttoptr i64 %5 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %17, metadata !650, metadata !DIExpression()) #10, !dbg !655
  %19 = icmp eq i16 %17, 129, !dbg !661
  %20 = icmp eq i16 %17, -22392, !dbg !662
  %21 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 7, i1 %19) #10
  %22 = or i1 %20, %21, !dbg !662
  %23 = xor i1 %22, true, !dbg !663
  %24 = getelementptr i8, i8* %10, i64 18
  %25 = bitcast i8* %24 to %struct.vlan_hdr*
  %26 = icmp ugt %struct.vlan_hdr* %25, %18
  %27 = select i1 %23, i1 true, i1 %26, !dbg !664
  br i1 %27, label %45, label %28, !dbg !664

28:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i16 undef, metadata !638, metadata !DIExpression()) #10, !dbg !640
  %29 = getelementptr i8, i8* %10, i64 16, !dbg !665
  %30 = bitcast i8* %29 to i16*, !dbg !665
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %25, metadata !632, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i32 1, metadata !639, metadata !DIExpression()) #10, !dbg !640
  %31 = load i16, i16* %30, align 1, !dbg !640, !tbaa !648
  call void @llvm.dbg.value(metadata i16 %31, metadata !638, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i16 %31, metadata !650, metadata !DIExpression()) #10, !dbg !655
  %32 = icmp eq i16 %31, 129, !dbg !661
  %33 = icmp eq i16 %31, -22392, !dbg !662
  %34 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 7, i1 %32) #10
  %35 = or i1 %33, %34, !dbg !662
  %36 = xor i1 %35, true, !dbg !663
  %37 = getelementptr i8, i8* %10, i64 22
  %38 = bitcast i8* %37 to %struct.vlan_hdr*
  %39 = icmp ugt %struct.vlan_hdr* %38, %18
  %40 = select i1 %36, i1 true, i1 %39, !dbg !664
  br i1 %40, label %45, label %41, !dbg !664

41:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i16 undef, metadata !638, metadata !DIExpression()) #10, !dbg !640
  %42 = getelementptr i8, i8* %10, i64 20, !dbg !665
  %43 = bitcast i8* %42 to i16*, !dbg !665
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %38, metadata !632, metadata !DIExpression()) #10, !dbg !640
  call void @llvm.dbg.value(metadata i32 2, metadata !639, metadata !DIExpression()) #10, !dbg !640
  %44 = load i16, i16* %43, align 1, !dbg !640, !tbaa !648
  call void @llvm.dbg.value(metadata i16 %44, metadata !638, metadata !DIExpression()) #10, !dbg !640
  br label %45

45:                                               ; preds = %13, %28, %41
  %46 = phi i8* [ %11, %13 ], [ %24, %28 ], [ %37, %41 ], !dbg !640
  %47 = phi i16 [ %17, %13 ], [ %31, %28 ], [ %44, %41 ], !dbg !640
  call void @llvm.dbg.value(metadata i8* %46, metadata !463, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i16 %47, metadata !468, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !597
  %48 = getelementptr inbounds %struct.pkt_loop_key, %struct.pkt_loop_key* %1, i64 0, i32 0, i64 0, !dbg !666
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !470, metadata !DIExpression()), !dbg !597
  %49 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 1, i64 0, !dbg !666
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %48, i8* noundef nonnull align 1 dereferenceable(6) %49, i64 6, i1 false), !dbg !666
  %50 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 6, !dbg !667
  %51 = load i32, i32* %50, align 8, !dbg !667, !tbaa !668
  %52 = trunc i32 %51 to i16, !dbg !669
  %53 = getelementptr inbounds %struct.pkt_loop_key, %struct.pkt_loop_key* %1, i64 0, i32 1, !dbg !670
  store i16 %52, i16* %53, align 2, !dbg !671, !tbaa !672
  switch i16 %47, label %201 [
    i16 8, label %54
    i16 -8826, label %73
    i16 1544, label %179
  ], !dbg !674

54:                                               ; preds = %45
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !479, metadata !DIExpression(DW_OP_deref)), !dbg !675
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !676, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i8* %6, metadata !682, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !683, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.value(metadata i8* %46, metadata !684, metadata !DIExpression()), !dbg !686
  %55 = getelementptr inbounds i8, i8* %46, i64 20, !dbg !688
  %56 = icmp ugt i8* %55, %6, !dbg !690
  br i1 %56, label %201, label %57, !dbg !691

57:                                               ; preds = %54
  %58 = load i8, i8* %46, align 4, !dbg !692
  %59 = and i8 %58, -16, !dbg !694
  %60 = icmp eq i8 %59, 64, !dbg !694
  br i1 %60, label %61, label %201, !dbg !695

61:                                               ; preds = %57
  %62 = shl i8 %58, 2, !dbg !696
  %63 = and i8 %62, 60, !dbg !696
  call void @llvm.dbg.value(metadata i8 %63, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !686
  %64 = icmp ult i8 %63, 20, !dbg !697
  br i1 %64, label %201, label %65, !dbg !699

65:                                               ; preds = %61
  %66 = zext i8 %63 to i64
  call void @llvm.dbg.value(metadata i64 %66, metadata !685, metadata !DIExpression()), !dbg !686
  %67 = getelementptr i8, i8* %46, i64 %66, !dbg !700
  %68 = icmp ugt i8* %67, %6, !dbg !702
  br i1 %68, label %201, label %69, !dbg !703

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i8* %67, metadata !463, metadata !DIExpression()), !dbg !597
  %70 = getelementptr inbounds i8, i8* %46, i64 9, !dbg !704
  %71 = load i8, i8* %70, align 1, !dbg !704, !tbaa !705
  call void @llvm.dbg.value(metadata i8 %71, metadata !469, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !597
  %72 = icmp eq i8 %71, 2, !dbg !707
  br i1 %72, label %207, label %201

73:                                               ; preds = %45
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !552, metadata !DIExpression(DW_OP_deref)), !dbg !709
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !710, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i8* %6, metadata !716, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !717, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i8* %46, metadata !718, metadata !DIExpression()), !dbg !719
  %74 = getelementptr inbounds i8, i8* %46, i64 40, !dbg !721
  %75 = icmp ugt i8* %74, %6, !dbg !723
  br i1 %75, label %201, label %76, !dbg !724

76:                                               ; preds = %73
  %77 = load i8, i8* %46, align 4, !dbg !725
  %78 = and i8 %77, -16, !dbg !727
  %79 = icmp eq i8 %78, 96, !dbg !727
  br i1 %79, label %80, label %201, !dbg !728

80:                                               ; preds = %76
  call void @llvm.dbg.value(metadata i8* %74, metadata !463, metadata !DIExpression()), !dbg !597
  %81 = getelementptr inbounds i8, i8* %46, i64 6, !dbg !729
  %82 = load i8, i8* %81, align 2, !dbg !729, !tbaa !730
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !732, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %6, metadata !737, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i32 0, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %82, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %74, metadata !741, metadata !DIExpression()), !dbg !752
  %83 = getelementptr inbounds i8, i8* %46, i64 42, !dbg !753
  %84 = icmp ugt i8* %83, %6, !dbg !755
  br i1 %84, label %201, label %85, !dbg !756

85:                                               ; preds = %80
  switch i8 %82, label %161 [
    i8 0, label %87
    i8 60, label %87
    i8 43, label %87
    i8 -121, label %87
    i8 51, label %86
    i8 44, label %94
  ], !dbg !757

86:                                               ; preds = %85
  call void @llvm.dbg.value(metadata i8 undef, metadata !738, metadata !DIExpression()), !dbg !749
  br label %87, !dbg !758

87:                                               ; preds = %86, %85, %85, %85, %85
  %88 = phi i64 [ 2, %86 ], [ 3, %85 ], [ 3, %85 ], [ 3, %85 ], [ 3, %85 ]
  %89 = getelementptr inbounds i8, i8* %46, i64 41, !dbg !760
  %90 = load i8, i8* %89, align 1, !dbg !760, !tbaa !761
  %91 = zext i8 %90 to i64, !dbg !760
  %92 = shl nuw nsw i64 %91, %88, !dbg !760
  %93 = add nuw nsw i64 %92, 8, !dbg !760
  br label %94, !dbg !760

94:                                               ; preds = %87, %85
  %95 = phi i64 [ 8, %85 ], [ %93, %87 ]
  %96 = getelementptr inbounds i8, i8* %74, i64 %95, !dbg !760
  call void @llvm.dbg.value(metadata i8* %96, metadata !463, metadata !DIExpression()), !dbg !597
  %97 = load i8, i8* %74, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i32 1, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %97, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %96, metadata !741, metadata !DIExpression()), !dbg !752
  %98 = getelementptr inbounds i8, i8* %96, i64 2, !dbg !753
  %99 = icmp ugt i8* %98, %6, !dbg !755
  br i1 %99, label %201, label %100, !dbg !756

100:                                              ; preds = %94
  switch i8 %97, label %161 [
    i8 0, label %101
    i8 60, label %101
    i8 43, label %101
    i8 -121, label %101
    i8 51, label %102
    i8 44, label %109
  ], !dbg !757

101:                                              ; preds = %100, %100, %100, %100
  call void @llvm.dbg.value(metadata i8 undef, metadata !738, metadata !DIExpression()), !dbg !749
  br label %102, !dbg !764

102:                                              ; preds = %101, %100
  %103 = phi i64 [ 3, %101 ], [ 2, %100 ]
  %104 = getelementptr inbounds i8, i8* %96, i64 1, !dbg !760
  %105 = load i8, i8* %104, align 1, !dbg !760, !tbaa !761
  %106 = zext i8 %105 to i64, !dbg !760
  %107 = shl nuw nsw i64 %106, %103, !dbg !760
  %108 = add nuw nsw i64 %107, 8, !dbg !760
  br label %109, !dbg !760

109:                                              ; preds = %102, %100
  %110 = phi i64 [ 8, %100 ], [ %108, %102 ]
  %111 = getelementptr inbounds i8, i8* %96, i64 %110, !dbg !760
  call void @llvm.dbg.value(metadata i8* %111, metadata !463, metadata !DIExpression()), !dbg !597
  %112 = load i8, i8* %96, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i32 2, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %112, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %111, metadata !741, metadata !DIExpression()), !dbg !752
  %113 = getelementptr inbounds i8, i8* %111, i64 2, !dbg !753
  %114 = icmp ugt i8* %113, %6, !dbg !755
  br i1 %114, label %201, label %115, !dbg !756

115:                                              ; preds = %109
  switch i8 %112, label %161 [
    i8 0, label %116
    i8 60, label %116
    i8 43, label %116
    i8 -121, label %116
    i8 51, label %117
    i8 44, label %124
  ], !dbg !757

116:                                              ; preds = %115, %115, %115, %115
  call void @llvm.dbg.value(metadata i8 undef, metadata !738, metadata !DIExpression()), !dbg !749
  br label %117, !dbg !764

117:                                              ; preds = %116, %115
  %118 = phi i64 [ 3, %116 ], [ 2, %115 ]
  %119 = getelementptr inbounds i8, i8* %111, i64 1, !dbg !760
  %120 = load i8, i8* %119, align 1, !dbg !760, !tbaa !761
  %121 = zext i8 %120 to i64, !dbg !760
  %122 = shl nuw nsw i64 %121, %118, !dbg !760
  %123 = add nuw nsw i64 %122, 8, !dbg !760
  br label %124, !dbg !760

124:                                              ; preds = %117, %115
  %125 = phi i64 [ 8, %115 ], [ %123, %117 ]
  %126 = getelementptr inbounds i8, i8* %111, i64 %125, !dbg !760
  call void @llvm.dbg.value(metadata i8* %126, metadata !463, metadata !DIExpression()), !dbg !597
  %127 = load i8, i8* %111, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i32 3, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %127, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %126, metadata !741, metadata !DIExpression()), !dbg !752
  %128 = getelementptr inbounds i8, i8* %126, i64 2, !dbg !753
  %129 = icmp ugt i8* %128, %6, !dbg !755
  br i1 %129, label %201, label %130, !dbg !756

130:                                              ; preds = %124
  switch i8 %127, label %161 [
    i8 0, label %131
    i8 60, label %131
    i8 43, label %131
    i8 -121, label %131
    i8 51, label %132
    i8 44, label %139
  ], !dbg !757

131:                                              ; preds = %130, %130, %130, %130
  call void @llvm.dbg.value(metadata i8 undef, metadata !738, metadata !DIExpression()), !dbg !749
  br label %132, !dbg !764

132:                                              ; preds = %131, %130
  %133 = phi i64 [ 3, %131 ], [ 2, %130 ]
  %134 = getelementptr inbounds i8, i8* %126, i64 1, !dbg !760
  %135 = load i8, i8* %134, align 1, !dbg !760, !tbaa !761
  %136 = zext i8 %135 to i64, !dbg !760
  %137 = shl nuw nsw i64 %136, %133, !dbg !760
  %138 = add nuw nsw i64 %137, 8, !dbg !760
  br label %139, !dbg !760

139:                                              ; preds = %132, %130
  %140 = phi i64 [ 8, %130 ], [ %138, %132 ]
  %141 = getelementptr inbounds i8, i8* %126, i64 %140, !dbg !760
  call void @llvm.dbg.value(metadata i8* %141, metadata !463, metadata !DIExpression()), !dbg !597
  %142 = load i8, i8* %126, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i32 4, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %142, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %141, metadata !741, metadata !DIExpression()), !dbg !752
  %143 = getelementptr inbounds i8, i8* %141, i64 2, !dbg !753
  %144 = icmp ugt i8* %143, %6, !dbg !755
  br i1 %144, label %201, label %145, !dbg !756

145:                                              ; preds = %139
  switch i8 %142, label %161 [
    i8 0, label %146
    i8 60, label %146
    i8 43, label %146
    i8 -121, label %146
    i8 51, label %147
    i8 44, label %154
  ], !dbg !757

146:                                              ; preds = %145, %145, %145, %145
  call void @llvm.dbg.value(metadata i8 undef, metadata !738, metadata !DIExpression()), !dbg !749
  br label %147, !dbg !764

147:                                              ; preds = %146, %145
  %148 = phi i64 [ 3, %146 ], [ 2, %145 ]
  %149 = getelementptr inbounds i8, i8* %141, i64 1, !dbg !760
  %150 = load i8, i8* %149, align 1, !dbg !760, !tbaa !761
  %151 = zext i8 %150 to i64, !dbg !760
  %152 = shl nuw nsw i64 %151, %148, !dbg !760
  %153 = add nuw nsw i64 %152, 8, !dbg !760
  br label %154, !dbg !760

154:                                              ; preds = %147, %145
  %155 = phi i64 [ 8, %145 ], [ %153, %147 ]
  %156 = getelementptr inbounds i8, i8* %141, i64 %155, !dbg !760
  call void @llvm.dbg.value(metadata i8* %156, metadata !463, metadata !DIExpression()), !dbg !597
  %157 = load i8, i8* %141, align 1, !dbg !760, !tbaa !763
  call void @llvm.dbg.value(metadata i32 5, metadata !739, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8 %157, metadata !738, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.value(metadata i8* %156, metadata !741, metadata !DIExpression()), !dbg !752
  %158 = getelementptr inbounds i8, i8* %156, i64 2, !dbg !753
  %159 = icmp ugt i8* %158, %6, !dbg !755
  br i1 %159, label %201, label %160, !dbg !756

160:                                              ; preds = %154
  switch i8 %157, label %161 [
    i8 0, label %201
    i8 60, label %201
    i8 43, label %201
    i8 -121, label %201
    i8 51, label %201
    i8 44, label %201
  ], !dbg !757

161:                                              ; preds = %85, %100, %115, %130, %145, %160
  %162 = phi i8* [ %74, %85 ], [ %96, %100 ], [ %111, %115 ], [ %126, %130 ], [ %141, %145 ], [ %156, %160 ], !dbg !719
  %163 = phi i8 [ %82, %85 ], [ %97, %100 ], [ %112, %115 ], [ %127, %130 ], [ %142, %145 ], [ %157, %160 ]
  call void @llvm.dbg.value(metadata i8* %162, metadata !463, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i8 %163, metadata !469, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !597
  %164 = icmp eq i8 %163, 58, !dbg !765
  br i1 %164, label %165, label %201, !dbg !767

165:                                              ; preds = %161
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !768, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.value(metadata i8* %6, metadata !774, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !775, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.value(metadata i8* %162, metadata !776, metadata !DIExpression()), !dbg !777
  %166 = getelementptr inbounds i8, i8* %162, i64 8, !dbg !779
  %167 = bitcast i8* %166 to %struct.icmp6hdr*, !dbg !779
  %168 = inttoptr i64 %5 to %struct.icmp6hdr*, !dbg !781
  %169 = icmp ugt %struct.icmp6hdr* %167, %168, !dbg !782
  br i1 %169, label %173, label %170, !dbg !783

170:                                              ; preds = %165
  call void @llvm.dbg.value(metadata i8* %162, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %167, metadata !463, metadata !DIExpression()), !dbg !597
  %171 = load i8, i8* %162, align 4, !dbg !784, !tbaa !785
  %172 = zext i8 %171 to i32, !dbg !787
  br label %173, !dbg !788

173:                                              ; preds = %165, %170
  %174 = phi i32 [ %172, %170 ], [ -1, %165 ], !dbg !777
  call void @llvm.dbg.value(metadata i32 %174, metadata !595, metadata !DIExpression()), !dbg !709
  %175 = icmp eq i32 %174, 131, !dbg !789
  %176 = icmp eq i32 %174, 143
  %177 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 6, i1 %175)
  %178 = select i1 %177, i1 true, i1 %176, !dbg !791
  br i1 %178, label %207, label %201, !dbg !792

179:                                              ; preds = %45
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !793, metadata !DIExpression()), !dbg !813
  call void @llvm.dbg.value(metadata i8* %6, metadata !799, metadata !DIExpression()), !dbg !813
  call void @llvm.dbg.value(metadata i8* %46, metadata !800, metadata !DIExpression()), !dbg !813
  %180 = getelementptr inbounds i8, i8* %46, i64 28, !dbg !816
  %181 = bitcast i8* %180 to %struct.arphdr*, !dbg !816
  %182 = inttoptr i64 %5 to %struct.arphdr*, !dbg !818
  %183 = icmp ugt %struct.arphdr* %181, %182, !dbg !819
  br i1 %183, label %201, label %184, !dbg !820

184:                                              ; preds = %179
  %185 = bitcast i8* %46 to i16*, !dbg !821
  %186 = load i16, i16* %185, align 1, !dbg !821, !tbaa !823
  %187 = icmp eq i16 %186, 256, !dbg !825
  br i1 %187, label %188, label %201, !dbg !826

188:                                              ; preds = %184
  %189 = getelementptr inbounds i8, i8* %46, i64 2, !dbg !827
  %190 = bitcast i8* %189 to i16*, !dbg !827
  %191 = load i16, i16* %190, align 1, !dbg !827, !tbaa !828
  %192 = icmp eq i16 %191, 8, !dbg !829
  br i1 %192, label %193, label %201, !dbg !830

193:                                              ; preds = %188
  %194 = getelementptr inbounds i8, i8* %46, i64 14, !dbg !831
  %195 = bitcast i8* %194 to i32*, !dbg !831
  %196 = load i32, i32* %195, align 1, !dbg !831, !tbaa !832
  %197 = getelementptr inbounds i8, i8* %46, i64 24, !dbg !833
  %198 = bitcast i8* %197 to i32*, !dbg !833
  %199 = load i32, i32* %198, align 1, !dbg !833, !tbaa !834
  %200 = icmp eq i32 %196, %199, !dbg !835
  br i1 %200, label %207, label %201, !dbg !836

201:                                              ; preds = %184, %188, %179, %160, %160, %160, %160, %160, %160, %80, %94, %109, %124, %139, %154, %76, %73, %173, %161, %65, %61, %57, %54, %45, %69, %193
  call void @llvm.dbg.label(metadata !596), !dbg !837
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !470, metadata !DIExpression()), !dbg !597
  %202 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 0, i64 0, !dbg !838
  call void @llvm.dbg.value(metadata i8* %202, metadata !839, metadata !DIExpression()), !dbg !846
  %203 = load i8, i8* %202, align 1, !dbg !848, !tbaa !849
  %204 = and i8 %203, 1, !dbg !850
  %205 = icmp eq i8 %204, 0, !dbg !851
  %206 = select i1 %205, i32 1, i32 2, !dbg !852
  br label %207, !dbg !853

207:                                              ; preds = %2, %173, %193, %69, %201
  %208 = phi i32 [ %206, %201 ], [ 3, %69 ], [ 4, %193 ], [ 3, %173 ], [ -1, %2 ]
  ret i32 %208, !dbg !854
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind
define dso_local i32 @filter_ingress_pkt(%struct.__sk_buff* nocapture noundef readonly %0) #1 section "tc" !dbg !241 {
  %2 = alloca %struct.pkt_loop_key, align 8
  %3 = alloca [4 x i64], align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !243, metadata !DIExpression()), !dbg !855
  %4 = load i32, i32* @active_ifindex, align 4, !dbg !856, !tbaa !405
  call void @llvm.dbg.value(metadata i32 %4, metadata !245, metadata !DIExpression()), !dbg !855
  %5 = tail call i64 inttoptr (i64 125 to i64 ()*)() #10, !dbg !857
  call void @llvm.dbg.value(metadata i64 %5, metadata !246, metadata !DIExpression()), !dbg !855
  %6 = getelementptr inbounds %struct.pkt_loop_key, %struct.pkt_loop_key* %2, i64 0, i32 0, i64 0, !dbg !858
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #10, !dbg !858
  call void @llvm.dbg.declare(metadata %struct.pkt_loop_key* %2, metadata !248, metadata !DIExpression()), !dbg !859
  call void @llvm.dbg.value(metadata i64 0, metadata !249, metadata !DIExpression()), !dbg !855
  %7 = call fastcc i32 @parse_pkt(%struct.__sk_buff* noundef %0, %struct.pkt_loop_key* noundef nonnull %2), !dbg !860
  call void @llvm.dbg.value(metadata i32 %7, metadata !244, metadata !DIExpression()), !dbg !855
  %8 = icmp slt i32 %7, 0, !dbg !861
  br i1 %8, label %77, label %9, !dbg !863

9:                                                ; preds = %1
  %10 = load volatile i32, i32* @debug_output, align 4, !dbg !864, !tbaa !405
  %11 = icmp eq i32 %10, 0, !dbg !864
  br i1 %11, label %23, label %12, !dbg !865

12:                                               ; preds = %9
  call void @llvm.dbg.value(metadata i48 undef, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 48)), !dbg !866
  call void @llvm.dbg.value(metadata i16 undef, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !866
  call void @llvm.dbg.value(metadata i16 undef, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !866
  %13 = getelementptr inbounds %struct.pkt_loop_key, %struct.pkt_loop_key* %2, i64 0, i32 1, !dbg !867
  %14 = load i16, i16* %13, align 2, !dbg !867, !tbaa.struct !868
  call void @llvm.dbg.value(metadata i16 %14, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !866
  %15 = tail call i16 @llvm.bswap.i16(i16 %14), !dbg !869
  call void @llvm.dbg.value(metadata i16 %15, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !866
  %16 = zext i16 %15 to i64, !dbg !870
  %17 = shl nuw i64 %16, 48, !dbg !870
  %18 = bitcast %struct.pkt_loop_key* %2 to i48*, !dbg !867
  %19 = load i48, i48* %18, align 8, !dbg !867, !tbaa.struct !871
  call void @llvm.dbg.value(metadata i48 %19, metadata !250, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 48)), !dbg !866
  %20 = zext i48 %19 to i64, !dbg !870
  %21 = or i64 %17, %20, !dbg !870
  %22 = tail call i64 @llvm.bswap.i64(i64 %21), !dbg !870
  br label %23, !dbg !870

23:                                               ; preds = %12, %9
  %24 = phi i64 [ 0, %9 ], [ %22, %12 ], !dbg !855
  call void @llvm.dbg.value(metadata i64 %24, metadata !249, metadata !DIExpression()), !dbg !855
  %25 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @iface_state to i8*), i8* noundef nonnull %6) #10, !dbg !872
  call void @llvm.dbg.value(metadata i8* %25, metadata !247, metadata !DIExpression()), !dbg !855
  %26 = icmp eq i8* %25, null, !dbg !873
  br i1 %26, label %66, label %27, !dbg !874

27:                                               ; preds = %23
  %28 = bitcast i8* %25 to i64*, !dbg !875
  %29 = load i64, i64* %28, align 8, !dbg !875, !tbaa !441
  %30 = icmp ugt i64 %29, %5, !dbg !876
  br i1 %30, label %31, label %66, !dbg !877

31:                                               ; preds = %27
  %32 = icmp eq i32 %7, 4, !dbg !878
  br i1 %32, label %33, label %44, !dbg !880

33:                                               ; preds = %31
  %34 = getelementptr inbounds i8, i8* %25, i64 8, !dbg !881
  %35 = bitcast i8* %34 to i64*, !dbg !881
  %36 = load i64, i64* %35, align 8, !dbg !881, !tbaa !448
  %37 = icmp ult i64 %36, %5, !dbg !882
  br i1 %37, label %38, label %44, !dbg !883

38:                                               ; preds = %33
  %39 = load volatile i32, i32* @debug_output, align 4, !dbg !884, !tbaa !405
  %40 = icmp eq i32 %39, 0, !dbg !884
  br i1 %40, label %43, label %41, !dbg !887

41:                                               ; preds = %38
  %42 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @filter_ingress_pkt.____fmt, i64 0, i64 0), i32 noundef 61, i64 noundef %24) #10, !dbg !888
  br label %43, !dbg !890

43:                                               ; preds = %41, %38
  store i64 0, i64* %28, align 8, !dbg !891, !tbaa !441
  br label %77, !dbg !892

44:                                               ; preds = %33, %31
  %45 = getelementptr inbounds i8, i8* %25, i64 20, !dbg !893
  %46 = bitcast i8* %45 to i32*, !dbg !893
  %47 = load i32, i32* %46, align 4, !dbg !894, !tbaa !895
  %48 = add i32 %47, 1, !dbg !894
  store i32 %48, i32* %46, align 4, !dbg !894, !tbaa !895
  %49 = load volatile i32, i32* @debug_output, align 4, !dbg !896, !tbaa !405
  %50 = icmp eq i32 %49, 0, !dbg !896
  br i1 %50, label %77, label %51, !dbg !897

51:                                               ; preds = %44
  %52 = bitcast [4 x i64]* %3 to i8*, !dbg !898
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %52) #10, !dbg !898
  call void @llvm.dbg.declare(metadata [4 x i64]* %3, metadata !253, metadata !DIExpression()), !dbg !898
  %53 = zext i32 %7 to i64, !dbg !898
  %54 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 0, !dbg !898
  store i64 %53, i64* %54, align 8, !dbg !898, !tbaa !899
  %55 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 9, !dbg !898
  %56 = load i32, i32* %55, align 4, !dbg !898, !tbaa !900
  %57 = zext i32 %56 to i64, !dbg !898
  %58 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 1, !dbg !898
  store i64 %57, i64* %58, align 8, !dbg !898, !tbaa !899
  %59 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 2, !dbg !898
  store i64 %24, i64* %59, align 8, !dbg !898, !tbaa !899
  %60 = getelementptr inbounds i8, i8* %25, i64 16, !dbg !898
  %61 = bitcast i8* %60 to i32*, !dbg !898
  %62 = load i32, i32* %61, align 8, !dbg !898, !tbaa !402
  %63 = zext i32 %62 to i64, !dbg !898
  %64 = getelementptr inbounds [4 x i64], [4 x i64]* %3, i64 0, i64 3, !dbg !898
  store i64 %63, i64* %64, align 8, !dbg !898, !tbaa !899
  %65 = call i64 inttoptr (i64 177 to i64 (i8*, i32, i8*, i32)*)(i8* noundef getelementptr inbounds ([99 x i8], [99 x i8]* @filter_ingress_pkt.___fmt, i64 0, i64 0), i32 noundef 99, i8* noundef nonnull %52, i32 noundef 32) #10, !dbg !898
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %52) #10, !dbg !901
  br label %77, !dbg !901

66:                                               ; preds = %27, %23
  %67 = icmp eq i32 %7, 2, !dbg !902
  br i1 %67, label %68, label %77, !dbg !904

68:                                               ; preds = %66
  %69 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 9, !dbg !905
  %70 = load i32, i32* %69, align 4, !dbg !905, !tbaa !900
  %71 = icmp eq i32 %70, %4, !dbg !906
  br i1 %71, label %77, label %72, !dbg !907

72:                                               ; preds = %68
  %73 = load volatile i32, i32* @debug_output, align 4, !dbg !908, !tbaa !405
  %74 = icmp eq i32 %73, 0, !dbg !908
  br i1 %74, label %77, label %75, !dbg !911

75:                                               ; preds = %72
  %76 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @filter_ingress_pkt.____fmt.1, i64 0, i64 0), i32 noundef 53, i32 noundef %70, i32 noundef %4) #10, !dbg !912
  br label %77, !dbg !914

77:                                               ; preds = %43, %1, %68, %66, %72, %75, %44, %51
  %78 = phi i32 [ 2, %51 ], [ 2, %44 ], [ 2, %75 ], [ 2, %72 ], [ 0, %66 ], [ 0, %68 ], [ 0, %1 ], [ 0, %43 ], !dbg !855
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #10, !dbg !915
  ret i32 %78, !dbg !915
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.bswap.i64(i64) #2

; Function Attrs: nounwind
define dso_local i32 @handle_change_slave(%struct.pt_regs* nocapture noundef readonly %0) #1 section "kprobe/bond_change_active_slave" !dbg !916 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.atomic64_t, align 8
  %4 = alloca %struct.net_device*, align 8
  %5 = alloca %struct.net*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.net_device*, align 8
  %8 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.pt_regs* %0, metadata !920, metadata !DIExpression()), !dbg !921
  %9 = getelementptr inbounds %struct.pt_regs, %struct.pt_regs* %0, i64 0, i32 14, !dbg !922
  %10 = load i64, i64* %9, align 8, !dbg !922, !tbaa !923
  %11 = getelementptr inbounds %struct.pt_regs, %struct.pt_regs* %0, i64 0, i32 13, !dbg !922
  %12 = load i64, i64* %11, align 8, !dbg !922, !tbaa !926
  call void @llvm.dbg.value(metadata %struct.pt_regs* undef, metadata !358, metadata !DIExpression()) #10, !dbg !927
  call void @llvm.dbg.value(metadata i64 %10, metadata !359, metadata !DIExpression()) #10, !dbg !927
  call void @llvm.dbg.value(metadata i64 %12, metadata !360, metadata !DIExpression()) #10, !dbg !927
  %13 = bitcast %struct.net_device** %4 to i8*, !dbg !929
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #10, !dbg !929
  %14 = inttoptr i64 %10 to i8*, !dbg !930
  call void @llvm.dbg.value(metadata %struct.net_device** %4, metadata !362, metadata !DIExpression(DW_OP_deref)) #10, !dbg !932
  %15 = call i64 inttoptr (i64 4 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %13, i32 noundef 8, i8* noundef %14) #10, !dbg !930
  %16 = bitcast %struct.net_device** %4 to i8**, !dbg !929
  %17 = load i8*, i8** %16, align 8, !dbg !929, !tbaa !933
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !362, metadata !DIExpression()) #10, !dbg !932
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #10, !dbg !935
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !361, metadata !DIExpression()) #10, !dbg !927
  %18 = bitcast %struct.net** %5 to i8*, !dbg !936
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #10, !dbg !936
  %19 = load i64, i64* @"llvm.net_device:0:8$0:1:0", align 8
  %20 = getelementptr i8, i8* %17, i64 %19
  %21 = bitcast i8* %20 to %struct.net**
  %22 = call %struct.net** @llvm.bpf.passthrough.p0p0s_struct.nets.p0p0s_struct.nets(i32 0, %struct.net** %21) #10
  %23 = bitcast %struct.net** %22 to i8*, !dbg !937
  call void @llvm.dbg.value(metadata %struct.net** %5, metadata !365, metadata !DIExpression(DW_OP_deref)) #10, !dbg !939
  %24 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %18, i32 noundef 8, i8* noundef %23) #10, !dbg !937
  %25 = load %struct.net*, %struct.net** %5, align 8, !dbg !936, !tbaa !933
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !365, metadata !DIExpression()) #10, !dbg !939
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #10, !dbg !940
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !364, metadata !DIExpression()) #10, !dbg !927
  %26 = bitcast i32* %6 to i8*, !dbg !941
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26) #10, !dbg !941
  %27 = load i64, i64* @"llvm.net_device:0:0$0:0", align 8
  %28 = getelementptr i8, i8* %17, i64 %27
  %29 = bitcast i8* %28 to i32*
  %30 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 1, i32* %29) #10
  %31 = bitcast i32* %30 to i8*, !dbg !942
  call void @llvm.dbg.value(metadata i32* %6, metadata !368, metadata !DIExpression(DW_OP_deref)) #10, !dbg !944
  %32 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %26, i32 noundef 4, i8* noundef %31) #10, !dbg !942
  %33 = load i32, i32* %6, align 4, !dbg !941, !tbaa !405
  call void @llvm.dbg.value(metadata i32 %33, metadata !368, metadata !DIExpression()) #10, !dbg !944
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #10, !dbg !945
  call void @llvm.dbg.value(metadata i32 %33, metadata !367, metadata !DIExpression()) #10, !dbg !927
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !946, metadata !DIExpression()) #10, !dbg !960
  %34 = load i32, i32* @"llvm.net:2:1$0:0", align 4
  %35 = call i32 @llvm.bpf.passthrough.i32.i32(i32 3, i32 %34) #10
  %36 = icmp eq i32 %35, 0, !dbg !962
  br i1 %36, label %47, label %37, !dbg !963

37:                                               ; preds = %1
  %38 = bitcast i64* %2 to i8*, !dbg !964
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #10, !dbg !964
  %39 = load i64, i64* @"llvm.net:0:0$0:0", align 8
  %40 = bitcast %struct.net* %25 to i8*
  %41 = getelementptr i8, i8* %40, i64 %39
  %42 = bitcast i8* %41 to i64*
  %43 = call i64* @llvm.bpf.passthrough.p0i64.p0i64(i32 4, i64* %42) #10
  %44 = bitcast i64* %43 to i8*, !dbg !965
  call void @llvm.dbg.value(metadata i64* %2, metadata !951, metadata !DIExpression(DW_OP_deref)) #10, !dbg !967
  %45 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %38, i32 noundef 8, i8* noundef %44) #10, !dbg !965
  %46 = load i64, i64* %2, align 8, !dbg !964, !tbaa !899
  call void @llvm.dbg.value(metadata i64 %46, metadata !951, metadata !DIExpression()) #10, !dbg !967
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #10, !dbg !968
  br label %58, !dbg !969

47:                                               ; preds = %1
  %48 = bitcast %struct.net* %25 to i8*, !dbg !970
  call void @llvm.dbg.value(metadata i8* %48, metadata !955, metadata !DIExpression()) #10, !dbg !971
  %49 = bitcast %struct.atomic64_t* %3 to i8*, !dbg !972
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %49) #10, !dbg !972
  call void @llvm.dbg.declare(metadata %struct.atomic64_t* %3, metadata !958, metadata !DIExpression()) #10, !dbg !972
  %50 = load i64, i64* @"llvm.net___old:0:0$0:0", align 8
  %51 = getelementptr i8, i8* %48, i64 %50
  %52 = bitcast i8* %51 to %struct.atomic64_t*
  %53 = call %struct.atomic64_t* @llvm.bpf.passthrough.p0s_struct.atomic64_ts.p0s_struct.atomic64_ts(i32 5, %struct.atomic64_t* %52) #10
  %54 = bitcast %struct.atomic64_t* %53 to i8*, !dbg !973
  %55 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %49, i32 noundef 8, i8* noundef %54) #10, !dbg !973
  %56 = getelementptr inbounds %struct.atomic64_t, %struct.atomic64_t* %3, i64 0, i32 0, !dbg !972
  %57 = load i64, i64* %56, align 8, !dbg !972, !tbaa.struct !975
  call void @llvm.dbg.value(metadata i64 %57, metadata !957, metadata !DIExpression()) #10, !dbg !971
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %49) #10, !dbg !976
  br label %58

58:                                               ; preds = %47, %37
  %59 = phi i64 [ %46, %37 ], [ %57, %47 ], !dbg !977
  call void @llvm.dbg.value(metadata i64 %59, metadata !370, metadata !DIExpression()) #10, !dbg !927
  %60 = load volatile i32, i32* @netns_cookie, align 4, !dbg !978, !tbaa !405
  %61 = sext i32 %60 to i64, !dbg !978
  %62 = icmp eq i64 %59, %61, !dbg !979
  br i1 %62, label %63, label %88, !dbg !980

63:                                               ; preds = %58
  %64 = load i32, i32* @bond_ifindex, align 4, !dbg !981, !tbaa !405
  %65 = icmp eq i32 %33, %64, !dbg !982
  %66 = icmp ne i64 %12, 0
  %67 = and i1 %66, %65, !dbg !983
  br i1 %67, label %68, label %88, !dbg !983

68:                                               ; preds = %63
  %69 = bitcast %struct.net_device** %7 to i8*, !dbg !984
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %69) #10, !dbg !984
  %70 = inttoptr i64 %12 to i8*, !dbg !985
  call void @llvm.dbg.value(metadata %struct.net_device** %7, metadata !375, metadata !DIExpression(DW_OP_deref)) #10, !dbg !987
  %71 = call i64 inttoptr (i64 4 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %69, i32 noundef 8, i8* noundef nonnull %70) #10, !dbg !985
  %72 = bitcast %struct.net_device** %7 to i8**, !dbg !984
  %73 = load i8*, i8** %72, align 8, !dbg !984, !tbaa !933
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !375, metadata !DIExpression()) #10, !dbg !987
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %69) #10, !dbg !988
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !371, metadata !DIExpression()) #10, !dbg !989
  %74 = bitcast i32* %8 to i8*, !dbg !990
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %74) #10, !dbg !990
  %75 = load i64, i64* @"llvm.net_device:0:0$0:0", align 8
  %76 = getelementptr i8, i8* %73, i64 %75
  %77 = bitcast i8* %76 to i32*
  %78 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 2, i32* %77) #10
  %79 = bitcast i32* %78 to i8*, !dbg !991
  call void @llvm.dbg.value(metadata i32* %8, metadata !377, metadata !DIExpression(DW_OP_deref)) #10, !dbg !993
  %80 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %74, i32 noundef 4, i8* noundef %79) #10, !dbg !991
  %81 = load i32, i32* %8, align 4, !dbg !990, !tbaa !405
  call void @llvm.dbg.value(metadata i32 %81, metadata !377, metadata !DIExpression()) #10, !dbg !993
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %74) #10, !dbg !994
  call void @llvm.dbg.value(metadata i32 %81, metadata !374, metadata !DIExpression()) #10, !dbg !989
  %82 = icmp eq i32 %81, 0, !dbg !995
  br i1 %82, label %88, label %83, !dbg !997

83:                                               ; preds = %68
  store i32 %81, i32* @active_ifindex, align 4, !dbg !998, !tbaa !405
  %84 = load volatile i32, i32* @debug_output, align 4, !dbg !1000, !tbaa !405
  %85 = icmp eq i32 %84, 0, !dbg !1000
  br i1 %85, label %88, label %86, !dbg !1002

86:                                               ; preds = %83
  %87 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @____handle_change_slave.____fmt, i64 0, i64 0), i32 noundef 39, i32 noundef %81) #10, !dbg !1003
  br label %88, !dbg !1005

88:                                               ; preds = %58, %63, %68, %83, %86
  ret i32 0, !dbg !922
}

; Function Attrs: nofree nosync nounwind readnone
declare %struct.net** @llvm.bpf.passthrough.p0p0s_struct.nets.p0p0s_struct.nets(i32, %struct.net**) #7

; Function Attrs: nofree nosync nounwind readnone
declare i32* @llvm.bpf.passthrough.p0i32.p0i32(i32, i32*) #7

; Function Attrs: nofree nosync nounwind readnone
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #7

; Function Attrs: nofree nosync nounwind readnone
declare i64* @llvm.bpf.passthrough.p0i64.p0i64(i32, i64*) #7

; Function Attrs: nofree nosync nounwind readnone
declare %struct.atomic64_t* @llvm.bpf.passthrough.p0s_struct.atomic64_ts.p0s_struct.atomic64_ts(i32, %struct.atomic64_t*) #7

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #8

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #9

attributes #0 = { "btf_ama" }
attributes #1 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { mustprogress nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #7 = { nofree nosync nounwind readnone }
attributes #8 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!386, !387, !388, !389}
!llvm.ident = !{!390}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bond_ifindex", scope: !2, file: !3, line: 31, type: !72, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !53, globals: !98, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "pkt-loop-filter.kern.c", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "d3438f93f0b8b293a9d3bcb2bce81379")
!4 = !{!5, !13, !44}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 397, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_ANY", value: 0)
!10 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!11 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!12 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 28, baseType: !7, size: 32, elements: !15)
!14 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!15 = !{!16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43}
!16 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!17 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!18 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!19 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!20 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!21 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!22 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!23 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!24 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!25 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!26 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!27 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!28 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!29 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!30 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!31 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!32 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!33 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!34 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!35 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!36 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!37 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!38 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!39 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!40 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!41 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!42 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!43 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_field_info_kind", file: !45, line: 13, baseType: !7, size: 32, elements: !46)
!45 = !DIFile(filename: "../lib/install/include/bpf/bpf_core_read.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "3441d4105e978a1f6a56f472c2d0c17e")
!46 = !{!47, !48, !49, !50, !51, !52}
!47 = !DIEnumerator(name: "BPF_FIELD_BYTE_OFFSET", value: 0)
!48 = !DIEnumerator(name: "BPF_FIELD_BYTE_SIZE", value: 1)
!49 = !DIEnumerator(name: "BPF_FIELD_EXISTS", value: 2)
!50 = !DIEnumerator(name: "BPF_FIELD_SIGNED", value: 3)
!51 = !DIEnumerator(name: "BPF_FIELD_LSHIFT_U64", value: 4)
!52 = !DIEnumerator(name: "BPF_FIELD_RSHIFT_U64", value: 5)
!53 = !{!54, !57, !58, !60, !59, !61, !63, !86, !68, !82, !77, !88}
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !55, line: 24, baseType: !56)
!55 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!56 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !55, line: 31, baseType: !59)
!59 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bonding", file: !65, line: 20, size: 128, elements: !66)
!65 = !DIFile(filename: "./bpf-defs.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "23c57a1138f1023ebfadde4430d695e3")
!66 = !{!67, !81}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "dev", scope: !64, file: !65, line: 21, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net_device", file: !65, line: 38, size: 128, elements: !70)
!70 = !{!71, !73}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !69, file: !65, line: 39, baseType: !72, size: 32)
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "nd_net", scope: !69, file: !65, line: 42, baseType: !74, size: 64, offset: 64)
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !69, file: !65, line: 40, size: 64, elements: !75)
!75 = !{!76}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "net", scope: !74, file: !65, line: 41, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net", file: !65, line: 26, size: 64, elements: !79)
!79 = !{!80}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "net_cookie", scope: !78, file: !65, line: 27, baseType: !58, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "curr_active_slave", scope: !64, file: !65, line: 22, baseType: !82, size: 64, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "slave", file: !65, line: 16, size: 64, elements: !84)
!84 = !{!85}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "dev", scope: !83, file: !65, line: 17, baseType: !68, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net___old", file: !65, line: 34, size: 64, elements: !90)
!90 = !{!91}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "net_cookie", scope: !89, file: !65, line: 35, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "atomic64_t", file: !65, line: 32, baseType: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !65, line: 30, size: 64, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !93, file: !65, line: 31, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !55, line: 30, baseType: !97)
!97 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!98 = !{!0, !99, !101, !105, !107, !239, !263, !268, !273, !276, !293, !299, !306, !311, !316, !321, !326, !379, !384}
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(name: "active_ifindex", scope: !2, file: !3, line: 32, type: !72, isLocal: false, isDefinition: true)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "debug_output", scope: !2, file: !3, line: 37, type: !103, isLocal: false, isDefinition: true)
!103 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !72)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(name: "netns_cookie", scope: !2, file: !3, line: 38, type: !103, isLocal: false, isDefinition: true)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "____fmt", scope: !109, file: !3, line: 146, type: !235, isLocal: true, isDefinition: true)
!109 = distinct !DISubprogram(name: "record_egress_pkt", scope: !3, file: !3, line: 133, type: !110, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !211)
!110 = !DISubroutineType(types: !111)
!111 = !{!72, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !114)
!114 = !{!115, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !132, !133, !134, !135, !136, !137, !138, !139, !140, !144, !145, !146, !147, !148, !185, !186, !187, !188, !210}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !113, file: !6, line: 4184, baseType: !116, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !55, line: 27, baseType: !7)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !113, file: !6, line: 4185, baseType: !116, size: 32, offset: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !113, file: !6, line: 4186, baseType: !116, size: 32, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !113, file: !6, line: 4187, baseType: !116, size: 32, offset: 96)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !113, file: !6, line: 4188, baseType: !116, size: 32, offset: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !113, file: !6, line: 4189, baseType: !116, size: 32, offset: 160)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !113, file: !6, line: 4190, baseType: !116, size: 32, offset: 192)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !113, file: !6, line: 4191, baseType: !116, size: 32, offset: 224)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !113, file: !6, line: 4192, baseType: !116, size: 32, offset: 256)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !113, file: !6, line: 4193, baseType: !116, size: 32, offset: 288)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !113, file: !6, line: 4194, baseType: !116, size: 32, offset: 320)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !113, file: !6, line: 4195, baseType: !116, size: 32, offset: 352)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !113, file: !6, line: 4196, baseType: !129, size: 160, offset: 384)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 160, elements: !130)
!130 = !{!131}
!131 = !DISubrange(count: 5)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !113, file: !6, line: 4197, baseType: !116, size: 32, offset: 544)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !113, file: !6, line: 4198, baseType: !116, size: 32, offset: 576)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !113, file: !6, line: 4199, baseType: !116, size: 32, offset: 608)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !113, file: !6, line: 4200, baseType: !116, size: 32, offset: 640)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !113, file: !6, line: 4201, baseType: !116, size: 32, offset: 672)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !113, file: !6, line: 4204, baseType: !116, size: 32, offset: 704)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !113, file: !6, line: 4205, baseType: !116, size: 32, offset: 736)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !113, file: !6, line: 4206, baseType: !116, size: 32, offset: 768)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !113, file: !6, line: 4207, baseType: !141, size: 128, offset: 800)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 128, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 4)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !113, file: !6, line: 4208, baseType: !141, size: 128, offset: 928)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !113, file: !6, line: 4209, baseType: !116, size: 32, offset: 1056)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !113, file: !6, line: 4210, baseType: !116, size: 32, offset: 1088)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !113, file: !6, line: 4213, baseType: !116, size: 32, offset: 1120)
!148 = !DIDerivedType(tag: DW_TAG_member, scope: !113, file: !6, line: 4214, baseType: !149, size: 64, align: 64, offset: 1152)
!149 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !113, file: !6, line: 4214, size: 64, align: 64, elements: !150)
!150 = !{!151}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !149, file: !6, line: 4214, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !154)
!154 = !{!155, !156, !157, !158, !161, !162, !163, !164, !167, !168, !169, !183, !184}
!155 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !153, file: !6, line: 5042, baseType: !54, size: 16)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !153, file: !6, line: 5043, baseType: !54, size: 16, offset: 16)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !153, file: !6, line: 5044, baseType: !54, size: 16, offset: 32)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !153, file: !6, line: 5045, baseType: !159, size: 8, offset: 48)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !55, line: 21, baseType: !160)
!160 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !153, file: !6, line: 5046, baseType: !159, size: 8, offset: 56)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !153, file: !6, line: 5047, baseType: !159, size: 8, offset: 64)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !153, file: !6, line: 5048, baseType: !159, size: 8, offset: 72)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !153, file: !6, line: 5049, baseType: !165, size: 16, offset: 80)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !166, line: 25, baseType: !54)
!166 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!167 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !153, file: !6, line: 5050, baseType: !165, size: 16, offset: 96)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !153, file: !6, line: 5051, baseType: !165, size: 16, offset: 112)
!169 = !DIDerivedType(tag: DW_TAG_member, scope: !153, file: !6, line: 5052, baseType: !170, size: 256, offset: 128)
!170 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !153, file: !6, line: 5052, size: 256, elements: !171)
!171 = !{!172, !178}
!172 = !DIDerivedType(tag: DW_TAG_member, scope: !170, file: !6, line: 5053, baseType: !173, size: 64)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !170, file: !6, line: 5053, size: 64, elements: !174)
!174 = !{!175, !177}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !173, file: !6, line: 5054, baseType: !176, size: 32)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !166, line: 27, baseType: !116)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !173, file: !6, line: 5055, baseType: !176, size: 32, offset: 32)
!178 = !DIDerivedType(tag: DW_TAG_member, scope: !170, file: !6, line: 5057, baseType: !179, size: 256)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !170, file: !6, line: 5057, size: 256, elements: !180)
!180 = !{!181, !182}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !179, file: !6, line: 5058, baseType: !141, size: 128)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !179, file: !6, line: 5059, baseType: !141, size: 128, offset: 128)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !153, file: !6, line: 5062, baseType: !116, size: 32, offset: 384)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !153, file: !6, line: 5063, baseType: !176, size: 32, offset: 416)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !113, file: !6, line: 4215, baseType: !58, size: 64, offset: 1216)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !113, file: !6, line: 4216, baseType: !116, size: 32, offset: 1280)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !113, file: !6, line: 4217, baseType: !116, size: 32, offset: 1312)
!188 = !DIDerivedType(tag: DW_TAG_member, scope: !113, file: !6, line: 4218, baseType: !189, size: 64, align: 64, offset: 1344)
!189 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !113, file: !6, line: 4218, size: 64, align: 64, elements: !190)
!190 = !{!191}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !189, file: !6, line: 4218, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !194)
!194 = !{!195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !193, file: !6, line: 4273, baseType: !116, size: 32)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !193, file: !6, line: 4274, baseType: !116, size: 32, offset: 32)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !193, file: !6, line: 4275, baseType: !116, size: 32, offset: 64)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !193, file: !6, line: 4276, baseType: !116, size: 32, offset: 96)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !193, file: !6, line: 4277, baseType: !116, size: 32, offset: 128)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !193, file: !6, line: 4278, baseType: !116, size: 32, offset: 160)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !193, file: !6, line: 4280, baseType: !116, size: 32, offset: 192)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !193, file: !6, line: 4281, baseType: !141, size: 128, offset: 224)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !193, file: !6, line: 4282, baseType: !116, size: 32, offset: 352)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !193, file: !6, line: 4283, baseType: !116, size: 32, offset: 384)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !193, file: !6, line: 4284, baseType: !116, size: 32, offset: 416)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !193, file: !6, line: 4285, baseType: !141, size: 128, offset: 448)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !193, file: !6, line: 4286, baseType: !116, size: 32, offset: 576)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !193, file: !6, line: 4287, baseType: !209, size: 32, offset: 608)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !55, line: 26, baseType: !72)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !113, file: !6, line: 4219, baseType: !116, size: 32, offset: 1408)
!211 = !{!212, !213, !221, !223, !224, !225, !226, !234}
!212 = !DILocalVariable(name: "skb", arg: 1, scope: !109, file: !3, line: 133, type: !112)
!213 = !DILocalVariable(name: "value", scope: !109, file: !3, line: 135, type: !214)
!214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pkt_loop_data", file: !215, line: 15, size: 192, elements: !216)
!215 = !DIFile(filename: "./pkt-loop-filter.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "752334828b203126fa75fa30edf98ac9")
!216 = !{!217, !218, !219, !220}
!217 = !DIDerivedType(tag: DW_TAG_member, name: "expiry_time", scope: !214, file: !215, line: 16, baseType: !58, size: 64)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "lock_time", scope: !214, file: !215, line: 17, baseType: !58, size: 64, offset: 64)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !214, file: !215, line: 18, baseType: !116, size: 32, offset: 128)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "drops", scope: !214, file: !215, line: 19, baseType: !116, size: 32, offset: 160)
!221 = !DILocalVariable(name: "v", scope: !109, file: !3, line: 135, type: !222)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!223 = !DILocalVariable(name: "pkt_type", scope: !109, file: !3, line: 136, type: !72)
!224 = !DILocalVariable(name: "act_ifindex", scope: !109, file: !3, line: 136, type: !72)
!225 = !DILocalVariable(name: "now", scope: !109, file: !3, line: 137, type: !58)
!226 = !DILocalVariable(name: "key", scope: !109, file: !3, line: 138, type: !227)
!227 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pkt_loop_key", file: !215, line: 10, size: 64, elements: !228)
!228 = !{!229, !233}
!229 = !DIDerivedType(tag: DW_TAG_member, name: "src_mac", scope: !227, file: !215, line: 11, baseType: !230, size: 48)
!230 = !DICompositeType(tag: DW_TAG_array_type, baseType: !159, size: 48, elements: !231)
!231 = !{!232}
!232 = !DISubrange(count: 6)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "src_vlan", scope: !227, file: !215, line: 12, baseType: !54, size: 16, offset: 48)
!234 = !DILabel(scope: !109, name: "out", file: !3, line: 162)
!235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !236, size: 312, elements: !237)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!237 = !{!238}
!238 = !DISubrange(count: 39)
!239 = !DIGlobalVariableExpression(var: !240, expr: !DIExpression())
!240 = distinct !DIGlobalVariable(name: "____fmt", scope: !241, file: !3, line: 194, type: !260, isLocal: true, isDefinition: true)
!241 = distinct !DISubprogram(name: "filter_ingress_pkt", scope: !3, file: !3, line: 167, type: !110, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!242 = !{!243, !244, !245, !246, !247, !248, !249, !250, !253, !259}
!243 = !DILocalVariable(name: "skb", arg: 1, scope: !241, file: !3, line: 167, type: !112)
!244 = !DILocalVariable(name: "pkt_type", scope: !241, file: !3, line: 169, type: !72)
!245 = !DILocalVariable(name: "act_ifindex", scope: !241, file: !3, line: 169, type: !72)
!246 = !DILocalVariable(name: "now", scope: !241, file: !3, line: 170, type: !58)
!247 = !DILocalVariable(name: "value", scope: !241, file: !3, line: 171, type: !222)
!248 = !DILocalVariable(name: "key", scope: !241, file: !3, line: 172, type: !227)
!249 = !DILocalVariable(name: "print_key", scope: !241, file: !3, line: 173, type: !58)
!250 = !DILocalVariable(name: "pkey", scope: !251, file: !3, line: 180, type: !227)
!251 = distinct !DILexicalBlock(scope: !252, file: !3, line: 179, column: 20)
!252 = distinct !DILexicalBlock(scope: !241, file: !3, line: 179, column: 6)
!253 = !DILocalVariable(name: "___param", scope: !254, file: !3, line: 207, type: !258)
!254 = distinct !DILexicalBlock(scope: !255, file: !3, line: 207, column: 4)
!255 = distinct !DILexicalBlock(scope: !256, file: !3, line: 201, column: 7)
!256 = distinct !DILexicalBlock(scope: !257, file: !3, line: 190, column: 41)
!257 = distinct !DILexicalBlock(scope: !241, file: !3, line: 190, column: 6)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 256, elements: !142)
!259 = !DILabel(scope: !241, name: "out", file: !3, line: 220)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !236, size: 488, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 61)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(name: "___fmt", scope: !241, file: !3, line: 207, type: !265, isLocal: true, isDefinition: true)
!265 = !DICompositeType(tag: DW_TAG_array_type, baseType: !236, size: 792, elements: !266)
!266 = !{!267}
!267 = !DISubrange(count: 99)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(name: "____fmt", scope: !241, file: !3, line: 215, type: !270, isLocal: true, isDefinition: true)
!270 = !DICompositeType(tag: DW_TAG_array_type, baseType: !236, size: 424, elements: !271)
!271 = !{!272}
!272 = !DISubrange(count: 53)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 249, type: !275, isLocal: false, isDefinition: true)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 32, elements: !142)
!276 = !DIGlobalVariableExpression(var: !277, expr: !DIExpression())
!277 = distinct !DIGlobalVariable(name: "iface_state", scope: !2, file: !3, line: 29, type: !278, isLocal: false, isDefinition: true)
!278 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 24, size: 256, elements: !279)
!279 = !{!280, !285, !287, !288}
!280 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !278, file: !3, line: 25, baseType: !281, size: 64)
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64)
!282 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 288, elements: !283)
!283 = !{!284}
!284 = !DISubrange(count: 9)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !278, file: !3, line: 26, baseType: !286, size: 64, offset: 64)
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !227, size: 64)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !278, file: !3, line: 27, baseType: !222, size: 64, offset: 128)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !278, file: !3, line: 28, baseType: !289, size: 64, offset: 192)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 32, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 1)
!293 = !DIGlobalVariableExpression(var: !294, expr: !DIExpression())
!294 = distinct !DIGlobalVariable(name: "bpf_ktime_get_boot_ns", scope: !2, file: !295, line: 3031, type: !296, isLocal: true, isDefinition: true)
!295 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !297, size: 64)
!297 = !DISubroutineType(types: !298)
!298 = !{!58}
!299 = !DIGlobalVariableExpression(var: !300, expr: !DIExpression())
!300 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !295, line: 176, type: !301, isLocal: true, isDefinition: true)
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = !DISubroutineType(types: !303)
!303 = !{!304, !305, !116, null}
!304 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!306 = !DIGlobalVariableExpression(var: !307, expr: !DIExpression())
!307 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !295, line: 615, type: !308, isLocal: true, isDefinition: true)
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!309 = !DISubroutineType(types: !310)
!310 = !{!304, !116, !58}
!311 = !DIGlobalVariableExpression(var: !312, expr: !DIExpression())
!312 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !295, line: 55, type: !313, isLocal: true, isDefinition: true)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!314 = !DISubroutineType(types: !315)
!315 = !{!60, !60, !86}
!316 = !DIGlobalVariableExpression(var: !317, expr: !DIExpression())
!317 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !295, line: 77, type: !318, isLocal: true, isDefinition: true)
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!319 = !DISubroutineType(types: !320)
!320 = !{!304, !60, !86, !86, !58}
!321 = !DIGlobalVariableExpression(var: !322, expr: !DIExpression())
!322 = distinct !DIGlobalVariable(name: "bpf_trace_vprintk", scope: !2, file: !295, line: 4112, type: !323, isLocal: true, isDefinition: true)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = !DISubroutineType(types: !325)
!325 = !{!304, !305, !116, !86, !116}
!326 = !DIGlobalVariableExpression(var: !327, expr: !DIExpression())
!327 = distinct !DIGlobalVariable(name: "____fmt", scope: !328, file: !3, line: 242, type: !235, isLocal: true, isDefinition: true)
!328 = distinct !DISubprogram(name: "____handle_change_slave", scope: !3, file: !3, line: 225, type: !329, scopeLine: 226, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !357)
!329 = !DISubroutineType(types: !330)
!330 = !{!72, !331, !63, !82}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64)
!332 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pt_regs", file: !333, line: 41, size: 1344, elements: !334)
!333 = !DIFile(filename: "/usr/include/asm/ptrace.h", directory: "", checksumkind: CSK_MD5, checksum: "d091e897972e0058ad5ca62f6e366c3e")
!334 = !{!335, !337, !338, !339, !340, !341, !342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !353, !354, !355, !356}
!335 = !DIDerivedType(tag: DW_TAG_member, name: "r15", scope: !332, file: !333, line: 46, baseType: !336, size: 64)
!336 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "r14", scope: !332, file: !333, line: 47, baseType: !336, size: 64, offset: 64)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "r13", scope: !332, file: !333, line: 48, baseType: !336, size: 64, offset: 128)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "r12", scope: !332, file: !333, line: 49, baseType: !336, size: 64, offset: 192)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "rbp", scope: !332, file: !333, line: 50, baseType: !336, size: 64, offset: 256)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "rbx", scope: !332, file: !333, line: 51, baseType: !336, size: 64, offset: 320)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "r11", scope: !332, file: !333, line: 53, baseType: !336, size: 64, offset: 384)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "r10", scope: !332, file: !333, line: 54, baseType: !336, size: 64, offset: 448)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "r9", scope: !332, file: !333, line: 55, baseType: !336, size: 64, offset: 512)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "r8", scope: !332, file: !333, line: 56, baseType: !336, size: 64, offset: 576)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "rax", scope: !332, file: !333, line: 57, baseType: !336, size: 64, offset: 640)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "rcx", scope: !332, file: !333, line: 58, baseType: !336, size: 64, offset: 704)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "rdx", scope: !332, file: !333, line: 59, baseType: !336, size: 64, offset: 768)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "rsi", scope: !332, file: !333, line: 60, baseType: !336, size: 64, offset: 832)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "rdi", scope: !332, file: !333, line: 61, baseType: !336, size: 64, offset: 896)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "orig_rax", scope: !332, file: !333, line: 66, baseType: !336, size: 64, offset: 960)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "rip", scope: !332, file: !333, line: 68, baseType: !336, size: 64, offset: 1024)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "cs", scope: !332, file: !333, line: 69, baseType: !336, size: 64, offset: 1088)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "eflags", scope: !332, file: !333, line: 70, baseType: !336, size: 64, offset: 1152)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "rsp", scope: !332, file: !333, line: 71, baseType: !336, size: 64, offset: 1216)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "ss", scope: !332, file: !333, line: 72, baseType: !336, size: 64, offset: 1280)
!357 = !{!358, !359, !360, !361, !362, !364, !365, !367, !368, !370, !371, !374, !375, !377}
!358 = !DILocalVariable(name: "ctx", arg: 1, scope: !328, file: !3, line: 225, type: !331)
!359 = !DILocalVariable(name: "bond", arg: 2, scope: !328, file: !3, line: 225, type: !63)
!360 = !DILocalVariable(name: "new_active", arg: 3, scope: !328, file: !3, line: 225, type: !82)
!361 = !DILocalVariable(name: "dev", scope: !328, file: !3, line: 227, type: !68)
!362 = !DILocalVariable(name: "__r", scope: !363, file: !3, line: 227, type: !68)
!363 = distinct !DILexicalBlock(scope: !328, file: !3, line: 227, column: 34)
!364 = !DILocalVariable(name: "net", scope: !328, file: !3, line: 228, type: !77)
!365 = !DILocalVariable(name: "__r", scope: !366, file: !3, line: 228, type: !77)
!366 = distinct !DILexicalBlock(scope: !328, file: !3, line: 228, column: 20)
!367 = !DILocalVariable(name: "ifindex", scope: !328, file: !3, line: 229, type: !72)
!368 = !DILocalVariable(name: "__r", scope: !369, file: !3, line: 229, type: !72)
!369 = distinct !DILexicalBlock(scope: !328, file: !3, line: 229, column: 16)
!370 = !DILocalVariable(name: "cookie", scope: !328, file: !3, line: 230, type: !58)
!371 = !DILocalVariable(name: "new_dev", scope: !372, file: !3, line: 234, type: !68)
!372 = distinct !DILexicalBlock(scope: !373, file: !3, line: 233, column: 78)
!373 = distinct !DILexicalBlock(scope: !328, file: !3, line: 233, column: 13)
!374 = !DILocalVariable(name: "ifindex", scope: !372, file: !3, line: 235, type: !72)
!375 = !DILocalVariable(name: "__r", scope: !376, file: !3, line: 237, type: !68)
!376 = distinct !DILexicalBlock(scope: !372, file: !3, line: 237, column: 13)
!377 = !DILocalVariable(name: "__r", scope: !378, file: !3, line: 238, type: !72)
!378 = distinct !DILexicalBlock(scope: !372, file: !3, line: 238, column: 13)
!379 = !DIGlobalVariableExpression(var: !380, expr: !DIExpression())
!380 = distinct !DIGlobalVariable(name: "bpf_probe_read", scope: !2, file: !295, line: 101, type: !381, isLocal: true, isDefinition: true)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!382 = !DISubroutineType(types: !383)
!383 = !{!304, !60, !116, !86}
!384 = !DIGlobalVariableExpression(var: !385, expr: !DIExpression())
!385 = distinct !DIGlobalVariable(name: "bpf_probe_read_kernel", scope: !2, file: !295, line: 2779, type: !381, isLocal: true, isDefinition: true)
!386 = !{i32 7, !"Dwarf Version", i32 5}
!387 = !{i32 2, !"Debug Info Version", i32 3}
!388 = !{i32 1, !"wchar_size", i32 4}
!389 = !{i32 7, !"frame-pointer", i32 2}
!390 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!391 = !DILocation(line: 0, scope: !109)
!392 = !DILocation(line: 135, column: 2, scope: !109)
!393 = !DILocation(line: 135, column: 23, scope: !109)
!394 = !DILocation(line: 135, column: 31, scope: !109)
!395 = !DILocation(line: 135, column: 49, scope: !109)
!396 = !{!397, !398, i64 40}
!397 = !{!"__sk_buff", !398, i64 0, !398, i64 4, !398, i64 8, !398, i64 12, !398, i64 16, !398, i64 20, !398, i64 24, !398, i64 28, !398, i64 32, !398, i64 36, !398, i64 40, !398, i64 44, !399, i64 48, !398, i64 68, !398, i64 72, !398, i64 76, !398, i64 80, !398, i64 84, !398, i64 88, !398, i64 92, !398, i64 96, !399, i64 100, !399, i64 116, !398, i64 132, !398, i64 136, !398, i64 140, !399, i64 144, !401, i64 152, !398, i64 160, !398, i64 164, !399, i64 168, !398, i64 176}
!398 = !{!"int", !399, i64 0}
!399 = !{!"omnipotent char", !400, i64 0}
!400 = !{!"Simple C/C++ TBAA"}
!401 = !{!"long long", !399, i64 0}
!402 = !{!403, !398, i64 16}
!403 = !{!"pkt_loop_data", !401, i64 0, !401, i64 8, !398, i64 16, !398, i64 20}
!404 = !DILocation(line: 136, column: 30, scope: !109)
!405 = !{!398, !398, i64 0}
!406 = !DILocation(line: 137, column: 14, scope: !109)
!407 = !DILocation(line: 138, column: 2, scope: !109)
!408 = !DILocation(line: 138, column: 22, scope: !109)
!409 = !DILocation(line: 140, column: 13, scope: !109)
!410 = !DILocation(line: 141, column: 15, scope: !411)
!411 = distinct !DILexicalBlock(scope: !109, file: !3, line: 141, column: 6)
!412 = !DILocation(line: 141, column: 6, scope: !109)
!413 = !DILocation(line: 144, column: 15, scope: !414)
!414 = distinct !DILexicalBlock(scope: !109, file: !3, line: 144, column: 6)
!415 = !DILocation(line: 144, column: 32, scope: !414)
!416 = !DILocation(line: 144, column: 40, scope: !414)
!417 = !DILocation(line: 144, column: 48, scope: !414)
!418 = !DILocation(line: 144, column: 6, scope: !109)
!419 = !DILocation(line: 145, column: 7, scope: !420)
!420 = distinct !DILexicalBlock(scope: !421, file: !3, line: 145, column: 7)
!421 = distinct !DILexicalBlock(scope: !414, file: !3, line: 144, column: 64)
!422 = !DILocation(line: 145, column: 7, scope: !421)
!423 = !DILocation(line: 146, column: 4, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !3, line: 146, column: 4)
!425 = !DILocation(line: 146, column: 4, scope: !420)
!426 = !DILocation(line: 148, column: 10, scope: !421)
!427 = !DILocation(line: 148, column: 3, scope: !421)
!428 = !DILocation(line: 151, column: 6, scope: !109)
!429 = !DILocation(line: 152, column: 7, scope: !430)
!430 = distinct !DILexicalBlock(scope: !109, file: !3, line: 152, column: 6)
!431 = !DILocation(line: 152, column: 6, scope: !109)
!432 = !DILocation(line: 153, column: 3, scope: !433)
!433 = distinct !DILexicalBlock(scope: !430, file: !3, line: 152, column: 10)
!434 = !DILocation(line: 154, column: 7, scope: !433)
!435 = !DILocation(line: 155, column: 8, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !3, line: 155, column: 7)
!437 = !DILocation(line: 155, column: 7, scope: !433)
!438 = !DILocation(line: 158, column: 23, scope: !109)
!439 = !DILocation(line: 158, column: 5, scope: !109)
!440 = !DILocation(line: 158, column: 17, scope: !109)
!441 = !{!403, !401, i64 0}
!442 = !DILocation(line: 159, column: 15, scope: !443)
!443 = distinct !DILexicalBlock(scope: !109, file: !3, line: 159, column: 6)
!444 = !DILocation(line: 159, column: 6, scope: !109)
!445 = !DILocation(line: 160, column: 22, scope: !443)
!446 = !DILocation(line: 160, column: 6, scope: !443)
!447 = !DILocation(line: 160, column: 16, scope: !443)
!448 = !{!403, !401, i64 8}
!449 = !DILocation(line: 160, column: 3, scope: !443)
!450 = !DILocation(line: 161, column: 20, scope: !109)
!451 = !DILocation(line: 161, column: 5, scope: !109)
!452 = !DILocation(line: 161, column: 13, scope: !109)
!453 = !DILocation(line: 161, column: 2, scope: !109)
!454 = !DILocation(line: 164, column: 1, scope: !109)
!455 = distinct !DISubprogram(name: "parse_pkt", scope: !3, file: !3, line: 77, type: !456, scopeLine: 78, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !458)
!456 = !DISubroutineType(types: !457)
!457 = !{!72, !112, !286}
!458 = !{!459, !460, !461, !462, !463, !468, !469, !470, !479, !509, !552, !595, !596}
!459 = !DILocalVariable(name: "skb", arg: 1, scope: !455, file: !3, line: 77, type: !112)
!460 = !DILocalVariable(name: "key", arg: 2, scope: !455, file: !3, line: 77, type: !286)
!461 = !DILocalVariable(name: "data_end", scope: !455, file: !3, line: 79, type: !60)
!462 = !DILocalVariable(name: "data", scope: !455, file: !3, line: 80, type: !60)
!463 = !DILocalVariable(name: "nh", scope: !455, file: !3, line: 81, type: !464)
!464 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !465, line: 35, size: 64, elements: !466)
!465 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!466 = !{!467}
!467 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !464, file: !465, line: 36, baseType: !60, size: 64)
!468 = !DILocalVariable(name: "eth_type", scope: !455, file: !3, line: 82, type: !72)
!469 = !DILocalVariable(name: "ip_type", scope: !455, file: !3, line: 82, type: !72)
!470 = !DILocalVariable(name: "eth", scope: !455, file: !3, line: 83, type: !471)
!471 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !472, size: 64)
!472 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !473, line: 168, size: 112, elements: !474)
!473 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!474 = !{!475, !477, !478}
!475 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !472, file: !473, line: 169, baseType: !476, size: 48)
!476 = !DICompositeType(tag: DW_TAG_array_type, baseType: !160, size: 48, elements: !231)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !472, file: !473, line: 170, baseType: !476, size: 48, offset: 48)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !472, file: !473, line: 171, baseType: !165, size: 16, offset: 96)
!479 = !DILocalVariable(name: "iph", scope: !480, file: !3, line: 96, type: !482)
!480 = distinct !DILexicalBlock(scope: !481, file: !3, line: 95, column: 3)
!481 = distinct !DILexicalBlock(scope: !455, file: !3, line: 93, column: 19)
!482 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 64)
!483 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !484, line: 87, size: 160, elements: !485)
!484 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!485 = !{!486, !487, !488, !489, !490, !491, !492, !493, !494, !496}
!486 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !483, file: !484, line: 89, baseType: !159, size: 4, flags: DIFlagBitField, extraData: i64 0)
!487 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !483, file: !484, line: 90, baseType: !159, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!488 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !483, file: !484, line: 97, baseType: !159, size: 8, offset: 8)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !483, file: !484, line: 98, baseType: !165, size: 16, offset: 16)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !483, file: !484, line: 99, baseType: !165, size: 16, offset: 32)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !483, file: !484, line: 100, baseType: !165, size: 16, offset: 48)
!492 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !483, file: !484, line: 101, baseType: !159, size: 8, offset: 64)
!493 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !483, file: !484, line: 102, baseType: !159, size: 8, offset: 72)
!494 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !483, file: !484, line: 103, baseType: !495, size: 16, offset: 80)
!495 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !166, line: 31, baseType: !54)
!496 = !DIDerivedType(tag: DW_TAG_member, scope: !483, file: !484, line: 104, baseType: !497, size: 64, offset: 96)
!497 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !483, file: !484, line: 104, size: 64, elements: !498)
!498 = !{!499, !504}
!499 = !DIDerivedType(tag: DW_TAG_member, scope: !497, file: !484, line: 104, baseType: !500, size: 64)
!500 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !497, file: !484, line: 104, size: 64, elements: !501)
!501 = !{!502, !503}
!502 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !500, file: !484, line: 104, baseType: !176, size: 32)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !500, file: !484, line: 104, baseType: !176, size: 32, offset: 32)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !497, file: !484, line: 104, baseType: !505, size: 64)
!505 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !497, file: !484, line: 104, size: 64, elements: !506)
!506 = !{!507, !508}
!507 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !505, file: !484, line: 104, baseType: !176, size: 32)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !505, file: !484, line: 104, baseType: !176, size: 32, offset: 32)
!509 = !DILocalVariable(name: "icmp6", scope: !510, file: !3, line: 107, type: !511)
!510 = distinct !DILexicalBlock(scope: !481, file: !3, line: 106, column: 3)
!511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !512, size: 64)
!512 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !513, line: 8, size: 64, elements: !514)
!513 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!514 = !{!515, !516, !517, !518}
!515 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !512, file: !513, line: 10, baseType: !159, size: 8)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !512, file: !513, line: 11, baseType: !159, size: 8, offset: 8)
!517 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !512, file: !513, line: 12, baseType: !495, size: 16, offset: 16)
!518 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !512, file: !513, line: 63, baseType: !519, size: 32, offset: 32)
!519 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !512, file: !513, line: 15, size: 32, elements: !520)
!520 = !{!521, !523, !527, !529, !534, !542}
!521 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !519, file: !513, line: 16, baseType: !522, size: 32)
!522 = !DICompositeType(tag: DW_TAG_array_type, baseType: !176, size: 32, elements: !291)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !519, file: !513, line: 17, baseType: !524, size: 32)
!524 = !DICompositeType(tag: DW_TAG_array_type, baseType: !165, size: 32, elements: !525)
!525 = !{!526}
!526 = !DISubrange(count: 2)
!527 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !519, file: !513, line: 18, baseType: !528, size: 32)
!528 = !DICompositeType(tag: DW_TAG_array_type, baseType: !159, size: 32, elements: !142)
!529 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !519, file: !513, line: 23, baseType: !530, size: 32)
!530 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !513, line: 20, size: 32, elements: !531)
!531 = !{!532, !533}
!532 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !530, file: !513, line: 21, baseType: !165, size: 16)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !530, file: !513, line: 22, baseType: !165, size: 16, offset: 16)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !519, file: !513, line: 40, baseType: !535, size: 32)
!535 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !513, line: 25, size: 32, elements: !536)
!536 = !{!537, !538, !539, !540, !541}
!537 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !535, file: !513, line: 27, baseType: !116, size: 5, flags: DIFlagBitField, extraData: i64 0)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !535, file: !513, line: 28, baseType: !116, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !535, file: !513, line: 29, baseType: !116, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !535, file: !513, line: 30, baseType: !116, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !535, file: !513, line: 31, baseType: !116, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !519, file: !513, line: 61, baseType: !543, size: 32)
!543 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !513, line: 42, size: 32, elements: !544)
!544 = !{!545, !546, !547, !548, !549, !550, !551}
!545 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !543, file: !513, line: 43, baseType: !159, size: 8)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !543, file: !513, line: 45, baseType: !159, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!547 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !543, file: !513, line: 46, baseType: !159, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !543, file: !513, line: 47, baseType: !159, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !543, file: !513, line: 48, baseType: !159, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!550 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !543, file: !513, line: 49, baseType: !159, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !543, file: !513, line: 60, baseType: !165, size: 16, offset: 16)
!552 = !DILocalVariable(name: "ip6h", scope: !510, file: !3, line: 108, type: !553)
!553 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !554, size: 64)
!554 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !555, line: 118, size: 320, elements: !556)
!555 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!556 = !{!557, !558, !559, !563, !564, !565, !566}
!557 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !554, file: !555, line: 120, baseType: !159, size: 4, flags: DIFlagBitField, extraData: i64 0)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !554, file: !555, line: 121, baseType: !159, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !554, file: !555, line: 128, baseType: !560, size: 24, offset: 8)
!560 = !DICompositeType(tag: DW_TAG_array_type, baseType: !159, size: 24, elements: !561)
!561 = !{!562}
!562 = !DISubrange(count: 3)
!563 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !554, file: !555, line: 130, baseType: !165, size: 16, offset: 32)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !554, file: !555, line: 131, baseType: !159, size: 8, offset: 48)
!565 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !554, file: !555, line: 132, baseType: !159, size: 8, offset: 56)
!566 = !DIDerivedType(tag: DW_TAG_member, scope: !554, file: !555, line: 134, baseType: !567, size: 256, offset: 64)
!567 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !554, file: !555, line: 134, size: 256, elements: !568)
!568 = !{!569, !590}
!569 = !DIDerivedType(tag: DW_TAG_member, scope: !567, file: !555, line: 134, baseType: !570, size: 256)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !567, file: !555, line: 134, size: 256, elements: !571)
!571 = !{!572, !589}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !570, file: !555, line: 134, baseType: !573, size: 128)
!573 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !574, line: 33, size: 128, elements: !575)
!574 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!575 = !{!576}
!576 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !573, file: !574, line: 40, baseType: !577, size: 128)
!577 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !573, file: !574, line: 34, size: 128, elements: !578)
!578 = !{!579, !583, !587}
!579 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !577, file: !574, line: 35, baseType: !580, size: 128)
!580 = !DICompositeType(tag: DW_TAG_array_type, baseType: !159, size: 128, elements: !581)
!581 = !{!582}
!582 = !DISubrange(count: 16)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !577, file: !574, line: 37, baseType: !584, size: 128)
!584 = !DICompositeType(tag: DW_TAG_array_type, baseType: !165, size: 128, elements: !585)
!585 = !{!586}
!586 = !DISubrange(count: 8)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !577, file: !574, line: 38, baseType: !588, size: 128)
!588 = !DICompositeType(tag: DW_TAG_array_type, baseType: !176, size: 128, elements: !142)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !570, file: !555, line: 134, baseType: !573, size: 128, offset: 128)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !567, file: !555, line: 134, baseType: !591, size: 256)
!591 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !567, file: !555, line: 134, size: 256, elements: !592)
!592 = !{!593, !594}
!593 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !591, file: !555, line: 134, baseType: !573, size: 128)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !591, file: !555, line: 134, baseType: !573, size: 128, offset: 128)
!595 = !DILocalVariable(name: "icmp6_type", scope: !510, file: !3, line: 109, type: !72)
!596 = !DILabel(scope: !455, name: "out", file: !3, line: 128)
!597 = !DILocation(line: 0, scope: !455)
!598 = !DILocation(line: 79, column: 52, scope: !455)
!599 = !{!397, !398, i64 80}
!600 = !DILocation(line: 79, column: 27, scope: !455)
!601 = !DILocation(line: 79, column: 19, scope: !455)
!602 = !DILocation(line: 80, column: 48, scope: !455)
!603 = !{!397, !398, i64 76}
!604 = !DILocation(line: 80, column: 23, scope: !455)
!605 = !DILocation(line: 80, column: 15, scope: !455)
!606 = !DILocalVariable(name: "nh", arg: 1, scope: !607, file: !465, line: 131, type: !610)
!607 = distinct !DISubprogram(name: "parse_ethhdr", scope: !465, file: !465, line: 131, type: !608, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !612)
!608 = !DISubroutineType(types: !609)
!609 = !{!72, !610, !60, !611}
!610 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !471, size: 64)
!612 = !{!606, !613, !614}
!613 = !DILocalVariable(name: "data_end", arg: 2, scope: !607, file: !465, line: 132, type: !60)
!614 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !607, file: !465, line: 133, type: !611)
!615 = !DILocation(line: 0, scope: !607, inlinedAt: !616)
!616 = distinct !DILocation(line: 86, column: 13, scope: !455)
!617 = !DILocalVariable(name: "nh", arg: 1, scope: !618, file: !465, line: 86, type: !610)
!618 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !465, file: !465, line: 86, type: !619, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !626)
!619 = !DISubroutineType(types: !620)
!620 = !{!72, !610, !60, !611, !621}
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64)
!622 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !465, line: 71, size: 32, elements: !623)
!623 = !{!624}
!624 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !622, file: !465, line: 72, baseType: !625, size: 32)
!625 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 32, elements: !525)
!626 = !{!617, !627, !628, !629, !630, !631, !632, !638, !639}
!627 = !DILocalVariable(name: "data_end", arg: 2, scope: !618, file: !465, line: 87, type: !60)
!628 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !618, file: !465, line: 88, type: !611)
!629 = !DILocalVariable(name: "vlans", arg: 4, scope: !618, file: !465, line: 89, type: !621)
!630 = !DILocalVariable(name: "eth", scope: !618, file: !465, line: 91, type: !471)
!631 = !DILocalVariable(name: "hdrsize", scope: !618, file: !465, line: 92, type: !72)
!632 = !DILocalVariable(name: "vlh", scope: !618, file: !465, line: 93, type: !633)
!633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !634, size: 64)
!634 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !465, line: 44, size: 32, elements: !635)
!635 = !{!636, !637}
!636 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !634, file: !465, line: 45, baseType: !165, size: 16)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !634, file: !465, line: 46, baseType: !165, size: 16, offset: 16)
!638 = !DILocalVariable(name: "h_proto", scope: !618, file: !465, line: 94, type: !54)
!639 = !DILocalVariable(name: "i", scope: !618, file: !465, line: 95, type: !72)
!640 = !DILocation(line: 0, scope: !618, inlinedAt: !641)
!641 = distinct !DILocation(line: 136, column: 9, scope: !607, inlinedAt: !616)
!642 = !DILocation(line: 100, column: 14, scope: !643, inlinedAt: !641)
!643 = distinct !DILexicalBlock(scope: !618, file: !465, line: 100, column: 6)
!644 = !DILocation(line: 100, column: 24, scope: !643, inlinedAt: !641)
!645 = !DILocation(line: 100, column: 6, scope: !618, inlinedAt: !641)
!646 = !DILocation(line: 104, column: 10, scope: !618, inlinedAt: !641)
!647 = !DILocation(line: 106, column: 17, scope: !618, inlinedAt: !641)
!648 = !{!649, !649, i64 0}
!649 = !{!"short", !399, i64 0}
!650 = !DILocalVariable(name: "h_proto", arg: 1, scope: !651, file: !465, line: 75, type: !54)
!651 = distinct !DISubprogram(name: "proto_is_vlan", scope: !465, file: !465, line: 75, type: !652, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !654)
!652 = !DISubroutineType(types: !653)
!653 = !{!72, !54}
!654 = !{!650}
!655 = !DILocation(line: 0, scope: !651, inlinedAt: !656)
!656 = distinct !DILocation(line: 113, column: 8, scope: !657, inlinedAt: !641)
!657 = distinct !DILexicalBlock(scope: !658, file: !465, line: 113, column: 7)
!658 = distinct !DILexicalBlock(scope: !659, file: !465, line: 112, column: 39)
!659 = distinct !DILexicalBlock(scope: !660, file: !465, line: 112, column: 2)
!660 = distinct !DILexicalBlock(scope: !618, file: !465, line: 112, column: 2)
!661 = !DILocation(line: 77, column: 20, scope: !651, inlinedAt: !656)
!662 = !DILocation(line: 77, column: 46, scope: !651, inlinedAt: !656)
!663 = !DILocation(line: 113, column: 8, scope: !657, inlinedAt: !641)
!664 = !DILocation(line: 113, column: 7, scope: !658, inlinedAt: !641)
!665 = !DILocation(line: 119, column: 18, scope: !658, inlinedAt: !641)
!666 = !DILocation(line: 90, column: 2, scope: !455)
!667 = !DILocation(line: 91, column: 23, scope: !455)
!668 = !{!397, !398, i64 24}
!669 = !DILocation(line: 91, column: 18, scope: !455)
!670 = !DILocation(line: 91, column: 7, scope: !455)
!671 = !DILocation(line: 91, column: 16, scope: !455)
!672 = !{!673, !649, i64 6}
!673 = !{!"pkt_loop_key", !399, i64 0, !649, i64 6}
!674 = !DILocation(line: 93, column: 2, scope: !455)
!675 = !DILocation(line: 0, scope: !480)
!676 = !DILocalVariable(name: "nh", arg: 1, scope: !677, file: !465, line: 196, type: !610)
!677 = distinct !DISubprogram(name: "parse_iphdr", scope: !465, file: !465, line: 196, type: !678, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !681)
!678 = !DISubroutineType(types: !679)
!679 = !{!72, !610, !60, !680}
!680 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !482, size: 64)
!681 = !{!676, !682, !683, !684, !685}
!682 = !DILocalVariable(name: "data_end", arg: 2, scope: !677, file: !465, line: 197, type: !60)
!683 = !DILocalVariable(name: "iphdr", arg: 3, scope: !677, file: !465, line: 198, type: !680)
!684 = !DILocalVariable(name: "iph", scope: !677, file: !465, line: 200, type: !482)
!685 = !DILocalVariable(name: "hdrsize", scope: !677, file: !465, line: 201, type: !72)
!686 = !DILocation(line: 0, scope: !677, inlinedAt: !687)
!687 = distinct !DILocation(line: 98, column: 14, scope: !480)
!688 = !DILocation(line: 203, column: 10, scope: !689, inlinedAt: !687)
!689 = distinct !DILexicalBlock(scope: !677, file: !465, line: 203, column: 6)
!690 = !DILocation(line: 203, column: 14, scope: !689, inlinedAt: !687)
!691 = !DILocation(line: 203, column: 6, scope: !677, inlinedAt: !687)
!692 = !DILocation(line: 206, column: 11, scope: !693, inlinedAt: !687)
!693 = distinct !DILexicalBlock(scope: !677, file: !465, line: 206, column: 6)
!694 = !DILocation(line: 206, column: 19, scope: !693, inlinedAt: !687)
!695 = !DILocation(line: 206, column: 6, scope: !677, inlinedAt: !687)
!696 = !DILocation(line: 209, column: 21, scope: !677, inlinedAt: !687)
!697 = !DILocation(line: 211, column: 13, scope: !698, inlinedAt: !687)
!698 = distinct !DILexicalBlock(scope: !677, file: !465, line: 211, column: 5)
!699 = !DILocation(line: 211, column: 5, scope: !677, inlinedAt: !687)
!700 = !DILocation(line: 215, column: 14, scope: !701, inlinedAt: !687)
!701 = distinct !DILexicalBlock(scope: !677, file: !465, line: 215, column: 6)
!702 = !DILocation(line: 215, column: 24, scope: !701, inlinedAt: !687)
!703 = !DILocation(line: 215, column: 6, scope: !677, inlinedAt: !687)
!704 = !DILocation(line: 221, column: 14, scope: !677, inlinedAt: !687)
!705 = !{!706, !399, i64 9}
!706 = !{!"iphdr", !399, i64 0, !399, i64 0, !399, i64 1, !649, i64 2, !649, i64 4, !649, i64 6, !399, i64 8, !399, i64 9, !649, i64 10, !399, i64 12}
!707 = !DILocation(line: 99, column: 16, scope: !708)
!708 = distinct !DILexicalBlock(scope: !480, file: !3, line: 99, column: 8)
!709 = !DILocation(line: 0, scope: !510)
!710 = !DILocalVariable(name: "nh", arg: 1, scope: !711, file: !465, line: 174, type: !610)
!711 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !465, file: !465, line: 174, type: !712, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !715)
!712 = !DISubroutineType(types: !713)
!713 = !{!72, !610, !60, !714}
!714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !553, size: 64)
!715 = !{!710, !716, !717, !718}
!716 = !DILocalVariable(name: "data_end", arg: 2, scope: !711, file: !465, line: 175, type: !60)
!717 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !711, file: !465, line: 176, type: !714)
!718 = !DILocalVariable(name: "ip6h", scope: !711, file: !465, line: 178, type: !553)
!719 = !DILocation(line: 0, scope: !711, inlinedAt: !720)
!720 = distinct !DILocation(line: 111, column: 14, scope: !510)
!721 = !DILocation(line: 184, column: 11, scope: !722, inlinedAt: !720)
!722 = distinct !DILexicalBlock(scope: !711, file: !465, line: 184, column: 6)
!723 = !DILocation(line: 184, column: 15, scope: !722, inlinedAt: !720)
!724 = !DILocation(line: 184, column: 6, scope: !711, inlinedAt: !720)
!725 = !DILocation(line: 187, column: 12, scope: !726, inlinedAt: !720)
!726 = distinct !DILexicalBlock(scope: !711, file: !465, line: 187, column: 6)
!727 = !DILocation(line: 187, column: 20, scope: !726, inlinedAt: !720)
!728 = !DILocation(line: 187, column: 6, scope: !711, inlinedAt: !720)
!729 = !DILocation(line: 193, column: 44, scope: !711, inlinedAt: !720)
!730 = !{!731, !399, i64 6}
!731 = !{!"ipv6hdr", !399, i64 0, !399, i64 0, !399, i64 1, !649, i64 4, !399, i64 6, !399, i64 7, !399, i64 8}
!732 = !DILocalVariable(name: "nh", arg: 1, scope: !733, file: !465, line: 139, type: !610)
!733 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !465, file: !465, line: 139, type: !734, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !736)
!734 = !DISubroutineType(types: !735)
!735 = !{!72, !610, !60, !159}
!736 = !{!732, !737, !738, !739, !741}
!737 = !DILocalVariable(name: "data_end", arg: 2, scope: !733, file: !465, line: 140, type: !60)
!738 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !733, file: !465, line: 141, type: !159)
!739 = !DILocalVariable(name: "i", scope: !740, file: !465, line: 143, type: !72)
!740 = distinct !DILexicalBlock(scope: !733, file: !465, line: 143, column: 2)
!741 = !DILocalVariable(name: "hdr", scope: !742, file: !465, line: 144, type: !744)
!742 = distinct !DILexicalBlock(scope: !743, file: !465, line: 143, column: 47)
!743 = distinct !DILexicalBlock(scope: !740, file: !465, line: 143, column: 2)
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !745, size: 64)
!745 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !555, line: 63, size: 16, elements: !746)
!746 = !{!747, !748}
!747 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !745, file: !555, line: 64, baseType: !159, size: 8)
!748 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !745, file: !555, line: 65, baseType: !159, size: 8, offset: 8)
!749 = !DILocation(line: 0, scope: !733, inlinedAt: !750)
!750 = distinct !DILocation(line: 193, column: 9, scope: !711, inlinedAt: !720)
!751 = !DILocation(line: 0, scope: !740, inlinedAt: !750)
!752 = !DILocation(line: 0, scope: !742, inlinedAt: !750)
!753 = !DILocation(line: 146, column: 11, scope: !754, inlinedAt: !750)
!754 = distinct !DILexicalBlock(scope: !742, file: !465, line: 146, column: 7)
!755 = !DILocation(line: 146, column: 15, scope: !754, inlinedAt: !750)
!756 = !DILocation(line: 146, column: 7, scope: !742, inlinedAt: !750)
!757 = !DILocation(line: 149, column: 3, scope: !742, inlinedAt: !750)
!758 = !DILocation(line: 160, column: 4, scope: !759, inlinedAt: !750)
!759 = distinct !DILexicalBlock(scope: !742, file: !465, line: 149, column: 26)
!760 = !DILocation(line: 0, scope: !759, inlinedAt: !750)
!761 = !{!762, !399, i64 1}
!762 = !{!"ipv6_opt_hdr", !399, i64 0, !399, i64 1}
!763 = !{!762, !399, i64 0}
!764 = !DILocation(line: 156, column: 4, scope: !759, inlinedAt: !750)
!765 = !DILocation(line: 112, column: 16, scope: !766)
!766 = distinct !DILexicalBlock(scope: !510, file: !3, line: 112, column: 8)
!767 = !DILocation(line: 112, column: 8, scope: !510)
!768 = !DILocalVariable(name: "nh", arg: 1, scope: !769, file: !465, line: 224, type: !610)
!769 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !465, file: !465, line: 224, type: !770, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !773)
!770 = !DISubroutineType(types: !771)
!771 = !{!72, !610, !60, !772}
!772 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !511, size: 64)
!773 = !{!768, !774, !775, !776}
!774 = !DILocalVariable(name: "data_end", arg: 2, scope: !769, file: !465, line: 225, type: !60)
!775 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !769, file: !465, line: 226, type: !772)
!776 = !DILocalVariable(name: "icmp6h", scope: !769, file: !465, line: 228, type: !511)
!777 = !DILocation(line: 0, scope: !769, inlinedAt: !778)
!778 = distinct !DILocation(line: 115, column: 17, scope: !510)
!779 = !DILocation(line: 230, column: 13, scope: !780, inlinedAt: !778)
!780 = distinct !DILexicalBlock(scope: !769, file: !465, line: 230, column: 6)
!781 = !DILocation(line: 230, column: 19, scope: !780, inlinedAt: !778)
!782 = !DILocation(line: 230, column: 17, scope: !780, inlinedAt: !778)
!783 = !DILocation(line: 230, column: 6, scope: !769, inlinedAt: !778)
!784 = !DILocation(line: 236, column: 17, scope: !769, inlinedAt: !778)
!785 = !{!786, !399, i64 0}
!786 = !{!"icmp6hdr", !399, i64 0, !399, i64 1, !649, i64 2, !399, i64 4}
!787 = !DILocation(line: 236, column: 9, scope: !769, inlinedAt: !778)
!788 = !DILocation(line: 236, column: 2, scope: !769, inlinedAt: !778)
!789 = !DILocation(line: 116, column: 19, scope: !790)
!790 = distinct !DILexicalBlock(scope: !510, file: !3, line: 116, column: 8)
!791 = !DILocation(line: 116, column: 40, scope: !790)
!792 = !DILocation(line: 0, scope: !481)
!793 = !DILocalVariable(name: "nh", arg: 1, scope: !794, file: !3, line: 63, type: !610)
!794 = distinct !DISubprogram(name: "is_gratuitous_arp", scope: !3, file: !3, line: 63, type: !795, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !798)
!795 = !DISubroutineType(types: !796)
!796 = !{!797, !610, !60}
!797 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!798 = !{!793, !799, !800}
!799 = !DILocalVariable(name: "data_end", arg: 2, scope: !794, file: !3, line: 63, type: !60)
!800 = !DILocalVariable(name: "ah", scope: !794, file: !3, line: 65, type: !801)
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !802, size: 64)
!802 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "arphdr", file: !3, line: 50, size: 224, elements: !803)
!803 = !{!804, !805, !806, !807, !808, !809, !810, !811, !812}
!804 = !DIDerivedType(tag: DW_TAG_member, name: "ar_hrd", scope: !802, file: !3, line: 51, baseType: !165, size: 16)
!805 = !DIDerivedType(tag: DW_TAG_member, name: "ar_pro", scope: !802, file: !3, line: 52, baseType: !165, size: 16, offset: 16)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "ar_hln", scope: !802, file: !3, line: 53, baseType: !160, size: 8, offset: 32)
!807 = !DIDerivedType(tag: DW_TAG_member, name: "ar_pln", scope: !802, file: !3, line: 54, baseType: !160, size: 8, offset: 40)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "ar_op", scope: !802, file: !3, line: 55, baseType: !165, size: 16, offset: 48)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "ar_sha", scope: !802, file: !3, line: 57, baseType: !476, size: 48, offset: 64)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "ar_sip", scope: !802, file: !3, line: 58, baseType: !176, size: 32, offset: 112)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "ar_tha", scope: !802, file: !3, line: 59, baseType: !476, size: 48, offset: 144)
!812 = !DIDerivedType(tag: DW_TAG_member, name: "ar_tip", scope: !802, file: !3, line: 60, baseType: !176, size: 32, offset: 192)
!813 = !DILocation(line: 0, scope: !794, inlinedAt: !814)
!814 = distinct !DILocation(line: 123, column: 7, scope: !815)
!815 = distinct !DILexicalBlock(scope: !481, file: !3, line: 123, column: 7)
!816 = !DILocation(line: 67, column: 9, scope: !817, inlinedAt: !814)
!817 = distinct !DILexicalBlock(scope: !794, file: !3, line: 67, column: 6)
!818 = !DILocation(line: 67, column: 15, scope: !817, inlinedAt: !814)
!819 = !DILocation(line: 67, column: 13, scope: !817, inlinedAt: !814)
!820 = !DILocation(line: 67, column: 6, scope: !794, inlinedAt: !814)
!821 = !DILocation(line: 70, column: 10, scope: !822, inlinedAt: !814)
!822 = distinct !DILexicalBlock(scope: !794, file: !3, line: 70, column: 6)
!823 = !{!824, !649, i64 0}
!824 = !{!"arphdr", !649, i64 0, !649, i64 2, !399, i64 4, !399, i64 5, !649, i64 6, !399, i64 8, !398, i64 14, !399, i64 18, !398, i64 24}
!825 = !DILocation(line: 70, column: 17, scope: !822, inlinedAt: !814)
!826 = !DILocation(line: 70, column: 44, scope: !822, inlinedAt: !814)
!827 = !DILocation(line: 70, column: 51, scope: !822, inlinedAt: !814)
!828 = !{!824, !649, i64 2}
!829 = !DILocation(line: 70, column: 58, scope: !822, inlinedAt: !814)
!830 = !DILocation(line: 70, column: 6, scope: !794, inlinedAt: !814)
!831 = !DILocation(line: 74, column: 14, scope: !794, inlinedAt: !814)
!832 = !{!824, !398, i64 14}
!833 = !DILocation(line: 74, column: 28, scope: !794, inlinedAt: !814)
!834 = !{!824, !398, i64 24}
!835 = !DILocation(line: 74, column: 21, scope: !794, inlinedAt: !814)
!836 = !DILocation(line: 123, column: 7, scope: !481)
!837 = !DILocation(line: 128, column: 1, scope: !455)
!838 = !DILocation(line: 129, column: 33, scope: !455)
!839 = !DILocalVariable(name: "addr", arg: 1, scope: !840, file: !3, line: 43, type: !843)
!840 = distinct !DISubprogram(name: "is_multicast_ether_addr", scope: !3, file: !3, line: 43, type: !841, scopeLine: 44, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !845)
!841 = !DISubroutineType(types: !842)
!842 = !{!797, !843}
!843 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !844, size: 64)
!844 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!845 = !{!839}
!846 = !DILocation(line: 0, scope: !840, inlinedAt: !847)
!847 = distinct !DILocation(line: 129, column: 9, scope: !455)
!848 = !DILocation(line: 45, column: 16, scope: !840, inlinedAt: !847)
!849 = !{!399, !399, i64 0}
!850 = !DILocation(line: 45, column: 14, scope: !840, inlinedAt: !847)
!851 = !DILocation(line: 45, column: 9, scope: !840, inlinedAt: !847)
!852 = !DILocation(line: 129, column: 9, scope: !455)
!853 = !DILocation(line: 129, column: 2, scope: !455)
!854 = !DILocation(line: 130, column: 1, scope: !455)
!855 = !DILocation(line: 0, scope: !241)
!856 = !DILocation(line: 169, column: 30, scope: !241)
!857 = !DILocation(line: 170, column: 14, scope: !241)
!858 = !DILocation(line: 172, column: 2, scope: !241)
!859 = !DILocation(line: 172, column: 22, scope: !241)
!860 = !DILocation(line: 175, column: 13, scope: !241)
!861 = !DILocation(line: 176, column: 15, scope: !862)
!862 = distinct !DILexicalBlock(scope: !241, file: !3, line: 176, column: 6)
!863 = !DILocation(line: 176, column: 6, scope: !241)
!864 = !DILocation(line: 179, column: 6, scope: !252)
!865 = !DILocation(line: 179, column: 6, scope: !241)
!866 = !DILocation(line: 0, scope: !251)
!867 = !DILocation(line: 180, column: 30, scope: !251)
!868 = !{i64 0, i64 2, !648}
!869 = !DILocation(line: 185, column: 19, scope: !251)
!870 = !DILocation(line: 186, column: 15, scope: !251)
!871 = !{i64 0, i64 6, !849, i64 6, i64 2, !648}
!872 = !DILocation(line: 189, column: 10, scope: !241)
!873 = !DILocation(line: 190, column: 6, scope: !257)
!874 = !DILocation(line: 190, column: 12, scope: !257)
!875 = !DILocation(line: 190, column: 22, scope: !257)
!876 = !DILocation(line: 190, column: 34, scope: !257)
!877 = !DILocation(line: 190, column: 6, scope: !241)
!878 = !DILocation(line: 191, column: 16, scope: !879)
!879 = distinct !DILexicalBlock(scope: !256, file: !3, line: 191, column: 7)
!880 = !DILocation(line: 191, column: 43, scope: !879)
!881 = !DILocation(line: 192, column: 14, scope: !879)
!882 = !DILocation(line: 192, column: 24, scope: !879)
!883 = !DILocation(line: 191, column: 7, scope: !256)
!884 = !DILocation(line: 193, column: 8, scope: !885)
!885 = distinct !DILexicalBlock(scope: !886, file: !3, line: 193, column: 8)
!886 = distinct !DILexicalBlock(scope: !879, file: !3, line: 192, column: 31)
!887 = !DILocation(line: 193, column: 8, scope: !886)
!888 = !DILocation(line: 194, column: 5, scope: !889)
!889 = distinct !DILexicalBlock(scope: !885, file: !3, line: 194, column: 5)
!890 = !DILocation(line: 194, column: 5, scope: !885)
!891 = !DILocation(line: 196, column: 23, scope: !886)
!892 = !DILocation(line: 197, column: 4, scope: !886)
!893 = !DILocation(line: 200, column: 10, scope: !256)
!894 = !DILocation(line: 200, column: 15, scope: !256)
!895 = !{!403, !398, i64 20}
!896 = !DILocation(line: 201, column: 7, scope: !255)
!897 = !DILocation(line: 201, column: 7, scope: !256)
!898 = !DILocation(line: 207, column: 4, scope: !254)
!899 = !{!401, !401, i64 0}
!900 = !{!397, !398, i64 36}
!901 = !DILocation(line: 207, column: 4, scope: !255)
!902 = !DILocation(line: 213, column: 15, scope: !903)
!903 = distinct !DILexicalBlock(scope: !241, file: !3, line: 213, column: 6)
!904 = !DILocation(line: 213, column: 37, scope: !903)
!905 = !DILocation(line: 213, column: 45, scope: !903)
!906 = !DILocation(line: 213, column: 61, scope: !903)
!907 = !DILocation(line: 213, column: 6, scope: !241)
!908 = !DILocation(line: 214, column: 7, scope: !909)
!909 = distinct !DILexicalBlock(scope: !910, file: !3, line: 214, column: 7)
!910 = distinct !DILexicalBlock(scope: !903, file: !3, line: 213, column: 77)
!911 = !DILocation(line: 214, column: 7, scope: !910)
!912 = !DILocation(line: 215, column: 4, scope: !913)
!913 = distinct !DILexicalBlock(scope: !909, file: !3, line: 215, column: 4)
!914 = !DILocation(line: 215, column: 4, scope: !909)
!915 = !DILocation(line: 222, column: 1, scope: !241)
!916 = distinct !DISubprogram(name: "handle_change_slave", scope: !3, file: !3, line: 225, type: !917, scopeLine: 225, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !919)
!917 = !DISubroutineType(types: !918)
!918 = !{!72, !331}
!919 = !{!920}
!920 = !DILocalVariable(name: "ctx", arg: 1, scope: !916, file: !3, line: 225, type: !331)
!921 = !DILocation(line: 0, scope: !916)
!922 = !DILocation(line: 225, column: 5, scope: !916)
!923 = !{!924, !925, i64 112}
!924 = !{!"pt_regs", !925, i64 0, !925, i64 8, !925, i64 16, !925, i64 24, !925, i64 32, !925, i64 40, !925, i64 48, !925, i64 56, !925, i64 64, !925, i64 72, !925, i64 80, !925, i64 88, !925, i64 96, !925, i64 104, !925, i64 112, !925, i64 120, !925, i64 128, !925, i64 136, !925, i64 144, !925, i64 152, !925, i64 160}
!925 = !{!"long", !399, i64 0}
!926 = !{!924, !925, i64 104}
!927 = !DILocation(line: 0, scope: !328, inlinedAt: !928)
!928 = distinct !DILocation(line: 225, column: 5, scope: !916)
!929 = !DILocation(line: 227, column: 34, scope: !363, inlinedAt: !928)
!930 = !DILocation(line: 227, column: 34, scope: !931, inlinedAt: !928)
!931 = distinct !DILexicalBlock(scope: !363, file: !3, line: 227, column: 34)
!932 = !DILocation(line: 0, scope: !363, inlinedAt: !928)
!933 = !{!934, !934, i64 0}
!934 = !{!"any pointer", !399, i64 0}
!935 = !DILocation(line: 227, column: 34, scope: !328, inlinedAt: !928)
!936 = !DILocation(line: 228, column: 20, scope: !366, inlinedAt: !928)
!937 = !DILocation(line: 228, column: 20, scope: !938, inlinedAt: !928)
!938 = distinct !DILexicalBlock(scope: !366, file: !3, line: 228, column: 20)
!939 = !DILocation(line: 0, scope: !366, inlinedAt: !928)
!940 = !DILocation(line: 228, column: 20, scope: !328, inlinedAt: !928)
!941 = !DILocation(line: 229, column: 16, scope: !369, inlinedAt: !928)
!942 = !DILocation(line: 229, column: 16, scope: !943, inlinedAt: !928)
!943 = distinct !DILexicalBlock(scope: !369, file: !3, line: 229, column: 16)
!944 = !DILocation(line: 0, scope: !369, inlinedAt: !928)
!945 = !DILocation(line: 229, column: 16, scope: !328, inlinedAt: !928)
!946 = !DILocalVariable(name: "net", arg: 1, scope: !947, file: !65, line: 49, type: !77)
!947 = distinct !DISubprogram(name: "read_net_cookie", scope: !65, file: !65, line: 49, type: !948, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !950)
!948 = !DISubroutineType(types: !949)
!949 = !{!58, !77}
!950 = !{!946, !951, !955, !957, !958}
!951 = !DILocalVariable(name: "__r", scope: !952, file: !65, line: 52, type: !58)
!952 = distinct !DILexicalBlock(scope: !953, file: !65, line: 52, column: 10)
!953 = distinct !DILexicalBlock(scope: !954, file: !65, line: 51, column: 46)
!954 = distinct !DILexicalBlock(scope: !947, file: !65, line: 51, column: 6)
!955 = !DILocalVariable(name: "n_old", scope: !956, file: !65, line: 54, type: !88)
!956 = distinct !DILexicalBlock(scope: !954, file: !65, line: 53, column: 9)
!957 = !DILocalVariable(name: "cookie_old", scope: !956, file: !65, line: 55, type: !92)
!958 = !DILocalVariable(name: "__r", scope: !959, file: !65, line: 57, type: !92)
!959 = distinct !DILexicalBlock(scope: !956, file: !65, line: 57, column: 16)
!960 = !DILocation(line: 0, scope: !947, inlinedAt: !961)
!961 = distinct !DILocation(line: 230, column: 17, scope: !328, inlinedAt: !928)
!962 = !DILocation(line: 51, column: 6, scope: !954, inlinedAt: !961)
!963 = !DILocation(line: 51, column: 6, scope: !947, inlinedAt: !961)
!964 = !DILocation(line: 52, column: 10, scope: !952, inlinedAt: !961)
!965 = !DILocation(line: 52, column: 10, scope: !966, inlinedAt: !961)
!966 = distinct !DILexicalBlock(scope: !952, file: !65, line: 52, column: 10)
!967 = !DILocation(line: 0, scope: !952, inlinedAt: !961)
!968 = !DILocation(line: 52, column: 10, scope: !953, inlinedAt: !961)
!969 = !DILocation(line: 52, column: 3, scope: !953, inlinedAt: !961)
!970 = !DILocation(line: 54, column: 29, scope: !956, inlinedAt: !961)
!971 = !DILocation(line: 0, scope: !956, inlinedAt: !961)
!972 = !DILocation(line: 57, column: 16, scope: !959, inlinedAt: !961)
!973 = !DILocation(line: 57, column: 16, scope: !974, inlinedAt: !961)
!974 = distinct !DILexicalBlock(scope: !959, file: !65, line: 57, column: 16)
!975 = !{i64 0, i64 8, !899}
!976 = !DILocation(line: 57, column: 16, scope: !956, inlinedAt: !961)
!977 = !DILocation(line: 0, scope: !954, inlinedAt: !961)
!978 = !DILocation(line: 233, column: 23, scope: !373, inlinedAt: !928)
!979 = !DILocation(line: 233, column: 20, scope: !373, inlinedAt: !928)
!980 = !DILocation(line: 233, column: 36, scope: !373, inlinedAt: !928)
!981 = !DILocation(line: 233, column: 50, scope: !373, inlinedAt: !928)
!982 = !DILocation(line: 233, column: 47, scope: !373, inlinedAt: !928)
!983 = !DILocation(line: 233, column: 63, scope: !373, inlinedAt: !928)
!984 = !DILocation(line: 237, column: 13, scope: !376, inlinedAt: !928)
!985 = !DILocation(line: 237, column: 13, scope: !986, inlinedAt: !928)
!986 = distinct !DILexicalBlock(scope: !376, file: !3, line: 237, column: 13)
!987 = !DILocation(line: 0, scope: !376, inlinedAt: !928)
!988 = !DILocation(line: 237, column: 13, scope: !372, inlinedAt: !928)
!989 = !DILocation(line: 0, scope: !372, inlinedAt: !928)
!990 = !DILocation(line: 238, column: 13, scope: !378, inlinedAt: !928)
!991 = !DILocation(line: 238, column: 13, scope: !992, inlinedAt: !928)
!992 = distinct !DILexicalBlock(scope: !378, file: !3, line: 238, column: 13)
!993 = !DILocation(line: 0, scope: !378, inlinedAt: !928)
!994 = !DILocation(line: 238, column: 13, scope: !372, inlinedAt: !928)
!995 = !DILocation(line: 239, column: 7, scope: !996, inlinedAt: !928)
!996 = distinct !DILexicalBlock(scope: !372, file: !3, line: 239, column: 7)
!997 = !DILocation(line: 239, column: 7, scope: !372, inlinedAt: !928)
!998 = !DILocation(line: 240, column: 19, scope: !999, inlinedAt: !928)
!999 = distinct !DILexicalBlock(scope: !996, file: !3, line: 239, column: 16)
!1000 = !DILocation(line: 241, column: 8, scope: !1001, inlinedAt: !928)
!1001 = distinct !DILexicalBlock(scope: !999, file: !3, line: 241, column: 8)
!1002 = !DILocation(line: 241, column: 8, scope: !999, inlinedAt: !928)
!1003 = !DILocation(line: 242, column: 5, scope: !1004, inlinedAt: !928)
!1004 = distinct !DILexicalBlock(scope: !1001, file: !3, line: 242, column: 5)
!1005 = !DILocation(line: 242, column: 5, scope: !1001, inlinedAt: !928)
