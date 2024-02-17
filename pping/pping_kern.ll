; ModuleID = 'pping_kern.c'
source_filename = "pping_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.5 = type { [4 x i32]*, [4 x i32]*, [4 x i32]* }
%struct.anon.6 = type { [1 x i32]*, %struct.network_tuple*, %struct.dual_flow_state*, [131072 x i32]* }
%struct.network_tuple = type { %struct.flow_address, %struct.flow_address, i16, i8, i8 }
%struct.flow_address = type { %struct.in6_addr, i16, i16 }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.dual_flow_state = type { %struct.flow_state, %struct.flow_state }
%struct.flow_state = type { i64, i64, i64, i64, i64, i64, i64, i32, i32, i8, i8, i8, [5 x i8] }
%struct.anon.7 = type { [1 x i32]*, %struct.packet_id*, i64*, [131072 x i32]* }
%struct.packet_id = type { %struct.network_tuple, i32 }
%struct.anon.8 = type { [5 x i32]*, i32*, %struct.aggregated_stats*, [16384 x i32]* }
%struct.aggregated_stats = type { i64, %struct.traffic_counters, %struct.traffic_counters, i64, i64, [250 x i32] }
%struct.traffic_counters = type { i64, i64, i64, i64, i64, i64 }
%struct.anon.9 = type { [5 x i32]*, i32*, %struct.aggregated_stats*, [16384 x i32]* }
%struct.anon.10 = type { [5 x i32]*, i64*, %struct.aggregated_stats*, [16384 x i32]* }
%struct.anon.11 = type { [5 x i32]*, i64*, %struct.aggregated_stats*, [16384 x i32]* }
%struct.anon.12 = type { [2 x i32]*, i32*, i32*, [1 x i32]* }
%struct.anon.13 = type { [6 x i32]*, i32*, %struct.global_counters*, [1 x i32]* }
%struct.global_counters = type { %struct.ecn_counters, %struct.pping_error_counters, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [256 x i32] }
%struct.ecn_counters = type { i64, i64, i64, i64 }
%struct.pping_error_counters = type { i64, i64, i64 }
%struct.anon.14 = type { [6 x i32]*, i32*, %struct.packet_info*, [1 x i32]* }
%struct.packet_info = type { i64, i32, i32, %struct.packet_id, %struct.packet_id, i32, %union.anon.4, i16, i8, i8, i8, i8, i8, i8, i8, i8 }
%union.anon.4 = type { i32 }
%struct.bpf_config = type { i64, i64, i64, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.parsing_context = type { i8*, i8*, %struct.hdr_cursor, i32 }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.collect_vlans = type { [2 x i16] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.16 }
%union.anon.16 = type { %struct.anon.17 }
%struct.anon.17 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.19 }
%union.anon.19 = type { %struct.anon.20 }
%struct.anon.20 = type { %struct.in6_addr, %struct.in6_addr }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.protocol_info = type { i32, i32, i8, i8, i8, i8, i8 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.26 }
%union.anon.26 = type { [1 x i32] }
%struct.icmpv6_echo = type { i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.23 }
%union.anon.23 = type { i32 }
%struct.anon.24 = type { i16, i16 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.bpf_iter__bpf_map_elem = type { %struct.bpf_iter_meta*, %struct.bpf_map*, i8*, i8* }
%struct.bpf_iter_meta = type { %struct.seq_file*, i64, i64 }
%struct.seq_file = type opaque
%struct.bpf_map = type opaque
%struct.flow_event = type { i64, i64, %struct.network_tuple, i8, i8, i8, i8 }
%struct.rtt_event = type { i64, i64, %struct.network_tuple, i32, i64, i64, i64, i64, i64, i64, i8, [7 x i8] }
%struct.map_full_event = type { i64, i64, %struct.network_tuple, i8, [3 x i8] }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.28, %union.anon.29, %union.anon.30, i16, i16, [6 x i8], [6 x i8] }
%union.anon.28 = type { i32 }
%union.anon.29 = type { [4 x i32] }
%union.anon.30 = type { [4 x i32] }
%struct.ipprefix_key = type { %union.anon.27 }
%union.anon.27 = type { i64 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@events = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !211
@flow_state = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !179
@packet_ts = dso_local global %struct.anon.7 zeroinitializer, section ".maps", align 8, !dbg !157
@map_v4_agg1 = dso_local global %struct.anon.8 zeroinitializer, section ".maps", align 8, !dbg !220
@map_v4_agg2 = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !254
@map_v6_agg1 = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !262
@map_v6_agg2 = dso_local global %struct.anon.11 zeroinitializer, section ".maps", align 8, !dbg !270
@map_active_agg_instance = dso_local global %struct.anon.12 zeroinitializer, section ".maps", align 8, !dbg !278
@map_global_counters = dso_local global %struct.anon.13 zeroinitializer, section ".maps", align 8, !dbg !290
@map_packet_info = dso_local global %struct.anon.14 zeroinitializer, section ".maps", align 8, !dbg !332
@config = internal constant %struct.bpf_config zeroinitializer, align 8, !dbg !363
@empty_stats = internal global %struct.aggregated_stats zeroinitializer, align 8, !dbg !390
@last_warn_time = internal global [2 x i64] zeroinitializer, align 8, !dbg !392
@llvm.compiler.used = appending global [16 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.5* @events to i8*), i8* bitcast (%struct.anon.6* @flow_state to i8*), i8* bitcast (i32 (%struct.bpf_iter__bpf_map_elem*)* @flowmap_cleanup to i8*), i8* bitcast (%struct.anon.12* @map_active_agg_instance to i8*), i8* bitcast (%struct.anon.13* @map_global_counters to i8*), i8* bitcast (%struct.anon.14* @map_packet_info to i8*), i8* bitcast (%struct.anon.8* @map_v4_agg1 to i8*), i8* bitcast (%struct.anon.9* @map_v4_agg2 to i8*), i8* bitcast (%struct.anon.10* @map_v6_agg1 to i8*), i8* bitcast (%struct.anon.11* @map_v6_agg2 to i8*), i8* bitcast (%struct.anon.7* @packet_ts to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @pping_tc_egress to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @pping_tc_ingress to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @pping_xdp_ingress to i8*), i8* bitcast (i32 (%struct.bpf_iter__bpf_map_elem*)* @tsmap_cleanup to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind
define dso_local i32 @parse_packet_identifer_tc(%struct.__sk_buff* nocapture noundef readonly %0, %struct.packet_info* noundef %1) local_unnamed_addr #0 !dbg !458 {
  %3 = alloca %struct.parsing_context, align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !550, metadata !DIExpression()), !dbg !563
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !551, metadata !DIExpression()), !dbg !563
  %4 = icmp eq %struct.packet_info* %1, null, !dbg !564
  br i1 %4, label %22, label %5, !dbg !566

5:                                                ; preds = %2
  %6 = bitcast %struct.parsing_context* %3 to i8*, !dbg !567
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #9, !dbg !567
  call void @llvm.dbg.declare(metadata %struct.parsing_context* %3, metadata !552, metadata !DIExpression()), !dbg !568
  %7 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 0, !dbg !569
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !570
  %9 = load i32, i32* %8, align 4, !dbg !570, !tbaa !571
  %10 = zext i32 %9 to i64, !dbg !577
  %11 = inttoptr i64 %10 to i8*, !dbg !578
  store i8* %11, i8** %7, align 8, !dbg !569, !tbaa !579
  %12 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 1, !dbg !569
  %13 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !583
  %14 = load i32, i32* %13, align 8, !dbg !583, !tbaa !584
  %15 = zext i32 %14 to i64, !dbg !585
  %16 = inttoptr i64 %15 to i8*, !dbg !586
  store i8* %16, i8** %12, align 8, !dbg !569, !tbaa !587
  %17 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 2, i32 0, !dbg !588
  store i8* %11, i8** %17, align 8, !dbg !588, !tbaa !589
  %18 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 3, !dbg !569
  %19 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !590
  %20 = load i32, i32* %19, align 8, !dbg !590, !tbaa !591
  store i32 %20, i32* %18, align 8, !dbg !569, !tbaa !592
  %21 = call fastcc i32 @parse_packet_identifier(%struct.parsing_context* noundef nonnull %3, %struct.packet_info* noundef nonnull %1), !dbg !593
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #9, !dbg !594
  br label %22

22:                                               ; preds = %2, %5
  %23 = phi i32 [ %21, %5 ], [ -1, %2 ], !dbg !563
  ret i32 %23, !dbg !594
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define internal fastcc i32 @parse_packet_identifier(%struct.parsing_context* nocapture noundef %0, %struct.packet_info* noundef %1) unnamed_addr #3 !dbg !595 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  call void @llvm.dbg.declare(metadata [3 x i8]* undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 104, 24)), !dbg !771
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !600, metadata !DIExpression()), !dbg !772
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !601, metadata !DIExpression()), !dbg !772
  %5 = bitcast %struct.packet_info* %1 to i8*, !dbg !773
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(136) %5, i8 0, i64 136, i1 false), !dbg !773
  %6 = tail call i64 inttoptr (i64 5 to i64 ()*)() #9, !dbg !774
  %7 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !775
  store i64 %6, i64* %7, align 8, !dbg !776, !tbaa !777
  %8 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 3, !dbg !785
  %9 = load i32, i32* %8, align 8, !dbg !785, !tbaa !592
  %10 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !786
  store i32 %9, i32* %10, align 8, !dbg !787, !tbaa !788
  %11 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, !dbg !789
  %12 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 1, !dbg !790
  %13 = load i8*, i8** %12, align 8, !dbg !790, !tbaa !587
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !604, metadata !DIExpression(DW_OP_deref)), !dbg !772
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !791, metadata !DIExpression()) #9, !dbg !800
  call void @llvm.dbg.value(metadata i8* %13, metadata !798, metadata !DIExpression()) #9, !dbg !800
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !799, metadata !DIExpression()) #9, !dbg !800
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !802, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i8* %13, metadata !812, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !813, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !814, metadata !DIExpression()) #9, !dbg !825
  %14 = getelementptr %struct.hdr_cursor, %struct.hdr_cursor* %11, i64 0, i32 0, !dbg !827
  %15 = load i8*, i8** %14, align 8, !dbg !827, !tbaa !589
  call void @llvm.dbg.value(metadata i8* %15, metadata !815, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i32 14, metadata !816, metadata !DIExpression()) #9, !dbg !825
  %16 = getelementptr i8, i8* %15, i64 14, !dbg !828
  %17 = icmp ugt i8* %16, %13, !dbg !830
  br i1 %17, label %669, label %18, !dbg !831

18:                                               ; preds = %2
  call void @llvm.dbg.value(metadata i8* %15, metadata !815, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i8* %16, metadata !817, metadata !DIExpression()) #9, !dbg !825
  %19 = getelementptr inbounds i8, i8* %15, i64 12, !dbg !832
  %20 = bitcast i8* %19 to i16*, !dbg !832
  call void @llvm.dbg.value(metadata i16 undef, metadata !823, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i32 0, metadata !824, metadata !DIExpression()) #9, !dbg !825
  %21 = load i16, i16* %20, align 1, !dbg !825, !tbaa !833
  call void @llvm.dbg.value(metadata i16 %21, metadata !823, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i16 %21, metadata !834, metadata !DIExpression()) #9, !dbg !839
  %22 = icmp eq i16 %21, 129, !dbg !845
  %23 = icmp eq i16 %21, -22392, !dbg !846
  %24 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %22) #9
  %25 = or i1 %23, %24, !dbg !846
  %26 = xor i1 %25, true, !dbg !847
  %27 = getelementptr i8, i8* %15, i64 18
  %28 = icmp ugt i8* %27, %13
  %29 = select i1 %26, i1 true, i1 %28, !dbg !848
  br i1 %29, label %46, label %30, !dbg !848

30:                                               ; preds = %18
  call void @llvm.dbg.value(metadata i16 undef, metadata !823, metadata !DIExpression()) #9, !dbg !825
  %31 = getelementptr i8, i8* %15, i64 16, !dbg !849
  %32 = bitcast i8* %31 to i16*, !dbg !849
  call void @llvm.dbg.value(metadata i8* %27, metadata !817, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i32 1, metadata !824, metadata !DIExpression()) #9, !dbg !825
  %33 = load i16, i16* %32, align 1, !dbg !825, !tbaa !833
  call void @llvm.dbg.value(metadata i16 %33, metadata !823, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i16 %33, metadata !834, metadata !DIExpression()) #9, !dbg !839
  %34 = icmp eq i16 %33, 129, !dbg !845
  %35 = icmp eq i16 %33, -22392, !dbg !846
  %36 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %34) #9
  %37 = or i1 %35, %36, !dbg !846
  %38 = xor i1 %37, true, !dbg !847
  %39 = getelementptr i8, i8* %15, i64 22
  %40 = icmp ugt i8* %39, %13
  %41 = select i1 %38, i1 true, i1 %40, !dbg !848
  br i1 %41, label %46, label %42, !dbg !848

42:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i16 undef, metadata !823, metadata !DIExpression()) #9, !dbg !825
  %43 = getelementptr i8, i8* %15, i64 20, !dbg !849
  %44 = bitcast i8* %43 to i16*, !dbg !849
  call void @llvm.dbg.value(metadata i8* %39, metadata !817, metadata !DIExpression()) #9, !dbg !825
  call void @llvm.dbg.value(metadata i32 2, metadata !824, metadata !DIExpression()) #9, !dbg !825
  %45 = load i16, i16* %44, align 1, !dbg !825, !tbaa !833
  call void @llvm.dbg.value(metadata i16 %45, metadata !823, metadata !DIExpression()) #9, !dbg !825
  br label %46

46:                                               ; preds = %18, %30, %42
  %47 = phi i8* [ %16, %18 ], [ %27, %30 ], [ %39, %42 ]
  %48 = phi i16 [ %21, %18 ], [ %33, %30 ], [ %45, %42 ], !dbg !825
  store i8* %47, i8** %14, align 8, !dbg !850, !tbaa !589
  call void @llvm.dbg.value(metadata i16 %48, metadata !602, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !772
  switch i16 %48, label %669 [
    i16 8, label %49
    i16 -8826, label %65
  ], !dbg !851

49:                                               ; preds = %46
  %50 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !852
  store i8 2, i8* %50, align 2, !dbg !855, !tbaa !856
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !857, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i8* %13, metadata !863, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !864, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i8* %47, metadata !865, metadata !DIExpression()), !dbg !867
  %51 = getelementptr inbounds i8, i8* %47, i64 20, !dbg !869
  %52 = icmp ugt i8* %51, %13, !dbg !871
  br i1 %52, label %669, label %53, !dbg !872

53:                                               ; preds = %49
  %54 = load i8, i8* %47, align 4, !dbg !873
  %55 = and i8 %54, -16, !dbg !875
  %56 = icmp eq i8 %55, 64, !dbg !875
  br i1 %56, label %57, label %669, !dbg !876

57:                                               ; preds = %53
  %58 = shl i8 %54, 2, !dbg !877
  %59 = and i8 %58, 60, !dbg !877
  call void @llvm.dbg.value(metadata i8 %59, metadata !866, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !867
  %60 = icmp ult i8 %59, 20, !dbg !878
  br i1 %60, label %669, label %61, !dbg !880

61:                                               ; preds = %57
  %62 = zext i8 %59 to i64
  call void @llvm.dbg.value(metadata i64 %62, metadata !866, metadata !DIExpression()), !dbg !867
  %63 = getelementptr i8, i8* %47, i64 %62, !dbg !881
  %64 = icmp ugt i8* %63, %13, !dbg !883
  br i1 %64, label %669, label %110, !dbg !884

65:                                               ; preds = %46
  %66 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !885
  store i8 10, i8* %66, align 2, !dbg !888, !tbaa !856
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !889, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i8* %13, metadata !895, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !896, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i8* %47, metadata !897, metadata !DIExpression()), !dbg !898
  %67 = getelementptr inbounds i8, i8* %47, i64 40, !dbg !900
  %68 = icmp ugt i8* %67, %13, !dbg !902
  br i1 %68, label %669, label %69, !dbg !903

69:                                               ; preds = %65
  %70 = load i8, i8* %47, align 4, !dbg !904
  %71 = and i8 %70, -16, !dbg !906
  %72 = icmp eq i8 %71, 96, !dbg !906
  br i1 %72, label %73, label %669, !dbg !907

73:                                               ; preds = %69
  store i8* %67, i8** %14, align 8, !dbg !908, !tbaa !589
  call void @llvm.dbg.value(metadata i8* %47, metadata !623, metadata !DIExpression()), !dbg !772
  %74 = getelementptr inbounds i8, i8* %47, i64 6, !dbg !909
  %75 = load i8, i8* %74, align 2, !dbg !909, !tbaa !910
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !912, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.value(metadata i8* %13, metadata !917, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.value(metadata i32 0, metadata !919, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata i8 %75, metadata !918, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.value(metadata i8* %67, metadata !921, metadata !DIExpression()), !dbg !932
  %76 = getelementptr inbounds i8, i8* %47, i64 42, !dbg !933
  %77 = icmp ugt i8* %76, %13, !dbg !935
  br i1 %77, label %669, label %78, !dbg !936

78:                                               ; preds = %73
  switch i8 %75, label %143 [
    i8 0, label %80
    i8 60, label %80
    i8 43, label %80
    i8 -121, label %80
    i8 51, label %79
    i8 44, label %87
  ], !dbg !937

79:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i8 undef, metadata !918, metadata !DIExpression()), !dbg !929
  br label %80, !dbg !938

80:                                               ; preds = %79, %78, %78, %78, %78
  %81 = phi i64 [ 2, %79 ], [ 3, %78 ], [ 3, %78 ], [ 3, %78 ], [ 3, %78 ]
  %82 = getelementptr inbounds i8, i8* %47, i64 41, !dbg !940
  %83 = load i8, i8* %82, align 1, !dbg !940, !tbaa !941
  %84 = zext i8 %83 to i64, !dbg !940
  %85 = shl nuw nsw i64 %84, %81, !dbg !940
  %86 = add nuw nsw i64 %85, 8, !dbg !940
  br label %87, !dbg !940

87:                                               ; preds = %80, %78
  %88 = phi i64 [ 8, %78 ], [ %86, %80 ]
  %89 = getelementptr inbounds i8, i8* %67, i64 %88, !dbg !940
  store i8* %89, i8** %14, align 8, !dbg !940, !tbaa !589
  %90 = load i8, i8* %67, align 1, !dbg !940, !tbaa !943
  call void @llvm.dbg.value(metadata i32 1, metadata !919, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata i8 %90, metadata !918, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.value(metadata i8* %89, metadata !921, metadata !DIExpression()), !dbg !932
  %91 = getelementptr inbounds i8, i8* %89, i64 2, !dbg !933
  %92 = icmp ugt i8* %91, %13, !dbg !935
  br i1 %92, label %669, label %93, !dbg !936

93:                                               ; preds = %87
  switch i8 %90, label %143 [
    i8 0, label %94
    i8 60, label %94
    i8 43, label %94
    i8 -121, label %94
    i8 51, label %95
    i8 44, label %102
  ], !dbg !937

94:                                               ; preds = %93, %93, %93, %93
  call void @llvm.dbg.value(metadata i8 undef, metadata !918, metadata !DIExpression()), !dbg !929
  br label %95, !dbg !944

95:                                               ; preds = %94, %93
  %96 = phi i64 [ 3, %94 ], [ 2, %93 ]
  %97 = getelementptr inbounds i8, i8* %89, i64 1, !dbg !940
  %98 = load i8, i8* %97, align 1, !dbg !940, !tbaa !941
  %99 = zext i8 %98 to i64, !dbg !940
  %100 = shl nuw nsw i64 %99, %96, !dbg !940
  %101 = add nuw nsw i64 %100, 8, !dbg !940
  br label %102, !dbg !940

102:                                              ; preds = %95, %93
  %103 = phi i64 [ 8, %93 ], [ %101, %95 ]
  %104 = getelementptr inbounds i8, i8* %89, i64 %103, !dbg !940
  store i8* %104, i8** %14, align 8, !dbg !940, !tbaa !589
  %105 = load i8, i8* %89, align 1, !dbg !940, !tbaa !943
  call void @llvm.dbg.value(metadata i32 2, metadata !919, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.value(metadata i8 %105, metadata !918, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.value(metadata i8* %104, metadata !921, metadata !DIExpression()), !dbg !932
  %106 = getelementptr inbounds i8, i8* %104, i64 2, !dbg !933
  %107 = icmp ugt i8* %106, %13, !dbg !935
  br i1 %107, label %669, label %108, !dbg !936

108:                                              ; preds = %102
  switch i8 %105, label %143 [
    i8 0, label %109
    i8 60, label %109
    i8 43, label %109
    i8 -121, label %109
    i8 51, label %659
    i8 44, label %666
  ], !dbg !937

109:                                              ; preds = %108, %108, %108, %108
  call void @llvm.dbg.value(metadata i8 undef, metadata !918, metadata !DIExpression()), !dbg !929
  br label %659, !dbg !944

110:                                              ; preds = %61
  store i8* %63, i8** %14, align 8, !dbg !945, !tbaa !589
  call void @llvm.dbg.value(metadata i8* %47, metadata !623, metadata !DIExpression()), !dbg !772
  %111 = getelementptr inbounds i8, i8* %47, i64 9, !dbg !946
  %112 = load i8, i8* %111, align 1, !dbg !946, !tbaa !947
  call void @llvm.dbg.value(metadata i8 %112, metadata !602, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !772
  %113 = zext i8 %112 to i16, !dbg !949
  %114 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, !dbg !950
  %115 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !951
  store i16 %113, i16* %115, align 8, !dbg !952, !tbaa !953
  %116 = getelementptr inbounds i8, i8* %47, i64 12, !dbg !954
  %117 = bitcast i8* %116 to i32*, !dbg !954
  %118 = load i32, i32* %117, align 4, !dbg !954, !tbaa !957
  call void @llvm.dbg.value(metadata %struct.packet_id* %114, metadata !958, metadata !DIExpression()) #9, !dbg !964
  call void @llvm.dbg.value(metadata i32 %118, metadata !963, metadata !DIExpression()) #9, !dbg !964
  %119 = bitcast %struct.packet_id* %114 to [16 x i8]*, !dbg !966
  %120 = bitcast %struct.packet_id* %114 to i8*, !dbg !967
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(10) %120, i8 0, i64 10, i1 false) #9, !dbg !968
  %121 = getelementptr inbounds [16 x i8], [16 x i8]* %119, i64 0, i64 10, !dbg !969
  %122 = bitcast i8* %121 to i16*, !dbg !970
  store i16 -1, i16* %122, align 2, !dbg !970
  %123 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !971
  store i32 %118, i32* %123, align 4, !dbg !972, !tbaa !957
  %124 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, !dbg !973
  %125 = getelementptr inbounds i8, i8* %47, i64 16, !dbg !974
  %126 = bitcast i8* %125 to i32*, !dbg !974
  %127 = load i32, i32* %126, align 4, !dbg !974, !tbaa !957
  call void @llvm.dbg.value(metadata %struct.in6_addr* %124, metadata !958, metadata !DIExpression()) #9, !dbg !975
  call void @llvm.dbg.value(metadata i32 %127, metadata !963, metadata !DIExpression()) #9, !dbg !975
  %128 = bitcast %struct.in6_addr* %124 to [16 x i8]*, !dbg !977
  %129 = bitcast %struct.in6_addr* %124 to i8*, !dbg !978
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(10) %129, i8 0, i64 10, i1 false) #9, !dbg !979
  %130 = getelementptr inbounds [16 x i8], [16 x i8]* %128, i64 0, i64 10, !dbg !980
  %131 = bitcast i8* %130 to i16*, !dbg !981
  store i16 -1, i16* %131, align 2, !dbg !981
  %132 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !982
  store i32 %127, i32* %132, align 4, !dbg !983, !tbaa !957
  %133 = getelementptr inbounds i8, i8* %47, i64 2, !dbg !984
  %134 = bitcast i8* %133 to i16*, !dbg !984
  %135 = load i16, i16* %134, align 2, !dbg !984, !tbaa !985
  %136 = tail call i16 @llvm.bswap.i16(i16 %135), !dbg !984
  %137 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 7, !dbg !986
  store i16 %136, i16* %137, align 8, !dbg !987, !tbaa !988
  %138 = getelementptr inbounds i8, i8* %47, i64 1, !dbg !989
  %139 = load i8, i8* %138, align 1, !dbg !989, !tbaa !990
  %140 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, !dbg !991
  %141 = bitcast %union.anon.4* %140 to i8*, !dbg !992
  store i8 %139, i8* %141, align 4, !dbg !993, !tbaa !957
  call void @llvm.dbg.value(metadata i8* %47, metadata !994, metadata !DIExpression()), !dbg !999
  %142 = load i8, i8* %138, align 1, !dbg !1001, !tbaa !990
  call void @llvm.dbg.value(metadata i8 %142, metadata !769, metadata !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !772
  br label %165, !dbg !1002

143:                                              ; preds = %78, %93, %108
  %144 = phi i8 [ %105, %108 ], [ %90, %93 ], [ %75, %78 ]
  call void @llvm.dbg.value(metadata i8* %47, metadata !623, metadata !DIExpression()), !dbg !772
  call void @llvm.dbg.value(metadata i8 %112, metadata !602, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !772
  %145 = zext i8 %144 to i16, !dbg !949
  %146 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, !dbg !950
  %147 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !951
  store i16 %145, i16* %147, align 8, !dbg !952, !tbaa !953
  %148 = getelementptr inbounds i8, i8* %47, i64 8, !dbg !1003
  %149 = bitcast %struct.packet_id* %146 to i8*, !dbg !1003
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %149, i8* noundef nonnull align 4 dereferenceable(16) %148, i64 16, i1 false), !dbg !1003, !tbaa.struct !1005
  %150 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, !dbg !1006
  %151 = getelementptr inbounds i8, i8* %47, i64 24, !dbg !1007
  %152 = bitcast %struct.in6_addr* %150 to i8*, !dbg !1007
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %152, i8* noundef nonnull align 4 dereferenceable(16) %151, i64 16, i1 false), !dbg !1007, !tbaa.struct !1005
  %153 = getelementptr inbounds i8, i8* %47, i64 4, !dbg !1008
  %154 = bitcast i8* %153 to i16*, !dbg !1008
  %155 = load i16, i16* %154, align 4, !dbg !1008, !tbaa !1009
  %156 = tail call i16 @llvm.bswap.i16(i16 %155), !dbg !1008
  %157 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 7, !dbg !1010
  store i16 %156, i16* %157, align 8, !dbg !1011, !tbaa !988
  %158 = bitcast i8* %47 to i32*, !dbg !1012
  %159 = load i32, i32* %158, align 4, !dbg !1013, !tbaa !1014
  %160 = and i32 %159, -241, !dbg !1015
  %161 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, i32 0, !dbg !1016
  store i32 %160, i32* %161, align 4, !dbg !1017, !tbaa !957
  call void @llvm.dbg.value(metadata i8* %47, metadata !1018, metadata !DIExpression()), !dbg !1023
  %162 = getelementptr inbounds i8, i8* %47, i64 1, !dbg !1025
  %163 = load i8, i8* %162, align 1, !dbg !1025, !tbaa !957
  %164 = lshr i8 %163, 4, !dbg !1026
  call void @llvm.dbg.value(metadata i8 %164, metadata !769, metadata !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value)), !dbg !772
  br label %165

165:                                              ; preds = %143, %110
  %166 = phi i16* [ %115, %110 ], [ %147, %143 ]
  %167 = phi %struct.packet_id* [ %114, %110 ], [ %146, %143 ]
  %168 = phi i8 [ %112, %110 ], [ %144, %143 ]
  %169 = phi i8 [ %142, %110 ], [ %164, %143 ]
  %170 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, !dbg !1027
  %171 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !1028
  %172 = and i8 %169, 3, !dbg !1029
  call void @llvm.dbg.value(metadata i8 %172, metadata !769, metadata !DIExpression()), !dbg !772
  tail call fastcc void @update_global_counters(i8 noundef zeroext %168, i32 noundef %9, i8 noundef zeroext %172), !dbg !1030
  call void @llvm.dbg.value(metadata i32 -1, metadata !603, metadata !DIExpression()), !dbg !772
  %173 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 5), align 1, !dbg !1031, !tbaa !1033, !range !1035
  %174 = icmp ne i8 %173, 0, !dbg !1031
  %175 = icmp eq i8 %168, 6
  %176 = and i1 %174, %175, !dbg !1036
  br i1 %176, label %177, label %521, !dbg !1036

177:                                              ; preds = %165
  %178 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 1, !dbg !1037
  %179 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 1, !dbg !1038
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1039, metadata !DIExpression()) #9, !dbg !1052
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !1047, metadata !DIExpression()) #9, !dbg !1052
  call void @llvm.dbg.value(metadata i16* %178, metadata !1048, metadata !DIExpression()) #9, !dbg !1052
  call void @llvm.dbg.value(metadata i16* %179, metadata !1049, metadata !DIExpression()) #9, !dbg !1052
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !1050, metadata !DIExpression()) #9, !dbg !1052
  %180 = load i8*, i8** %12, align 8, !dbg !1054, !tbaa !587
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1056, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)) #9, !dbg !1065
  call void @llvm.dbg.value(metadata i8* %180, metadata !1061, metadata !DIExpression()) #9, !dbg !1065
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !1062, metadata !DIExpression()) #9, !dbg !1065
  %181 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, i32 0, !dbg !1067
  %182 = load i8*, i8** %181, align 8, !dbg !1067, !tbaa !589
  call void @llvm.dbg.value(metadata i8* %182, metadata !1064, metadata !DIExpression()) #9, !dbg !1065
  %183 = getelementptr inbounds i8, i8* %182, i64 20, !dbg !1068
  %184 = icmp ugt i8* %183, %180, !dbg !1070
  br i1 %184, label %615, label %185, !dbg !1071

185:                                              ; preds = %177
  %186 = getelementptr inbounds i8, i8* %182, i64 12, !dbg !1072
  %187 = bitcast i8* %186 to i16*, !dbg !1072
  %188 = load i16, i16* %187, align 4, !dbg !1072
  %189 = lshr i16 %188, 2, !dbg !1073
  %190 = and i16 %189, 60, !dbg !1073
  call void @llvm.dbg.value(metadata i16 %190, metadata !1063, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1065
  %191 = icmp ult i16 %190, 20, !dbg !1074
  br i1 %191, label %615, label %192, !dbg !1076

192:                                              ; preds = %185
  %193 = zext i16 %190 to i64
  %194 = getelementptr i8, i8* %182, i64 %193, !dbg !1077
  %195 = icmp ugt i8* %194, %180, !dbg !1079
  br i1 %195, label %615, label %196, !dbg !1080

196:                                              ; preds = %192
  store i8* %194, i8** %181, align 8, !dbg !1081, !tbaa !589
  %197 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 8), align 8, !dbg !1082, !tbaa !1084, !range !1035
  %198 = icmp eq i8 %197, 0, !dbg !1082
  %199 = load i16, i16* %187, align 4, !dbg !1052
  %200 = and i16 %199, 512
  %201 = icmp eq i16 %200, 0
  %202 = select i1 %198, i1 true, i1 %201, !dbg !1085
  call void @llvm.dbg.value(metadata i8* %182, metadata !1051, metadata !DIExpression()) #9, !dbg !1052
  br i1 %202, label %203, label %615, !dbg !1085

203:                                              ; preds = %196
  call void @llvm.dbg.value(metadata i8* %182, metadata !1051, metadata !DIExpression()) #9, !dbg !1052
  call void @llvm.dbg.value(metadata i8* %182, metadata !1086, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %180, metadata !1091, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i32* undef, metadata !1092, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i32* undef, metadata !1093, metadata !DIExpression()) #9, !dbg !1101
  %204 = lshr i16 %199, 2, !dbg !1104
  %205 = and i16 %204, 60, !dbg !1104
  call void @llvm.dbg.value(metadata i16 %205, metadata !1094, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1101
  %206 = zext i16 %205 to i64
  %207 = getelementptr i8, i8* %182, i64 %206, !dbg !1105
  call void @llvm.dbg.value(metadata i8* %207, metadata !1095, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %183, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4), !dbg !1106
  call void @llvm.dbg.declare(metadata i8* %4, metadata !1099, metadata !DIExpression()) #9, !dbg !1107
  %208 = icmp ult i16 %205, 21
  br i1 %208, label %474, label %209, !dbg !1108

209:                                              ; preds = %203
  call void @llvm.dbg.value(metadata i8 0, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %183, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %210 = getelementptr inbounds i8, i8* %182, i64 21, !dbg !1110
  %211 = icmp ugt i8* %210, %207, !dbg !1115
  %212 = icmp ugt i8* %210, %180
  %213 = or i1 %212, %211, !dbg !1116
  br i1 %213, label %474, label %214, !dbg !1116

214:                                              ; preds = %209
  %215 = load i8, i8* %183, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %215, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %215, label %216 [
    i8 0, label %474
    i8 1, label %241
  ], !dbg !1118

216:                                              ; preds = %214
  %217 = getelementptr inbounds i8, i8* %182, i64 22, !dbg !1119
  %218 = icmp ult i8* %207, %217, !dbg !1121
  %219 = icmp ugt i8* %217, %180
  %220 = or i1 %219, %218, !dbg !1122
  br i1 %220, label %474, label %221, !dbg !1122

221:                                              ; preds = %216
  %222 = load i8, i8* %210, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %222, i8* %4, align 1, !dbg !1124, !tbaa !957
  %223 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %224 = icmp ult i8 %223, 2, !dbg !1127
  br i1 %224, label %474, label %225, !dbg !1128

225:                                              ; preds = %221
  %226 = icmp eq i8 %215, 8, !dbg !1129
  br i1 %226, label %227, label %237, !dbg !1131

227:                                              ; preds = %225
  %228 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %229 = icmp eq i8 %228, 10, !dbg !1133
  br i1 %229, label %230, label %237, !dbg !1134

230:                                              ; preds = %469, %442, %416, %390, %364, %338, %312, %286, %260, %227
  %231 = phi i8* [ %183, %227 ], [ %242, %260 ], [ %268, %286 ], [ %294, %312 ], [ %320, %338 ], [ %346, %364 ], [ %372, %390 ], [ %398, %416 ], [ %424, %442 ], [ %450, %469 ]
  %232 = phi i8* [ %217, %227 ], [ %250, %260 ], [ %276, %286 ], [ %302, %312 ], [ %328, %338 ], [ %354, %364 ], [ %380, %390 ], [ %406, %416 ], [ %432, %442 ], [ %459, %469 ], !dbg !1119
  %233 = getelementptr inbounds i8, i8* %231, i64 10, !dbg !1135
  %234 = icmp ugt i8* %233, %207, !dbg !1138
  %235 = icmp ugt i8* %233, %180
  %236 = or i1 %234, %235, !dbg !1139
  br i1 %236, label %474, label %475, !dbg !1139

237:                                              ; preds = %227, %225
  %238 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %239 = zext i8 %238 to i64
  %240 = getelementptr inbounds i8, i8* %183, i64 %239, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %240, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %241, !dbg !1142

241:                                              ; preds = %237, %214
  %242 = phi i8* [ %240, %237 ], [ %210, %214 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 1, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %242, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %243 = getelementptr inbounds i8, i8* %242, i64 1, !dbg !1110
  %244 = icmp ugt i8* %243, %207, !dbg !1115
  %245 = icmp ugt i8* %243, %180
  %246 = or i1 %244, %245, !dbg !1116
  br i1 %246, label %474, label %247, !dbg !1116

247:                                              ; preds = %241
  %248 = load i8, i8* %242, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %248, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %248, label %249 [
    i8 0, label %474
    i8 1, label %267
  ], !dbg !1118

249:                                              ; preds = %247
  %250 = getelementptr inbounds i8, i8* %242, i64 2, !dbg !1119
  %251 = icmp ugt i8* %250, %207, !dbg !1121
  %252 = icmp ugt i8* %250, %180
  %253 = or i1 %251, %252, !dbg !1122
  br i1 %253, label %474, label %254, !dbg !1122

254:                                              ; preds = %249
  %255 = load i8, i8* %243, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %255, i8* %4, align 1, !dbg !1124, !tbaa !957
  %256 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %257 = icmp ult i8 %256, 2, !dbg !1127
  br i1 %257, label %474, label %258, !dbg !1128

258:                                              ; preds = %254
  %259 = icmp eq i8 %248, 8, !dbg !1129
  br i1 %259, label %260, label %263, !dbg !1131

260:                                              ; preds = %258
  %261 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %262 = icmp eq i8 %261, 10, !dbg !1133
  br i1 %262, label %230, label %263, !dbg !1134

263:                                              ; preds = %260, %258
  %264 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %265 = zext i8 %264 to i64
  %266 = getelementptr inbounds i8, i8* %242, i64 %265, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %266, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %267, !dbg !1142

267:                                              ; preds = %263, %247
  %268 = phi i8* [ %266, %263 ], [ %243, %247 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 2, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %268, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %269 = getelementptr inbounds i8, i8* %268, i64 1, !dbg !1110
  %270 = icmp ugt i8* %269, %207, !dbg !1115
  %271 = icmp ugt i8* %269, %180
  %272 = or i1 %270, %271, !dbg !1116
  br i1 %272, label %474, label %273, !dbg !1116

273:                                              ; preds = %267
  %274 = load i8, i8* %268, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %274, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %274, label %275 [
    i8 0, label %474
    i8 1, label %293
  ], !dbg !1118

275:                                              ; preds = %273
  %276 = getelementptr inbounds i8, i8* %268, i64 2, !dbg !1119
  %277 = icmp ugt i8* %276, %207, !dbg !1121
  %278 = icmp ugt i8* %276, %180
  %279 = or i1 %277, %278, !dbg !1122
  br i1 %279, label %474, label %280, !dbg !1122

280:                                              ; preds = %275
  %281 = load i8, i8* %269, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %281, i8* %4, align 1, !dbg !1124, !tbaa !957
  %282 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %283 = icmp ult i8 %282, 2, !dbg !1127
  br i1 %283, label %474, label %284, !dbg !1128

284:                                              ; preds = %280
  %285 = icmp eq i8 %274, 8, !dbg !1129
  br i1 %285, label %286, label %289, !dbg !1131

286:                                              ; preds = %284
  %287 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %288 = icmp eq i8 %287, 10, !dbg !1133
  br i1 %288, label %230, label %289, !dbg !1134

289:                                              ; preds = %286, %284
  %290 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %291 = zext i8 %290 to i64
  %292 = getelementptr inbounds i8, i8* %268, i64 %291, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %292, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %293, !dbg !1142

293:                                              ; preds = %289, %273
  %294 = phi i8* [ %292, %289 ], [ %269, %273 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 3, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %294, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %295 = getelementptr inbounds i8, i8* %294, i64 1, !dbg !1110
  %296 = icmp ugt i8* %295, %207, !dbg !1115
  %297 = icmp ugt i8* %295, %180
  %298 = or i1 %296, %297, !dbg !1116
  br i1 %298, label %474, label %299, !dbg !1116

299:                                              ; preds = %293
  %300 = load i8, i8* %294, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %300, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %300, label %301 [
    i8 0, label %474
    i8 1, label %319
  ], !dbg !1118

301:                                              ; preds = %299
  %302 = getelementptr inbounds i8, i8* %294, i64 2, !dbg !1119
  %303 = icmp ugt i8* %302, %207, !dbg !1121
  %304 = icmp ugt i8* %302, %180
  %305 = or i1 %303, %304, !dbg !1122
  br i1 %305, label %474, label %306, !dbg !1122

306:                                              ; preds = %301
  %307 = load i8, i8* %295, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %307, i8* %4, align 1, !dbg !1124, !tbaa !957
  %308 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %309 = icmp ult i8 %308, 2, !dbg !1127
  br i1 %309, label %474, label %310, !dbg !1128

310:                                              ; preds = %306
  %311 = icmp eq i8 %300, 8, !dbg !1129
  br i1 %311, label %312, label %315, !dbg !1131

312:                                              ; preds = %310
  %313 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %314 = icmp eq i8 %313, 10, !dbg !1133
  br i1 %314, label %230, label %315, !dbg !1134

315:                                              ; preds = %312, %310
  %316 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %317 = zext i8 %316 to i64
  %318 = getelementptr inbounds i8, i8* %294, i64 %317, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %318, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %319, !dbg !1142

319:                                              ; preds = %315, %299
  %320 = phi i8* [ %318, %315 ], [ %295, %299 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 4, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %320, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %321 = getelementptr inbounds i8, i8* %320, i64 1, !dbg !1110
  %322 = icmp ugt i8* %321, %207, !dbg !1115
  %323 = icmp ugt i8* %321, %180
  %324 = or i1 %322, %323, !dbg !1116
  br i1 %324, label %474, label %325, !dbg !1116

325:                                              ; preds = %319
  %326 = load i8, i8* %320, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %326, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %326, label %327 [
    i8 0, label %474
    i8 1, label %345
  ], !dbg !1118

327:                                              ; preds = %325
  %328 = getelementptr inbounds i8, i8* %320, i64 2, !dbg !1119
  %329 = icmp ugt i8* %328, %207, !dbg !1121
  %330 = icmp ugt i8* %328, %180
  %331 = or i1 %329, %330, !dbg !1122
  br i1 %331, label %474, label %332, !dbg !1122

332:                                              ; preds = %327
  %333 = load i8, i8* %321, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %333, i8* %4, align 1, !dbg !1124, !tbaa !957
  %334 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %335 = icmp ult i8 %334, 2, !dbg !1127
  br i1 %335, label %474, label %336, !dbg !1128

336:                                              ; preds = %332
  %337 = icmp eq i8 %326, 8, !dbg !1129
  br i1 %337, label %338, label %341, !dbg !1131

338:                                              ; preds = %336
  %339 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %340 = icmp eq i8 %339, 10, !dbg !1133
  br i1 %340, label %230, label %341, !dbg !1134

341:                                              ; preds = %338, %336
  %342 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %343 = zext i8 %342 to i64
  %344 = getelementptr inbounds i8, i8* %320, i64 %343, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %344, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %345, !dbg !1142

345:                                              ; preds = %341, %325
  %346 = phi i8* [ %344, %341 ], [ %321, %325 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 5, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %346, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %347 = getelementptr inbounds i8, i8* %346, i64 1, !dbg !1110
  %348 = icmp ugt i8* %347, %207, !dbg !1115
  %349 = icmp ugt i8* %347, %180
  %350 = or i1 %348, %349, !dbg !1116
  br i1 %350, label %474, label %351, !dbg !1116

351:                                              ; preds = %345
  %352 = load i8, i8* %346, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %352, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %352, label %353 [
    i8 0, label %474
    i8 1, label %371
  ], !dbg !1118

353:                                              ; preds = %351
  %354 = getelementptr inbounds i8, i8* %346, i64 2, !dbg !1119
  %355 = icmp ugt i8* %354, %207, !dbg !1121
  %356 = icmp ugt i8* %354, %180
  %357 = or i1 %355, %356, !dbg !1122
  br i1 %357, label %474, label %358, !dbg !1122

358:                                              ; preds = %353
  %359 = load i8, i8* %347, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %359, i8* %4, align 1, !dbg !1124, !tbaa !957
  %360 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %361 = icmp ult i8 %360, 2, !dbg !1127
  br i1 %361, label %474, label %362, !dbg !1128

362:                                              ; preds = %358
  %363 = icmp eq i8 %352, 8, !dbg !1129
  br i1 %363, label %364, label %367, !dbg !1131

364:                                              ; preds = %362
  %365 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %366 = icmp eq i8 %365, 10, !dbg !1133
  br i1 %366, label %230, label %367, !dbg !1134

367:                                              ; preds = %364, %362
  %368 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %369 = zext i8 %368 to i64
  %370 = getelementptr inbounds i8, i8* %346, i64 %369, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %370, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %371, !dbg !1142

371:                                              ; preds = %367, %351
  %372 = phi i8* [ %370, %367 ], [ %347, %351 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 6, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %372, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %373 = getelementptr inbounds i8, i8* %372, i64 1, !dbg !1110
  %374 = icmp ugt i8* %373, %207, !dbg !1115
  %375 = icmp ugt i8* %373, %180
  %376 = or i1 %374, %375, !dbg !1116
  br i1 %376, label %474, label %377, !dbg !1116

377:                                              ; preds = %371
  %378 = load i8, i8* %372, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %378, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %378, label %379 [
    i8 0, label %474
    i8 1, label %397
  ], !dbg !1118

379:                                              ; preds = %377
  %380 = getelementptr inbounds i8, i8* %372, i64 2, !dbg !1119
  %381 = icmp ugt i8* %380, %207, !dbg !1121
  %382 = icmp ugt i8* %380, %180
  %383 = or i1 %381, %382, !dbg !1122
  br i1 %383, label %474, label %384, !dbg !1122

384:                                              ; preds = %379
  %385 = load i8, i8* %373, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %385, i8* %4, align 1, !dbg !1124, !tbaa !957
  %386 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %387 = icmp ult i8 %386, 2, !dbg !1127
  br i1 %387, label %474, label %388, !dbg !1128

388:                                              ; preds = %384
  %389 = icmp eq i8 %378, 8, !dbg !1129
  br i1 %389, label %390, label %393, !dbg !1131

390:                                              ; preds = %388
  %391 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %392 = icmp eq i8 %391, 10, !dbg !1133
  br i1 %392, label %230, label %393, !dbg !1134

393:                                              ; preds = %390, %388
  %394 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %395 = zext i8 %394 to i64
  %396 = getelementptr inbounds i8, i8* %372, i64 %395, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %396, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %397, !dbg !1142

397:                                              ; preds = %393, %377
  %398 = phi i8* [ %396, %393 ], [ %373, %377 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 7, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %398, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %399 = getelementptr inbounds i8, i8* %398, i64 1, !dbg !1110
  %400 = icmp ugt i8* %399, %207, !dbg !1115
  %401 = icmp ugt i8* %399, %180
  %402 = or i1 %400, %401, !dbg !1116
  br i1 %402, label %474, label %403, !dbg !1116

403:                                              ; preds = %397
  %404 = load i8, i8* %398, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %404, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %404, label %405 [
    i8 0, label %474
    i8 1, label %423
  ], !dbg !1118

405:                                              ; preds = %403
  %406 = getelementptr inbounds i8, i8* %398, i64 2, !dbg !1119
  %407 = icmp ugt i8* %406, %207, !dbg !1121
  %408 = icmp ugt i8* %406, %180
  %409 = or i1 %407, %408, !dbg !1122
  br i1 %409, label %474, label %410, !dbg !1122

410:                                              ; preds = %405
  %411 = load i8, i8* %399, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %411, i8* %4, align 1, !dbg !1124, !tbaa !957
  %412 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %413 = icmp ult i8 %412, 2, !dbg !1127
  br i1 %413, label %474, label %414, !dbg !1128

414:                                              ; preds = %410
  %415 = icmp eq i8 %404, 8, !dbg !1129
  br i1 %415, label %416, label %419, !dbg !1131

416:                                              ; preds = %414
  %417 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %418 = icmp eq i8 %417, 10, !dbg !1133
  br i1 %418, label %230, label %419, !dbg !1134

419:                                              ; preds = %416, %414
  %420 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %421 = zext i8 %420 to i64
  %422 = getelementptr inbounds i8, i8* %398, i64 %421, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %422, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %423, !dbg !1142

423:                                              ; preds = %419, %403
  %424 = phi i8* [ %422, %419 ], [ %399, %403 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 8, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %424, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %425 = getelementptr inbounds i8, i8* %424, i64 1, !dbg !1110
  %426 = icmp ugt i8* %425, %207, !dbg !1115
  %427 = icmp ugt i8* %425, %180
  %428 = or i1 %426, %427, !dbg !1116
  br i1 %428, label %474, label %429, !dbg !1116

429:                                              ; preds = %423
  %430 = load i8, i8* %424, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %430, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  switch i8 %430, label %431 [
    i8 0, label %474
    i8 1, label %449
  ], !dbg !1118

431:                                              ; preds = %429
  %432 = getelementptr inbounds i8, i8* %424, i64 2, !dbg !1119
  %433 = icmp ugt i8* %432, %207, !dbg !1121
  %434 = icmp ugt i8* %432, %180
  %435 = or i1 %433, %434, !dbg !1122
  br i1 %435, label %474, label %436, !dbg !1122

436:                                              ; preds = %431
  %437 = load i8, i8* %425, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %437, i8* %4, align 1, !dbg !1124, !tbaa !957
  %438 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %439 = icmp ult i8 %438, 2, !dbg !1127
  br i1 %439, label %474, label %440, !dbg !1128

440:                                              ; preds = %436
  %441 = icmp eq i8 %430, 8, !dbg !1129
  br i1 %441, label %442, label %445, !dbg !1131

442:                                              ; preds = %440
  %443 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %444 = icmp eq i8 %443, 10, !dbg !1133
  br i1 %444, label %230, label %445, !dbg !1134

445:                                              ; preds = %442, %440
  %446 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  %447 = zext i8 %446 to i64
  %448 = getelementptr inbounds i8, i8* %424, i64 %447, !dbg !1141
  call void @llvm.dbg.value(metadata i8* %448, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  br label %449, !dbg !1142

449:                                              ; preds = %445, %429
  %450 = phi i8* [ %448, %445 ], [ %425, %429 ], !dbg !1143
  call void @llvm.dbg.value(metadata i8 9, metadata !1097, metadata !DIExpression()) #9, !dbg !1101
  call void @llvm.dbg.value(metadata i8* %450, metadata !1096, metadata !DIExpression()) #9, !dbg !1101
  %451 = getelementptr inbounds i8, i8* %450, i64 1, !dbg !1110
  %452 = icmp ugt i8* %451, %207, !dbg !1115
  %453 = icmp ugt i8* %451, %180
  %454 = or i1 %452, %453, !dbg !1116
  br i1 %454, label %474, label %455, !dbg !1116

455:                                              ; preds = %449
  %456 = load i8, i8* %450, align 1, !dbg !1117, !tbaa !957
  call void @llvm.dbg.value(metadata i8 %456, metadata !1098, metadata !DIExpression()) #9, !dbg !1101
  %457 = icmp ult i8 %456, 2, !dbg !1118
  br i1 %457, label %474, label %458, !dbg !1118

458:                                              ; preds = %455
  %459 = getelementptr inbounds i8, i8* %450, i64 2, !dbg !1119
  %460 = icmp ugt i8* %459, %207, !dbg !1121
  %461 = icmp ugt i8* %459, %180
  %462 = or i1 %460, %461, !dbg !1122
  br i1 %462, label %474, label %463, !dbg !1122

463:                                              ; preds = %458
  %464 = load i8, i8* %451, align 1, !dbg !1123, !tbaa !957
  store volatile i8 %464, i8* %4, align 1, !dbg !1124, !tbaa !957
  %465 = load volatile i8, i8* %4, align 1, !dbg !1125, !tbaa !957
  %466 = icmp ult i8 %465, 2, !dbg !1127
  br i1 %466, label %474, label %467, !dbg !1128

467:                                              ; preds = %463
  %468 = icmp eq i8 %456, 8, !dbg !1129
  br i1 %468, label %469, label %472, !dbg !1131

469:                                              ; preds = %467
  %470 = load volatile i8, i8* %4, align 1, !dbg !1132, !tbaa !957
  %471 = icmp eq i8 %470, 10, !dbg !1133
  br i1 %471, label %230, label %472, !dbg !1134

472:                                              ; preds = %469, %467
  %473 = load volatile i8, i8* %4, align 1, !dbg !1140, !tbaa !957
  call void @llvm.dbg.value(metadata !DIArgList(i8* %450, i8 %473), metadata !1096, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #9, !dbg !1101
  br label %474, !dbg !1142

474:                                              ; preds = %472, %463, %458, %455, %449, %436, %431, %429, %423, %410, %405, %403, %397, %384, %379, %377, %371, %358, %353, %351, %345, %332, %327, %325, %319, %306, %301, %299, %293, %280, %275, %273, %267, %254, %249, %247, %241, %230, %221, %216, %214, %209, %203
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4), !dbg !1144
  br label %615, !dbg !1145

475:                                              ; preds = %230
  %476 = bitcast i8* %232 to i32*, !dbg !1146
  %477 = load i32, i32* %476, align 4, !dbg !1146, !tbaa !1014
  %478 = tail call i32 @llvm.bswap.i32(i32 %477) #9, !dbg !1146
  call void @llvm.dbg.value(metadata i32 %478, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  %479 = getelementptr inbounds i8, i8* %231, i64 6, !dbg !1147
  %480 = bitcast i8* %479 to i32*, !dbg !1147
  %481 = load i32, i32* %480, align 4, !dbg !1147, !tbaa !1014
  %482 = tail call i32 @llvm.bswap.i32(i32 %481) #9, !dbg !1147
  call void @llvm.dbg.value(metadata i32 %482, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4), !dbg !1144
  %483 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 0, !dbg !1148
  %484 = load i8*, i8** %483, align 8, !dbg !1148, !tbaa !579
  %485 = ptrtoint i8* %194 to i64, !dbg !1149
  %486 = ptrtoint i8* %484 to i64, !dbg !1149
  %487 = sub i64 %485, %486, !dbg !1149
  %488 = load i32, i32* %8, align 8, !dbg !1150, !tbaa !592
  %489 = zext i32 %488 to i64, !dbg !1151
  %490 = icmp slt i64 %487, %489, !dbg !1152
  %491 = icmp ne i16 %200, 0, !dbg !1153
  %492 = select i1 %490, i1 true, i1 %491, !dbg !1153
  %493 = zext i1 %492 to i8, !dbg !1154
  call void @llvm.dbg.value(metadata i8 %493, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8* %182, metadata !1051, metadata !DIExpression()) #9, !dbg !1052
  %494 = lshr i16 %199, 12, !dbg !1155
  %495 = trunc i16 %494 to i8, !dbg !1155
  %496 = and i8 %495, 1, !dbg !1155
  call void @llvm.dbg.value(metadata i8 %496, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  %497 = and i16 %199, 1024, !dbg !1156
  %498 = icmp eq i16 %497, 0, !dbg !1156
  br i1 %498, label %499, label %511, !dbg !1158

499:                                              ; preds = %475
  %500 = and i16 %199, 256, !dbg !1159
  %501 = and i16 %199, 768, !dbg !1161
  %502 = icmp eq i16 %501, 512, !dbg !1161
  %503 = lshr exact i16 %500, 6, !dbg !1161
  %504 = trunc i16 %503 to i8, !dbg !1161
  %505 = lshr exact i16 %500, 7, !dbg !1161
  %506 = trunc i16 %505 to i8, !dbg !1161
  br i1 %502, label %507, label %511, !dbg !1161

507:                                              ; preds = %499
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8* %182, metadata !1051, metadata !DIExpression()) #9, !dbg !1052
  %508 = and i16 %199, 4096, !dbg !1162
  %509 = icmp eq i16 %508, 0, !dbg !1162
  %510 = select i1 %509, i8 1, i8 2, !dbg !1162
  call void @llvm.dbg.value(metadata i8 %510, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  br label %511, !dbg !1165

511:                                              ; preds = %499, %475, %507
  %512 = phi i8 [ 0, %507 ], [ undef, %475 ], [ 1, %499 ]
  %513 = phi i8 [ %510, %507 ], [ 5, %475 ], [ %504, %499 ], !dbg !1166
  %514 = phi i8 [ 1, %507 ], [ 3, %475 ], [ %506, %499 ], !dbg !1166
  call void @llvm.dbg.value(metadata i8 %514, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %513, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %512, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8* %182, metadata !1051, metadata !DIExpression()) #9, !dbg !1052
  %515 = bitcast i8* %182 to i16*, !dbg !1167
  %516 = load i16, i16* %515, align 4, !dbg !1167, !tbaa !1168
  store i16 %516, i16* %178, align 2, !dbg !1170, !tbaa !833
  %517 = getelementptr inbounds i8, i8* %182, i64 2, !dbg !1171
  %518 = bitcast i8* %517 to i16*, !dbg !1171
  %519 = load i16, i16* %518, align 2, !dbg !1171, !tbaa !1172
  store i16 %519, i16* %179, align 2, !dbg !1173, !tbaa !833
  call void @llvm.dbg.value(metadata i8* %182, metadata !681, metadata !DIExpression()), !dbg !772
  %520 = load i8, i8* %171, align 2, !dbg !1174, !tbaa !1184
  br label %617, !dbg !1185

521:                                              ; preds = %165
  %522 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 6), align 2, !dbg !1186, !tbaa !1188, !range !1035
  %523 = icmp ne i8 %522, 0, !dbg !1186
  %524 = icmp eq i8 %168, 58
  %525 = and i1 %523, %524, !dbg !1189
  br i1 %525, label %526, label %569, !dbg !1189

526:                                              ; preds = %521
  %527 = load i8, i8* %171, align 2, !dbg !1190, !tbaa !856
  %528 = icmp eq i8 %527, 10, !dbg !1191
  br i1 %528, label %531, label %529, !dbg !1192

529:                                              ; preds = %526
  %530 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 6), align 2, !dbg !1193, !tbaa !1188, !range !1035
  br label %615, !dbg !1195

531:                                              ; preds = %526
  %532 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 1, !dbg !1196
  %533 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 1, !dbg !1197
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1198, metadata !DIExpression()), !dbg !1209
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !1204, metadata !DIExpression()), !dbg !1209
  call void @llvm.dbg.value(metadata i16* %532, metadata !1205, metadata !DIExpression()), !dbg !1209
  call void @llvm.dbg.value(metadata i16* %533, metadata !1206, metadata !DIExpression()), !dbg !1209
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !1207, metadata !DIExpression()), !dbg !1209
  %534 = bitcast i8** %12 to %struct.icmp6hdr**, !dbg !1211
  %535 = load %struct.icmp6hdr*, %struct.icmp6hdr** %534, align 8, !dbg !1211, !tbaa !587
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !1213, metadata !DIExpression()), !dbg !1221
  call void @llvm.dbg.value(metadata i8* undef, metadata !1218, metadata !DIExpression()), !dbg !1221
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !1219, metadata !DIExpression()), !dbg !1221
  %536 = bitcast %struct.hdr_cursor* %11 to %struct.icmp6hdr**, !dbg !1223
  %537 = load %struct.icmp6hdr*, %struct.icmp6hdr** %536, align 8, !dbg !1223, !tbaa !589
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %537, metadata !1220, metadata !DIExpression()), !dbg !1221
  %538 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 1, !dbg !1224
  %539 = icmp ugt %struct.icmp6hdr* %538, %535, !dbg !1226
  br i1 %539, label %615, label %540, !dbg !1227

540:                                              ; preds = %531
  %541 = getelementptr %struct.icmp6hdr, %struct.icmp6hdr* %538, i64 0, i32 0, !dbg !1228
  store i8* %541, i8** %14, align 8, !dbg !1229, !tbaa !589
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %537, metadata !1208, metadata !DIExpression()), !dbg !1209
  %542 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 0, i32 1, !dbg !1230
  %543 = load i8, i8* %542, align 1, !dbg !1230, !tbaa !1232
  %544 = icmp eq i8 %543, 0, !dbg !1234
  br i1 %544, label %545, label %615, !dbg !1235

545:                                              ; preds = %540
  %546 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 0, i32 0, !dbg !1236
  %547 = load i8, i8* %546, align 4, !dbg !1236, !tbaa !1238
  switch i8 %547, label %615 [
    i8 -128, label %548
    i8 -127, label %554
  ], !dbg !1239

548:                                              ; preds = %545
  %549 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 0, i32 3, !dbg !1240
  %550 = bitcast %union.anon.26* %549 to %struct.icmpv6_echo*, !dbg !1240
  %551 = getelementptr inbounds %struct.icmpv6_echo, %struct.icmpv6_echo* %550, i64 0, i32 1, !dbg !1240
  %552 = load i16, i16* %551, align 2, !dbg !1240, !tbaa !957
  %553 = zext i16 %552 to i32, !dbg !1242
  call void @llvm.dbg.value(metadata i32 %553, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  br label %560, !dbg !1243

554:                                              ; preds = %545
  %555 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 0, i32 3, !dbg !1244
  %556 = bitcast %union.anon.26* %555 to %struct.icmpv6_echo*, !dbg !1244
  %557 = getelementptr inbounds %struct.icmpv6_echo, %struct.icmpv6_echo* %556, i64 0, i32 1, !dbg !1244
  %558 = load i16, i16* %557, align 2, !dbg !1244, !tbaa !957
  %559 = zext i16 %558 to i32, !dbg !1247
  call void @llvm.dbg.value(metadata i32 %559, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  br label %560

560:                                              ; preds = %554, %548
  %561 = phi i8 [ 1, %554 ], [ 0, %548 ], !dbg !1248
  %562 = phi i8 [ 0, %554 ], [ 1, %548 ], !dbg !1248
  %563 = phi i32 [ %559, %554 ], [ 0, %548 ], !dbg !1248
  %564 = phi i32 [ 0, %554 ], [ %553, %548 ], !dbg !1248
  call void @llvm.dbg.value(metadata i32 %564, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i32 %563, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %562, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %561, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %537, metadata !1208, metadata !DIExpression()), !dbg !1209
  %565 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %537, i64 0, i32 3, !dbg !1249
  %566 = bitcast %union.anon.26* %565 to i16*, !dbg !1249
  %567 = load i16, i16* %566, align 4, !dbg !1249, !tbaa !957
  store i16 %567, i16* %532, align 2, !dbg !1250, !tbaa !833
  %568 = load i16, i16* %566, align 4, !dbg !1251, !tbaa !957
  store i16 %568, i16* %533, align 2, !dbg !1252, !tbaa !833
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %537, metadata !681, metadata !DIExpression()), !dbg !772
  br label %617, !dbg !1253

569:                                              ; preds = %521
  %570 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 6), align 2, !dbg !1193, !tbaa !1188, !range !1035
  %571 = icmp ne i8 %570, 0, !dbg !1193
  %572 = icmp eq i8 %168, 1
  %573 = and i1 %571, %572, !dbg !1195
  br i1 %573, label %574, label %615, !dbg !1195

574:                                              ; preds = %569
  %575 = load i8, i8* %171, align 2, !dbg !1254, !tbaa !856
  %576 = icmp eq i8 %575, 2, !dbg !1255
  br i1 %576, label %577, label %615, !dbg !1256

577:                                              ; preds = %574
  %578 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 1, !dbg !1257
  %579 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 1, !dbg !1258
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1259, metadata !DIExpression()), !dbg !1270
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !1265, metadata !DIExpression()), !dbg !1270
  call void @llvm.dbg.value(metadata i16* %578, metadata !1266, metadata !DIExpression()), !dbg !1270
  call void @llvm.dbg.value(metadata i16* %579, metadata !1267, metadata !DIExpression()), !dbg !1270
  call void @llvm.dbg.value(metadata %struct.protocol_info* undef, metadata !1268, metadata !DIExpression()), !dbg !1270
  %580 = bitcast i8** %12 to %struct.icmphdr**, !dbg !1272
  %581 = load %struct.icmphdr*, %struct.icmphdr** %580, align 8, !dbg !1272, !tbaa !587
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* %11, metadata !1274, metadata !DIExpression()), !dbg !1282
  call void @llvm.dbg.value(metadata i8* undef, metadata !1279, metadata !DIExpression()), !dbg !1282
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !1280, metadata !DIExpression()), !dbg !1282
  %582 = bitcast %struct.hdr_cursor* %11 to %struct.icmphdr**, !dbg !1284
  %583 = load %struct.icmphdr*, %struct.icmphdr** %582, align 8, !dbg !1284, !tbaa !589
  call void @llvm.dbg.value(metadata %struct.icmphdr* %583, metadata !1281, metadata !DIExpression()), !dbg !1282
  %584 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 1, !dbg !1285
  %585 = icmp ugt %struct.icmphdr* %584, %581, !dbg !1287
  br i1 %585, label %615, label %586, !dbg !1288

586:                                              ; preds = %577
  %587 = getelementptr %struct.icmphdr, %struct.icmphdr* %584, i64 0, i32 0, !dbg !1289
  store i8* %587, i8** %14, align 8, !dbg !1290, !tbaa !589
  call void @llvm.dbg.value(metadata %struct.icmphdr* %583, metadata !1269, metadata !DIExpression()), !dbg !1270
  %588 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 0, i32 1, !dbg !1291
  %589 = load i8, i8* %588, align 1, !dbg !1291, !tbaa !1293
  %590 = icmp eq i8 %589, 0, !dbg !1295
  br i1 %590, label %591, label %615, !dbg !1296

591:                                              ; preds = %586
  %592 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 0, i32 0, !dbg !1297
  %593 = load i8, i8* %592, align 4, !dbg !1297, !tbaa !1299
  switch i8 %593, label %615 [
    i8 8, label %594
    i8 0, label %600
  ], !dbg !1300

594:                                              ; preds = %591
  %595 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 0, i32 3, !dbg !1301
  %596 = bitcast %union.anon.23* %595 to %struct.anon.24*, !dbg !1303
  %597 = getelementptr inbounds %struct.anon.24, %struct.anon.24* %596, i64 0, i32 1, !dbg !1304
  %598 = load i16, i16* %597, align 2, !dbg !1304, !tbaa !957
  %599 = zext i16 %598 to i32, !dbg !1305
  call void @llvm.dbg.value(metadata i32 %599, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  br label %606, !dbg !1306

600:                                              ; preds = %591
  %601 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 0, i32 3, !dbg !1307
  %602 = bitcast %union.anon.23* %601 to %struct.anon.24*, !dbg !1310
  %603 = getelementptr inbounds %struct.anon.24, %struct.anon.24* %602, i64 0, i32 1, !dbg !1311
  %604 = load i16, i16* %603, align 2, !dbg !1311, !tbaa !957
  %605 = zext i16 %604 to i32, !dbg !1312
  call void @llvm.dbg.value(metadata i32 %605, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 1, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  br label %606

606:                                              ; preds = %600, %594
  %607 = phi i8 [ 1, %600 ], [ 0, %594 ], !dbg !1313
  %608 = phi i8 [ 0, %600 ], [ 1, %594 ], !dbg !1313
  %609 = phi i32 [ %605, %600 ], [ 0, %594 ], !dbg !1313
  %610 = phi i32 [ 0, %600 ], [ %599, %594 ], !dbg !1313
  call void @llvm.dbg.value(metadata i32 %610, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i32 %609, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %608, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %607, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 0, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  call void @llvm.dbg.value(metadata %struct.icmphdr* %583, metadata !1269, metadata !DIExpression()), !dbg !1270
  %611 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %583, i64 0, i32 3, !dbg !1314
  %612 = bitcast %union.anon.23* %611 to i16*, !dbg !1315
  %613 = load i16, i16* %612, align 4, !dbg !1315, !tbaa !957
  store i16 %613, i16* %578, align 2, !dbg !1316, !tbaa !833
  %614 = load i16, i16* %612, align 4, !dbg !1317, !tbaa !957
  store i16 %614, i16* %579, align 2, !dbg !1318, !tbaa !833
  call void @llvm.dbg.value(metadata %struct.icmphdr* %583, metadata !681, metadata !DIExpression()), !dbg !772
  br label %617, !dbg !1319

615:                                              ; preds = %574, %569, %474, %177, %185, %192, %196, %540, %545, %531, %529, %586, %591, %577
  call void @llvm.dbg.value(metadata i32 %625, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i32 %624, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %623, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %622, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %621, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %620, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %619, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !603, metadata !DIExpression()), !dbg !772
  %616 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 15, !dbg !1320
  store i8 0, i8* %616, align 1, !dbg !1321, !tbaa !1323
  br label %687, !dbg !1324

617:                                              ; preds = %511, %560, %606
  %618 = phi i8 [ %520, %511 ], [ 10, %560 ], [ 2, %606 ], !dbg !1174
  %619 = phi i8 [ %512, %511 ], [ 0, %560 ], [ 0, %606 ]
  %620 = phi i8 [ %513, %511 ], [ 0, %560 ], [ 0, %606 ]
  %621 = phi i8 [ %514, %511 ], [ 0, %560 ], [ 0, %606 ]
  %622 = phi i8 [ %496, %511 ], [ %561, %560 ], [ %607, %606 ]
  %623 = phi i8 [ %493, %511 ], [ %562, %560 ], [ %608, %606 ]
  %624 = phi i32 [ %482, %511 ], [ %563, %560 ], [ %609, %606 ]
  %625 = phi i32 [ %478, %511 ], [ %564, %560 ], [ %610, %606 ]
  call void @llvm.dbg.value(metadata i32 %625, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i32 %624, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %623, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %622, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %621, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %620, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i8 %619, metadata !613, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !772
  call void @llvm.dbg.value(metadata i32 0, metadata !603, metadata !DIExpression()), !dbg !772
  %626 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 15, !dbg !1320
  store i8 1, i8* %626, align 1, !dbg !1325, !tbaa !1323
  %627 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !1326
  store i32 %625, i32* %627, align 4, !dbg !1327, !tbaa !1328
  %628 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !1329
  store i8 %623, i8* %628, align 4, !dbg !1330, !tbaa !1331
  %629 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 1, !dbg !1332
  store i32 %624, i32* %629, align 4, !dbg !1333, !tbaa !1334
  %630 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !1335
  store i8 %622, i8* %630, align 1, !dbg !1336, !tbaa !1337
  %631 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !1338
  store i8 %621, i8* %631, align 2, !dbg !1339, !tbaa !1340
  %632 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !1341
  store i8 %620, i8* %632, align 1, !dbg !1342, !tbaa !1343
  %633 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 14, !dbg !1344
  store i8 %619, i8* %633, align 8, !dbg !1345, !tbaa !1346
  %634 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, !dbg !1347
  call void @llvm.dbg.value(metadata %struct.network_tuple* %634, metadata !1179, metadata !DIExpression()) #9, !dbg !1348
  call void @llvm.dbg.value(metadata %struct.packet_id* %114, metadata !1180, metadata !DIExpression()) #9, !dbg !1348
  %635 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, i32 3, !dbg !1349
  store i8 %618, i8* %635, align 2, !dbg !1350, !tbaa !1184
  %636 = load i16, i16* %166, align 4, !dbg !1351, !tbaa !1352
  %637 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, i32 2, !dbg !1353
  store i16 %636, i16* %637, align 4, !dbg !1354, !tbaa !1352
  %638 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, !dbg !1355
  %639 = bitcast %struct.network_tuple* %634 to i8*, !dbg !1355
  %640 = bitcast %struct.flow_address* %638 to i8*, !dbg !1355
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %639, i8* noundef nonnull align 4 dereferenceable(20) %640, i64 20, i1 false) #9, !dbg !1355, !tbaa.struct !1356
  %641 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, i32 1, !dbg !1357
  %642 = bitcast %struct.flow_address* %641 to i8*, !dbg !1358
  %643 = bitcast %struct.packet_id* %167 to i8*, !dbg !1358
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %642, i8* noundef nonnull align 4 dereferenceable(20) %643, i64 20, i1 false) #9, !dbg !1358, !tbaa.struct !1356
  %644 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, i32 4, !dbg !1359
  store i8 0, i8* %644, align 1, !dbg !1360, !tbaa !1361
  %645 = tail call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* noundef nonnull %170), !dbg !1362
  %646 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !1363
  %647 = zext i1 %645 to i8, !dbg !1364
  store i8 %647, i8* %646, align 1, !dbg !1364, !tbaa !1365
  call void @llvm.dbg.value(metadata %struct.parsing_context* %0, metadata !1366, metadata !DIExpression()) #9, !dbg !1372
  %648 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 2, i32 0, !dbg !1374
  %649 = load i8*, i8** %648, align 8, !dbg !1374, !tbaa !1375
  %650 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %0, i64 0, i32 0, !dbg !1376
  %651 = load i8*, i8** %650, align 8, !dbg !1376, !tbaa !579
  %652 = ptrtoint i8* %649 to i64, !dbg !1377
  %653 = ptrtoint i8* %651 to i64, !dbg !1377
  %654 = sub i64 %652, %653, !dbg !1377
  %655 = trunc i64 %654 to i32, !dbg !1378
  call void @llvm.dbg.value(metadata i32 %655, metadata !1371, metadata !DIExpression()) #9, !dbg !1372
  %656 = load i32, i32* %8, align 8, !dbg !1379, !tbaa !592
  %657 = tail call i32 @llvm.usub.sat.i32(i32 %656, i32 %655) #9, !dbg !1380
  %658 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, !dbg !1381
  store i32 %657, i32* %658, align 4, !dbg !1382, !tbaa !1383
  br label %687

659:                                              ; preds = %108, %109
  %660 = phi i64 [ 3, %109 ], [ 2, %108 ]
  %661 = getelementptr inbounds i8, i8* %104, i64 1, !dbg !940
  %662 = load i8, i8* %661, align 1, !dbg !940, !tbaa !941
  %663 = zext i8 %662 to i64, !dbg !940
  %664 = shl nuw nsw i64 %663, %660, !dbg !940
  %665 = add nuw nsw i64 %664, 8, !dbg !940
  br label %666, !dbg !940

666:                                              ; preds = %659, %108
  %667 = phi i64 [ 8, %108 ], [ %665, %659 ]
  %668 = getelementptr inbounds i8, i8* %104, i64 %667, !dbg !940
  store i8* %668, i8** %14, align 8, !dbg !940, !tbaa !589
  br label %669, !dbg !1384

669:                                              ; preds = %666, %73, %87, %102, %69, %65, %61, %57, %53, %49, %2, %46
  call void @llvm.dbg.label(metadata !770), !dbg !1396
  call void @llvm.dbg.value(metadata i8 0, metadata !1390, metadata !DIExpression()) #9, !dbg !1397
  call void @llvm.dbg.value(metadata i32 %9, metadata !1391, metadata !DIExpression()) #9, !dbg !1397
  call void @llvm.dbg.value(metadata i8 0, metadata !1392, metadata !DIExpression()) #9, !dbg !1397
  %670 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !1384, !tbaa !1398, !range !1035
  %671 = icmp eq i8 %670, 0, !dbg !1384
  br i1 %671, label %687, label %672, !dbg !1399

672:                                              ; preds = %669
  %673 = bitcast i32* %3 to i8*, !dbg !1400
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %673) #9, !dbg !1400
  call void @llvm.dbg.value(metadata i32 0, metadata !1394, metadata !DIExpression()) #9, !dbg !1397
  store i32 0, i32* %3, align 4, !dbg !1401, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %3, metadata !1394, metadata !DIExpression(DW_OP_deref)) #9, !dbg !1397
  %674 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.13* @map_global_counters to i8*), i8* noundef nonnull %673) #9, !dbg !1402
  call void @llvm.dbg.value(metadata i8* %674, metadata !1393, metadata !DIExpression()) #9, !dbg !1397
  %675 = icmp eq i8* %674, null, !dbg !1403
  br i1 %675, label %686, label %676, !dbg !1405

676:                                              ; preds = %672
  %677 = getelementptr inbounds i8, i8* %674, i64 56, !dbg !1406
  %678 = bitcast i8* %677 to i64*, !dbg !1406
  %679 = load i64, i64* %678, align 8, !dbg !1408, !tbaa !1409
  %680 = add i64 %679, 1, !dbg !1408
  store i64 %680, i64* %678, align 8, !dbg !1408, !tbaa !1409
  %681 = zext i32 %9 to i64, !dbg !1413
  %682 = getelementptr inbounds i8, i8* %674, i64 64, !dbg !1414
  %683 = bitcast i8* %682 to i64*, !dbg !1397
  %684 = load i64, i64* %683, align 8, !dbg !1397, !tbaa !1415
  %685 = add i64 %684, %681, !dbg !1397
  store i64 %685, i64* %683, align 8, !dbg !1397, !tbaa !1415
  br label %686, !dbg !1416

686:                                              ; preds = %676, %672
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %673) #9, !dbg !1416
  br label %687

687:                                              ; preds = %686, %669, %615, %617
  %688 = phi i32 [ 0, %617 ], [ 0, %615 ], [ -1, %669 ], [ -1, %686 ], !dbg !772
  ret i32 %688, !dbg !1417
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind
define dso_local i32 @parse_packet_identifer_xdp(%struct.xdp_md* nocapture noundef readonly %0, %struct.packet_info* noundef %1) local_unnamed_addr #0 !dbg !1418 {
  %3 = alloca %struct.parsing_context, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1431, metadata !DIExpression()), !dbg !1434
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !1432, metadata !DIExpression()), !dbg !1434
  %4 = icmp eq %struct.packet_info* %1, null, !dbg !1435
  br i1 %4, label %21, label %5, !dbg !1437

5:                                                ; preds = %2
  %6 = bitcast %struct.parsing_context* %3 to i8*, !dbg !1438
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #9, !dbg !1438
  call void @llvm.dbg.declare(metadata %struct.parsing_context* %3, metadata !1433, metadata !DIExpression()), !dbg !1439
  %7 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 0, !dbg !1440
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !1441
  %9 = load i32, i32* %8, align 4, !dbg !1441, !tbaa !1442
  %10 = zext i32 %9 to i64, !dbg !1444
  %11 = inttoptr i64 %10 to i8*, !dbg !1445
  store i8* %11, i8** %7, align 8, !dbg !1440, !tbaa !579
  %12 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 1, !dbg !1440
  %13 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !1446
  %14 = load i32, i32* %13, align 4, !dbg !1446, !tbaa !1447
  %15 = zext i32 %14 to i64, !dbg !1448
  %16 = inttoptr i64 %15 to i8*, !dbg !1449
  store i8* %16, i8** %12, align 8, !dbg !1440, !tbaa !587
  %17 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 2, i32 0, !dbg !1450
  store i8* %11, i8** %17, align 8, !dbg !1450, !tbaa !589
  %18 = getelementptr inbounds %struct.parsing_context, %struct.parsing_context* %3, i64 0, i32 3, !dbg !1440
  %19 = sub i32 %14, %9, !dbg !1451
  store i32 %19, i32* %18, align 8, !dbg !1440, !tbaa !592
  %20 = call fastcc i32 @parse_packet_identifier(%struct.parsing_context* noundef nonnull %3, %struct.packet_info* noundef nonnull %1), !dbg !1452
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #9, !dbg !1453
  br label %21

21:                                               ; preds = %2, %5
  %22 = phi i32 [ %20, %5 ], [ -1, %2 ], !dbg !1434
  ret i32 %22, !dbg !1453
}

; Function Attrs: nounwind
define dso_local i32 @pping_tc_egress(%struct.__sk_buff* noundef %0) #3 section "tc" !dbg !1454 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1458, metadata !DIExpression()), !dbg !1459
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1460, metadata !DIExpression()) #9, !dbg !1468
  call void @llvm.dbg.value(metadata i8 0, metadata !1465, metadata !DIExpression()) #9, !dbg !1468
  %3 = bitcast i32* %2 to i8*, !dbg !1470
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1470
  call void @llvm.dbg.value(metadata i32 0, metadata !1467, metadata !DIExpression()) #9, !dbg !1468
  store i32 0, i32* %2, align 4, !dbg !1471, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %2, metadata !1467, metadata !DIExpression(DW_OP_deref)) #9, !dbg !1468
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.14* @map_packet_info to i8*), i8* noundef nonnull %3) #9, !dbg !1472
  %5 = bitcast i8* %4 to %struct.packet_info*, !dbg !1472
  call void @llvm.dbg.value(metadata %struct.packet_info* %5, metadata !1466, metadata !DIExpression()) #9, !dbg !1468
  %6 = icmp eq i8* %4, null, !dbg !1473
  br i1 %6, label %15, label %7, !dbg !1475

7:                                                ; preds = %1
  %8 = call i32 @parse_packet_identifer_tc(%struct.__sk_buff* noundef %0, %struct.packet_info* noundef nonnull %5) #9, !dbg !1476
  %9 = icmp slt i32 %8, 0, !dbg !1478
  br i1 %9, label %15, label %10, !dbg !1479

10:                                               ; preds = %7
  %11 = getelementptr inbounds i8, i8* %4, i64 122, !dbg !1480
  store i8 0, i8* %11, align 2, !dbg !1481, !tbaa !1482
  %12 = getelementptr inbounds i8, i8* %4, i64 112, !dbg !1483
  %13 = bitcast i8* %12 to i32*, !dbg !1483
  store i32 0, i32* %13, align 8, !dbg !1484, !tbaa !1485
  %14 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !1486
  call fastcc void @pping_parsed_packet(i8* noundef %14, %struct.packet_info* noundef nonnull %5) #9, !dbg !1487
  br label %15, !dbg !1488

15:                                               ; preds = %1, %7, %10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1488
  ret i32 -1, !dbg !1489
}

; Function Attrs: nounwind
define dso_local i32 @pping_tc_ingress(%struct.__sk_buff* noundef %0) #3 section "tc" !dbg !1490 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1492, metadata !DIExpression()), !dbg !1493
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1460, metadata !DIExpression()) #9, !dbg !1494
  call void @llvm.dbg.value(metadata i8 1, metadata !1465, metadata !DIExpression()) #9, !dbg !1494
  %3 = bitcast i32* %2 to i8*, !dbg !1496
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1496
  call void @llvm.dbg.value(metadata i32 0, metadata !1467, metadata !DIExpression()) #9, !dbg !1494
  store i32 0, i32* %2, align 4, !dbg !1497, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %2, metadata !1467, metadata !DIExpression(DW_OP_deref)) #9, !dbg !1494
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.14* @map_packet_info to i8*), i8* noundef nonnull %3) #9, !dbg !1498
  %5 = bitcast i8* %4 to %struct.packet_info*, !dbg !1498
  call void @llvm.dbg.value(metadata %struct.packet_info* %5, metadata !1466, metadata !DIExpression()) #9, !dbg !1494
  %6 = icmp eq i8* %4, null, !dbg !1499
  br i1 %6, label %17, label %7, !dbg !1500

7:                                                ; preds = %1
  %8 = call i32 @parse_packet_identifer_tc(%struct.__sk_buff* noundef %0, %struct.packet_info* noundef nonnull %5) #9, !dbg !1501
  %9 = icmp slt i32 %8, 0, !dbg !1502
  br i1 %9, label %17, label %10, !dbg !1503

10:                                               ; preds = %7
  %11 = getelementptr inbounds i8, i8* %4, i64 122, !dbg !1504
  store i8 1, i8* %11, align 2, !dbg !1505, !tbaa !1482
  %12 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 9, !dbg !1506
  %13 = load i32, i32* %12, align 4, !dbg !1506, !tbaa !1507
  %14 = getelementptr inbounds i8, i8* %4, i64 112, !dbg !1508
  %15 = bitcast i8* %14 to i32*, !dbg !1508
  store i32 %13, i32* %15, align 8, !dbg !1509, !tbaa !1485
  %16 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !1510
  call fastcc void @pping_parsed_packet(i8* noundef %16, %struct.packet_info* noundef nonnull %5) #9, !dbg !1511
  br label %17, !dbg !1512

17:                                               ; preds = %1, %7, %10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1512
  ret i32 -1, !dbg !1513
}

; Function Attrs: nounwind
define dso_local i32 @pping_xdp_ingress(%struct.xdp_md* noundef %0) #3 section "xdp" !dbg !1514 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1518, metadata !DIExpression()), !dbg !1519
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1520, metadata !DIExpression()) #9, !dbg !1527
  %3 = bitcast i32* %2 to i8*, !dbg !1529
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1529
  call void @llvm.dbg.value(metadata i32 0, metadata !1526, metadata !DIExpression()) #9, !dbg !1527
  store i32 0, i32* %2, align 4, !dbg !1530, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %2, metadata !1526, metadata !DIExpression(DW_OP_deref)) #9, !dbg !1527
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.14* @map_packet_info to i8*), i8* noundef nonnull %3) #9, !dbg !1531
  %5 = bitcast i8* %4 to %struct.packet_info*, !dbg !1531
  call void @llvm.dbg.value(metadata %struct.packet_info* %5, metadata !1525, metadata !DIExpression()) #9, !dbg !1527
  %6 = icmp eq i8* %4, null, !dbg !1532
  br i1 %6, label %17, label %7, !dbg !1534

7:                                                ; preds = %1
  %8 = call i32 @parse_packet_identifer_xdp(%struct.xdp_md* noundef %0, %struct.packet_info* noundef nonnull %5) #9, !dbg !1535
  %9 = icmp slt i32 %8, 0, !dbg !1537
  br i1 %9, label %17, label %10, !dbg !1538

10:                                               ; preds = %7
  %11 = getelementptr inbounds i8, i8* %4, i64 122, !dbg !1539
  store i8 1, i8* %11, align 2, !dbg !1540, !tbaa !1482
  %12 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 3, !dbg !1541
  %13 = load i32, i32* %12, align 4, !dbg !1541, !tbaa !1542
  %14 = getelementptr inbounds i8, i8* %4, i64 112, !dbg !1543
  %15 = bitcast i8* %14 to i32*, !dbg !1543
  store i32 %13, i32* %15, align 8, !dbg !1544, !tbaa !1485
  %16 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1545
  call fastcc void @pping_parsed_packet(i8* noundef %16, %struct.packet_info* noundef nonnull %5) #9, !dbg !1546
  br label %17, !dbg !1547

17:                                               ; preds = %1, %7, %10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #9, !dbg !1547
  ret i32 2, !dbg !1548
}

; Function Attrs: nounwind
define dso_local i32 @tsmap_cleanup(%struct.bpf_iter__bpf_map_elem* nocapture noundef readonly %0) #3 section "iter/bpf_map_elem" !dbg !1549 {
  %2 = alloca %struct.packet_id, align 4
  %3 = alloca %struct.network_tuple, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_iter__bpf_map_elem* %0, metadata !1570, metadata !DIExpression()), !dbg !1580
  %4 = bitcast %struct.packet_id* %2 to i8*, !dbg !1581
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %4) #9, !dbg !1581
  call void @llvm.dbg.declare(metadata %struct.packet_id* %2, metadata !1571, metadata !DIExpression()), !dbg !1582
  call void @llvm.dbg.value(metadata %struct.flow_state* null, metadata !1572, metadata !DIExpression()), !dbg !1580
  %5 = bitcast %struct.network_tuple* %3 to i8*, !dbg !1583
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %5) #9, !dbg !1583
  call void @llvm.dbg.declare(metadata %struct.network_tuple* %3, metadata !1575, metadata !DIExpression()), !dbg !1584
  %6 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 2, !dbg !1585
  %7 = load i8*, i8** %6, align 8, !dbg !1585, !tbaa !1586
  call void @llvm.dbg.value(metadata i8* %7, metadata !1576, metadata !DIExpression()), !dbg !1580
  %8 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 3, !dbg !1588
  %9 = bitcast i8** %8 to i64**, !dbg !1588
  %10 = load i64*, i64** %9, align 8, !dbg !1588, !tbaa !1589
  call void @llvm.dbg.value(metadata i64* %10, metadata !1577, metadata !DIExpression()), !dbg !1580
  %11 = tail call i64 inttoptr (i64 5 to i64 ()*)() #9, !dbg !1590
  call void @llvm.dbg.value(metadata i64 %11, metadata !1578, metadata !DIExpression()), !dbg !1580
  %12 = icmp ne i8* %7, null, !dbg !1591
  %13 = icmp ne i64* %10, null
  %14 = select i1 %12, i1 %13, i1 false, !dbg !1593
  br i1 %14, label %15, label %66, !dbg !1593

15:                                               ; preds = %1
  %16 = load i64, i64* %10, align 8, !dbg !1594, !tbaa !1415
  %17 = icmp ugt i64 %11, %16, !dbg !1596
  br i1 %17, label %18, label %66, !dbg !1597

18:                                               ; preds = %15
  %19 = bitcast i8* %7 to %struct.network_tuple*, !dbg !1598
  call void @llvm.dbg.value(metadata %struct.network_tuple* %3, metadata !1599, metadata !DIExpression()) #9, !dbg !1603
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1602, metadata !DIExpression()) #9, !dbg !1603
  %20 = tail call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* noundef nonnull %19) #9, !dbg !1605
  br i1 %20, label %21, label %22, !dbg !1607

21:                                               ; preds = %18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(44) %5, i8* noundef nonnull align 4 dereferenceable(44) %7, i64 44, i1 false) #9, !dbg !1608, !tbaa.struct !1609
  br label %34, !dbg !1610

22:                                               ; preds = %18
  call void @llvm.dbg.value(metadata %struct.network_tuple* %3, metadata !1179, metadata !DIExpression()) #9, !dbg !1611
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1180, metadata !DIExpression()) #9, !dbg !1611
  %23 = getelementptr inbounds i8, i8* %7, i64 42, !dbg !1613
  %24 = load i8, i8* %23, align 2, !dbg !1613, !tbaa !1184
  %25 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 3, !dbg !1614
  store i8 %24, i8* %25, align 2, !dbg !1615, !tbaa !1184
  %26 = getelementptr inbounds i8, i8* %7, i64 40, !dbg !1616
  %27 = bitcast i8* %26 to i16*, !dbg !1616
  %28 = load i16, i16* %27, align 4, !dbg !1616, !tbaa !1352
  %29 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 2, !dbg !1617
  store i16 %28, i16* %29, align 4, !dbg !1618, !tbaa !1352
  %30 = getelementptr inbounds i8, i8* %7, i64 20, !dbg !1619
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %5, i8* noundef nonnull align 4 dereferenceable(20) %30, i64 20, i1 false) #9, !dbg !1619, !tbaa.struct !1356
  %31 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 1, !dbg !1620
  %32 = bitcast %struct.flow_address* %31 to i8*, !dbg !1621
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %32, i8* noundef nonnull align 4 dereferenceable(20) %7, i64 20, i1 false) #9, !dbg !1621, !tbaa.struct !1356
  %33 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %3, i64 0, i32 4, !dbg !1622
  store i8 0, i8* %33, align 1, !dbg !1623, !tbaa !1361
  br label %34

34:                                               ; preds = %21, %22
  %35 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %5) #9, !dbg !1624
  call void @llvm.dbg.value(metadata i8* %35, metadata !1574, metadata !DIExpression()), !dbg !1580
  %36 = icmp eq i8* %35, null, !dbg !1625
  br i1 %36, label %51, label %37, !dbg !1627

37:                                               ; preds = %34
  call void @llvm.dbg.value(metadata i8* %35, metadata !1574, metadata !DIExpression()), !dbg !1580
  call void @llvm.dbg.value(metadata i8* %35, metadata !1628, metadata !DIExpression()) #9, !dbg !1634
  call void @llvm.dbg.value(metadata %struct.network_tuple* %19, metadata !1633, metadata !DIExpression()) #9, !dbg !1634
  %38 = call fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* noundef nonnull %19) #9, !dbg !1636
  call void @llvm.dbg.value(metadata i8* %35, metadata !1637, metadata !DIExpression()) #9, !dbg !1643
  call void @llvm.dbg.value(metadata i1 %38, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1643
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !1572, metadata !DIExpression()), !dbg !1580
  %39 = select i1 %38, i64 0, i64 72, !dbg !1645
  %40 = getelementptr i8, i8* %35, i64 %39, !dbg !1645
  %41 = bitcast i8* %40 to %struct.flow_state*, !dbg !1646
  %42 = getelementptr inbounds i8, i8* %40, i64 8, !dbg !1647
  %43 = bitcast i8* %42 to i64*, !dbg !1647
  %44 = load i64, i64* %43, align 8, !dbg !1647, !tbaa !1648
  call void @llvm.dbg.value(metadata i64 %44, metadata !1579, metadata !DIExpression()), !dbg !1580
  %45 = icmp eq i64 %44, 0, !dbg !1650
  br i1 %45, label %51, label %46, !dbg !1652

46:                                               ; preds = %37
  %47 = load i64, i64* %10, align 8, !dbg !1653, !tbaa !1415
  %48 = sub i64 %11, %47, !dbg !1654
  %49 = shl i64 %44, 3, !dbg !1655
  %50 = icmp ugt i64 %48, %49, !dbg !1656
  br i1 %50, label %57, label %51, !dbg !1657

51:                                               ; preds = %34, %46, %37
  %52 = phi %struct.flow_state* [ %41, %46 ], [ %41, %37 ], [ null, %34 ]
  %53 = phi i1 [ false, %46 ], [ false, %37 ], [ true, %34 ]
  %54 = load i64, i64* %10, align 8, !dbg !1658, !tbaa !1415
  %55 = sub i64 %11, %54, !dbg !1659
  %56 = icmp ugt i64 %55, 10000000000, !dbg !1660
  br i1 %56, label %57, label %66, !dbg !1661

57:                                               ; preds = %51, %46
  %58 = phi %struct.flow_state* [ %52, %51 ], [ %41, %46 ]
  %59 = phi i1 [ %53, %51 ], [ false, %46 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(48) %4, i8* noundef nonnull align 4 dereferenceable(48) %7, i64 48, i1 false), !dbg !1662
  %60 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.7* @packet_ts to i8*), i8* noundef nonnull %4) #9, !dbg !1664
  %61 = icmp ne i64 %60, 0, !dbg !1666
  %62 = or i1 %59, %61, !dbg !1667
  br i1 %62, label %66, label %63, !dbg !1667

63:                                               ; preds = %57
  %64 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %58, i64 0, i32 8, !dbg !1668
  %65 = atomicrmw add i32* %64, i32 -1 seq_cst, align 4, !dbg !1671
  br label %66, !dbg !1671

66:                                               ; preds = %57, %51, %63, %15, %1
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %5) #9, !dbg !1672
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %4) #9, !dbg !1672
  ret i32 0, !dbg !1672
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
define dso_local i32 @flowmap_cleanup(%struct.bpf_iter__bpf_map_elem* noundef %0) #3 section "iter/bpf_map_elem" !dbg !1673 {
  %2 = alloca %struct.flow_event, align 8
  %3 = alloca %struct.flow_event, align 8
  %4 = alloca %struct.network_tuple, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_iter__bpf_map_elem* %0, metadata !1675, metadata !DIExpression()), !dbg !1686
  %5 = bitcast %struct.network_tuple* %4 to i8*, !dbg !1687
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %5) #9, !dbg !1687
  call void @llvm.dbg.declare(metadata %struct.network_tuple* %4, metadata !1676, metadata !DIExpression()), !dbg !1688
  %6 = tail call i64 inttoptr (i64 5 to i64 ()*)() #9, !dbg !1689
  call void @llvm.dbg.value(metadata i64 %6, metadata !1681, metadata !DIExpression()), !dbg !1686
  %7 = bitcast %struct.bpf_iter__bpf_map_elem* %0 to i8*, !dbg !1690
  %8 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 2, !dbg !1691
  %9 = load i8*, i8** %8, align 8, !dbg !1691, !tbaa !1586
  %10 = icmp eq i8* %9, null, !dbg !1692
  br i1 %10, label %358, label %11, !dbg !1694

11:                                               ; preds = %1
  %12 = getelementptr inbounds %struct.bpf_iter__bpf_map_elem, %struct.bpf_iter__bpf_map_elem* %0, i64 0, i32 3, !dbg !1695
  %13 = load i8*, i8** %12, align 8, !dbg !1695, !tbaa !1589
  %14 = icmp eq i8* %13, null, !dbg !1696
  br i1 %14, label %358, label %15, !dbg !1697

15:                                               ; preds = %11
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(44) %5, i8* noundef nonnull align 4 dereferenceable(44) %9, i64 44, i1 false), !dbg !1698, !tbaa.struct !1609
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1179, metadata !DIExpression()) #9, !dbg !1699
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1180, metadata !DIExpression()) #9, !dbg !1699
  %16 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 3, !dbg !1701
  %17 = load i8, i8* %16, align 2, !dbg !1701, !tbaa !1184
  call void @llvm.dbg.value(metadata i8 %17, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 336, 8)), !dbg !1686
  %18 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 2, !dbg !1702
  %19 = load i16, i16* %18, align 4, !dbg !1702, !tbaa !1352
  call void @llvm.dbg.value(metadata i16 %19, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 320, 16)), !dbg !1686
  %20 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, !dbg !1703
  %21 = bitcast %struct.flow_address* %20 to i8*, !dbg !1703
  %22 = load i8, i8* %21, align 4, !dbg !1703, !tbaa.struct !1356
  call void @llvm.dbg.value(metadata i8 %22, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !1686
  %23 = getelementptr inbounds i8, i8* %5, i64 21, !dbg !1703
  %24 = load i8, i8* %23, align 1, !dbg !1703, !tbaa.struct !1704
  call void @llvm.dbg.value(metadata i8 %24, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !1686
  %25 = getelementptr inbounds i8, i8* %5, i64 22, !dbg !1703
  %26 = load i8, i8* %25, align 2, !dbg !1703, !tbaa.struct !1705
  call void @llvm.dbg.value(metadata i8 %26, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !1686
  %27 = getelementptr inbounds i8, i8* %5, i64 23, !dbg !1703
  %28 = load i8, i8* %27, align 1, !dbg !1703, !tbaa.struct !1706
  call void @llvm.dbg.value(metadata i8 %28, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !1686
  %29 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !1703
  %30 = bitcast i32* %29 to i8*, !dbg !1703
  %31 = load i8, i8* %30, align 4, !dbg !1703, !tbaa.struct !1707
  call void @llvm.dbg.value(metadata i8 %31, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !1686
  %32 = getelementptr inbounds i8, i8* %5, i64 25, !dbg !1703
  %33 = load i8, i8* %32, align 1, !dbg !1703, !tbaa.struct !1708
  call void @llvm.dbg.value(metadata i8 %33, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !1686
  %34 = getelementptr inbounds i8, i8* %5, i64 26, !dbg !1703
  %35 = load i8, i8* %34, align 2, !dbg !1703, !tbaa.struct !1709
  call void @llvm.dbg.value(metadata i8 %35, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 8)), !dbg !1686
  %36 = getelementptr inbounds i8, i8* %5, i64 27, !dbg !1703
  %37 = load i8, i8* %36, align 1, !dbg !1703, !tbaa.struct !1710
  call void @llvm.dbg.value(metadata i8 %37, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 56, 8)), !dbg !1686
  %38 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !1703
  %39 = bitcast i32* %38 to i8*, !dbg !1703
  %40 = load i8, i8* %39, align 4, !dbg !1703, !tbaa.struct !1711
  call void @llvm.dbg.value(metadata i8 %40, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !1686
  %41 = getelementptr inbounds i8, i8* %5, i64 29, !dbg !1703
  %42 = load i8, i8* %41, align 1, !dbg !1703, !tbaa.struct !1712
  call void @llvm.dbg.value(metadata i8 %42, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !1686
  %43 = getelementptr inbounds i8, i8* %5, i64 30, !dbg !1703
  %44 = load i8, i8* %43, align 2, !dbg !1703, !tbaa.struct !1713
  call void @llvm.dbg.value(metadata i8 %44, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 80, 8)), !dbg !1686
  %45 = getelementptr inbounds i8, i8* %5, i64 31, !dbg !1703
  %46 = load i8, i8* %45, align 1, !dbg !1703, !tbaa.struct !1714
  call void @llvm.dbg.value(metadata i8 %46, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 88, 8)), !dbg !1686
  %47 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1703
  %48 = bitcast i32* %47 to i8*, !dbg !1703
  %49 = load i8, i8* %48, align 4, !dbg !1703, !tbaa.struct !1715
  call void @llvm.dbg.value(metadata i8 %49, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 96, 8)), !dbg !1686
  %50 = getelementptr inbounds i8, i8* %5, i64 33, !dbg !1703
  %51 = load i8, i8* %50, align 1, !dbg !1703, !tbaa.struct !1716
  call void @llvm.dbg.value(metadata i8 %51, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 104, 8)), !dbg !1686
  %52 = getelementptr inbounds i8, i8* %5, i64 34, !dbg !1703
  %53 = load i8, i8* %52, align 2, !dbg !1703, !tbaa.struct !1717
  call void @llvm.dbg.value(metadata i8 %53, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 112, 8)), !dbg !1686
  %54 = getelementptr inbounds i8, i8* %5, i64 35, !dbg !1703
  %55 = load i8, i8* %54, align 1, !dbg !1703, !tbaa.struct !1718
  call void @llvm.dbg.value(metadata i8 %55, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 120, 8)), !dbg !1686
  %56 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 1, !dbg !1703
  %57 = bitcast i16* %56 to i8*, !dbg !1703
  %58 = load i8, i8* %57, align 4, !dbg !1703, !tbaa.struct !1719
  call void @llvm.dbg.value(metadata i8 %58, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 8)), !dbg !1686
  %59 = getelementptr inbounds i8, i8* %5, i64 37, !dbg !1703
  %60 = load i8, i8* %59, align 1, !dbg !1703, !tbaa.struct !1720
  call void @llvm.dbg.value(metadata i8 %60, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 136, 8)), !dbg !1686
  %61 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 1, i32 2, !dbg !1703
  %62 = bitcast i16* %61 to i8*, !dbg !1703
  %63 = load i8, i8* %62, align 2, !dbg !1703, !tbaa.struct !1721
  call void @llvm.dbg.value(metadata i8 %63, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 144, 8)), !dbg !1686
  %64 = getelementptr inbounds i8, i8* %5, i64 39, !dbg !1703
  %65 = load i8, i8* %64, align 1, !dbg !1703, !tbaa.struct !1722
  call void @llvm.dbg.value(metadata i8 %65, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 152, 8)), !dbg !1686
  %66 = load i8, i8* %5, align 4, !dbg !1723, !tbaa.struct !1356
  call void @llvm.dbg.value(metadata i8 %66, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 160, 8)), !dbg !1686
  %67 = getelementptr inbounds i8, i8* %5, i64 1, !dbg !1723
  %68 = load i8, i8* %67, align 1, !dbg !1723, !tbaa.struct !1704
  call void @llvm.dbg.value(metadata i8 %68, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 168, 8)), !dbg !1686
  %69 = getelementptr inbounds i8, i8* %5, i64 2, !dbg !1723
  %70 = load i8, i8* %69, align 2, !dbg !1723, !tbaa.struct !1705
  call void @llvm.dbg.value(metadata i8 %70, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 176, 8)), !dbg !1686
  %71 = getelementptr inbounds i8, i8* %5, i64 3, !dbg !1723
  %72 = load i8, i8* %71, align 1, !dbg !1723, !tbaa.struct !1706
  call void @llvm.dbg.value(metadata i8 %72, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 184, 8)), !dbg !1686
  %73 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1723
  %74 = bitcast i32* %73 to i8*, !dbg !1723
  %75 = load i8, i8* %74, align 4, !dbg !1723, !tbaa.struct !1707
  call void @llvm.dbg.value(metadata i8 %75, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 192, 8)), !dbg !1686
  %76 = getelementptr inbounds i8, i8* %5, i64 5, !dbg !1723
  %77 = load i8, i8* %76, align 1, !dbg !1723, !tbaa.struct !1708
  call void @llvm.dbg.value(metadata i8 %77, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 200, 8)), !dbg !1686
  %78 = getelementptr inbounds i8, i8* %5, i64 6, !dbg !1723
  %79 = load i8, i8* %78, align 2, !dbg !1723, !tbaa.struct !1709
  call void @llvm.dbg.value(metadata i8 %79, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 208, 8)), !dbg !1686
  %80 = getelementptr inbounds i8, i8* %5, i64 7, !dbg !1723
  %81 = load i8, i8* %80, align 1, !dbg !1723, !tbaa.struct !1710
  call void @llvm.dbg.value(metadata i8 %81, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 216, 8)), !dbg !1686
  %82 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1723
  %83 = bitcast i32* %82 to i8*, !dbg !1723
  %84 = load i8, i8* %83, align 4, !dbg !1723, !tbaa.struct !1711
  call void @llvm.dbg.value(metadata i8 %84, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 224, 8)), !dbg !1686
  %85 = getelementptr inbounds i8, i8* %5, i64 9, !dbg !1723
  %86 = load i8, i8* %85, align 1, !dbg !1723, !tbaa.struct !1712
  call void @llvm.dbg.value(metadata i8 %86, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 232, 8)), !dbg !1686
  %87 = getelementptr inbounds i8, i8* %5, i64 10, !dbg !1723
  %88 = load i8, i8* %87, align 2, !dbg !1723, !tbaa.struct !1713
  call void @llvm.dbg.value(metadata i8 %88, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 240, 8)), !dbg !1686
  %89 = getelementptr inbounds i8, i8* %5, i64 11, !dbg !1723
  %90 = load i8, i8* %89, align 1, !dbg !1723, !tbaa.struct !1714
  call void @llvm.dbg.value(metadata i8 %90, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 248, 8)), !dbg !1686
  %91 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1723
  %92 = bitcast i32* %91 to i8*, !dbg !1723
  %93 = load i8, i8* %92, align 4, !dbg !1723, !tbaa.struct !1715
  call void @llvm.dbg.value(metadata i8 %93, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 8)), !dbg !1686
  %94 = getelementptr inbounds i8, i8* %5, i64 13, !dbg !1723
  %95 = load i8, i8* %94, align 1, !dbg !1723, !tbaa.struct !1716
  call void @llvm.dbg.value(metadata i8 %95, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 264, 8)), !dbg !1686
  %96 = getelementptr inbounds i8, i8* %5, i64 14, !dbg !1723
  %97 = load i8, i8* %96, align 2, !dbg !1723, !tbaa.struct !1717
  call void @llvm.dbg.value(metadata i8 %97, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 272, 8)), !dbg !1686
  %98 = getelementptr inbounds i8, i8* %5, i64 15, !dbg !1723
  %99 = load i8, i8* %98, align 1, !dbg !1723, !tbaa.struct !1718
  call void @llvm.dbg.value(metadata i8 %99, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 280, 8)), !dbg !1686
  %100 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 1, !dbg !1723
  %101 = bitcast i16* %100 to i8*, !dbg !1723
  %102 = load i8, i8* %101, align 4, !dbg !1723, !tbaa.struct !1719
  call void @llvm.dbg.value(metadata i8 %102, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)), !dbg !1686
  %103 = getelementptr inbounds i8, i8* %5, i64 17, !dbg !1723
  %104 = load i8, i8* %103, align 1, !dbg !1723, !tbaa.struct !1720
  call void @llvm.dbg.value(metadata i8 %104, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 296, 8)), !dbg !1686
  %105 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %4, i64 0, i32 0, i32 2, !dbg !1723
  %106 = bitcast i16* %105 to i8*, !dbg !1723
  %107 = load i8, i8* %106, align 2, !dbg !1723, !tbaa.struct !1721
  call void @llvm.dbg.value(metadata i8 %107, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 304, 8)), !dbg !1686
  %108 = getelementptr inbounds i8, i8* %5, i64 19, !dbg !1723
  %109 = load i8, i8* %108, align 1, !dbg !1723, !tbaa.struct !1722
  call void @llvm.dbg.value(metadata i8 %109, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 312, 8)), !dbg !1686
  call void @llvm.dbg.value(metadata i8 0, metadata !1677, metadata !DIExpression(DW_OP_LLVM_fragment, 344, 8)), !dbg !1686
  call void @llvm.dbg.value(metadata i8* %13, metadata !1680, metadata !DIExpression()), !dbg !1686
  call void @llvm.dbg.value(metadata i8* %13, metadata !1628, metadata !DIExpression()) #9, !dbg !1724
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1633, metadata !DIExpression()) #9, !dbg !1724
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1726, metadata !DIExpression()), !dbg !1731
  call void @llvm.dbg.value(metadata i8* %5, metadata !1733, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i8* %21, metadata !1738, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i32 20, metadata !1739, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i8* %5, metadata !1740, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i8* %21, metadata !1743, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i32 0, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression()), !dbg !1745
  %110 = icmp eq i8 %66, %22, !dbg !1747
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %110, label %111, label %152, !dbg !1752

111:                                              ; preds = %15
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression()), !dbg !1745
  %112 = icmp eq i8 %68, %24, !dbg !1747
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %112, label %113, label %152, !dbg !1752

113:                                              ; preds = %111
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression()), !dbg !1745
  %114 = icmp eq i8 %70, %26, !dbg !1747
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %114, label %115, label %152, !dbg !1752

115:                                              ; preds = %113
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression()), !dbg !1745
  %116 = icmp eq i8 %72, %28, !dbg !1747
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %116, label %117, label %152, !dbg !1752

117:                                              ; preds = %115
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression()), !dbg !1745
  %118 = icmp eq i8 %75, %31, !dbg !1747
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %118, label %119, label %152, !dbg !1752

119:                                              ; preds = %117
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression()), !dbg !1745
  %120 = icmp eq i8 %77, %33, !dbg !1747
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %120, label %121, label %152, !dbg !1752

121:                                              ; preds = %119
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression()), !dbg !1745
  %122 = icmp eq i8 %79, %35, !dbg !1747
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %122, label %123, label %152, !dbg !1752

123:                                              ; preds = %121
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression()), !dbg !1745
  %124 = icmp eq i8 %81, %37, !dbg !1747
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %124, label %125, label %152, !dbg !1752

125:                                              ; preds = %123
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression()), !dbg !1745
  %126 = icmp eq i8 %84, %40, !dbg !1747
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %126, label %127, label %152, !dbg !1752

127:                                              ; preds = %125
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression()), !dbg !1745
  %128 = icmp eq i8 %86, %42, !dbg !1747
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %128, label %129, label %152, !dbg !1752

129:                                              ; preds = %127
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression()), !dbg !1745
  %130 = icmp eq i8 %88, %44, !dbg !1747
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %130, label %131, label %152, !dbg !1752

131:                                              ; preds = %129
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression()), !dbg !1745
  %132 = icmp eq i8 %90, %46, !dbg !1747
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %132, label %133, label %152, !dbg !1752

133:                                              ; preds = %131
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression()), !dbg !1745
  %134 = icmp eq i8 %93, %49, !dbg !1747
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %134, label %135, label %152, !dbg !1752

135:                                              ; preds = %133
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression()), !dbg !1745
  %136 = icmp eq i8 %95, %51, !dbg !1747
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %136, label %137, label %152, !dbg !1752

137:                                              ; preds = %135
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression()), !dbg !1745
  %138 = icmp eq i8 %97, %53, !dbg !1747
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %138, label %139, label %152, !dbg !1752

139:                                              ; preds = %137
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression()), !dbg !1745
  %140 = icmp eq i8 %99, %55, !dbg !1747
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %140, label %141, label %152, !dbg !1752

141:                                              ; preds = %139
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression()), !dbg !1745
  %142 = icmp eq i8 %102, %58, !dbg !1747
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %142, label %143, label %152, !dbg !1752

143:                                              ; preds = %141
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression()), !dbg !1745
  %144 = icmp eq i8 %104, %60, !dbg !1747
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %144, label %145, label %152, !dbg !1752

145:                                              ; preds = %143
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression()), !dbg !1745
  %146 = icmp eq i8 %107, %63, !dbg !1747
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %146, label %147, label %152, !dbg !1752

147:                                              ; preds = %145
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression()), !dbg !1745
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression()), !dbg !1745
  %148 = icmp eq i8 %109, %65, !dbg !1747
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1745
  br i1 %148, label %149, label %152, !dbg !1752

149:                                              ; preds = %147
  call void @llvm.dbg.value(metadata i8* %13, metadata !1637, metadata !DIExpression()) #9, !dbg !1753
  call void @llvm.dbg.value(metadata i1 %155, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1753
  %150 = getelementptr inbounds i8, i8* %13, i64 72, !dbg !1755
  %151 = bitcast i8* %150 to %struct.flow_state*, !dbg !1755
  br label %158, !dbg !1755

152:                                              ; preds = %15, %111, %113, %115, %117, %119, %121, %123, %125, %127, %129, %131, %133, %135, %137, %139, %141, %143, %145, %147
  %153 = phi i8 [ %66, %15 ], [ %68, %111 ], [ %70, %113 ], [ %72, %115 ], [ %75, %117 ], [ %77, %119 ], [ %79, %121 ], [ %81, %123 ], [ %84, %125 ], [ %86, %127 ], [ %88, %129 ], [ %90, %131 ], [ %93, %133 ], [ %95, %135 ], [ %97, %137 ], [ %99, %139 ], [ %102, %141 ], [ %104, %143 ], [ %107, %145 ], [ %109, %147 ], !dbg !1756
  %154 = phi i8 [ %22, %15 ], [ %24, %111 ], [ %26, %113 ], [ %28, %115 ], [ %31, %117 ], [ %33, %119 ], [ %35, %121 ], [ %37, %123 ], [ %40, %125 ], [ %42, %127 ], [ %44, %129 ], [ %46, %131 ], [ %49, %133 ], [ %51, %135 ], [ %53, %137 ], [ %55, %139 ], [ %58, %141 ], [ %60, %143 ], [ %63, %145 ], [ %65, %147 ], !dbg !1757
  %155 = icmp ugt i8 %153, %154, !dbg !1758
  call void @llvm.dbg.value(metadata i8* %13, metadata !1637, metadata !DIExpression()) #9, !dbg !1753
  call void @llvm.dbg.value(metadata i1 %155, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1753
  %156 = getelementptr inbounds i8, i8* %13, i64 72, !dbg !1755
  %157 = bitcast i8* %156 to %struct.flow_state*, !dbg !1755
  br i1 %155, label %161, label %158, !dbg !1755

158:                                              ; preds = %149, %152
  %159 = phi %struct.flow_state* [ %151, %149 ], [ %157, %152 ]
  %160 = bitcast i8* %13 to %struct.flow_state*
  br label %161, !dbg !1755

161:                                              ; preds = %152, %158
  %162 = phi %struct.flow_state* [ %159, %158 ], [ %157, %152 ]
  %163 = phi %struct.flow_state* [ %160, %158 ], [ %157, %152 ]
  %164 = bitcast i8* %13 to %struct.flow_state*
  call void @llvm.dbg.value(metadata %struct.flow_state* %163, metadata !1678, metadata !DIExpression()), !dbg !1686
  call void @llvm.dbg.value(metadata i8* %13, metadata !1628, metadata !DIExpression()) #9, !dbg !1759
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1633, metadata !DIExpression()) #9, !dbg !1759
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1726, metadata !DIExpression()), !dbg !1761
  call void @llvm.dbg.value(metadata i8* undef, metadata !1733, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.value(metadata i8* undef, metadata !1738, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.value(metadata i32 20, metadata !1739, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.value(metadata i8* undef, metadata !1740, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.value(metadata i8* undef, metadata !1743, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %110, label %165, label %203, !dbg !1765

165:                                              ; preds = %161
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression()), !dbg !1763
  %166 = icmp eq i8 %24, %68, !dbg !1766
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %166, label %167, label %203, !dbg !1765

167:                                              ; preds = %165
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression()), !dbg !1763
  %168 = icmp eq i8 %26, %70, !dbg !1766
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %168, label %169, label %203, !dbg !1765

169:                                              ; preds = %167
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression()), !dbg !1763
  %170 = icmp eq i8 %28, %72, !dbg !1766
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %170, label %171, label %203, !dbg !1765

171:                                              ; preds = %169
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression()), !dbg !1763
  %172 = icmp eq i8 %31, %75, !dbg !1766
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %172, label %173, label %203, !dbg !1765

173:                                              ; preds = %171
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression()), !dbg !1763
  %174 = icmp eq i8 %33, %77, !dbg !1766
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %174, label %175, label %203, !dbg !1765

175:                                              ; preds = %173
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression()), !dbg !1763
  %176 = icmp eq i8 %35, %79, !dbg !1766
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %176, label %177, label %203, !dbg !1765

177:                                              ; preds = %175
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression()), !dbg !1763
  %178 = icmp eq i8 %37, %81, !dbg !1766
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %178, label %179, label %203, !dbg !1765

179:                                              ; preds = %177
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression()), !dbg !1763
  %180 = icmp eq i8 %40, %84, !dbg !1766
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %180, label %181, label %203, !dbg !1765

181:                                              ; preds = %179
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression()), !dbg !1763
  %182 = icmp eq i8 %42, %86, !dbg !1766
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %182, label %183, label %203, !dbg !1765

183:                                              ; preds = %181
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression()), !dbg !1763
  %184 = icmp eq i8 %44, %88, !dbg !1766
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %184, label %185, label %203, !dbg !1765

185:                                              ; preds = %183
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression()), !dbg !1763
  %186 = icmp eq i8 %46, %90, !dbg !1766
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %186, label %187, label %203, !dbg !1765

187:                                              ; preds = %185
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression()), !dbg !1763
  %188 = icmp eq i8 %49, %93, !dbg !1766
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %188, label %189, label %203, !dbg !1765

189:                                              ; preds = %187
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression()), !dbg !1763
  %190 = icmp eq i8 %51, %95, !dbg !1766
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %190, label %191, label %203, !dbg !1765

191:                                              ; preds = %189
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression()), !dbg !1763
  %192 = icmp eq i8 %53, %97, !dbg !1766
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %192, label %193, label %203, !dbg !1765

193:                                              ; preds = %191
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression()), !dbg !1763
  %194 = icmp eq i8 %55, %99, !dbg !1766
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %194, label %195, label %203, !dbg !1765

195:                                              ; preds = %193
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression()), !dbg !1763
  %196 = icmp eq i8 %58, %102, !dbg !1766
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %196, label %197, label %203, !dbg !1765

197:                                              ; preds = %195
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression()), !dbg !1763
  %198 = icmp eq i8 %60, %104, !dbg !1766
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %198, label %199, label %203, !dbg !1765

199:                                              ; preds = %197
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression()), !dbg !1763
  %200 = icmp eq i8 %63, %107, !dbg !1766
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %200, label %201, label %203, !dbg !1765

201:                                              ; preds = %199
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression()), !dbg !1763
  %202 = icmp eq i8 %65, %109, !dbg !1766
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1763
  br i1 %202, label %207, label %203, !dbg !1765

203:                                              ; preds = %161, %165, %167, %169, %171, %173, %175, %177, %179, %181, %183, %185, %187, %189, %191, %193, %195, %197, %199, %201
  %204 = phi i8 [ %22, %161 ], [ %24, %165 ], [ %26, %167 ], [ %28, %169 ], [ %31, %171 ], [ %33, %173 ], [ %35, %175 ], [ %37, %177 ], [ %40, %179 ], [ %42, %181 ], [ %44, %183 ], [ %46, %185 ], [ %49, %187 ], [ %51, %189 ], [ %53, %191 ], [ %55, %193 ], [ %58, %195 ], [ %60, %197 ], [ %63, %199 ], [ %65, %201 ], !dbg !1767
  %205 = phi i8 [ %66, %161 ], [ %68, %165 ], [ %70, %167 ], [ %72, %169 ], [ %75, %171 ], [ %77, %173 ], [ %79, %175 ], [ %81, %177 ], [ %84, %179 ], [ %86, %181 ], [ %88, %183 ], [ %90, %185 ], [ %93, %187 ], [ %95, %189 ], [ %97, %191 ], [ %99, %193 ], [ %102, %195 ], [ %104, %197 ], [ %107, %199 ], [ %109, %201 ], !dbg !1768
  %206 = icmp ugt i8 %204, %205, !dbg !1769
  call void @llvm.dbg.value(metadata i8* %13, metadata !1637, metadata !DIExpression()) #9, !dbg !1770
  call void @llvm.dbg.value(metadata i1 %206, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !1770
  br i1 %206, label %208, label %207, !dbg !1772

207:                                              ; preds = %201, %203
  br label %208, !dbg !1772

208:                                              ; preds = %207, %203
  %209 = phi %struct.flow_state* [ %164, %207 ], [ %162, %203 ]
  call void @llvm.dbg.value(metadata %struct.flow_state* %209, metadata !1679, metadata !DIExpression()), !dbg !1686
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1773, metadata !DIExpression()), !dbg !1782
  call void @llvm.dbg.value(metadata %struct.flow_state* %163, metadata !1778, metadata !DIExpression()), !dbg !1782
  call void @llvm.dbg.value(metadata i64 %6, metadata !1779, metadata !DIExpression()), !dbg !1782
  call void @llvm.dbg.value(metadata %struct.flow_state* %163, metadata !1784, metadata !DIExpression()), !dbg !1789
  %210 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %163, i64 0, i32 9, !dbg !1792
  %211 = load i8, i8* %210, align 8, !dbg !1792, !tbaa !1793
  switch i8 %211, label %212 [
    i8 3, label %230
    i8 0, label %230
  ], !dbg !1794

212:                                              ; preds = %208
  %213 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %163, i64 0, i32 2, !dbg !1795
  %214 = load i64, i64* %213, align 8, !dbg !1795, !tbaa !1796
  call void @llvm.dbg.value(metadata i64 %214, metadata !1781, metadata !DIExpression()), !dbg !1782
  %215 = icmp ult i64 %6, %214, !dbg !1797
  br i1 %215, label %230, label %216, !dbg !1799

216:                                              ; preds = %212
  %217 = sub i64 %6, %214, !dbg !1800
  call void @llvm.dbg.value(metadata i64 %217, metadata !1780, metadata !DIExpression()), !dbg !1782
  %218 = icmp eq i8 %211, 1, !dbg !1801
  %219 = icmp ugt i64 %217, 30000000000
  %220 = select i1 %218, i1 %219, i1 false, !dbg !1802
  br i1 %220, label %230, label %221, !dbg !1802

221:                                              ; preds = %216
  %222 = icmp eq i16 %19, 1, !dbg !1803
  br i1 %222, label %226, label %223, !dbg !1804

223:                                              ; preds = %221
  %224 = icmp eq i16 %19, 58, !dbg !1805
  %225 = select i1 %224, i1 %219, i1 false, !dbg !1806
  br i1 %225, label %230, label %227, !dbg !1806

226:                                              ; preds = %221
  br i1 %219, label %230, label %227, !dbg !1807

227:                                              ; preds = %226, %223
  %228 = freeze i64 %217
  %229 = icmp ugt i64 %228, 300000000000, !dbg !1808
  br label %230, !dbg !1807

230:                                              ; preds = %227, %226, %223, %216, %212, %208, %208
  %231 = phi i1 [ false, %208 ], [ false, %212 ], [ true, %226 ], [ %229, %227 ], [ true, %216 ], [ true, %223 ], [ false, %208 ]
  call void @llvm.dbg.value(metadata i1 undef, metadata !1684, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1686
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1773, metadata !DIExpression()), !dbg !1809
  call void @llvm.dbg.value(metadata %struct.flow_state* %209, metadata !1778, metadata !DIExpression()), !dbg !1809
  call void @llvm.dbg.value(metadata i64 %6, metadata !1779, metadata !DIExpression()), !dbg !1809
  call void @llvm.dbg.value(metadata %struct.flow_state* %209, metadata !1784, metadata !DIExpression()), !dbg !1811
  %232 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %209, i64 0, i32 9, !dbg !1813
  %233 = load i8, i8* %232, align 8, !dbg !1813, !tbaa !1793
  switch i8 %233, label %234 [
    i8 3, label %252
    i8 0, label %252
  ], !dbg !1814

234:                                              ; preds = %230
  %235 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %209, i64 0, i32 2, !dbg !1815
  %236 = load i64, i64* %235, align 8, !dbg !1815, !tbaa !1796
  call void @llvm.dbg.value(metadata i64 %236, metadata !1781, metadata !DIExpression()), !dbg !1809
  %237 = icmp ult i64 %6, %236, !dbg !1816
  br i1 %237, label %252, label %238, !dbg !1817

238:                                              ; preds = %234
  %239 = sub i64 %6, %236, !dbg !1818
  call void @llvm.dbg.value(metadata i64 %239, metadata !1780, metadata !DIExpression()), !dbg !1809
  %240 = icmp eq i8 %233, 1, !dbg !1819
  %241 = icmp ugt i64 %239, 30000000000
  %242 = select i1 %240, i1 %241, i1 false, !dbg !1820
  br i1 %242, label %252, label %243, !dbg !1820

243:                                              ; preds = %238
  %244 = icmp eq i16 %19, 1, !dbg !1821
  br i1 %244, label %248, label %245, !dbg !1822

245:                                              ; preds = %243
  %246 = icmp eq i16 %19, 58, !dbg !1823
  %247 = select i1 %246, i1 %241, i1 false, !dbg !1824
  br i1 %247, label %252, label %249, !dbg !1824

248:                                              ; preds = %243
  br i1 %241, label %252, label %249, !dbg !1825

249:                                              ; preds = %248, %245
  %250 = freeze i64 %239
  %251 = icmp ugt i64 %250, 300000000000, !dbg !1826
  br label %252, !dbg !1825

252:                                              ; preds = %230, %230, %234, %238, %245, %248, %249
  %253 = phi i1 [ false, %230 ], [ false, %234 ], [ true, %248 ], [ %251, %249 ], [ true, %238 ], [ true, %245 ], [ false, %230 ]
  call void @llvm.dbg.value(metadata i1 undef, metadata !1685, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1686
  call void @llvm.dbg.value(metadata %struct.flow_state* %163, metadata !1784, metadata !DIExpression()), !dbg !1827
  %254 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %163, i64 0, i32 9, !dbg !1830
  %255 = load i8, i8* %254, align 8, !dbg !1830, !tbaa !1793
  br i1 %231, label %257, label %256, !dbg !1831

256:                                              ; preds = %252
  switch i8 %255, label %358 [
    i8 3, label %257
    i8 0, label %257
  ], !dbg !1831

257:                                              ; preds = %256, %256, %252
  call void @llvm.dbg.value(metadata %struct.flow_state* %209, metadata !1784, metadata !DIExpression()), !dbg !1832
  %258 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %209, i64 0, i32 9, !dbg !1834
  %259 = load i8, i8* %258, align 8, !dbg !1834, !tbaa !1793
  br i1 %253, label %261, label %260, !dbg !1835

260:                                              ; preds = %257
  switch i8 %259, label %358 [
    i8 3, label %261
    i8 0, label %261
  ], !dbg !1835

261:                                              ; preds = %260, %260, %257
  call void @llvm.dbg.value(metadata %struct.flow_state* %163, metadata !1836, metadata !DIExpression()), !dbg !1839
  call void @llvm.dbg.value(metadata i1 undef, metadata !1682, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1686
  call void @llvm.dbg.value(metadata %struct.flow_state* %209, metadata !1836, metadata !DIExpression()), !dbg !1842
  %262 = icmp eq i8 %259, 2, !dbg !1844
  %263 = and i1 %262, %253, !dbg !1845
  call void @llvm.dbg.value(metadata i1 %263, metadata !1683, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1686
  %264 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %5) #9, !dbg !1846
  %265 = icmp eq i64 %264, 0, !dbg !1848
  br i1 %265, label %266, label %358, !dbg !1849

266:                                              ; preds = %261
  %267 = icmp eq i8 %255, 2, !dbg !1850
  %268 = and i1 %267, %231, !dbg !1851
  call void @llvm.dbg.value(metadata i1 %268, metadata !1682, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1686
  br i1 %268, label %269, label %290, !dbg !1852

269:                                              ; preds = %266
  call void @llvm.dbg.value(metadata i8* %7, metadata !1854, metadata !DIExpression()) #9, !dbg !1871
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1859, metadata !DIExpression()) #9, !dbg !1871
  call void @llvm.dbg.value(metadata i64 %6, metadata !1860, metadata !DIExpression()) #9, !dbg !1871
  %270 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !1874, !tbaa !1876, !range !1035
  %271 = icmp eq i8 %270, 0, !dbg !1874
  br i1 %271, label %290, label %272, !dbg !1877

272:                                              ; preds = %269
  %273 = bitcast %struct.flow_event* %3 to i8*, !dbg !1878
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %273) #9, !dbg !1878
  call void @llvm.dbg.declare(metadata %struct.flow_event* %3, metadata !1861, metadata !DIExpression()) #9, !dbg !1879
  %274 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 0, !dbg !1880
  store i64 1, i64* %274, align 8, !dbg !1880, !tbaa !1881
  %275 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 1, !dbg !1880
  store i64 %6, i64* %275, align 8, !dbg !1880, !tbaa !1883
  %276 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, !dbg !1880
  %277 = bitcast %struct.network_tuple* %276 to i8*, !dbg !1880
  %278 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 3, !dbg !1880
  store i8 2, i8* %278, align 4, !dbg !1880, !tbaa !1884
  %279 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 4, !dbg !1880
  store i8 6, i8* %279, align 1, !dbg !1880, !tbaa !1885
  %280 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 5, !dbg !1880
  store i8 2, i8* %280, align 2, !dbg !1880, !tbaa !1886
  %281 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 6, !dbg !1880
  store i8 0, i8* %281, align 1, !dbg !1880, !tbaa !1887
  call void @llvm.dbg.value(metadata %struct.network_tuple* %276, metadata !1179, metadata !DIExpression()) #9, !dbg !1888
  call void @llvm.dbg.value(metadata %struct.network_tuple* %4, metadata !1180, metadata !DIExpression()) #9, !dbg !1888
  %282 = load i8, i8* %16, align 2, !dbg !1890, !tbaa !1184
  %283 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 3, !dbg !1891
  store i8 %282, i8* %283, align 2, !dbg !1892, !tbaa !1184
  %284 = load i16, i16* %18, align 4, !dbg !1893, !tbaa !1352
  %285 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 2, !dbg !1894
  store i16 %284, i16* %285, align 8, !dbg !1895, !tbaa !1352
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(20) %277, i8* noundef nonnull align 4 dereferenceable(20) %21, i64 20, i1 false) #9, !dbg !1896, !tbaa.struct !1356
  %286 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 1, !dbg !1897
  %287 = bitcast %struct.flow_address* %286 to i8*, !dbg !1898
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %287, i8* noundef nonnull align 4 dereferenceable(20) %5, i64 20, i1 false) #9, !dbg !1898, !tbaa.struct !1356
  %288 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, i32 4, !dbg !1899
  store i8 0, i8* %288, align 1, !dbg !1900, !tbaa !1361
  %289 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef nonnull %7, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %273, i64 noundef 64) #9, !dbg !1901
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %273) #9, !dbg !1902
  br label %290

290:                                              ; preds = %272, %269, %266
  br i1 %263, label %291, label %358, !dbg !1903

291:                                              ; preds = %290
  call void @llvm.dbg.value(metadata i8* %7, metadata !1854, metadata !DIExpression()) #9, !dbg !1904
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1859, metadata !DIExpression()) #9, !dbg !1904
  call void @llvm.dbg.value(metadata i64 %6, metadata !1860, metadata !DIExpression()) #9, !dbg !1904
  %292 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !1907, !tbaa !1876, !range !1035
  %293 = icmp eq i8 %292, 0, !dbg !1907
  br i1 %293, label %358, label %294, !dbg !1908

294:                                              ; preds = %291
  %295 = bitcast %struct.flow_event* %2 to i8*, !dbg !1909
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %295) #9, !dbg !1909
  call void @llvm.dbg.declare(metadata %struct.flow_event* %2, metadata !1861, metadata !DIExpression()) #9, !dbg !1910
  %296 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 0, !dbg !1911
  store i64 1, i64* %296, align 8, !dbg !1911, !tbaa !1881
  %297 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 1, !dbg !1911
  store i64 %6, i64* %297, align 8, !dbg !1911, !tbaa !1883
  %298 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 3, !dbg !1911
  store i8 2, i8* %298, align 4, !dbg !1911, !tbaa !1884
  %299 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 4, !dbg !1911
  store i8 6, i8* %299, align 1, !dbg !1911, !tbaa !1885
  %300 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 5, !dbg !1911
  store i8 2, i8* %300, align 2, !dbg !1911, !tbaa !1886
  %301 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 6, !dbg !1911
  store i8 0, i8* %301, align 1, !dbg !1911, !tbaa !1887
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1179, metadata !DIExpression()) #9, !dbg !1912
  call void @llvm.dbg.value(metadata %struct.network_tuple* undef, metadata !1180, metadata !DIExpression()) #9, !dbg !1912
  %302 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 3, !dbg !1914
  store i8 %17, i8* %302, align 2, !dbg !1915, !tbaa !1184
  %303 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 2, !dbg !1916
  store i16 %19, i16* %303, align 8, !dbg !1917, !tbaa !1352
  %304 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, !dbg !1918
  %305 = bitcast %struct.network_tuple* %304 to i8*, !dbg !1918
  store i8 %66, i8* %305, align 8, !dbg !1918, !tbaa.struct !1356
  %306 = getelementptr inbounds i8, i8* %295, i64 17, !dbg !1918
  store i8 %68, i8* %306, align 1, !dbg !1918, !tbaa.struct !1704
  %307 = getelementptr inbounds i8, i8* %295, i64 18, !dbg !1918
  store i8 %70, i8* %307, align 2, !dbg !1918, !tbaa.struct !1705
  %308 = getelementptr inbounds i8, i8* %295, i64 19, !dbg !1918
  store i8 %72, i8* %308, align 1, !dbg !1918, !tbaa.struct !1706
  %309 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1918
  %310 = bitcast i32* %309 to i8*, !dbg !1918
  store i8 %75, i8* %310, align 4, !dbg !1918, !tbaa.struct !1707
  %311 = getelementptr inbounds i8, i8* %295, i64 21, !dbg !1918
  store i8 %77, i8* %311, align 1, !dbg !1918, !tbaa.struct !1708
  %312 = getelementptr inbounds i8, i8* %295, i64 22, !dbg !1918
  store i8 %79, i8* %312, align 2, !dbg !1918, !tbaa.struct !1709
  %313 = getelementptr inbounds i8, i8* %295, i64 23, !dbg !1918
  store i8 %81, i8* %313, align 1, !dbg !1918, !tbaa.struct !1710
  %314 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1918
  %315 = bitcast i32* %314 to i8*, !dbg !1918
  store i8 %84, i8* %315, align 8, !dbg !1918, !tbaa.struct !1711
  %316 = getelementptr inbounds i8, i8* %295, i64 25, !dbg !1918
  store i8 %86, i8* %316, align 1, !dbg !1918, !tbaa.struct !1712
  %317 = getelementptr inbounds i8, i8* %295, i64 26, !dbg !1918
  store i8 %88, i8* %317, align 2, !dbg !1918, !tbaa.struct !1713
  %318 = getelementptr inbounds i8, i8* %295, i64 27, !dbg !1918
  store i8 %90, i8* %318, align 1, !dbg !1918, !tbaa.struct !1714
  %319 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1918
  %320 = bitcast i32* %319 to i8*, !dbg !1918
  store i8 %93, i8* %320, align 4, !dbg !1918, !tbaa.struct !1715
  %321 = getelementptr inbounds i8, i8* %295, i64 29, !dbg !1918
  store i8 %95, i8* %321, align 1, !dbg !1918, !tbaa.struct !1716
  %322 = getelementptr inbounds i8, i8* %295, i64 30, !dbg !1918
  store i8 %97, i8* %322, align 2, !dbg !1918, !tbaa.struct !1717
  %323 = getelementptr inbounds i8, i8* %295, i64 31, !dbg !1918
  store i8 %99, i8* %323, align 1, !dbg !1918, !tbaa.struct !1718
  %324 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 0, i32 1, !dbg !1918
  %325 = bitcast i16* %324 to i8*, !dbg !1918
  store i8 %102, i8* %325, align 8, !dbg !1918, !tbaa.struct !1719
  %326 = getelementptr inbounds i8, i8* %295, i64 33, !dbg !1918
  store i8 %104, i8* %326, align 1, !dbg !1918, !tbaa.struct !1720
  %327 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 0, i32 2, !dbg !1918
  %328 = bitcast i16* %327 to i8*, !dbg !1918
  store i8 %107, i8* %328, align 2, !dbg !1918, !tbaa.struct !1721
  %329 = getelementptr inbounds i8, i8* %295, i64 35, !dbg !1918
  store i8 %109, i8* %329, align 1, !dbg !1918, !tbaa.struct !1722
  %330 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, !dbg !1919
  %331 = bitcast %struct.flow_address* %330 to i8*, !dbg !1919
  store i8 %22, i8* %331, align 4, !dbg !1919, !tbaa.struct !1356
  %332 = getelementptr inbounds i8, i8* %295, i64 37, !dbg !1919
  store i8 %24, i8* %332, align 1, !dbg !1919, !tbaa.struct !1704
  %333 = getelementptr inbounds i8, i8* %295, i64 38, !dbg !1919
  store i8 %26, i8* %333, align 2, !dbg !1919, !tbaa.struct !1705
  %334 = getelementptr inbounds i8, i8* %295, i64 39, !dbg !1919
  store i8 %28, i8* %334, align 1, !dbg !1919, !tbaa.struct !1706
  %335 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !1919
  %336 = bitcast i32* %335 to i8*, !dbg !1919
  store i8 %31, i8* %336, align 8, !dbg !1919, !tbaa.struct !1707
  %337 = getelementptr inbounds i8, i8* %295, i64 41, !dbg !1919
  store i8 %33, i8* %337, align 1, !dbg !1919, !tbaa.struct !1708
  %338 = getelementptr inbounds i8, i8* %295, i64 42, !dbg !1919
  store i8 %35, i8* %338, align 2, !dbg !1919, !tbaa.struct !1709
  %339 = getelementptr inbounds i8, i8* %295, i64 43, !dbg !1919
  store i8 %37, i8* %339, align 1, !dbg !1919, !tbaa.struct !1710
  %340 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !1919
  %341 = bitcast i32* %340 to i8*, !dbg !1919
  store i8 %40, i8* %341, align 4, !dbg !1919, !tbaa.struct !1711
  %342 = getelementptr inbounds i8, i8* %295, i64 45, !dbg !1919
  store i8 %42, i8* %342, align 1, !dbg !1919, !tbaa.struct !1712
  %343 = getelementptr inbounds i8, i8* %295, i64 46, !dbg !1919
  store i8 %44, i8* %343, align 2, !dbg !1919, !tbaa.struct !1713
  %344 = getelementptr inbounds i8, i8* %295, i64 47, !dbg !1919
  store i8 %46, i8* %344, align 1, !dbg !1919, !tbaa.struct !1714
  %345 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !1919
  %346 = bitcast i32* %345 to i8*, !dbg !1919
  store i8 %49, i8* %346, align 8, !dbg !1919, !tbaa.struct !1715
  %347 = getelementptr inbounds i8, i8* %295, i64 49, !dbg !1919
  store i8 %51, i8* %347, align 1, !dbg !1919, !tbaa.struct !1716
  %348 = getelementptr inbounds i8, i8* %295, i64 50, !dbg !1919
  store i8 %53, i8* %348, align 2, !dbg !1919, !tbaa.struct !1717
  %349 = getelementptr inbounds i8, i8* %295, i64 51, !dbg !1919
  store i8 %55, i8* %349, align 1, !dbg !1919, !tbaa.struct !1718
  %350 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, i32 1, !dbg !1919
  %351 = bitcast i16* %350 to i8*, !dbg !1919
  store i8 %58, i8* %351, align 4, !dbg !1919, !tbaa.struct !1719
  %352 = getelementptr inbounds i8, i8* %295, i64 53, !dbg !1919
  store i8 %60, i8* %352, align 1, !dbg !1919, !tbaa.struct !1720
  %353 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 1, i32 2, !dbg !1919
  %354 = bitcast i16* %353 to i8*, !dbg !1919
  store i8 %63, i8* %354, align 2, !dbg !1919, !tbaa.struct !1721
  %355 = getelementptr inbounds i8, i8* %295, i64 55, !dbg !1919
  store i8 %65, i8* %355, align 1, !dbg !1919, !tbaa.struct !1722
  %356 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %2, i64 0, i32 2, i32 4, !dbg !1920
  store i8 0, i8* %356, align 1, !dbg !1921, !tbaa !1361
  %357 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef nonnull %7, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %295, i64 noundef 64) #9, !dbg !1922
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %295) #9, !dbg !1923
  br label %358

358:                                              ; preds = %260, %256, %294, %291, %290, %261, %1, %11
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %5) #9, !dbg !1924
  ret i32 0, !dbg !1924
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nounwind
define internal fastcc void @update_global_counters(i8 noundef zeroext %0, i32 noundef %1, i8 noundef zeroext %2) unnamed_addr #3 !dbg !1386 {
  %4 = alloca i32, align 4
  call void @llvm.dbg.value(metadata i8 %0, metadata !1390, metadata !DIExpression()), !dbg !1925
  call void @llvm.dbg.value(metadata i32 %1, metadata !1391, metadata !DIExpression()), !dbg !1925
  call void @llvm.dbg.value(metadata i8 %2, metadata !1392, metadata !DIExpression()), !dbg !1925
  %5 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !1926, !tbaa !1398, !range !1035
  %6 = icmp eq i8 %5, 0, !dbg !1926
  br i1 %6, label %80, label %7, !dbg !1927

7:                                                ; preds = %3
  %8 = bitcast i32* %4 to i8*, !dbg !1928
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #9, !dbg !1928
  call void @llvm.dbg.value(metadata i32 0, metadata !1394, metadata !DIExpression()), !dbg !1925
  store i32 0, i32* %4, align 4, !dbg !1929, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %4, metadata !1394, metadata !DIExpression(DW_OP_deref)), !dbg !1925
  %9 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.13* @map_global_counters to i8*), i8* noundef nonnull %8) #9, !dbg !1930
  call void @llvm.dbg.value(metadata i8* %9, metadata !1393, metadata !DIExpression()), !dbg !1925
  %10 = icmp eq i8* %9, null, !dbg !1931
  br i1 %10, label %79, label %11, !dbg !1932

11:                                               ; preds = %7
  switch i8 %0, label %59 [
    i8 0, label %12
    i8 6, label %19
    i8 17, label %29
    i8 1, label %39
    i8 58, label %49
  ], !dbg !1933

12:                                               ; preds = %11
  %13 = getelementptr inbounds i8, i8* %9, i64 56, !dbg !1934
  %14 = bitcast i8* %13 to i64*, !dbg !1934
  %15 = load i64, i64* %14, align 8, !dbg !1935, !tbaa !1409
  %16 = add i64 %15, 1, !dbg !1935
  store i64 %16, i64* %14, align 8, !dbg !1935, !tbaa !1409
  %17 = zext i32 %1 to i64, !dbg !1936
  %18 = getelementptr inbounds i8, i8* %9, i64 64, !dbg !1937
  br label %73, !dbg !1938

19:                                               ; preds = %11
  %20 = getelementptr inbounds i8, i8* %9, i64 72, !dbg !1939
  %21 = bitcast i8* %20 to i64*, !dbg !1939
  %22 = load i64, i64* %21, align 8, !dbg !1940, !tbaa !1941
  %23 = add i64 %22, 1, !dbg !1940
  store i64 %23, i64* %21, align 8, !dbg !1940, !tbaa !1941
  %24 = zext i32 %1 to i64, !dbg !1942
  %25 = getelementptr inbounds i8, i8* %9, i64 80, !dbg !1943
  %26 = bitcast i8* %25 to i64*, !dbg !1943
  %27 = load i64, i64* %26, align 8, !dbg !1944, !tbaa !1945
  %28 = add i64 %27, %24, !dbg !1944
  store i64 %28, i64* %26, align 8, !dbg !1944, !tbaa !1945
  br label %66, !dbg !1946

29:                                               ; preds = %11
  %30 = getelementptr inbounds i8, i8* %9, i64 88, !dbg !1947
  %31 = bitcast i8* %30 to i64*, !dbg !1947
  %32 = load i64, i64* %31, align 8, !dbg !1948, !tbaa !1949
  %33 = add i64 %32, 1, !dbg !1948
  store i64 %33, i64* %31, align 8, !dbg !1948, !tbaa !1949
  %34 = zext i32 %1 to i64, !dbg !1950
  %35 = getelementptr inbounds i8, i8* %9, i64 96, !dbg !1951
  %36 = bitcast i8* %35 to i64*, !dbg !1951
  %37 = load i64, i64* %36, align 8, !dbg !1952, !tbaa !1953
  %38 = add i64 %37, %34, !dbg !1952
  store i64 %38, i64* %36, align 8, !dbg !1952, !tbaa !1953
  br label %66, !dbg !1954

39:                                               ; preds = %11
  %40 = getelementptr inbounds i8, i8* %9, i64 104, !dbg !1955
  %41 = bitcast i8* %40 to i64*, !dbg !1955
  %42 = load i64, i64* %41, align 8, !dbg !1956, !tbaa !1957
  %43 = add i64 %42, 1, !dbg !1956
  store i64 %43, i64* %41, align 8, !dbg !1956, !tbaa !1957
  %44 = zext i32 %1 to i64, !dbg !1958
  %45 = getelementptr inbounds i8, i8* %9, i64 112, !dbg !1959
  %46 = bitcast i8* %45 to i64*, !dbg !1959
  %47 = load i64, i64* %46, align 8, !dbg !1960, !tbaa !1961
  %48 = add i64 %47, %44, !dbg !1960
  store i64 %48, i64* %46, align 8, !dbg !1960, !tbaa !1961
  br label %66, !dbg !1962

49:                                               ; preds = %11
  %50 = getelementptr inbounds i8, i8* %9, i64 120, !dbg !1963
  %51 = bitcast i8* %50 to i64*, !dbg !1963
  %52 = load i64, i64* %51, align 8, !dbg !1964, !tbaa !1965
  %53 = add i64 %52, 1, !dbg !1964
  store i64 %53, i64* %51, align 8, !dbg !1964, !tbaa !1965
  %54 = zext i32 %1 to i64, !dbg !1966
  %55 = getelementptr inbounds i8, i8* %9, i64 128, !dbg !1967
  %56 = bitcast i8* %55 to i64*, !dbg !1967
  %57 = load i64, i64* %56, align 8, !dbg !1968, !tbaa !1969
  %58 = add i64 %57, %54, !dbg !1968
  store i64 %58, i64* %56, align 8, !dbg !1968, !tbaa !1969
  br label %66, !dbg !1970

59:                                               ; preds = %11
  %60 = getelementptr inbounds i8, i8* %9, i64 136, !dbg !1971
  %61 = bitcast i8* %60 to [256 x i32]*, !dbg !1971
  %62 = zext i8 %0 to i64, !dbg !1972
  %63 = getelementptr inbounds [256 x i32], [256 x i32]* %61, i64 0, i64 %62, !dbg !1972
  %64 = load i32, i32* %63, align 4, !dbg !1973, !tbaa !1014
  %65 = add i32 %64, 1, !dbg !1973
  store i32 %65, i32* %63, align 4, !dbg !1973, !tbaa !1014
  br label %66, !dbg !1938

66:                                               ; preds = %59, %19, %29, %39, %49
  call void @llvm.dbg.value(metadata i8* %9, metadata !1974, metadata !DIExpression()), !dbg !1981
  call void @llvm.dbg.value(metadata i8 %2, metadata !1980, metadata !DIExpression()), !dbg !1981
  switch i8 %2, label %79 [
    i8 0, label %73
    i8 1, label %67
    i8 2, label %69
    i8 3, label %71
  ], !dbg !1984

67:                                               ; preds = %66
  %68 = getelementptr inbounds i8, i8* %9, i64 8, !dbg !1985
  br label %73, !dbg !1987

69:                                               ; preds = %66
  %70 = getelementptr inbounds i8, i8* %9, i64 16, !dbg !1988
  br label %73, !dbg !1989

71:                                               ; preds = %66
  %72 = getelementptr inbounds i8, i8* %9, i64 24, !dbg !1990
  br label %73, !dbg !1991

73:                                               ; preds = %67, %69, %71, %66, %12
  %74 = phi i8* [ %18, %12 ], [ %72, %71 ], [ %70, %69 ], [ %68, %67 ], [ %9, %66 ]
  %75 = phi i64 [ %17, %12 ], [ 1, %71 ], [ 1, %69 ], [ 1, %67 ], [ 1, %66 ]
  %76 = bitcast i8* %74 to i64*, !dbg !1925
  %77 = load i64, i64* %76, align 8, !dbg !1925, !tbaa !1415
  %78 = add i64 %77, %75, !dbg !1925
  store i64 %78, i64* %76, align 8, !dbg !1925, !tbaa !1415
  br label %79, !dbg !1992

79:                                               ; preds = %73, %66, %7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #9, !dbg !1992
  br label %80

80:                                               ; preds = %3, %79
  ret void, !dbg !1992
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly willreturn
define internal fastcc zeroext i1 @is_dualflow_key(%struct.network_tuple* nocapture noundef readonly %0) unnamed_addr #6 !dbg !1727 {
  call void @llvm.dbg.value(metadata %struct.network_tuple* %0, metadata !1726, metadata !DIExpression()), !dbg !1993
  %2 = bitcast %struct.network_tuple* %0 to i8*, !dbg !1994
  %3 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, !dbg !1995
  %4 = bitcast %struct.flow_address* %3 to i8*, !dbg !1996
  call void @llvm.dbg.value(metadata i8* %2, metadata !1733, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i8* %4, metadata !1738, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i32 20, metadata !1739, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i8* %2, metadata !1740, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i8* %4, metadata !1743, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i32 0, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression()), !dbg !1997
  %5 = load i8, i8* %2, align 1, !dbg !1999, !tbaa !957
  %6 = load i8, i8* %4, align 1, !dbg !2000, !tbaa !957
  %7 = icmp eq i8 %5, %6, !dbg !2001
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %7, label %8, label %132, !dbg !2002

8:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 0, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression()), !dbg !1997
  %9 = getelementptr inbounds i8, i8* %2, i64 1, !dbg !1999
  %10 = load i8, i8* %9, align 1, !dbg !1999, !tbaa !957
  %11 = getelementptr inbounds i8, i8* %4, i64 1, !dbg !2000
  %12 = load i8, i8* %11, align 1, !dbg !2000, !tbaa !957
  %13 = icmp eq i8 %10, %12, !dbg !2001
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %13, label %14, label %132, !dbg !2002

14:                                               ; preds = %8
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 1, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression()), !dbg !1997
  %15 = getelementptr inbounds i8, i8* %2, i64 2, !dbg !1999
  %16 = load i8, i8* %15, align 1, !dbg !1999, !tbaa !957
  %17 = getelementptr inbounds i8, i8* %4, i64 2, !dbg !2000
  %18 = load i8, i8* %17, align 1, !dbg !2000, !tbaa !957
  %19 = icmp eq i8 %16, %18, !dbg !2001
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %19, label %20, label %132, !dbg !2002

20:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 2, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression()), !dbg !1997
  %21 = getelementptr inbounds i8, i8* %2, i64 3, !dbg !1999
  %22 = load i8, i8* %21, align 1, !dbg !1999, !tbaa !957
  %23 = getelementptr inbounds i8, i8* %4, i64 3, !dbg !2000
  %24 = load i8, i8* %23, align 1, !dbg !2000, !tbaa !957
  %25 = icmp eq i8 %22, %24, !dbg !2001
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %25, label %26, label %132, !dbg !2002

26:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 3, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression()), !dbg !1997
  %27 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1, !dbg !1999
  %28 = bitcast i32* %27 to i8*, !dbg !1999
  %29 = load i8, i8* %28, align 1, !dbg !1999, !tbaa !957
  %30 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 1, !dbg !2000
  %31 = bitcast i32* %30 to i8*, !dbg !2000
  %32 = load i8, i8* %31, align 1, !dbg !2000, !tbaa !957
  %33 = icmp eq i8 %29, %32, !dbg !2001
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %33, label %34, label %132, !dbg !2002

34:                                               ; preds = %26
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 4, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression()), !dbg !1997
  %35 = getelementptr inbounds i8, i8* %2, i64 5, !dbg !1999
  %36 = load i8, i8* %35, align 1, !dbg !1999, !tbaa !957
  %37 = getelementptr inbounds i8, i8* %4, i64 5, !dbg !2000
  %38 = load i8, i8* %37, align 1, !dbg !2000, !tbaa !957
  %39 = icmp eq i8 %36, %38, !dbg !2001
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %39, label %40, label %132, !dbg !2002

40:                                               ; preds = %34
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 5, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression()), !dbg !1997
  %41 = getelementptr inbounds i8, i8* %2, i64 6, !dbg !1999
  %42 = load i8, i8* %41, align 1, !dbg !1999, !tbaa !957
  %43 = getelementptr inbounds i8, i8* %4, i64 6, !dbg !2000
  %44 = load i8, i8* %43, align 1, !dbg !2000, !tbaa !957
  %45 = icmp eq i8 %42, %44, !dbg !2001
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %45, label %46, label %132, !dbg !2002

46:                                               ; preds = %40
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 6, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression()), !dbg !1997
  %47 = getelementptr inbounds i8, i8* %2, i64 7, !dbg !1999
  %48 = load i8, i8* %47, align 1, !dbg !1999, !tbaa !957
  %49 = getelementptr inbounds i8, i8* %4, i64 7, !dbg !2000
  %50 = load i8, i8* %49, align 1, !dbg !2000, !tbaa !957
  %51 = icmp eq i8 %48, %50, !dbg !2001
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %51, label %52, label %132, !dbg !2002

52:                                               ; preds = %46
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 7, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression()), !dbg !1997
  %53 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2, !dbg !1999
  %54 = bitcast i32* %53 to i8*, !dbg !1999
  %55 = load i8, i8* %54, align 1, !dbg !1999, !tbaa !957
  %56 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 2, !dbg !2000
  %57 = bitcast i32* %56 to i8*, !dbg !2000
  %58 = load i8, i8* %57, align 1, !dbg !2000, !tbaa !957
  %59 = icmp eq i8 %55, %58, !dbg !2001
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %59, label %60, label %132, !dbg !2002

60:                                               ; preds = %52
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 8, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression()), !dbg !1997
  %61 = getelementptr inbounds i8, i8* %2, i64 9, !dbg !1999
  %62 = load i8, i8* %61, align 1, !dbg !1999, !tbaa !957
  %63 = getelementptr inbounds i8, i8* %4, i64 9, !dbg !2000
  %64 = load i8, i8* %63, align 1, !dbg !2000, !tbaa !957
  %65 = icmp eq i8 %62, %64, !dbg !2001
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %65, label %66, label %132, !dbg !2002

66:                                               ; preds = %60
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 9, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression()), !dbg !1997
  %67 = getelementptr inbounds i8, i8* %2, i64 10, !dbg !1999
  %68 = load i8, i8* %67, align 1, !dbg !1999, !tbaa !957
  %69 = getelementptr inbounds i8, i8* %4, i64 10, !dbg !2000
  %70 = load i8, i8* %69, align 1, !dbg !2000, !tbaa !957
  %71 = icmp eq i8 %68, %70, !dbg !2001
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %71, label %72, label %132, !dbg !2002

72:                                               ; preds = %66
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 10, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression()), !dbg !1997
  %73 = getelementptr inbounds i8, i8* %2, i64 11, !dbg !1999
  %74 = load i8, i8* %73, align 1, !dbg !1999, !tbaa !957
  %75 = getelementptr inbounds i8, i8* %4, i64 11, !dbg !2000
  %76 = load i8, i8* %75, align 1, !dbg !2000, !tbaa !957
  %77 = icmp eq i8 %74, %76, !dbg !2001
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %77, label %78, label %132, !dbg !2002

78:                                               ; preds = %72
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 11, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression()), !dbg !1997
  %79 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !1999
  %80 = bitcast i32* %79 to i8*, !dbg !1999
  %81 = load i8, i8* %80, align 1, !dbg !1999, !tbaa !957
  %82 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !2000
  %83 = bitcast i32* %82 to i8*, !dbg !2000
  %84 = load i8, i8* %83, align 1, !dbg !2000, !tbaa !957
  %85 = icmp eq i8 %81, %84, !dbg !2001
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %85, label %86, label %132, !dbg !2002

86:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 12, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression()), !dbg !1997
  %87 = getelementptr inbounds i8, i8* %2, i64 13, !dbg !1999
  %88 = load i8, i8* %87, align 1, !dbg !1999, !tbaa !957
  %89 = getelementptr inbounds i8, i8* %4, i64 13, !dbg !2000
  %90 = load i8, i8* %89, align 1, !dbg !2000, !tbaa !957
  %91 = icmp eq i8 %88, %90, !dbg !2001
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %91, label %92, label %132, !dbg !2002

92:                                               ; preds = %86
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 13, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression()), !dbg !1997
  %93 = getelementptr inbounds i8, i8* %2, i64 14, !dbg !1999
  %94 = load i8, i8* %93, align 1, !dbg !1999, !tbaa !957
  %95 = getelementptr inbounds i8, i8* %4, i64 14, !dbg !2000
  %96 = load i8, i8* %95, align 1, !dbg !2000, !tbaa !957
  %97 = icmp eq i8 %94, %96, !dbg !2001
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %97, label %98, label %132, !dbg !2002

98:                                               ; preds = %92
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 14, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression()), !dbg !1997
  %99 = getelementptr inbounds i8, i8* %2, i64 15, !dbg !1999
  %100 = load i8, i8* %99, align 1, !dbg !1999, !tbaa !957
  %101 = getelementptr inbounds i8, i8* %4, i64 15, !dbg !2000
  %102 = load i8, i8* %101, align 1, !dbg !2000, !tbaa !957
  %103 = icmp eq i8 %100, %102, !dbg !2001
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %103, label %104, label %132, !dbg !2002

104:                                              ; preds = %98
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 15, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression()), !dbg !1997
  %105 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 1, !dbg !1999
  %106 = bitcast i16* %105 to i8*, !dbg !1999
  %107 = load i8, i8* %106, align 1, !dbg !1999, !tbaa !957
  %108 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 1, !dbg !2000
  %109 = bitcast i16* %108 to i8*, !dbg !2000
  %110 = load i8, i8* %109, align 1, !dbg !2000, !tbaa !957
  %111 = icmp eq i8 %107, %110, !dbg !2001
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %111, label %112, label %132, !dbg !2002

112:                                              ; preds = %104
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 16, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression()), !dbg !1997
  %113 = getelementptr inbounds i8, i8* %2, i64 17, !dbg !1999
  %114 = load i8, i8* %113, align 1, !dbg !1999, !tbaa !957
  %115 = getelementptr inbounds i8, i8* %4, i64 17, !dbg !2000
  %116 = load i8, i8* %115, align 1, !dbg !2000, !tbaa !957
  %117 = icmp eq i8 %114, %116, !dbg !2001
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %117, label %118, label %132, !dbg !2002

118:                                              ; preds = %112
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 17, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression()), !dbg !1997
  %119 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 0, i32 2, !dbg !1999
  %120 = bitcast i16* %119 to i8*, !dbg !1999
  %121 = load i8, i8* %120, align 1, !dbg !1999, !tbaa !957
  %122 = getelementptr inbounds %struct.network_tuple, %struct.network_tuple* %0, i64 0, i32 1, i32 2, !dbg !2000
  %123 = bitcast i16* %122 to i8*, !dbg !2000
  %124 = load i8, i8* %123, align 1, !dbg !2000, !tbaa !957
  %125 = icmp eq i8 %121, %124, !dbg !2001
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %125, label %126, label %132, !dbg !2002

126:                                              ; preds = %118
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression()), !dbg !1997
  call void @llvm.dbg.value(metadata i64 18, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression()), !dbg !1997
  %127 = getelementptr inbounds i8, i8* %2, i64 19, !dbg !1999
  %128 = load i8, i8* %127, align 1, !dbg !1999, !tbaa !957
  %129 = getelementptr inbounds i8, i8* %4, i64 19, !dbg !2000
  %130 = load i8, i8* %129, align 1, !dbg !2000, !tbaa !957
  %131 = icmp eq i8 %128, %130, !dbg !2001
  call void @llvm.dbg.value(metadata i64 19, metadata !1744, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1997
  br i1 %131, label %136, label %132, !dbg !2002

132:                                              ; preds = %126, %118, %112, %104, %98, %92, %86, %78, %72, %66, %60, %52, %46, %40, %34, %26, %20, %14, %8, %1
  %133 = phi i8 [ %5, %1 ], [ %10, %8 ], [ %16, %14 ], [ %22, %20 ], [ %29, %26 ], [ %36, %34 ], [ %42, %40 ], [ %48, %46 ], [ %55, %52 ], [ %62, %60 ], [ %68, %66 ], [ %74, %72 ], [ %81, %78 ], [ %88, %86 ], [ %94, %92 ], [ %100, %98 ], [ %107, %104 ], [ %114, %112 ], [ %121, %118 ], [ %128, %126 ], !dbg !1999
  %134 = phi i8 [ %6, %1 ], [ %12, %8 ], [ %18, %14 ], [ %24, %20 ], [ %32, %26 ], [ %38, %34 ], [ %44, %40 ], [ %50, %46 ], [ %58, %52 ], [ %64, %60 ], [ %70, %66 ], [ %76, %72 ], [ %84, %78 ], [ %90, %86 ], [ %96, %92 ], [ %102, %98 ], [ %110, %104 ], [ %116, %112 ], [ %124, %118 ], [ %130, %126 ], !dbg !2000
  %135 = icmp ule i8 %133, %134, !dbg !2003
  br label %136, !dbg !2004

136:                                              ; preds = %126, %132
  %137 = phi i1 [ %135, %132 ], [ true, %126 ]
  ret i1 %137, !dbg !2005
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #1

; Function Attrs: nounwind
define internal fastcc void @pping_parsed_packet(i8* noundef %0, %struct.packet_info* noundef %1) unnamed_addr #3 !dbg !2006 {
  %3 = alloca %struct.flow_event, align 8
  %4 = alloca %struct.flow_event, align 8
  %5 = alloca %struct.rtt_event, align 8
  %6 = alloca %struct.flow_event, align 8
  %7 = alloca %struct.map_full_event, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.bpf_fib_lookup, align 4
  %10 = alloca %struct.map_full_event, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.dual_flow_state, align 8
  call void @llvm.dbg.value(metadata i8* %0, metadata !2010, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2011, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* null, metadata !2015, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* null, metadata !2016, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.aggregated_stats** undef, metadata !2018, metadata !DIExpression()) #9, !dbg !2026
  call void @llvm.dbg.value(metadata %struct.aggregated_stats** undef, metadata !2024, metadata !DIExpression()) #9, !dbg !2026
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2025, metadata !DIExpression()) #9, !dbg !2026
  %13 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !2028, !tbaa !1398, !range !1035
  %14 = icmp eq i8 %13, 0, !dbg !2028
  br i1 %14, label %95, label %15, !dbg !2030

15:                                               ; preds = %2
  %16 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 0, !dbg !2031
  %17 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !2032
  %18 = load i8, i8* %17, align 2, !dbg !2032, !tbaa !856
  %19 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 15, !dbg !2033
  %20 = load i8, i8* %19, align 1, !dbg !2033, !tbaa !1323, !range !1035
  %21 = icmp ne i8 %20, 0, !dbg !2033
  %22 = tail call fastcc %struct.aggregated_stats* @lookup_or_create_aggregation_stats(%struct.in6_addr* noundef nonnull %16, i8 noundef zeroext %18, i1 noundef zeroext %21) #9, !dbg !2034
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %22, metadata !2035, metadata !DIExpression()) #9, !dbg !2044
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2040, metadata !DIExpression()) #9, !dbg !2044
  call void @llvm.dbg.value(metadata i1 false, metadata !2041, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2044
  %23 = icmp eq %struct.aggregated_stats* %22, null, !dbg !2046
  br i1 %23, label %56, label %24, !dbg !2048

24:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %22, metadata !2042, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)) #9, !dbg !2044
  %25 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !2049
  %26 = load i16, i16* %25, align 8, !dbg !2049, !tbaa !953
  %27 = icmp eq i16 %26, 6, !dbg !2051
  br i1 %27, label %28, label %41, !dbg !2052

28:                                               ; preds = %24
  %29 = load i8, i8* %19, align 1, !dbg !2053, !tbaa !1323, !range !1035
  %30 = icmp eq i8 %29, 0, !dbg !2053
  br i1 %30, label %36, label %31, !dbg !2056

31:                                               ; preds = %28
  %32 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 0, !dbg !2057
  %33 = load i64, i64* %32, align 8, !dbg !2059, !tbaa !2060
  %34 = add i64 %33, 1, !dbg !2059
  store i64 %34, i64* %32, align 8, !dbg !2059, !tbaa !2060
  %35 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 1, !dbg !2062
  br label %46, !dbg !2063

36:                                               ; preds = %28
  %37 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 2, !dbg !2064
  %38 = load i64, i64* %37, align 8, !dbg !2066, !tbaa !2067
  %39 = add i64 %38, 1, !dbg !2066
  store i64 %39, i64* %37, align 8, !dbg !2066, !tbaa !2067
  %40 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 3, !dbg !2068
  br label %46

41:                                               ; preds = %24
  %42 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 4, !dbg !2069
  %43 = load i64, i64* %42, align 8, !dbg !2071, !tbaa !2072
  %44 = add i64 %43, 1, !dbg !2071
  store i64 %44, i64* %42, align 8, !dbg !2071, !tbaa !2072
  %45 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 1, i32 5, !dbg !2073
  br label %46

46:                                               ; preds = %41, %36, %31
  %47 = phi i64* [ %35, %31 ], [ %40, %36 ], [ %45, %41 ]
  %48 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !2074
  %49 = load i32, i32* %48, align 8, !dbg !2074, !tbaa !788
  %50 = zext i32 %49 to i64, !dbg !2074
  %51 = load i64, i64* %47, align 8, !dbg !2074, !tbaa !1415
  %52 = add i64 %51, %50, !dbg !2074
  store i64 %52, i64* %47, align 8, !dbg !2074, !tbaa !1415
  %53 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2075
  %54 = load i64, i64* %53, align 8, !dbg !2075, !tbaa !777
  %55 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %22, i64 0, i32 0, !dbg !2076
  store i64 %54, i64* %55, align 8, !dbg !2077, !tbaa !2078
  br label %56, !dbg !2080

56:                                               ; preds = %46, %15
  %57 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, !dbg !2081
  %58 = load i8, i8* %17, align 2, !dbg !2082, !tbaa !856
  %59 = load i8, i8* %19, align 1, !dbg !2083, !tbaa !1323, !range !1035
  %60 = icmp ne i8 %59, 0, !dbg !2083
  %61 = tail call fastcc %struct.aggregated_stats* @lookup_or_create_aggregation_stats(%struct.in6_addr* noundef nonnull %57, i8 noundef zeroext %58, i1 noundef zeroext %60) #9, !dbg !2084
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %61, metadata !2035, metadata !DIExpression()) #9, !dbg !2085
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2040, metadata !DIExpression()) #9, !dbg !2085
  call void @llvm.dbg.value(metadata i1 true, metadata !2041, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2085
  %62 = icmp eq %struct.aggregated_stats* %61, null, !dbg !2087
  br i1 %62, label %95, label %63, !dbg !2088

63:                                               ; preds = %56
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %61, metadata !2042, metadata !DIExpression(DW_OP_plus_uconst, 56, DW_OP_stack_value)) #9, !dbg !2085
  %64 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !2089
  %65 = load i16, i16* %64, align 8, !dbg !2089, !tbaa !953
  %66 = icmp eq i16 %65, 6, !dbg !2090
  br i1 %66, label %67, label %80, !dbg !2091

67:                                               ; preds = %63
  %68 = load i8, i8* %19, align 1, !dbg !2092, !tbaa !1323, !range !1035
  %69 = icmp eq i8 %68, 0, !dbg !2092
  br i1 %69, label %75, label %70, !dbg !2093

70:                                               ; preds = %67
  %71 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 0, !dbg !2094
  %72 = load i64, i64* %71, align 8, !dbg !2095, !tbaa !2060
  %73 = add i64 %72, 1, !dbg !2095
  store i64 %73, i64* %71, align 8, !dbg !2095, !tbaa !2060
  %74 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 1, !dbg !2096
  br label %85, !dbg !2097

75:                                               ; preds = %67
  %76 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 2, !dbg !2098
  %77 = load i64, i64* %76, align 8, !dbg !2099, !tbaa !2067
  %78 = add i64 %77, 1, !dbg !2099
  store i64 %78, i64* %76, align 8, !dbg !2099, !tbaa !2067
  %79 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 3, !dbg !2100
  br label %85

80:                                               ; preds = %63
  %81 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 4, !dbg !2101
  %82 = load i64, i64* %81, align 8, !dbg !2102, !tbaa !2072
  %83 = add i64 %82, 1, !dbg !2102
  store i64 %83, i64* %81, align 8, !dbg !2102, !tbaa !2072
  %84 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 2, i32 5, !dbg !2103
  br label %85

85:                                               ; preds = %80, %75, %70
  %86 = phi i64* [ %74, %70 ], [ %79, %75 ], [ %84, %80 ]
  %87 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 1, !dbg !2104
  %88 = load i32, i32* %87, align 8, !dbg !2104, !tbaa !788
  %89 = zext i32 %88 to i64, !dbg !2104
  %90 = load i64, i64* %86, align 8, !dbg !2104, !tbaa !1415
  %91 = add i64 %90, %89, !dbg !2104
  store i64 %91, i64* %86, align 8, !dbg !2104, !tbaa !1415
  %92 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2105
  %93 = load i64, i64* %92, align 8, !dbg !2105, !tbaa !777
  %94 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %61, i64 0, i32 0, !dbg !2106
  store i64 %93, i64* %94, align 8, !dbg !2107, !tbaa !2078
  br label %95, !dbg !2108

95:                                               ; preds = %2, %56, %85
  %96 = phi %struct.aggregated_stats* [ null, %2 ], [ %22, %56 ], [ %22, %85 ], !dbg !2017
  %97 = phi %struct.aggregated_stats* [ null, %2 ], [ null, %56 ], [ %61, %85 ], !dbg !2017
  %98 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 15, !dbg !2109
  %99 = load i8, i8* %98, align 1, !dbg !2109, !tbaa !1323, !range !1035
  %100 = icmp eq i8 %99, 0, !dbg !2109
  br i1 %100, label %596, label %101, !dbg !2111

101:                                              ; preds = %95
  call void @llvm.dbg.value(metadata i8* %0, metadata !2112, metadata !DIExpression()) #9, !dbg !2119
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2117, metadata !DIExpression()) #9, !dbg !2119
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2121, metadata !DIExpression()) #9, !dbg !2126
  %102 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 9, !dbg !2128
  %103 = load i8, i8* %102, align 1, !dbg !2128, !tbaa !1365, !range !1035
  %104 = icmp eq i8 %103, 0, !dbg !2128
  %105 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, !dbg !2129
  %106 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, i32 0, !dbg !2129
  %107 = select i1 %104, %struct.network_tuple* %106, %struct.network_tuple* %105, !dbg !2129
  %108 = bitcast %struct.network_tuple* %107 to i8*, !dbg !2130
  %109 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %108) #9, !dbg !2131
  call void @llvm.dbg.value(metadata i8* %109, metadata !2118, metadata !DIExpression()) #9, !dbg !2119
  %110 = icmp eq i8* %109, null, !dbg !2132
  br i1 %110, label %113, label %111, !dbg !2134

111:                                              ; preds = %101
  %112 = bitcast i8* %109 to %struct.dual_flow_state*, !dbg !2131
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %112, metadata !2118, metadata !DIExpression()) #9, !dbg !2119
  br label %194, !dbg !2135

113:                                              ; preds = %101
  %114 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !2136
  %115 = load i8, i8* %114, align 4, !dbg !2136, !tbaa !1331, !range !1035
  %116 = icmp eq i8 %115, 0, !dbg !2136
  br i1 %116, label %596, label %117, !dbg !2138

117:                                              ; preds = %113
  %118 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2139
  %119 = load i8, i8* %118, align 2, !dbg !2139, !tbaa !1340
  %120 = and i8 %119, -2, !dbg !2140
  %121 = icmp eq i8 %120, 2, !dbg !2140
  br i1 %121, label %596, label %122, !dbg !2140

122:                                              ; preds = %117
  call void @llvm.dbg.value(metadata i8* %0, metadata !2141, metadata !DIExpression()) #9, !dbg !2147
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2144, metadata !DIExpression()) #9, !dbg !2147
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2121, metadata !DIExpression()) #9, !dbg !2149
  %123 = load i8, i8* %102, align 1, !dbg !2151, !tbaa !1365, !range !1035
  %124 = icmp eq i8 %123, 0, !dbg !2151
  %125 = select i1 %124, %struct.network_tuple* %106, %struct.network_tuple* %105, !dbg !2152
  call void @llvm.dbg.value(metadata %struct.network_tuple* %125, metadata !2145, metadata !DIExpression()) #9, !dbg !2147
  %126 = bitcast %struct.dual_flow_state* %12 to i8*, !dbg !2153
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %126) #9, !dbg !2153
  call void @llvm.dbg.declare(metadata %struct.dual_flow_state* %12, metadata !2146, metadata !DIExpression()) #9, !dbg !2154
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(144) %126, i8 0, i64 144, i1 false) #9, !dbg !2154
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %12, metadata !2155, metadata !DIExpression()) #9, !dbg !2163
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2160, metadata !DIExpression()) #9, !dbg !2163
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !2161, metadata !DIExpression()) #9, !dbg !2163
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !2162, metadata !DIExpression()) #9, !dbg !2163
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !2165, metadata !DIExpression()) #9, !dbg !2171
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2170, metadata !DIExpression()) #9, !dbg !2171
  %127 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 1, i32 9, !dbg !2173
  %128 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 0, i32 9, !dbg !2173
  %129 = select i1 %124, i8* %127, i8* %128, !dbg !2173
  store i8 1, i8* %129, align 8, !dbg !2174, !tbaa !1793
  %130 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2175
  %131 = load i64, i64* %130, align 8, !dbg !2175, !tbaa !777
  %132 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 1, i32 2, !dbg !2176
  %133 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 0, i32 2, !dbg !2176
  %134 = select i1 %124, i64* %132, i64* %133, !dbg !2176
  store i64 %131, i64* %134, align 8, !dbg !2177, !tbaa !1796
  %135 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !2178
  %136 = load i32, i32* %135, align 4, !dbg !2178, !tbaa !1328
  %137 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 1, i32 7, !dbg !2179
  %138 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 0, i32 7, !dbg !2179
  %139 = select i1 %124, i32* %137, i32* %138, !dbg !2179
  store i32 %136, i32* %139, align 8, !dbg !2180, !tbaa !2181
  %140 = icmp eq i8 %119, 1, !dbg !2182
  br i1 %140, label %141, label %144, !dbg !2183

141:                                              ; preds = %122
  %142 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !2184
  %143 = load i8, i8* %142, align 1, !dbg !2184, !tbaa !1343
  br label %144, !dbg !2183

144:                                              ; preds = %141, %122
  %145 = phi i8 [ %143, %141 ], [ 3, %122 ]
  %146 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 1, i32 10, !dbg !2185
  %147 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 0, i32 10, !dbg !2185
  %148 = select i1 %124, i8* %146, i8* %147, !dbg !2185
  store i8 %145, i8* %148, align 1, !dbg !2186, !tbaa !2187
  %149 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 1, i32 11, !dbg !2188
  %150 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %12, i64 0, i32 0, i32 11, !dbg !2188
  %151 = select i1 %124, i8* %149, i8* %150, !dbg !2188
  store i8 0, i8* %151, align 2, !dbg !2189, !tbaa !2190
  call void @llvm.dbg.value(metadata %struct.flow_state* undef, metadata !2191, metadata !DIExpression()) #9, !dbg !2196
  %152 = select i1 %124, i8* %128, i8* %127, !dbg !2198
  store i8 0, i8* %152, align 8, !dbg !2199, !tbaa !1793
  %153 = select i1 %124, i8* %150, i8* %149, !dbg !2200
  store i8 0, i8* %153, align 2, !dbg !2201, !tbaa !2190
  %154 = bitcast %struct.network_tuple* %125 to i8*, !dbg !2202
  %155 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %154, i8* noundef nonnull %126, i64 noundef 1) #9, !dbg !2204
  %156 = icmp eq i64 %155, 0, !dbg !2205
  br i1 %156, label %189, label %157, !dbg !2206

157:                                              ; preds = %144
  call void @llvm.dbg.value(metadata i32 1, metadata !2207, metadata !DIExpression()) #9, !dbg !2214
  %158 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !2217, !tbaa !1398, !range !1035
  %159 = icmp eq i8 %158, 0, !dbg !2217
  br i1 %159, label %170, label %160, !dbg !2219

160:                                              ; preds = %157
  %161 = bitcast i32* %11 to i8*, !dbg !2220
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %161) #9, !dbg !2220
  call void @llvm.dbg.value(metadata i32 0, metadata !2213, metadata !DIExpression()) #9, !dbg !2214
  store i32 0, i32* %11, align 4, !dbg !2221, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %11, metadata !2213, metadata !DIExpression(DW_OP_deref)) #9, !dbg !2214
  %162 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.13* @map_global_counters to i8*), i8* noundef nonnull %161) #9, !dbg !2222
  call void @llvm.dbg.value(metadata i8* %162, metadata !2212, metadata !DIExpression()) #9, !dbg !2214
  %163 = icmp eq i8* %162, null, !dbg !2223
  br i1 %163, label %169, label %164, !dbg !2225

164:                                              ; preds = %160
  %165 = getelementptr inbounds i8, i8* %162, i64 40, !dbg !2226
  %166 = bitcast i8* %165 to i64*, !dbg !2226
  %167 = load i64, i64* %166, align 8, !dbg !2226, !tbaa !1415
  %168 = add i64 %167, 1, !dbg !2226
  store i64 %168, i64* %166, align 8, !dbg !2226, !tbaa !1415
  br label %169, !dbg !2228

169:                                              ; preds = %164, %160
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %161) #9, !dbg !2228
  br label %170

170:                                              ; preds = %169, %157
  call void @llvm.dbg.value(metadata i8* %0, metadata !2229, metadata !DIExpression()) #9, !dbg !2244
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2234, metadata !DIExpression()) #9, !dbg !2244
  call void @llvm.dbg.value(metadata i8 0, metadata !2235, metadata !DIExpression()) #9, !dbg !2244
  %171 = bitcast %struct.map_full_event* %10 to i8*, !dbg !2246
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %171) #9, !dbg !2246
  call void @llvm.dbg.declare(metadata %struct.map_full_event* %10, metadata !2236, metadata !DIExpression()) #9, !dbg !2247
  %172 = load i64, i64* %130, align 8, !dbg !2248, !tbaa !777
  %173 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !2250, !tbaa !1415
  %174 = icmp ult i64 %172, %173, !dbg !2251
  br i1 %174, label %188, label %175, !dbg !2252

175:                                              ; preds = %170
  %176 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !2253, !tbaa !1415
  %177 = sub i64 %172, %176, !dbg !2254
  %178 = icmp ult i64 %177, 1000000000, !dbg !2255
  br i1 %178, label %188, label %179, !dbg !2256

179:                                              ; preds = %175
  store volatile i64 %172, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 0), align 8, !dbg !2257, !tbaa !1415
  %180 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %10, i64 0, i32 2, i32 2, !dbg !2258
  %181 = bitcast i16* %180 to i64*, !dbg !2258
  store i64 0, i64* %181, align 8, !dbg !2258
  %182 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %10, i64 0, i32 0, !dbg !2259
  store i64 3, i64* %182, align 8, !dbg !2260, !tbaa !2261
  %183 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %10, i64 0, i32 1, !dbg !2263
  store i64 %172, i64* %183, align 8, !dbg !2264, !tbaa !2265
  %184 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %10, i64 0, i32 2, !dbg !2266
  %185 = bitcast %struct.network_tuple* %184 to i8*, !dbg !2267
  %186 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2267
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %185, i8* noundef nonnull align 8 dereferenceable(44) %186, i64 44, i1 false) #9, !dbg !2267, !tbaa.struct !1609
  %187 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %171, i64 noundef 64) #9, !dbg !2268
  br label %188, !dbg !2269

188:                                              ; preds = %179, %175, %170
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %171) #9, !dbg !2269
  br label %192, !dbg !2270

189:                                              ; preds = %144
  %190 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %154) #9, !dbg !2271
  %191 = bitcast i8* %190 to %struct.dual_flow_state*, !dbg !2271
  br label %192, !dbg !2272

192:                                              ; preds = %189, %188
  %193 = phi %struct.dual_flow_state* [ null, %188 ], [ %191, %189 ], !dbg !2147
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %126) #9, !dbg !2273
  br label %194, !dbg !2274

194:                                              ; preds = %111, %192
  %195 = phi %struct.dual_flow_state* [ %112, %111 ], [ %193, %192 ], !dbg !2119
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %195, metadata !2012, metadata !DIExpression()), !dbg !2017
  %196 = icmp eq %struct.dual_flow_state* %195, null, !dbg !2275
  br i1 %196, label %596, label %197, !dbg !2277

197:                                              ; preds = %194
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %195, metadata !2278, metadata !DIExpression()), !dbg !2284
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2283, metadata !DIExpression()), !dbg !2284
  %198 = load i8, i8* %102, align 1, !dbg !2286, !tbaa !1365, !range !1035
  %199 = icmp eq i8 %198, 0, !dbg !2286
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %195, metadata !1637, metadata !DIExpression()), !dbg !2287
  call void @llvm.dbg.value(metadata i1 %199, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2287
  %200 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %195, i64 0, i32 0, !dbg !2289
  %201 = getelementptr inbounds %struct.dual_flow_state, %struct.dual_flow_state* %195, i64 0, i32 1, !dbg !2289
  %202 = select i1 %199, %struct.flow_state* %201, %struct.flow_state* %200, !dbg !2289
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2013, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2290, metadata !DIExpression()), !dbg !2296
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2295, metadata !DIExpression()), !dbg !2296
  %203 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 9, !dbg !2298
  %204 = load i8, i8* %203, align 8, !dbg !2298, !tbaa !1793
  switch i8 %204, label %226 [
    i8 0, label %205
    i8 3, label %388
  ], !dbg !2300

205:                                              ; preds = %197
  %206 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !2301
  %207 = load i8, i8* %206, align 4, !dbg !2301, !tbaa !1331, !range !1035
  %208 = icmp eq i8 %207, 0, !dbg !2301
  br i1 %208, label %388, label %209, !dbg !2302

209:                                              ; preds = %205
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2165, metadata !DIExpression()), !dbg !2303
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2170, metadata !DIExpression()), !dbg !2303
  store i8 1, i8* %203, align 8, !dbg !2305, !tbaa !1793
  %210 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2306
  %211 = load i64, i64* %210, align 8, !dbg !2306, !tbaa !777
  %212 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 2, !dbg !2307
  store i64 %211, i64* %212, align 8, !dbg !2308, !tbaa !1796
  %213 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !2309
  %214 = load i32, i32* %213, align 4, !dbg !2309, !tbaa !1328
  %215 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 7, !dbg !2310
  store i32 %214, i32* %215, align 8, !dbg !2311, !tbaa !2181
  %216 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2312
  %217 = load i8, i8* %216, align 2, !dbg !2312, !tbaa !1340
  %218 = icmp eq i8 %217, 1, !dbg !2313
  br i1 %218, label %219, label %222, !dbg !2314

219:                                              ; preds = %209
  %220 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !2315
  %221 = load i8, i8* %220, align 1, !dbg !2315, !tbaa !1343
  br label %222, !dbg !2314

222:                                              ; preds = %209, %219
  %223 = phi i8 [ %221, %219 ], [ 3, %209 ]
  %224 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 10, !dbg !2316
  store i8 %223, i8* %224, align 1, !dbg !2317, !tbaa !2187
  %225 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 11, !dbg !2318
  store i8 0, i8* %225, align 2, !dbg !2319, !tbaa !2190
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2320, metadata !DIExpression()) #9, !dbg !2327
  call void @llvm.dbg.value(metadata i8* %0, metadata !2325, metadata !DIExpression()) #9, !dbg !2327
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2326, metadata !DIExpression()) #9, !dbg !2327
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !1784, metadata !DIExpression()) #9, !dbg !2329
  br label %226, !dbg !2332

226:                                              ; preds = %197, %222
  %227 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 3, !dbg !2333
  %228 = load i64, i64* %227, align 8, !dbg !2336, !tbaa !2337
  %229 = add i64 %228, 1, !dbg !2336
  store i64 %229, i64* %227, align 8, !dbg !2336, !tbaa !2337
  %230 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, !dbg !2338
  %231 = load i32, i32* %230, align 4, !dbg !2338, !tbaa !1383
  %232 = zext i32 %231 to i64, !dbg !2339
  %233 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 4, !dbg !2340
  %234 = load i64, i64* %233, align 8, !dbg !2341, !tbaa !2342
  %235 = add i64 %234, %232, !dbg !2341
  store i64 %235, i64* %233, align 8, !dbg !2341, !tbaa !2342
  %236 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 10, !dbg !2343
  %237 = load i8, i8* %236, align 4, !dbg !2343, !tbaa !1331, !range !1035
  %238 = icmp eq i8 %237, 0, !dbg !2343
  br i1 %238, label %388, label %239, !dbg !2344

239:                                              ; preds = %226
  %240 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 7), align 1, !dbg !2345, !tbaa !2347, !range !1035
  %241 = icmp eq i8 %240, 0, !dbg !2345
  br i1 %241, label %293, label %242, !dbg !2348

242:                                              ; preds = %239
  %243 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 8, !dbg !2349
  %244 = load i8, i8* %243, align 2, !dbg !2349, !tbaa !1482, !range !1035
  %245 = icmp eq i8 %244, 0, !dbg !2349
  br i1 %245, label %293, label %246, !dbg !2350

246:                                              ; preds = %242
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2351, metadata !DIExpression()) #9, !dbg !2364
  call void @llvm.dbg.value(metadata i8* %0, metadata !2356, metadata !DIExpression()) #9, !dbg !2364
  %247 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 0, !dbg !2366
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %247) #9, !dbg !2366
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %9, metadata !2358, metadata !DIExpression()) #9, !dbg !2367
  %248 = getelementptr inbounds i8, i8* %247, i64 12, !dbg !2368
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(64) %248, i8 0, i64 52, i1 false) #9, !dbg !2368
  %249 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 5, !dbg !2369
  %250 = load i32, i32* %249, align 8, !dbg !2369, !tbaa !1485
  %251 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 5, !dbg !2370
  store i32 %250, i32* %251, align 4, !dbg !2371, !tbaa !2372
  %252 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 3, !dbg !2374
  %253 = load i8, i8* %252, align 2, !dbg !2374, !tbaa !856
  store i8 %253, i8* %247, align 4, !dbg !2375, !tbaa !2376
  %254 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 7, !dbg !2377
  %255 = load i16, i16* %254, align 8, !dbg !2377, !tbaa !988
  %256 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 4, !dbg !2378
  store i16 %255, i16* %256, align 2, !dbg !2379, !tbaa !2380
  switch i8 %253, label %280 [
    i8 2, label %257
    i8 10, label %269
  ], !dbg !2381

257:                                              ; preds = %246
  %258 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, !dbg !2382
  %259 = bitcast %union.anon.4* %258 to i8*, !dbg !2384
  %260 = load i8, i8* %259, align 4, !dbg !2384, !tbaa !957
  %261 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 6, !dbg !2385
  %262 = bitcast %union.anon.28* %261 to i8*, !dbg !2385
  store i8 %260, i8* %262, align 4, !dbg !2386, !tbaa !957
  call void @llvm.dbg.value(metadata %struct.network_tuple* %105, metadata !2387, metadata !DIExpression()) #9, !dbg !2392
  %263 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 0, i32 0, i32 0, i32 0, i64 3, !dbg !2394
  %264 = load i32, i32* %263, align 4, !dbg !2394, !tbaa !957
  %265 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 7, i32 0, i64 0, !dbg !2395
  store i32 %264, i32* %265, align 4, !dbg !2396, !tbaa !957
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2387, metadata !DIExpression(DW_OP_plus_uconst, 36, DW_OP_stack_value)) #9, !dbg !2397
  %266 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, i32 0, i32 0, i64 3, !dbg !2399
  %267 = load i32, i32* %266, align 4, !dbg !2399, !tbaa !957
  %268 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 8, i32 0, i64 0, !dbg !2400
  store i32 %267, i32* %268, align 4, !dbg !2401, !tbaa !957
  br label %280, !dbg !2402

269:                                              ; preds = %246
  %270 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 7, i32 0, i64 0, !dbg !2403
  call void @llvm.dbg.value(metadata i32* %270, metadata !2359, metadata !DIExpression()) #9, !dbg !2404
  %271 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 8, i32 0, i64 0, !dbg !2405
  call void @llvm.dbg.value(metadata i32* %271, metadata !2363, metadata !DIExpression()) #9, !dbg !2404
  %272 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 6, i32 0, !dbg !2406
  %273 = load i32, i32* %272, align 4, !dbg !2406, !tbaa !957
  %274 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 6, i32 0, !dbg !2407
  store i32 %273, i32* %274, align 4, !dbg !2408, !tbaa !957
  %275 = bitcast i32* %270 to i8*, !dbg !2409
  %276 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2409
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %275, i8* noundef nonnull align 8 dereferenceable(16) %276, i64 16, i1 false) #9, !dbg !2409, !tbaa.struct !1005
  %277 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 1, i32 0, !dbg !2410
  %278 = bitcast i32* %271 to i8*, !dbg !2410
  %279 = bitcast %struct.in6_addr* %277 to i8*, !dbg !2410
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %278, i8* noundef nonnull align 4 dereferenceable(16) %279, i64 16, i1 false) #9, !dbg !2410, !tbaa.struct !1005
  br label %280, !dbg !2411

280:                                              ; preds = %269, %257, %246
  %281 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !2412
  %282 = load i16, i16* %281, align 8, !dbg !2412, !tbaa !953
  %283 = trunc i16 %282 to i8, !dbg !2413
  %284 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 1, !dbg !2414
  store i8 %283, i8* %284, align 1, !dbg !2415, !tbaa !2416
  %285 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 2, !dbg !2417
  store i16 0, i16* %285, align 2, !dbg !2418, !tbaa !2419
  %286 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %9, i64 0, i32 3, !dbg !2420
  store i16 0, i16* %286, align 4, !dbg !2421, !tbaa !2422
  %287 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* noundef %0, %struct.bpf_fib_lookup* noundef nonnull %9, i32 noundef 64, i32 noundef 0) #9, !dbg !2423
  %288 = trunc i64 %287 to i32, !dbg !2423
  call void @llvm.dbg.value(metadata i32 %288, metadata !2357, metadata !DIExpression()) #9, !dbg !2364
  %289 = icmp eq i32 %288, 4, !dbg !2424
  %290 = icmp eq i32 %288, 5, !dbg !2425
  %291 = call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %289) #9
  %292 = select i1 %291, i1 true, i1 %290, !dbg !2425
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %247) #9, !dbg !2426
  br i1 %292, label %388, label %293, !dbg !2427

293:                                              ; preds = %280, %242, %239
  %294 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 11, !dbg !2428
  %295 = load i8, i8* %294, align 2, !dbg !2428, !tbaa !2190, !range !1035
  %296 = icmp eq i8 %295, 0, !dbg !2428
  br i1 %296, label %297, label %305, !dbg !2430

297:                                              ; preds = %293
  %298 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 14, !dbg !2431
  %299 = load i8, i8* %298, align 8, !dbg !2431, !tbaa !1346, !range !1035
  %300 = icmp eq i8 %299, 0, !dbg !2431
  br i1 %300, label %301, label %305, !dbg !2432

301:                                              ; preds = %297
  %302 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !2433
  %303 = load i32, i32* %302, align 4, !dbg !2433, !tbaa !1328
  %304 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 7, !dbg !2434
  store i32 %303, i32* %304, align 8, !dbg !2435, !tbaa !2181
  br label %344, !dbg !2436

305:                                              ; preds = %297, %293
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2438, metadata !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value)) #9, !dbg !2444
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2443, metadata !DIExpression()) #9, !dbg !2444
  %306 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 0, i32 2, !dbg !2446
  %307 = load i16, i16* %306, align 4, !dbg !2446, !tbaa !2448
  %308 = icmp eq i16 %307, 6, !dbg !2449
  %309 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, i32 1, !dbg !2444
  %310 = load i32, i32* %309, align 4, !dbg !2444, !tbaa !2450
  %311 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 7, !dbg !2444
  %312 = load i32, i32* %311, align 8, !dbg !2444, !tbaa !2181
  %313 = sub i32 %310, %312, !dbg !2451
  %314 = icmp sgt i32 %313, 0, !dbg !2451
  %315 = icmp ne i32 %310, %312, !dbg !2451
  %316 = select i1 %308, i1 %314, i1 %315, !dbg !2451
  br i1 %316, label %317, label %388, !dbg !2452

317:                                              ; preds = %305
  store i32 %310, i32* %311, align 8, !dbg !2435, !tbaa !2181
  br i1 %296, label %344, label %318, !dbg !2436

318:                                              ; preds = %317
  %319 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2453
  %320 = load i64, i64* %319, align 8, !dbg !2453, !tbaa !777
  %321 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 2, !dbg !2454
  %322 = load i64, i64* %321, align 8, !dbg !2454, !tbaa !1796
  %323 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 4), align 4, !dbg !2455, !tbaa !2456, !range !1035
  %324 = icmp eq i8 %323, 0, !dbg !2455
  %325 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 1, !dbg !2457
  %326 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 0, !dbg !2457
  %327 = select i1 %324, i64* %326, i64* %325, !dbg !2457
  %328 = load i64, i64* %327, align 8, !dbg !2457, !tbaa !1415
  call void @llvm.dbg.value(metadata i64 %320, metadata !2458, metadata !DIExpression()) #9, !dbg !2465
  call void @llvm.dbg.value(metadata i64 %322, metadata !2463, metadata !DIExpression()) #9, !dbg !2465
  call void @llvm.dbg.value(metadata i64 %328, metadata !2464, metadata !DIExpression()) #9, !dbg !2465
  %329 = icmp ult i64 %320, %322, !dbg !2467
  br i1 %329, label %388, label %330, !dbg !2469

330:                                              ; preds = %318
  %331 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 1), align 8, !dbg !2470, !tbaa !2472
  %332 = icmp ne i64 %331, 0, !dbg !2473
  %333 = icmp ne i64 %328, 0
  %334 = and i1 %333, %332, !dbg !2474
  %335 = sub i64 %320, %322, !dbg !2465
  br i1 %334, label %336, label %341, !dbg !2474

336:                                              ; preds = %330
  %337 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 1), align 8, !dbg !2475, !tbaa !2472
  %338 = mul i64 %337, %328, !dbg !2475
  %339 = lshr i64 %338, 16, !dbg !2475
  %340 = icmp ult i64 %335, %339, !dbg !2476
  br i1 %340, label %388, label %344, !dbg !2477

341:                                              ; preds = %330
  %342 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 0), align 8, !dbg !2478, !tbaa !2479
  %343 = icmp ult i64 %335, %342, !dbg !2480
  br i1 %343, label %388, label %344, !dbg !2477

344:                                              ; preds = %341, %336, %317, %301
  %345 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 3, !dbg !2481
  store i8 1, i8* %294, align 2, !dbg !2482, !tbaa !2190
  %346 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2483
  %347 = load i64, i64* %346, align 8, !dbg !2483, !tbaa !777
  %348 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 2, !dbg !2484
  store i64 %347, i64* %348, align 8, !dbg !2485, !tbaa !1796
  %349 = bitcast %struct.packet_id* %345 to i8*, !dbg !2486
  %350 = bitcast %struct.packet_info* %1 to i8*, !dbg !2488
  %351 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.7* @packet_ts to i8*), i8* noundef nonnull %349, i8* noundef %350, i64 noundef 1) #9, !dbg !2489
  %352 = icmp eq i64 %351, 0, !dbg !2490
  br i1 %352, label %353, label %356, !dbg !2491

353:                                              ; preds = %344
  %354 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %202, i64 0, i32 8, !dbg !2492
  %355 = atomicrmw add i32* %354, i32 1 seq_cst, align 4, !dbg !2494
  br label %388, !dbg !2495

356:                                              ; preds = %344
  call void @llvm.dbg.value(metadata i32 0, metadata !2207, metadata !DIExpression()) #9, !dbg !2496
  %357 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !2499, !tbaa !1398, !range !1035
  %358 = icmp eq i8 %357, 0, !dbg !2499
  br i1 %358, label %369, label %359, !dbg !2500

359:                                              ; preds = %356
  %360 = bitcast i32* %8 to i8*, !dbg !2501
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %360) #9, !dbg !2501
  call void @llvm.dbg.value(metadata i32 0, metadata !2213, metadata !DIExpression()) #9, !dbg !2496
  store i32 0, i32* %8, align 4, !dbg !2502, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %8, metadata !2213, metadata !DIExpression(DW_OP_deref)) #9, !dbg !2496
  %361 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.13* @map_global_counters to i8*), i8* noundef nonnull %360) #9, !dbg !2503
  call void @llvm.dbg.value(metadata i8* %361, metadata !2212, metadata !DIExpression()) #9, !dbg !2496
  %362 = icmp eq i8* %361, null, !dbg !2504
  br i1 %362, label %368, label %363, !dbg !2505

363:                                              ; preds = %359
  %364 = getelementptr inbounds i8, i8* %361, i64 32, !dbg !2506
  %365 = bitcast i8* %364 to i64*, !dbg !2506
  %366 = load i64, i64* %365, align 8, !dbg !2506, !tbaa !1415
  %367 = add i64 %366, 1, !dbg !2506
  store i64 %367, i64* %365, align 8, !dbg !2506, !tbaa !1415
  br label %368, !dbg !2507

368:                                              ; preds = %363, %359
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %360) #9, !dbg !2507
  br label %369

369:                                              ; preds = %368, %356
  call void @llvm.dbg.value(metadata i8* %0, metadata !2229, metadata !DIExpression()) #9, !dbg !2508
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2234, metadata !DIExpression()) #9, !dbg !2508
  call void @llvm.dbg.value(metadata i8 1, metadata !2235, metadata !DIExpression()) #9, !dbg !2508
  %370 = bitcast %struct.map_full_event* %7 to i8*, !dbg !2510
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %370) #9, !dbg !2510
  call void @llvm.dbg.declare(metadata %struct.map_full_event* %7, metadata !2236, metadata !DIExpression()) #9, !dbg !2511
  %371 = load i64, i64* %346, align 8, !dbg !2512, !tbaa !777
  %372 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2513, !tbaa !1415
  %373 = icmp ult i64 %371, %372, !dbg !2514
  br i1 %373, label %387, label %374, !dbg !2515

374:                                              ; preds = %369
  %375 = load volatile i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2516, !tbaa !1415
  %376 = sub i64 %371, %375, !dbg !2517
  %377 = icmp ult i64 %376, 1000000000, !dbg !2518
  br i1 %377, label %387, label %378, !dbg !2519

378:                                              ; preds = %374
  store volatile i64 %371, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @last_warn_time, i64 0, i64 1), align 8, !dbg !2520, !tbaa !1415
  %379 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %7, i64 0, i32 2, i32 2, !dbg !2521
  %380 = bitcast i16* %379 to i64*, !dbg !2521
  store i64 4294967296, i64* %380, align 8, !dbg !2521
  %381 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %7, i64 0, i32 0, !dbg !2522
  store i64 3, i64* %381, align 8, !dbg !2523, !tbaa !2261
  %382 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %7, i64 0, i32 1, !dbg !2524
  store i64 %371, i64* %382, align 8, !dbg !2525, !tbaa !2265
  %383 = getelementptr inbounds %struct.map_full_event, %struct.map_full_event* %7, i64 0, i32 2, !dbg !2526
  %384 = bitcast %struct.network_tuple* %383 to i8*, !dbg !2527
  %385 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2527
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %384, i8* noundef nonnull align 8 dereferenceable(44) %385, i64 44, i1 false) #9, !dbg !2527, !tbaa.struct !1609
  %386 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %370, i64 noundef 64) #9, !dbg !2528
  br label %387, !dbg !2529

387:                                              ; preds = %378, %374, %369
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %370) #9, !dbg !2529
  br label %388

388:                                              ; preds = %205, %197, %226, %280, %305, %318, %336, %341, %353, %387
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %195, metadata !2530, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2533, metadata !DIExpression()), !dbg !2534
  %389 = load i8, i8* %102, align 1, !dbg !2536, !tbaa !1365, !range !1035
  %390 = icmp eq i8 %389, 0, !dbg !2536
  call void @llvm.dbg.value(metadata %struct.dual_flow_state* %195, metadata !1637, metadata !DIExpression()), !dbg !2537
  call void @llvm.dbg.value(metadata i1 %390, metadata !1642, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2537
  %391 = select i1 %390, %struct.flow_state* %200, %struct.flow_state* %201, !dbg !2539
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2014, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata i8* %0, metadata !2540, metadata !DIExpression()) #9, !dbg !2547
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2545, metadata !DIExpression()) #9, !dbg !2547
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2546, metadata !DIExpression()) #9, !dbg !2547
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !1784, metadata !DIExpression()) #9, !dbg !2549
  %392 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 9, !dbg !2552
  %393 = load i8, i8* %392, align 8, !dbg !2552, !tbaa !1793
  switch i8 %393, label %418 [
    i8 3, label %429
    i8 0, label %429
    i8 1, label %394
  ], !dbg !2553

394:                                              ; preds = %388
  %395 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2554
  %396 = load i8, i8* %395, align 2, !dbg !2554, !tbaa !1340
  %397 = icmp eq i8 %396, 3, !dbg !2556
  br i1 %397, label %418, label %398, !dbg !2557

398:                                              ; preds = %394
  store i8 2, i8* %392, align 8, !dbg !2558, !tbaa !1793
  call void @llvm.dbg.value(metadata i8* %0, metadata !2560, metadata !DIExpression()) #9, !dbg !2566
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2563, metadata !DIExpression()) #9, !dbg !2566
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2564, metadata !DIExpression()) #9, !dbg !2566
  %399 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !2568, !tbaa !1876, !range !1035
  %400 = icmp eq i8 %399, 0, !dbg !2568
  br i1 %400, label %418, label %401, !dbg !2570

401:                                              ; preds = %398
  %402 = bitcast %struct.flow_event* %6 to i8*, !dbg !2571
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %402) #9, !dbg !2571
  call void @llvm.dbg.declare(metadata %struct.flow_event* %6, metadata !2565, metadata !DIExpression()) #9, !dbg !2572
  %403 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 0, !dbg !2573
  store i64 1, i64* %403, align 8, !dbg !2573, !tbaa !1881
  %404 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 1, !dbg !2573
  %405 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 2, !dbg !2574
  %406 = load i64, i64* %405, align 8, !dbg !2574, !tbaa !1796
  store i64 %406, i64* %404, align 8, !dbg !2573, !tbaa !1883
  %407 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 2, !dbg !2573
  %408 = bitcast %struct.network_tuple* %407 to i8*, !dbg !2575
  %409 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2575
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %408, i8* noundef nonnull align 8 dereferenceable(44) %409, i64 44, i1 false) #9, !dbg !2575, !tbaa.struct !1609
  %410 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 3, !dbg !2573
  store i8 1, i8* %410, align 4, !dbg !2573, !tbaa !1884
  %411 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 4, !dbg !2573
  %412 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 10, !dbg !2576
  %413 = load i8, i8* %412, align 1, !dbg !2576, !tbaa !2187
  store i8 %413, i8* %411, align 1, !dbg !2573, !tbaa !1885
  %414 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 5, !dbg !2573
  store i8 1, i8* %414, align 2, !dbg !2573, !tbaa !1886
  %415 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %6, i64 0, i32 6, !dbg !2573
  store i8 0, i8* %415, align 1, !dbg !2573, !tbaa !1887
  %416 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %402, i64 noundef 64) #9, !dbg !2577
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %402) #9, !dbg !2578
  %417 = load i8, i8* %392, align 8, !dbg !2579, !tbaa !1793
  br label %418

418:                                              ; preds = %401, %398, %394, %388
  %419 = phi i8 [ %417, %401 ], [ 2, %398 ], [ 1, %394 ], [ %393, %388 ], !dbg !2579
  %420 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 5, !dbg !2593
  %421 = load i64, i64* %420, align 8, !dbg !2594, !tbaa !2595
  %422 = add i64 %421, 1, !dbg !2594
  store i64 %422, i64* %420, align 8, !dbg !2594, !tbaa !2595
  %423 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 2, !dbg !2596
  %424 = load i32, i32* %423, align 4, !dbg !2596, !tbaa !1383
  %425 = zext i32 %424 to i64, !dbg !2597
  %426 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 6, !dbg !2598
  %427 = load i64, i64* %426, align 8, !dbg !2599, !tbaa !2600
  %428 = add i64 %427, %425, !dbg !2599
  store i64 %428, i64* %426, align 8, !dbg !2599, !tbaa !2600
  br label %429, !dbg !2601

429:                                              ; preds = %388, %388, %418
  %430 = phi i8 [ %393, %388 ], [ %393, %388 ], [ %419, %418 ], !dbg !2579
  %431 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 11), align 1, !dbg !2602, !tbaa !2603, !range !1035
  %432 = icmp eq i8 %431, 0, !dbg !2602
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %97, metadata !2016, metadata !DIExpression()), !dbg !2017
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %96, metadata !2015, metadata !DIExpression()), !dbg !2017
  %433 = select i1 %432, %struct.aggregated_stats* %96, %struct.aggregated_stats* %97, !dbg !2604
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2586, metadata !DIExpression()) #9, !dbg !2605
  call void @llvm.dbg.value(metadata i8* %0, metadata !2587, metadata !DIExpression()) #9, !dbg !2605
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2588, metadata !DIExpression()) #9, !dbg !2605
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %433, metadata !2589, metadata !DIExpression()) #9, !dbg !2605
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !1784, metadata !DIExpression()) #9, !dbg !2606
  switch i8 %430, label %434 [
    i8 3, label %532
    i8 0, label %532
  ], !dbg !2607

434:                                              ; preds = %429
  %435 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 11, !dbg !2608
  %436 = load i8, i8* %435, align 1, !dbg !2608, !tbaa !1337, !range !1035
  %437 = icmp eq i8 %436, 0, !dbg !2608
  br i1 %437, label %532, label %438, !dbg !2609

438:                                              ; preds = %434
  %439 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 8, !dbg !2610
  %440 = load i32, i32* %439, align 4, !dbg !2610, !tbaa !2612
  %441 = icmp eq i32 %440, 0, !dbg !2613
  br i1 %441, label %532, label %442, !dbg !2614

442:                                              ; preds = %438
  %443 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 4, !dbg !2615
  %444 = bitcast %struct.packet_id* %443 to i8*, !dbg !2616
  %445 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.7* @packet_ts to i8*), i8* noundef nonnull %444) #9, !dbg !2617
  call void @llvm.dbg.value(metadata i8* %445, metadata !2591, metadata !DIExpression()) #9, !dbg !2605
  %446 = icmp eq i8* %445, null, !dbg !2618
  br i1 %446, label %532, label %447, !dbg !2620

447:                                              ; preds = %442
  %448 = bitcast i8* %445 to i64*, !dbg !2617
  call void @llvm.dbg.value(metadata i64* %448, metadata !2591, metadata !DIExpression()) #9, !dbg !2605
  %449 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2621
  %450 = load i64, i64* %449, align 8, !dbg !2621, !tbaa !777
  %451 = load i64, i64* %448, align 8, !dbg !2622, !tbaa !1415
  %452 = icmp ult i64 %450, %451, !dbg !2623
  br i1 %452, label %532, label %453, !dbg !2624

453:                                              ; preds = %447
  %454 = sub i64 %450, %451, !dbg !2625
  call void @llvm.dbg.value(metadata i64 %454, metadata !2590, metadata !DIExpression()) #9, !dbg !2605
  %455 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.7* @packet_ts to i8*), i8* noundef nonnull %444) #9, !dbg !2626
  %456 = icmp eq i64 %455, 0, !dbg !2628
  br i1 %456, label %457, label %459, !dbg !2629

457:                                              ; preds = %453
  %458 = atomicrmw add i32* %439, i32 -1 seq_cst, align 4, !dbg !2630
  br label %459, !dbg !2632

459:                                              ; preds = %457, %453
  %460 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 0, !dbg !2633
  %461 = load i64, i64* %460, align 8, !dbg !2633, !tbaa !2635
  %462 = icmp eq i64 %461, 0, !dbg !2636
  %463 = icmp ult i64 %454, %461
  %464 = select i1 %462, i1 true, i1 %463, !dbg !2637
  br i1 %464, label %465, label %466, !dbg !2637

465:                                              ; preds = %459
  store i64 %454, i64* %460, align 8, !dbg !2638, !tbaa !2635
  br label %466, !dbg !2639

466:                                              ; preds = %465, %459
  %467 = phi i64 [ %461, %459 ], [ %454, %465 ]
  %468 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 1, !dbg !2640
  %469 = load i64, i64* %468, align 8, !dbg !2640, !tbaa !1648
  call void @llvm.dbg.value(metadata i64 %469, metadata !2641, metadata !DIExpression()) #9, !dbg !2647
  call void @llvm.dbg.value(metadata i64 %454, metadata !2646, metadata !DIExpression()) #9, !dbg !2647
  %470 = icmp eq i64 %469, 0, !dbg !2649
  %471 = lshr i64 %469, 3, !dbg !2651
  %472 = lshr i64 %454, 3, !dbg !2651
  %473 = add i64 %469, %472, !dbg !2651
  %474 = sub i64 %473, %471, !dbg !2651
  %475 = select i1 %470, i64 %454, i64 %474, !dbg !2651
  store i64 %475, i64* %468, align 8, !dbg !2652, !tbaa !1648
  call void @llvm.dbg.value(metadata i8* %0, metadata !2653, metadata !DIExpression()) #9, !dbg !2679
  call void @llvm.dbg.value(metadata i64 %454, metadata !2658, metadata !DIExpression()) #9, !dbg !2679
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2659, metadata !DIExpression()) #9, !dbg !2679
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2660, metadata !DIExpression()) #9, !dbg !2679
  %476 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !2681, !tbaa !1876, !range !1035
  %477 = icmp eq i8 %476, 0, !dbg !2681
  br i1 %477, label %507, label %478, !dbg !2683

478:                                              ; preds = %466
  %479 = bitcast %struct.rtt_event* %5 to i8*, !dbg !2684
  call void @llvm.lifetime.start.p0i8(i64 120, i8* nonnull %479) #9, !dbg !2684
  call void @llvm.dbg.declare(metadata %struct.rtt_event* %5, metadata !2661, metadata !DIExpression()) #9, !dbg !2685
  %480 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 0, !dbg !2686
  store i64 2, i64* %480, align 8, !dbg !2686, !tbaa !2687
  %481 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 1, !dbg !2686
  %482 = load i64, i64* %449, align 8, !dbg !2689, !tbaa !777
  store i64 %482, i64* %481, align 8, !dbg !2686, !tbaa !2690
  %483 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 2, !dbg !2686
  %484 = bitcast %struct.network_tuple* %483 to i8*, !dbg !2691
  %485 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2691
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %484, i8* noundef nonnull align 8 dereferenceable(44) %485, i64 44, i1 false) #9, !dbg !2691, !tbaa.struct !1609
  %486 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 3, !dbg !2686
  store i32 0, i32* %486, align 4, !dbg !2686, !tbaa !2692
  %487 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 4, !dbg !2686
  store i64 %454, i64* %487, align 8, !dbg !2686, !tbaa !2693
  %488 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 5, !dbg !2686
  store i64 %467, i64* %488, align 8, !dbg !2686, !tbaa !2694
  %489 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 6, !dbg !2686
  %490 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 3, !dbg !2695
  %491 = load i64, i64* %490, align 8, !dbg !2695, !tbaa !2337
  store i64 %491, i64* %489, align 8, !dbg !2686, !tbaa !2696
  %492 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 7, !dbg !2686
  %493 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 4, !dbg !2697
  %494 = load i64, i64* %493, align 8, !dbg !2697, !tbaa !2342
  store i64 %494, i64* %492, align 8, !dbg !2686, !tbaa !2698
  %495 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 8, !dbg !2686
  %496 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 5, !dbg !2699
  %497 = load i64, i64* %496, align 8, !dbg !2699, !tbaa !2595
  store i64 %497, i64* %495, align 8, !dbg !2686, !tbaa !2700
  %498 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 9, !dbg !2686
  %499 = getelementptr inbounds %struct.flow_state, %struct.flow_state* %391, i64 0, i32 6, !dbg !2701
  %500 = load i64, i64* %499, align 8, !dbg !2701, !tbaa !2600
  store i64 %500, i64* %498, align 8, !dbg !2686, !tbaa !2702
  %501 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 10, !dbg !2686
  %502 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 8, !dbg !2703
  %503 = load i8, i8* %502, align 2, !dbg !2703, !tbaa !1482, !range !1035
  %504 = xor i8 %503, 1, !dbg !2686
  store i8 %504, i8* %501, align 8, !dbg !2686, !tbaa !2704
  %505 = getelementptr inbounds %struct.rtt_event, %struct.rtt_event* %5, i64 0, i32 11, i64 0, !dbg !2705
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(7) %505, i8 0, i64 7, i1 false) #9, !dbg !2705
  %506 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %479, i64 noundef 120) #9, !dbg !2706
  call void @llvm.lifetime.end.p0i8(i64 120, i8* nonnull %479) #9, !dbg !2707
  br label %507

507:                                              ; preds = %478, %466
  call void @llvm.dbg.value(metadata i64 %454, metadata !2708, metadata !DIExpression()) #9, !dbg !2715
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %433, metadata !2713, metadata !DIExpression()) #9, !dbg !2715
  %508 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !2717, !tbaa !1398, !range !1035
  %509 = icmp ne i8 %508, 0, !dbg !2717
  %510 = icmp ne %struct.aggregated_stats* %433, null
  %511 = and i1 %510, %509, !dbg !2719
  br i1 %511, label %512, label %532, !dbg !2719

512:                                              ; preds = %507
  %513 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %433, i64 0, i32 3, !dbg !2720
  %514 = load i64, i64* %513, align 8, !dbg !2720, !tbaa !2722
  %515 = add i64 %514, -1, !dbg !2723
  %516 = icmp ult i64 %515, %454, !dbg !2723
  br i1 %516, label %518, label %517, !dbg !2723

517:                                              ; preds = %512
  store i64 %454, i64* %513, align 8, !dbg !2724, !tbaa !2722
  br label %518, !dbg !2725

518:                                              ; preds = %517, %512
  %519 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %433, i64 0, i32 4, !dbg !2726
  %520 = load i64, i64* %519, align 8, !dbg !2726, !tbaa !2728
  %521 = icmp ult i64 %520, %454, !dbg !2729
  br i1 %521, label %522, label %523, !dbg !2730

522:                                              ; preds = %518
  store i64 %454, i64* %519, align 8, !dbg !2731, !tbaa !2728
  br label %523, !dbg !2732

523:                                              ; preds = %522, %518
  %524 = udiv i64 %454, 4000000, !dbg !2733
  call void @llvm.dbg.value(metadata i64 %524, metadata !2714, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2715
  %525 = shl i64 %524, 32, !dbg !2734
  %526 = ashr exact i64 %525, 32, !dbg !2734
  %527 = icmp ult i64 %526, 249, !dbg !2734
  %528 = select i1 %527, i64 %526, i64 249, !dbg !2734
  call void @llvm.dbg.value(metadata i64 %528, metadata !2714, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2715
  %529 = getelementptr inbounds %struct.aggregated_stats, %struct.aggregated_stats* %433, i64 0, i32 5, i64 %528, !dbg !2735
  %530 = load i32, i32* %529, align 4, !dbg !2736, !tbaa !1014
  %531 = add i32 %530, 1, !dbg !2736
  store i32 %531, i32* %529, align 4, !dbg !2736, !tbaa !1014
  br label %532

532:                                              ; preds = %429, %429, %434, %438, %442, %447, %507, %523
  call void @llvm.dbg.value(metadata i8* %0, metadata !2737, metadata !DIExpression()) #9, !dbg !2745
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2742, metadata !DIExpression()) #9, !dbg !2745
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !2743, metadata !DIExpression()) #9, !dbg !2745
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !2744, metadata !DIExpression()) #9, !dbg !2745
  %533 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 12, !dbg !2747
  %534 = load i8, i8* %533, align 2, !dbg !2747, !tbaa !1340
  %535 = and i8 %534, -2, !dbg !2749
  %536 = icmp eq i8 %535, 2, !dbg !2749
  br i1 %536, label %537, label %586, !dbg !2749

537:                                              ; preds = %532
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !1836, metadata !DIExpression()) #9, !dbg !2750
  %538 = load i8, i8* %203, align 8, !dbg !2754, !tbaa !1793
  %539 = icmp eq i8 %538, 2, !dbg !2755
  br i1 %539, label %540, label %560, !dbg !2756

540:                                              ; preds = %537
  call void @llvm.dbg.value(metadata i8* %0, metadata !2757, metadata !DIExpression()) #9, !dbg !2765
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2762, metadata !DIExpression()) #9, !dbg !2765
  call void @llvm.dbg.value(metadata i1 false, metadata !2763, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2765
  %541 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !2767, !tbaa !1876, !range !1035
  %542 = icmp eq i8 %541, 0, !dbg !2767
  br i1 %542, label %560, label %543, !dbg !2769

543:                                              ; preds = %540
  %544 = bitcast %struct.flow_event* %4 to i8*, !dbg !2770
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %544) #9, !dbg !2770
  call void @llvm.dbg.declare(metadata %struct.flow_event* %4, metadata !2764, metadata !DIExpression()) #9, !dbg !2771
  %545 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 0, !dbg !2772
  store i64 1, i64* %545, align 8, !dbg !2772, !tbaa !1881
  %546 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 1, !dbg !2772
  %547 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2773
  %548 = load i64, i64* %547, align 8, !dbg !2773, !tbaa !777
  store i64 %548, i64* %546, align 8, !dbg !2772, !tbaa !1883
  %549 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 2, !dbg !2772
  %550 = bitcast %struct.network_tuple* %549 to i8*, !dbg !2772
  %551 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 3, !dbg !2772
  store i8 %534, i8* %551, align 4, !dbg !2772, !tbaa !1884
  %552 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 4, !dbg !2772
  %553 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !2774
  %554 = load i8, i8* %553, align 1, !dbg !2774, !tbaa !1343
  store i8 %554, i8* %552, align 1, !dbg !2772, !tbaa !1885
  %555 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 5, !dbg !2772
  %556 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %4, i64 0, i32 6, !dbg !2772
  store i8 0, i8* %556, align 1, !dbg !2772, !tbaa !1887
  %557 = bitcast %struct.network_tuple* %106 to i8*, !dbg !2775
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %550, i8* noundef nonnull align 8 dereferenceable(44) %557, i64 44, i1 false) #9, !dbg !2775
  store i8 1, i8* %555, align 2, !dbg !2775, !tbaa !1886
  %558 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %544, i64 noundef 64) #9, !dbg !2777
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %544) #9, !dbg !2778
  %559 = load i8, i8* %533, align 2, !dbg !2779, !tbaa !1340
  br label %560

560:                                              ; preds = %543, %540, %537
  %561 = phi i8 [ %534, %537 ], [ %534, %540 ], [ %559, %543 ], !dbg !2779
  store i8 3, i8* %203, align 8, !dbg !2781, !tbaa !1793
  %562 = icmp eq i8 %561, 3, !dbg !2782
  br i1 %562, label %563, label %588, !dbg !2783

563:                                              ; preds = %560
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !1836, metadata !DIExpression()) #9, !dbg !2784
  %564 = load i8, i8* %392, align 8, !dbg !2788, !tbaa !1793
  %565 = icmp eq i8 %564, 2, !dbg !2789
  br i1 %565, label %566, label %585, !dbg !2790

566:                                              ; preds = %563
  call void @llvm.dbg.value(metadata i8* %0, metadata !2757, metadata !DIExpression()) #9, !dbg !2791
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2762, metadata !DIExpression()) #9, !dbg !2791
  call void @llvm.dbg.value(metadata i1 true, metadata !2763, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #9, !dbg !2791
  %567 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 9), align 1, !dbg !2793, !tbaa !1876, !range !1035
  %568 = icmp eq i8 %567, 0, !dbg !2793
  br i1 %568, label %585, label %569, !dbg !2794

569:                                              ; preds = %566
  %570 = bitcast %struct.flow_event* %3 to i8*, !dbg !2795
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %570) #9, !dbg !2795
  call void @llvm.dbg.declare(metadata %struct.flow_event* %3, metadata !2764, metadata !DIExpression()) #9, !dbg !2796
  %571 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 0, !dbg !2797
  store i64 1, i64* %571, align 8, !dbg !2797, !tbaa !1881
  %572 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 1, !dbg !2797
  %573 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 0, !dbg !2798
  %574 = load i64, i64* %573, align 8, !dbg !2798, !tbaa !777
  store i64 %574, i64* %572, align 8, !dbg !2797, !tbaa !1883
  %575 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 2, !dbg !2797
  %576 = bitcast %struct.network_tuple* %575 to i8*, !dbg !2797
  %577 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 3, !dbg !2797
  store i8 3, i8* %577, align 4, !dbg !2797, !tbaa !1884
  %578 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 4, !dbg !2797
  %579 = getelementptr inbounds %struct.packet_info, %struct.packet_info* %1, i64 0, i32 13, !dbg !2799
  %580 = load i8, i8* %579, align 1, !dbg !2799, !tbaa !1343
  store i8 %580, i8* %578, align 1, !dbg !2797, !tbaa !1885
  %581 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 5, !dbg !2797
  %582 = getelementptr inbounds %struct.flow_event, %struct.flow_event* %3, i64 0, i32 6, !dbg !2797
  store i8 0, i8* %582, align 1, !dbg !2797, !tbaa !1887
  %583 = bitcast %struct.network_tuple* %105 to i8*, !dbg !2800
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(44) %576, i8* noundef nonnull align 8 dereferenceable(44) %583, i64 44, i1 false) #9, !dbg !2800
  store i8 0, i8* %581, align 2, !dbg !2800, !tbaa !1886
  %584 = call i64 inttoptr (i64 25 to i64 (i8*, i8*, i64, i8*, i64)*)(i8* noundef %0, i8* noundef bitcast (%struct.anon.5* @events to i8*), i64 noundef 4294967295, i8* noundef nonnull %570, i64 noundef 64) #9, !dbg !2801
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %570) #9, !dbg !2802
  br label %585

585:                                              ; preds = %569, %566, %563
  store i8 3, i8* %392, align 8, !dbg !2803, !tbaa !1793
  br label %586, !dbg !2804

586:                                              ; preds = %585, %532
  %587 = load i8, i8* %203, align 8, !dbg !2805, !tbaa !1793
  call void @llvm.dbg.value(metadata %struct.flow_state* %202, metadata !1784, metadata !DIExpression()) #9, !dbg !2808
  switch i8 %587, label %596 [
    i8 3, label %588
    i8 0, label %588
  ], !dbg !2809

588:                                              ; preds = %560, %586, %586
  call void @llvm.dbg.value(metadata %struct.flow_state* %391, metadata !1784, metadata !DIExpression()) #9, !dbg !2810
  %589 = load i8, i8* %392, align 8, !dbg !2812, !tbaa !1793
  switch i8 %589, label %596 [
    i8 3, label %590
    i8 0, label %590
  ], !dbg !2813

590:                                              ; preds = %588, %588
  call void @llvm.dbg.value(metadata %struct.packet_info* %1, metadata !2121, metadata !DIExpression()) #9, !dbg !2814
  %591 = load i8, i8* %102, align 1, !dbg !2818, !tbaa !1365, !range !1035
  %592 = icmp eq i8 %591, 0, !dbg !2818
  %593 = select i1 %592, %struct.network_tuple* %106, %struct.network_tuple* %105, !dbg !2819
  %594 = bitcast %struct.network_tuple* %593 to i8*, !dbg !2820
  %595 = call i64 inttoptr (i64 3 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.6* @flow_state to i8*), i8* noundef nonnull %594) #9, !dbg !2821
  br label %596, !dbg !2822

596:                                              ; preds = %113, %117, %590, %588, %586, %194, %95
  ret void, !dbg !2823
}

; Function Attrs: nounwind
define internal fastcc %struct.aggregated_stats* @lookup_or_create_aggregation_stats(%struct.in6_addr* nocapture noundef readonly %0, i8 noundef zeroext %1, i1 noundef zeroext %2) unnamed_addr #3 !dbg !2824 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.ipprefix_key, align 8
  %6 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.in6_addr* %0, metadata !2828, metadata !DIExpression()), !dbg !2844
  call void @llvm.dbg.value(metadata i8 %1, metadata !2829, metadata !DIExpression()), !dbg !2844
  call void @llvm.dbg.value(metadata i1 %2, metadata !2830, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2844
  %7 = bitcast %struct.ipprefix_key* %5 to i8*, !dbg !2845
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #9, !dbg !2845
  call void @llvm.dbg.declare(metadata %struct.ipprefix_key* %5, metadata !2832, metadata !DIExpression()), !dbg !2846
  %8 = bitcast i32* %6 to i8*, !dbg !2847
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #9, !dbg !2847
  call void @llvm.dbg.value(metadata i32 0, metadata !2841, metadata !DIExpression()), !dbg !2844
  store i32 0, i32* %6, align 4, !dbg !2848, !tbaa !1014
  call void @llvm.dbg.value(metadata i32 0, metadata !2843, metadata !DIExpression()), !dbg !2844
  call void @llvm.dbg.value(metadata i32* %6, metadata !2841, metadata !DIExpression(DW_OP_deref)), !dbg !2844
  %9 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.12* @map_active_agg_instance to i8*), i8* noundef nonnull %8) #9, !dbg !2849
  %10 = bitcast i8* %9 to i32*, !dbg !2849
  call void @llvm.dbg.value(metadata i32* %10, metadata !2840, metadata !DIExpression()), !dbg !2844
  %11 = icmp eq i8* %9, null, !dbg !2850
  br i1 %11, label %63, label %12, !dbg !2852

12:                                               ; preds = %3
  %13 = icmp eq i8 %1, 2, !dbg !2853
  br i1 %13, label %14, label %23, !dbg !2855

14:                                               ; preds = %12
  %15 = bitcast %struct.ipprefix_key* %5 to i32*, !dbg !2856
  call void @llvm.dbg.value(metadata i32* %15, metadata !2858, metadata !DIExpression()), !dbg !2864
  call void @llvm.dbg.value(metadata %struct.in6_addr* %0, metadata !2863, metadata !DIExpression()), !dbg !2864
  %16 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %0, i64 0, i32 0, i32 0, i64 3, !dbg !2866
  %17 = load i32, i32* %16, align 4, !dbg !2866, !tbaa !957
  %18 = load volatile i32, i32* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 3), align 8, !dbg !2867, !tbaa !2868
  %19 = and i32 %18, %17, !dbg !2869
  store i32 %19, i32* %15, align 8, !dbg !2870, !tbaa !1014
  %20 = load i32, i32* %10, align 4, !dbg !2871, !tbaa !1014
  %21 = icmp eq i32 %20, 0, !dbg !2872
  %22 = select i1 %21, i8* bitcast (%struct.anon.8* @map_v4_agg1 to i8*), i8* bitcast (%struct.anon.9* @map_v4_agg2 to i8*), !dbg !2871
  call void @llvm.dbg.value(metadata i8* %22, metadata !2842, metadata !DIExpression()), !dbg !2844
  br label %32, !dbg !2873

23:                                               ; preds = %12
  %24 = getelementptr inbounds %struct.ipprefix_key, %struct.ipprefix_key* %5, i64 0, i32 0, i32 0, !dbg !2874
  call void @llvm.dbg.value(metadata i64* %24, metadata !2876, metadata !DIExpression()), !dbg !2882
  call void @llvm.dbg.value(metadata %struct.in6_addr* %0, metadata !2881, metadata !DIExpression()), !dbg !2882
  %25 = bitcast %struct.in6_addr* %0 to i64*, !dbg !2884
  %26 = load i64, i64* %25, align 4, !dbg !2884, !tbaa !1415
  %27 = load volatile i64, i64* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 2), align 8, !dbg !2885, !tbaa !2886
  %28 = and i64 %27, %26, !dbg !2887
  store i64 %28, i64* %24, align 8, !dbg !2888, !tbaa !1415
  %29 = load i32, i32* %10, align 4, !dbg !2889, !tbaa !1014
  %30 = icmp eq i32 %29, 0, !dbg !2890
  %31 = select i1 %30, i8* bitcast (%struct.anon.10* @map_v6_agg1 to i8*), i8* bitcast (%struct.anon.11* @map_v6_agg2 to i8*), !dbg !2889
  call void @llvm.dbg.value(metadata i8* %31, metadata !2842, metadata !DIExpression()), !dbg !2844
  br label %32

32:                                               ; preds = %23, %14
  %33 = phi i8* [ %22, %14 ], [ %31, %23 ], !dbg !2891
  call void @llvm.dbg.value(metadata i8* %33, metadata !2842, metadata !DIExpression()), !dbg !2844
  %34 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef %33, i8* noundef nonnull %7) #9, !dbg !2892
  call void @llvm.dbg.value(metadata i8* %34, metadata !2831, metadata !DIExpression()), !dbg !2844
  %35 = icmp eq i8* %34, null, !dbg !2893
  br i1 %35, label %38, label %36, !dbg !2895

36:                                               ; preds = %32
  %37 = bitcast i8* %34 to %struct.aggregated_stats*, !dbg !2892
  call void @llvm.dbg.value(metadata %struct.aggregated_stats* %37, metadata !2831, metadata !DIExpression()), !dbg !2844
  br label %63, !dbg !2896

38:                                               ; preds = %32
  br i1 %2, label %39, label %55, !dbg !2897

39:                                               ; preds = %38
  %40 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef %33, i8* noundef nonnull %7, i8* noundef bitcast (%struct.aggregated_stats* @empty_stats to i8*), i64 noundef 1) #9, !dbg !2898
  %41 = trunc i64 %40 to i32, !dbg !2898
  call void @llvm.dbg.value(metadata i32 undef, metadata !2843, metadata !DIExpression()), !dbg !2844
  switch i32 %41, label %42 [
    i32 -17, label %60
    i32 0, label %60
  ], !dbg !2900

42:                                               ; preds = %39
  call void @llvm.dbg.value(metadata i32 2, metadata !2207, metadata !DIExpression()) #9, !dbg !2902
  %43 = load volatile i8, i8* getelementptr inbounds (%struct.bpf_config, %struct.bpf_config* @config, i64 0, i32 10), align 2, !dbg !2906, !tbaa !1398, !range !1035
  %44 = icmp eq i8 %43, 0, !dbg !2906
  br i1 %44, label %55, label %45, !dbg !2907

45:                                               ; preds = %42
  %46 = bitcast i32* %4 to i8*, !dbg !2908
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %46) #9, !dbg !2908
  call void @llvm.dbg.value(metadata i32 0, metadata !2213, metadata !DIExpression()) #9, !dbg !2902
  store i32 0, i32* %4, align 4, !dbg !2909, !tbaa !1014
  call void @llvm.dbg.value(metadata i32* %4, metadata !2213, metadata !DIExpression(DW_OP_deref)) #9, !dbg !2902
  %47 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.13* @map_global_counters to i8*), i8* noundef nonnull %46) #9, !dbg !2910
  call void @llvm.dbg.value(metadata i8* %47, metadata !2212, metadata !DIExpression()) #9, !dbg !2902
  %48 = icmp eq i8* %47, null, !dbg !2911
  br i1 %48, label %54, label %49, !dbg !2912

49:                                               ; preds = %45
  %50 = getelementptr inbounds i8, i8* %47, i64 48, !dbg !2913
  %51 = bitcast i8* %50 to i64*, !dbg !2913
  %52 = load i64, i64* %51, align 8, !dbg !2913, !tbaa !1415
  %53 = add i64 %52, 1, !dbg !2913
  store i64 %53, i64* %51, align 8, !dbg !2913, !tbaa !1415
  br label %54, !dbg !2914

54:                                               ; preds = %49, %45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %46) #9, !dbg !2914
  br label %55

55:                                               ; preds = %54, %42, %38
  br i1 %13, label %56, label %58, !dbg !2915

56:                                               ; preds = %55
  %57 = bitcast %struct.ipprefix_key* %5 to i32*, !dbg !2916
  store i32 -16645952, i32* %57, align 8, !dbg !2918, !tbaa !957
  br label %60, !dbg !2919

58:                                               ; preds = %55
  %59 = getelementptr inbounds %struct.ipprefix_key, %struct.ipprefix_key* %5, i64 0, i32 0, i32 0, !dbg !2920
  store i64 -2133130976, i64* %59, align 8, !dbg !2921, !tbaa !957
  br label %60

60:                                               ; preds = %39, %39, %56, %58
  %61 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef %33, i8* noundef nonnull %7) #9, !dbg !2922
  %62 = bitcast i8* %61 to %struct.aggregated_stats*, !dbg !2922
  br label %63, !dbg !2923

63:                                               ; preds = %3, %60, %36
  %64 = phi %struct.aggregated_stats* [ %37, %36 ], [ %62, %60 ], [ null, %3 ], !dbg !2844
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #9, !dbg !2924
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #9, !dbg !2924
  ret %struct.aggregated_stats* %64, !dbg !2924
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #7

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #8

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.usub.sat.i32(i32, i32) #7

attributes #0 = { noinline nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { mustprogress nofree norecurse nosync nounwind readonly willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!453, !454, !455, !456}
!llvm.ident = !{!457}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 126, type: !452, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !105, globals: !156, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "pping_kern.c", directory: "/home/nir_ophir/code/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "e387d230fdf3425b196f39cf19616570")
!4 = !{!5, !13, !22, !31, !37, !41, !72, !78, !83, !89, !100}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_type", file: !6, line: 51, baseType: !7, size: 8, elements: !8)
!6 = !DIFile(filename: "./pping.h", directory: "/home/nir_ophir/code/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "9c184710a9c2c6ccbf5311bfdd415bc8")
!7 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "FLOW_EVENT_NONE", value: 0)
!10 = !DIEnumerator(name: "FLOW_EVENT_OPENING", value: 1)
!11 = !DIEnumerator(name: "FLOW_EVENT_CLOSING", value: 2)
!12 = !DIEnumerator(name: "FLOW_EVENT_CLOSING_BOTH", value: 3)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_reason", file: !6, line: 58, baseType: !7, size: 8, elements: !14)
!14 = !{!15, !16, !17, !18, !19, !20, !21}
!15 = !DIEnumerator(name: "EVENT_REASON_NONE", value: 0)
!16 = !DIEnumerator(name: "EVENT_REASON_SYN", value: 1)
!17 = !DIEnumerator(name: "EVENT_REASON_SYN_ACK", value: 2)
!18 = !DIEnumerator(name: "EVENT_REASON_FIRST_OBS_PCKT", value: 3)
!19 = !DIEnumerator(name: "EVENT_REASON_FIN", value: 4)
!20 = !DIEnumerator(name: "EVENT_REASON_RST", value: 5)
!21 = !DIEnumerator(name: "EVENT_REASON_FLOW_TIMEOUT", value: 6)
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !23, line: 4363, baseType: !24, size: 32, elements: !25)
!23 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!27 = !DIEnumerator(name: "XDP_DROP", value: 1)
!28 = !DIEnumerator(name: "XDP_PASS", value: 2)
!29 = !DIEnumerator(name: "XDP_TX", value: 3)
!30 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!31 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "connection_state", file: !6, line: 79, baseType: !7, size: 8, elements: !32)
!32 = !{!33, !34, !35, !36}
!33 = !DIEnumerator(name: "CONNECTION_STATE_EMPTY", value: 0)
!34 = !DIEnumerator(name: "CONNECTION_STATE_WAITOPEN", value: 1)
!35 = !DIEnumerator(name: "CONNECTION_STATE_OPEN", value: 2)
!36 = !DIEnumerator(name: "CONNECTION_STATE_CLOSED", value: 3)
!37 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "pping_map", file: !6, line: 74, baseType: !7, size: 8, elements: !38)
!38 = !{!39, !40}
!39 = !DIEnumerator(name: "PPING_MAP_FLOWSTATE", value: 0)
!40 = !DIEnumerator(name: "PPING_MAP_PACKETTS", value: 1)
!41 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !42, line: 28, baseType: !24, size: 32, elements: !43)
!42 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!43 = !{!44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71}
!44 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!45 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!46 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!47 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!48 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!49 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!50 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!51 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!52 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!53 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!54 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!55 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!56 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!57 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!58 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!59 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!60 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!61 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!62 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!63 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!64 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!65 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!66 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!67 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!68 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!69 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!70 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!71 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!72 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 397, baseType: !24, size: 32, elements: !73)
!73 = !{!74, !75, !76, !77}
!74 = !DIEnumerator(name: "BPF_ANY", value: 0)
!75 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!76 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!77 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!78 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "pping_error", file: !6, line: 86, baseType: !24, size: 32, elements: !79)
!79 = !{!80, !81, !82}
!80 = !DIEnumerator(name: "PPING_ERR_PKTTS_STORE", value: 0)
!81 = !DIEnumerator(name: "PPING_ERR_FLOW_CREATE", value: 1)
!82 = !DIEnumerator(name: "PPING_ERR_AGGSUBNET_CREATE", value: 2)
!83 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 4063, baseType: !84, size: 64, elements: !85)
!84 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!85 = !{!86, !87, !88}
!86 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!87 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!88 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!89 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 4955, baseType: !24, size: 32, elements: !90)
!90 = !{!91, !92, !93, !94, !95, !96, !97, !98, !99}
!91 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0)
!92 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1)
!93 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2)
!94 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3)
!95 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4)
!96 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5)
!97 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6)
!98 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7)
!99 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8)
!100 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_source", file: !6, line: 68, baseType: !7, size: 8, elements: !101)
!101 = !{!102, !103, !104}
!102 = !DIEnumerator(name: "EVENT_SOURCE_PKT_SRC", value: 0)
!103 = !DIEnumerator(name: "EVENT_SOURCE_PKT_DEST", value: 1)
!104 = !DIEnumerator(name: "EVENT_SOURCE_GC", value: 2)
!105 = !{!106, !107, !108, !131, !147, !137, !138, !148, !150, !151, !152, !155}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!107 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network_tuple", file: !6, line: 132, size: 352, elements: !110)
!110 = !{!111, !143, !144, !145, !146}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !109, file: !6, line: 133, baseType: !112, size: 160)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_address", file: !6, line: 119, size: 160, elements: !113)
!113 = !{!114, !141, !142}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !112, file: !6, line: 120, baseType: !115, size: 128)
!115 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !116, line: 33, size: 128, elements: !117)
!116 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!117 = !{!118}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !115, file: !116, line: 40, baseType: !119, size: 128)
!119 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !115, file: !116, line: 34, size: 128, elements: !120)
!120 = !{!121, !127, !135}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !119, file: !116, line: 35, baseType: !122, size: 128)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 128, elements: !125)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !124, line: 21, baseType: !7)
!124 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!125 = !{!126}
!126 = !DISubrange(count: 16)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !119, file: !116, line: 37, baseType: !128, size: 128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !129, size: 128, elements: !133)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !130, line: 25, baseType: !131)
!130 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !124, line: 24, baseType: !132)
!132 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!133 = !{!134}
!134 = !DISubrange(count: 8)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !119, file: !116, line: 38, baseType: !136, size: 128)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !137, size: 128, elements: !139)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !130, line: 27, baseType: !138)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !124, line: 27, baseType: !24)
!139 = !{!140}
!140 = !DISubrange(count: 4)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !112, file: !6, line: 121, baseType: !131, size: 16, offset: 128)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !112, file: !6, line: 122, baseType: !131, size: 16, offset: 144)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !109, file: !6, line: 134, baseType: !112, size: 160, offset: 160)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !109, file: !6, line: 135, baseType: !131, size: 16, offset: 320)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "ipv", scope: !109, file: !6, line: 136, baseType: !123, size: 8, offset: 336)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !109, file: !6, line: 137, baseType: !123, size: 8, offset: 344)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!149 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !124, line: 31, baseType: !154)
!154 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!156 = !{!0, !157, !179, !211, !220, !254, !262, !270, !278, !290, !332, !363, !382, !390, !392, !396, !401, !437, !442, !447}
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(name: "packet_ts", scope: !2, file: !3, line: 143, type: !159, isLocal: false, isDefinition: true)
!159 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 138, size: 256, elements: !160)
!160 = !{!161, !167, !173, !174}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !159, file: !3, line: 139, baseType: !162, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 32, elements: !165)
!164 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!165 = !{!166}
!166 = !DISubrange(count: 1)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !159, file: !3, line: 140, baseType: !168, size: 64, offset: 64)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_id", file: !6, line: 167, size: 384, elements: !170)
!170 = !{!171, !172}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !169, file: !6, line: 168, baseType: !109, size: 352)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !169, file: !6, line: 169, baseType: !138, size: 32, offset: 352)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !159, file: !3, line: 141, baseType: !152, size: 64, offset: 128)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !159, file: !3, line: 142, baseType: !175, size: 64, offset: 192)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 4194304, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 131072)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "flow_state", scope: !2, file: !3, line: 150, type: !181, isLocal: false, isDefinition: true)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 145, size: 256, elements: !182)
!182 = !{!183, !184, !185, !210}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !181, file: !3, line: 146, baseType: !162, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !181, file: !3, line: 147, baseType: !108, size: 64, offset: 64)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !181, file: !3, line: 148, baseType: !186, size: 64, offset: 128)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dual_flow_state", file: !6, line: 162, size: 1152, elements: !188)
!188 = !{!189, !209}
!189 = !DIDerivedType(tag: DW_TAG_member, name: "dir1", scope: !187, file: !6, line: 163, baseType: !190, size: 576)
!190 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !6, line: 140, size: 576, elements: !191)
!191 = !{!192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !205}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !190, file: !6, line: 141, baseType: !153, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !190, file: !6, line: 142, baseType: !153, size: 64, offset: 64)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !190, file: !6, line: 143, baseType: !153, size: 64, offset: 128)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !190, file: !6, line: 144, baseType: !153, size: 64, offset: 192)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !190, file: !6, line: 145, baseType: !153, size: 64, offset: 256)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !190, file: !6, line: 146, baseType: !153, size: 64, offset: 320)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !190, file: !6, line: 147, baseType: !153, size: 64, offset: 384)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !190, file: !6, line: 148, baseType: !138, size: 32, offset: 448)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "outstanding_timestamps", scope: !190, file: !6, line: 149, baseType: !138, size: 32, offset: 480)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "conn_state", scope: !190, file: !6, line: 150, baseType: !31, size: 8, offset: 512)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !190, file: !6, line: 151, baseType: !13, size: 8, offset: 520)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "has_been_timestamped", scope: !190, file: !6, line: 152, baseType: !204, size: 8, offset: 528)
!204 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !190, file: !6, line: 153, baseType: !206, size: 40, offset: 536)
!206 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 40, elements: !207)
!207 = !{!208}
!208 = !DISubrange(count: 5)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "dir2", scope: !187, file: !6, line: 164, baseType: !190, size: 576, offset: 576)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !181, file: !3, line: 149, baseType: !175, size: 64, offset: 192)
!211 = !DIGlobalVariableExpression(var: !212, expr: !DIExpression())
!212 = distinct !DIGlobalVariable(name: "events", scope: !2, file: !3, line: 156, type: !213, isLocal: false, isDefinition: true)
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 152, size: 192, elements: !214)
!214 = !{!215, !218, !219}
!215 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !213, file: !3, line: 153, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 128, elements: !139)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !213, file: !3, line: 154, baseType: !216, size: 64, offset: 64)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !213, file: !3, line: 155, baseType: !216, size: 64, offset: 128)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(name: "map_v4_agg1", scope: !2, file: !3, line: 163, type: !222, isLocal: false, isDefinition: true)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 158, size: 256, elements: !223)
!223 = !{!224, !227, !228, !249}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !222, file: !3, line: 159, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 160, elements: !207)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !222, file: !3, line: 160, baseType: !151, size: 64, offset: 64)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !222, file: !3, line: 161, baseType: !229, size: 64, offset: 128)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "aggregated_stats", file: !6, line: 265, size: 8960, elements: !231)
!231 = !{!232, !233, !242, !243, !244, !245}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "last_updated", scope: !230, file: !6, line: 266, baseType: !153, size: 64)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "rx_stats", scope: !230, file: !6, line: 267, baseType: !234, size: 384, offset: 64)
!234 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "traffic_counters", file: !6, line: 256, size: 384, elements: !235)
!235 = !{!236, !237, !238, !239, !240, !241}
!236 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_ts_pkts", scope: !234, file: !6, line: 257, baseType: !153, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_ts_bytes", scope: !234, file: !6, line: 258, baseType: !153, size: 64, offset: 64)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_nots_pkts", scope: !234, file: !6, line: 259, baseType: !153, size: 64, offset: 128)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_nots_bytes", scope: !234, file: !6, line: 260, baseType: !153, size: 64, offset: 192)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "other_pkts", scope: !234, file: !6, line: 261, baseType: !153, size: 64, offset: 256)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "other_bytes", scope: !234, file: !6, line: 262, baseType: !153, size: 64, offset: 320)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "tx_stats", scope: !230, file: !6, line: 268, baseType: !234, size: 384, offset: 448)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_min", scope: !230, file: !6, line: 269, baseType: !153, size: 64, offset: 832)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_max", scope: !230, file: !6, line: 270, baseType: !153, size: 64, offset: 896)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_bins", scope: !230, file: !6, line: 271, baseType: !246, size: 8000, offset: 960)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 8000, elements: !247)
!247 = !{!248}
!248 = !DISubrange(count: 250)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !222, file: !3, line: 162, baseType: !250, size: 64, offset: 192)
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64)
!251 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 524288, elements: !252)
!252 = !{!253}
!253 = !DISubrange(count: 16384)
!254 = !DIGlobalVariableExpression(var: !255, expr: !DIExpression())
!255 = distinct !DIGlobalVariable(name: "map_v4_agg2", scope: !2, file: !3, line: 170, type: !256, isLocal: false, isDefinition: true)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 165, size: 256, elements: !257)
!257 = !{!258, !259, !260, !261}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !256, file: !3, line: 166, baseType: !225, size: 64)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !256, file: !3, line: 167, baseType: !151, size: 64, offset: 64)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !256, file: !3, line: 168, baseType: !229, size: 64, offset: 128)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !256, file: !3, line: 169, baseType: !250, size: 64, offset: 192)
!262 = !DIGlobalVariableExpression(var: !263, expr: !DIExpression())
!263 = distinct !DIGlobalVariable(name: "map_v6_agg1", scope: !2, file: !3, line: 177, type: !264, isLocal: false, isDefinition: true)
!264 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 172, size: 256, elements: !265)
!265 = !{!266, !267, !268, !269}
!266 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !264, file: !3, line: 173, baseType: !225, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !264, file: !3, line: 174, baseType: !152, size: 64, offset: 64)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !264, file: !3, line: 175, baseType: !229, size: 64, offset: 128)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !264, file: !3, line: 176, baseType: !250, size: 64, offset: 192)
!270 = !DIGlobalVariableExpression(var: !271, expr: !DIExpression())
!271 = distinct !DIGlobalVariable(name: "map_v6_agg2", scope: !2, file: !3, line: 184, type: !272, isLocal: false, isDefinition: true)
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 179, size: 256, elements: !273)
!273 = !{!274, !275, !276, !277}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !272, file: !3, line: 180, baseType: !225, size: 64)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !272, file: !3, line: 181, baseType: !152, size: 64, offset: 64)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !272, file: !3, line: 182, baseType: !229, size: 64, offset: 128)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !272, file: !3, line: 183, baseType: !250, size: 64, offset: 192)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(name: "map_active_agg_instance", scope: !2, file: !3, line: 191, type: !280, isLocal: false, isDefinition: true)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 186, size: 256, elements: !281)
!281 = !{!282, !287, !288, !289}
!282 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !280, file: !3, line: 187, baseType: !283, size: 64)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!284 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 64, elements: !285)
!285 = !{!286}
!286 = !DISubrange(count: 2)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !280, file: !3, line: 188, baseType: !151, size: 64, offset: 64)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !280, file: !3, line: 189, baseType: !151, size: 64, offset: 128)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !280, file: !3, line: 190, baseType: !162, size: 64, offset: 192)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(name: "map_global_counters", scope: !2, file: !3, line: 198, type: !292, isLocal: false, isDefinition: true)
!292 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 193, size: 256, elements: !293)
!293 = !{!294, !299, !300, !331}
!294 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !292, file: !3, line: 194, baseType: !295, size: 64)
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64)
!296 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 192, elements: !297)
!297 = !{!298}
!298 = !DISubrange(count: 6)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !292, file: !3, line: 195, baseType: !151, size: 64, offset: 64)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !292, file: !3, line: 196, baseType: !301, size: 64, offset: 128)
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "global_counters", file: !6, line: 287, size: 9280, elements: !303)
!303 = !{!304, !311, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "ecn", scope: !302, file: !6, line: 288, baseType: !305, size: 256)
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ecn_counters", file: !6, line: 274, size: 256, elements: !306)
!306 = !{!307, !308, !309, !310}
!307 = !DIDerivedType(tag: DW_TAG_member, name: "no_ect", scope: !305, file: !6, line: 275, baseType: !153, size: 64)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "ect1", scope: !305, file: !6, line: 276, baseType: !153, size: 64, offset: 64)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "ect0", scope: !305, file: !6, line: 277, baseType: !153, size: 64, offset: 128)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "ce", scope: !305, file: !6, line: 278, baseType: !153, size: 64, offset: 192)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "err", scope: !302, file: !6, line: 289, baseType: !312, size: 192, offset: 256)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pping_error_counters", file: !6, line: 281, size: 192, elements: !313)
!313 = !{!314, !315, !316}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "pktts_store", scope: !312, file: !6, line: 282, baseType: !153, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "flow_create", scope: !312, file: !6, line: 283, baseType: !153, size: 64, offset: 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "agg_subnet_create", scope: !312, file: !6, line: 284, baseType: !153, size: 64, offset: 128)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "nonip_pkts", scope: !302, file: !6, line: 290, baseType: !153, size: 64, offset: 448)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "nonip_bytes", scope: !302, file: !6, line: 291, baseType: !153, size: 64, offset: 512)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_pkts", scope: !302, file: !6, line: 292, baseType: !153, size: 64, offset: 576)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "tcp_bytes", scope: !302, file: !6, line: 293, baseType: !153, size: 64, offset: 640)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "udp_pkts", scope: !302, file: !6, line: 294, baseType: !153, size: 64, offset: 704)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "udp_bytes", scope: !302, file: !6, line: 295, baseType: !153, size: 64, offset: 768)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "icmp_pkts", scope: !302, file: !6, line: 296, baseType: !153, size: 64, offset: 832)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "icmp_bytes", scope: !302, file: !6, line: 297, baseType: !153, size: 64, offset: 896)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_pkts", scope: !302, file: !6, line: 298, baseType: !153, size: 64, offset: 960)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_bytes", scope: !302, file: !6, line: 299, baseType: !153, size: 64, offset: 1024)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "other_ipprotos", scope: !302, file: !6, line: 300, baseType: !328, size: 8192, offset: 1088)
!328 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 8192, elements: !329)
!329 = !{!330}
!330 = !DISubrange(count: 256)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !292, file: !3, line: 197, baseType: !162, size: 64, offset: 192)
!332 = !DIGlobalVariableExpression(var: !333, expr: !DIExpression())
!333 = distinct !DIGlobalVariable(name: "map_packet_info", scope: !2, file: !3, line: 205, type: !334, isLocal: false, isDefinition: true)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 200, size: 256, elements: !335)
!335 = !{!336, !337, !338, !362}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !334, file: !3, line: 201, baseType: !295, size: 64)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !334, file: !3, line: 202, baseType: !151, size: 64, offset: 64)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !334, file: !3, line: 203, baseType: !339, size: 64, offset: 128)
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64)
!340 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_info", file: !3, line: 91, size: 1088, elements: !341)
!341 = !{!342, !343, !344, !345, !346, !347, !348, !353, !354, !355, !356, !357, !358, !359, !360, !361}
!342 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !340, file: !3, line: 92, baseType: !153, size: 64)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_len", scope: !340, file: !3, line: 93, baseType: !138, size: 32, offset: 64)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !340, file: !3, line: 94, baseType: !138, size: 32, offset: 96)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !340, file: !3, line: 95, baseType: !169, size: 384, offset: 128)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !340, file: !3, line: 96, baseType: !169, size: 384, offset: 512)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !340, file: !3, line: 97, baseType: !138, size: 32, offset: 896)
!348 = !DIDerivedType(tag: DW_TAG_member, name: "ip_tos", scope: !340, file: !3, line: 101, baseType: !349, size: 32, offset: 928)
!349 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !340, file: !3, line: 98, size: 32, elements: !350)
!350 = !{!351, !352}
!351 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_tos", scope: !349, file: !3, line: 99, baseType: !123, size: 8)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_tos", scope: !349, file: !3, line: 100, baseType: !137, size: 32)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "ip_len", scope: !340, file: !3, line: 102, baseType: !131, size: 16, offset: 960)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "is_ingress", scope: !340, file: !3, line: 103, baseType: !204, size: 8, offset: 976)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "pid_flow_is_dfkey", scope: !340, file: !3, line: 104, baseType: !204, size: 8, offset: 984)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !340, file: !3, line: 105, baseType: !204, size: 8, offset: 992)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !340, file: !3, line: 106, baseType: !204, size: 8, offset: 1000)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !340, file: !3, line: 107, baseType: !5, size: 8, offset: 1008)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !340, file: !3, line: 108, baseType: !13, size: 8, offset: 1016)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "wait_first_edge", scope: !340, file: !3, line: 109, baseType: !204, size: 8, offset: 1024)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_trackable", scope: !340, file: !3, line: 110, baseType: !204, size: 8, offset: 1032)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !334, file: !3, line: 204, baseType: !162, size: 64, offset: 192)
!363 = !DIGlobalVariableExpression(var: !364, expr: !DIExpression())
!364 = distinct !DIGlobalVariable(name: "config", scope: !2, file: !3, line: 128, type: !365, isLocal: true, isDefinition: true)
!365 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !366)
!366 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !367)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !6, line: 92, size: 320, elements: !368)
!368 = !{!369, !370, !372, !373, !374, !375, !376, !377, !378, !379, !380, !381}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !367, file: !6, line: 93, baseType: !153, size: 64)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !367, file: !6, line: 94, baseType: !371, size: 64, offset: 64)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixpoint64", file: !6, line: 19, baseType: !153)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_prefix_mask", scope: !367, file: !6, line: 95, baseType: !153, size: 64, offset: 128)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_prefix_mask", scope: !367, file: !6, line: 96, baseType: !138, size: 32, offset: 192)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !367, file: !6, line: 97, baseType: !204, size: 8, offset: 224)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !367, file: !6, line: 98, baseType: !204, size: 8, offset: 232)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !367, file: !6, line: 99, baseType: !204, size: 8, offset: 240)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !367, file: !6, line: 100, baseType: !204, size: 8, offset: 248)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "skip_syn", scope: !367, file: !6, line: 101, baseType: !204, size: 8, offset: 256)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "push_individual_events", scope: !367, file: !6, line: 102, baseType: !204, size: 8, offset: 264)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "agg_rtts", scope: !367, file: !6, line: 103, baseType: !204, size: 8, offset: 272)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "agg_by_dst", scope: !367, file: !6, line: 104, baseType: !204, size: 8, offset: 280)
!382 = !DIGlobalVariableExpression(var: !383, expr: !DIExpression())
!383 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !384, line: 77, type: !385, isLocal: true, isDefinition: true)
!384 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !386, size: 64)
!386 = !DISubroutineType(types: !387)
!387 = !{!107, !106, !388, !388, !153}
!388 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!390 = !DIGlobalVariableExpression(var: !391, expr: !DIExpression())
!391 = distinct !DIGlobalVariable(name: "empty_stats", scope: !2, file: !3, line: 134, type: !230, isLocal: true, isDefinition: true)
!392 = !DIGlobalVariableExpression(var: !393, expr: !DIExpression())
!393 = distinct !DIGlobalVariable(name: "last_warn_time", scope: !2, file: !3, line: 129, type: !394, isLocal: true, isDefinition: true)
!394 = !DICompositeType(tag: DW_TAG_array_type, baseType: !395, size: 128, elements: !285)
!395 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !153)
!396 = !DIGlobalVariableExpression(var: !397, expr: !DIExpression())
!397 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !2, file: !384, line: 692, type: !398, isLocal: true, isDefinition: true)
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64)
!399 = !DISubroutineType(types: !400)
!400 = !{!107, !106, !106, !153, !106, !153}
!401 = !DIGlobalVariableExpression(var: !402, expr: !DIExpression())
!402 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !384, line: 1839, type: !403, isLocal: true, isDefinition: true)
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64)
!404 = !DISubroutineType(types: !405)
!405 = !{!107, !106, !406, !164, !138}
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64)
!407 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !23, line: 4967, size: 512, elements: !408)
!408 = !{!409, !410, !411, !412, !413, !414, !415, !421, !427, !432, !433, !434, !436}
!409 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !407, file: !23, line: 4971, baseType: !123, size: 8)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !407, file: !23, line: 4974, baseType: !123, size: 8, offset: 8)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !407, file: !23, line: 4975, baseType: !129, size: 16, offset: 16)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !407, file: !23, line: 4976, baseType: !129, size: 16, offset: 32)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !407, file: !23, line: 4979, baseType: !131, size: 16, offset: 48)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !407, file: !23, line: 4984, baseType: !138, size: 32, offset: 64)
!415 = !DIDerivedType(tag: DW_TAG_member, scope: !407, file: !23, line: 4986, baseType: !416, size: 32, offset: 96)
!416 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !407, file: !23, line: 4986, size: 32, elements: !417)
!417 = !{!418, !419, !420}
!418 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !416, file: !23, line: 4988, baseType: !123, size: 8)
!419 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !416, file: !23, line: 4989, baseType: !137, size: 32)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !416, file: !23, line: 4992, baseType: !138, size: 32)
!421 = !DIDerivedType(tag: DW_TAG_member, scope: !407, file: !23, line: 4995, baseType: !422, size: 128, offset: 128)
!422 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !407, file: !23, line: 4995, size: 128, elements: !423)
!423 = !{!424, !425}
!424 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !422, file: !23, line: 4996, baseType: !137, size: 32)
!425 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !422, file: !23, line: 4997, baseType: !426, size: 128)
!426 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 128, elements: !139)
!427 = !DIDerivedType(tag: DW_TAG_member, scope: !407, file: !23, line: 5004, baseType: !428, size: 128, offset: 256)
!428 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !407, file: !23, line: 5004, size: 128, elements: !429)
!429 = !{!430, !431}
!430 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !428, file: !23, line: 5005, baseType: !137, size: 32)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !428, file: !23, line: 5006, baseType: !426, size: 128)
!432 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !407, file: !23, line: 5010, baseType: !129, size: 16, offset: 384)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !407, file: !23, line: 5011, baseType: !129, size: 16, offset: 400)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !407, file: !23, line: 5012, baseType: !435, size: 48, offset: 416)
!435 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 48, elements: !297)
!436 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !407, file: !23, line: 5013, baseType: !435, size: 48, offset: 464)
!437 = !DIGlobalVariableExpression(var: !438, expr: !DIExpression())
!438 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !384, line: 113, type: !439, isLocal: true, isDefinition: true)
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!440 = !DISubroutineType(types: !441)
!441 = !{!153}
!442 = !DIGlobalVariableExpression(var: !443, expr: !DIExpression())
!443 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !384, line: 55, type: !444, isLocal: true, isDefinition: true)
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!445 = !DISubroutineType(types: !446)
!446 = !{!106, !106, !388}
!447 = !DIGlobalVariableExpression(var: !448, expr: !DIExpression())
!448 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !384, line: 87, type: !449, isLocal: true, isDefinition: true)
!449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !450, size: 64)
!450 = !DISubroutineType(types: !451)
!451 = !{!107, !106, !388}
!452 = !DICompositeType(tag: DW_TAG_array_type, baseType: !149, size: 32, elements: !139)
!453 = !{i32 7, !"Dwarf Version", i32 5}
!454 = !{i32 2, !"Debug Info Version", i32 3}
!455 = !{i32 1, !"wchar_size", i32 4}
!456 = !{i32 7, !"frame-pointer", i32 2}
!457 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!458 = distinct !DISubprogram(name: "parse_packet_identifer_tc", scope: !3, file: !3, line: 743, type: !459, scopeLine: 745, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !549)
!459 = !DISubroutineType(types: !460)
!460 = !{!164, !461, !339}
!461 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !462, size: 64)
!462 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !23, line: 4183, size: 1472, elements: !463)
!463 = !{!464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !478, !479, !480, !481, !482, !483, !484, !485, !486, !487, !488, !489, !490, !491, !523, !524, !525, !526, !548}
!464 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !462, file: !23, line: 4184, baseType: !138, size: 32)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !462, file: !23, line: 4185, baseType: !138, size: 32, offset: 32)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !462, file: !23, line: 4186, baseType: !138, size: 32, offset: 64)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !462, file: !23, line: 4187, baseType: !138, size: 32, offset: 96)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !462, file: !23, line: 4188, baseType: !138, size: 32, offset: 128)
!469 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !462, file: !23, line: 4189, baseType: !138, size: 32, offset: 160)
!470 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !462, file: !23, line: 4190, baseType: !138, size: 32, offset: 192)
!471 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !462, file: !23, line: 4191, baseType: !138, size: 32, offset: 224)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !462, file: !23, line: 4192, baseType: !138, size: 32, offset: 256)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !462, file: !23, line: 4193, baseType: !138, size: 32, offset: 288)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !462, file: !23, line: 4194, baseType: !138, size: 32, offset: 320)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !462, file: !23, line: 4195, baseType: !138, size: 32, offset: 352)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !462, file: !23, line: 4196, baseType: !477, size: 160, offset: 384)
!477 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 160, elements: !207)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !462, file: !23, line: 4197, baseType: !138, size: 32, offset: 544)
!479 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !462, file: !23, line: 4198, baseType: !138, size: 32, offset: 576)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !462, file: !23, line: 4199, baseType: !138, size: 32, offset: 608)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !462, file: !23, line: 4200, baseType: !138, size: 32, offset: 640)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !462, file: !23, line: 4201, baseType: !138, size: 32, offset: 672)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !462, file: !23, line: 4204, baseType: !138, size: 32, offset: 704)
!484 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !462, file: !23, line: 4205, baseType: !138, size: 32, offset: 736)
!485 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !462, file: !23, line: 4206, baseType: !138, size: 32, offset: 768)
!486 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !462, file: !23, line: 4207, baseType: !426, size: 128, offset: 800)
!487 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !462, file: !23, line: 4208, baseType: !426, size: 128, offset: 928)
!488 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !462, file: !23, line: 4209, baseType: !138, size: 32, offset: 1056)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !462, file: !23, line: 4210, baseType: !138, size: 32, offset: 1088)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !462, file: !23, line: 4213, baseType: !138, size: 32, offset: 1120)
!491 = !DIDerivedType(tag: DW_TAG_member, scope: !462, file: !23, line: 4214, baseType: !492, size: 64, align: 64, offset: 1152)
!492 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !462, file: !23, line: 4214, size: 64, align: 64, elements: !493)
!493 = !{!494}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !492, file: !23, line: 4214, baseType: !495, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !496, size: 64)
!496 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !23, line: 5041, size: 448, elements: !497)
!497 = !{!498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !521, !522}
!498 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !496, file: !23, line: 5042, baseType: !131, size: 16)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !496, file: !23, line: 5043, baseType: !131, size: 16, offset: 16)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !496, file: !23, line: 5044, baseType: !131, size: 16, offset: 32)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !496, file: !23, line: 5045, baseType: !123, size: 8, offset: 48)
!502 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !496, file: !23, line: 5046, baseType: !123, size: 8, offset: 56)
!503 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !496, file: !23, line: 5047, baseType: !123, size: 8, offset: 64)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !496, file: !23, line: 5048, baseType: !123, size: 8, offset: 72)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !496, file: !23, line: 5049, baseType: !129, size: 16, offset: 80)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !496, file: !23, line: 5050, baseType: !129, size: 16, offset: 96)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !496, file: !23, line: 5051, baseType: !129, size: 16, offset: 112)
!508 = !DIDerivedType(tag: DW_TAG_member, scope: !496, file: !23, line: 5052, baseType: !509, size: 256, offset: 128)
!509 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !496, file: !23, line: 5052, size: 256, elements: !510)
!510 = !{!511, !516}
!511 = !DIDerivedType(tag: DW_TAG_member, scope: !509, file: !23, line: 5053, baseType: !512, size: 64)
!512 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !509, file: !23, line: 5053, size: 64, elements: !513)
!513 = !{!514, !515}
!514 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !512, file: !23, line: 5054, baseType: !137, size: 32)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !512, file: !23, line: 5055, baseType: !137, size: 32, offset: 32)
!516 = !DIDerivedType(tag: DW_TAG_member, scope: !509, file: !23, line: 5057, baseType: !517, size: 256)
!517 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !509, file: !23, line: 5057, size: 256, elements: !518)
!518 = !{!519, !520}
!519 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !517, file: !23, line: 5058, baseType: !426, size: 128)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !517, file: !23, line: 5059, baseType: !426, size: 128, offset: 128)
!521 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !496, file: !23, line: 5062, baseType: !138, size: 32, offset: 384)
!522 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !496, file: !23, line: 5063, baseType: !137, size: 32, offset: 416)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !462, file: !23, line: 4215, baseType: !153, size: 64, offset: 1216)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !462, file: !23, line: 4216, baseType: !138, size: 32, offset: 1280)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !462, file: !23, line: 4217, baseType: !138, size: 32, offset: 1312)
!526 = !DIDerivedType(tag: DW_TAG_member, scope: !462, file: !23, line: 4218, baseType: !527, size: 64, align: 64, offset: 1344)
!527 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !462, file: !23, line: 4218, size: 64, align: 64, elements: !528)
!528 = !{!529}
!529 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !527, file: !23, line: 4218, baseType: !530, size: 64)
!530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64)
!531 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !23, line: 4272, size: 640, elements: !532)
!532 = !{!533, !534, !535, !536, !537, !538, !539, !540, !541, !542, !543, !544, !545, !546}
!533 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !531, file: !23, line: 4273, baseType: !138, size: 32)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !531, file: !23, line: 4274, baseType: !138, size: 32, offset: 32)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !531, file: !23, line: 4275, baseType: !138, size: 32, offset: 64)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !531, file: !23, line: 4276, baseType: !138, size: 32, offset: 96)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !531, file: !23, line: 4277, baseType: !138, size: 32, offset: 128)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !531, file: !23, line: 4278, baseType: !138, size: 32, offset: 160)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !531, file: !23, line: 4280, baseType: !138, size: 32, offset: 192)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !531, file: !23, line: 4281, baseType: !426, size: 128, offset: 224)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !531, file: !23, line: 4282, baseType: !138, size: 32, offset: 352)
!542 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !531, file: !23, line: 4283, baseType: !138, size: 32, offset: 384)
!543 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !531, file: !23, line: 4284, baseType: !138, size: 32, offset: 416)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !531, file: !23, line: 4285, baseType: !426, size: 128, offset: 448)
!545 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !531, file: !23, line: 4286, baseType: !138, size: 32, offset: 576)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !531, file: !23, line: 4287, baseType: !547, size: 32, offset: 608)
!547 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !124, line: 26, baseType: !164)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !462, file: !23, line: 4219, baseType: !138, size: 32, offset: 1408)
!549 = !{!550, !551, !552}
!550 = !DILocalVariable(name: "ctx", arg: 1, scope: !458, file: !3, line: 743, type: !461)
!551 = !DILocalVariable(name: "p_info", arg: 2, scope: !458, file: !3, line: 744, type: !339)
!552 = !DILocalVariable(name: "pctx", scope: !458, file: !3, line: 749, type: !553)
!553 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parsing_context", file: !3, line: 73, size: 256, elements: !554)
!554 = !{!555, !556, !557, !562}
!555 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !553, file: !3, line: 74, baseType: !106, size: 64)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !553, file: !3, line: 75, baseType: !106, size: 64, offset: 64)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "nh", scope: !553, file: !3, line: 76, baseType: !558, size: 64, offset: 128)
!558 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !559, line: 35, size: 64, elements: !560)
!559 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!560 = !{!561}
!561 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !558, file: !559, line: 36, baseType: !106, size: 64)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_len", scope: !553, file: !3, line: 77, baseType: !138, size: 32, offset: 192)
!563 = !DILocation(line: 0, scope: !458)
!564 = !DILocation(line: 746, column: 7, scope: !565)
!565 = distinct !DILexicalBlock(scope: !458, file: !3, line: 746, column: 6)
!566 = !DILocation(line: 746, column: 6, scope: !458)
!567 = !DILocation(line: 749, column: 2, scope: !458)
!568 = !DILocation(line: 749, column: 25, scope: !458)
!569 = !DILocation(line: 749, column: 32, scope: !458)
!570 = !DILocation(line: 750, column: 30, scope: !458)
!571 = !{!572, !573, i64 76}
!572 = !{!"__sk_buff", !573, i64 0, !573, i64 4, !573, i64 8, !573, i64 12, !573, i64 16, !573, i64 20, !573, i64 24, !573, i64 28, !573, i64 32, !573, i64 36, !573, i64 40, !573, i64 44, !574, i64 48, !573, i64 68, !573, i64 72, !573, i64 76, !573, i64 80, !573, i64 84, !573, i64 88, !573, i64 92, !573, i64 96, !574, i64 100, !574, i64 116, !573, i64 132, !573, i64 136, !573, i64 140, !574, i64 144, !576, i64 152, !573, i64 160, !573, i64 164, !574, i64 168, !573, i64 176}
!573 = !{!"int", !574, i64 0}
!574 = !{!"omnipotent char", !575, i64 0}
!575 = !{!"Simple C/C++ TBAA"}
!576 = !{!"long long", !574, i64 0}
!577 = !DILocation(line: 750, column: 19, scope: !458)
!578 = !DILocation(line: 750, column: 11, scope: !458)
!579 = !{!580, !581, i64 0}
!580 = !{!"parsing_context", !581, i64 0, !581, i64 8, !582, i64 16, !573, i64 24}
!581 = !{!"any pointer", !574, i64 0}
!582 = !{!"hdr_cursor", !581, i64 0}
!583 = !DILocation(line: 751, column: 34, scope: !458)
!584 = !{!572, !573, i64 80}
!585 = !DILocation(line: 751, column: 23, scope: !458)
!586 = !DILocation(line: 751, column: 15, scope: !458)
!587 = !{!580, !581, i64 8}
!588 = !DILocation(line: 752, column: 9, scope: !458)
!589 = !{!582, !581, i64 0}
!590 = !DILocation(line: 753, column: 19, scope: !458)
!591 = !{!572, !573, i64 0}
!592 = !{!580, !573, i64 24}
!593 = !DILocation(line: 756, column: 9, scope: !458)
!594 = !DILocation(line: 757, column: 1, scope: !458)
!595 = distinct !DISubprogram(name: "parse_packet_identifier", scope: !3, file: !3, line: 631, type: !596, scopeLine: 633, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !599)
!596 = !DISubroutineType(types: !597)
!597 = !{!164, !598, !339}
!598 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !553, size: 64)
!599 = !{!600, !601, !602, !603, !604, !613, !623, !681, !769, !770}
!600 = !DILocalVariable(name: "pctx", arg: 1, scope: !595, file: !3, line: 631, type: !598)
!601 = !DILocalVariable(name: "p_info", arg: 2, scope: !595, file: !3, line: 632, type: !339)
!602 = !DILocalVariable(name: "proto", scope: !595, file: !3, line: 634, type: !164)
!603 = !DILocalVariable(name: "err", scope: !595, file: !3, line: 634, type: !164)
!604 = !DILocalVariable(name: "eth", scope: !595, file: !3, line: 635, type: !605)
!605 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !606, size: 64)
!606 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !607, line: 168, size: 112, elements: !608)
!607 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!608 = !{!609, !611, !612}
!609 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !606, file: !607, line: 169, baseType: !610, size: 48)
!610 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 48, elements: !297)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !606, file: !607, line: 170, baseType: !610, size: 48, offset: 48)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !606, file: !607, line: 171, baseType: !129, size: 16, offset: 96)
!613 = !DILocalVariable(name: "proto_info", scope: !595, file: !3, line: 636, type: !614)
!614 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "protocol_info", file: !3, line: 116, size: 128, elements: !615)
!615 = !{!616, !617, !618, !619, !620, !621, !622}
!616 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !614, file: !3, line: 117, baseType: !138, size: 32)
!617 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !614, file: !3, line: 118, baseType: !138, size: 32, offset: 32)
!618 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !614, file: !3, line: 119, baseType: !204, size: 8, offset: 64)
!619 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !614, file: !3, line: 120, baseType: !204, size: 8, offset: 72)
!620 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !614, file: !3, line: 121, baseType: !5, size: 8, offset: 80)
!621 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !614, file: !3, line: 122, baseType: !13, size: 8, offset: 88)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "wait_first_edge", scope: !614, file: !3, line: 123, baseType: !204, size: 8, offset: 96)
!623 = !DILocalVariable(name: "iph_ptr", scope: !595, file: !3, line: 640, type: !624)
!624 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !595, file: !3, line: 637, size: 64, elements: !625)
!625 = !{!626, !654}
!626 = !DIDerivedType(tag: DW_TAG_member, name: "iph", scope: !624, file: !3, line: 638, baseType: !627, size: 64)
!627 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !628, size: 64)
!628 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !629, line: 87, size: 160, elements: !630)
!629 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!630 = !{!631, !632, !633, !634, !635, !636, !637, !638, !639, !641}
!631 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !628, file: !629, line: 89, baseType: !123, size: 4, flags: DIFlagBitField, extraData: i64 0)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !628, file: !629, line: 90, baseType: !123, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !628, file: !629, line: 97, baseType: !123, size: 8, offset: 8)
!634 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !628, file: !629, line: 98, baseType: !129, size: 16, offset: 16)
!635 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !628, file: !629, line: 99, baseType: !129, size: 16, offset: 32)
!636 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !628, file: !629, line: 100, baseType: !129, size: 16, offset: 48)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !628, file: !629, line: 101, baseType: !123, size: 8, offset: 64)
!638 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !628, file: !629, line: 102, baseType: !123, size: 8, offset: 72)
!639 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !628, file: !629, line: 103, baseType: !640, size: 16, offset: 80)
!640 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !130, line: 31, baseType: !131)
!641 = !DIDerivedType(tag: DW_TAG_member, scope: !628, file: !629, line: 104, baseType: !642, size: 64, offset: 96)
!642 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !628, file: !629, line: 104, size: 64, elements: !643)
!643 = !{!644, !649}
!644 = !DIDerivedType(tag: DW_TAG_member, scope: !642, file: !629, line: 104, baseType: !645, size: 64)
!645 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !642, file: !629, line: 104, size: 64, elements: !646)
!646 = !{!647, !648}
!647 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !645, file: !629, line: 104, baseType: !137, size: 32)
!648 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !645, file: !629, line: 104, baseType: !137, size: 32, offset: 32)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !642, file: !629, line: 104, baseType: !650, size: 64)
!650 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !642, file: !629, line: 104, size: 64, elements: !651)
!651 = !{!652, !653}
!652 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !650, file: !629, line: 104, baseType: !137, size: 32)
!653 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !650, file: !629, line: 104, baseType: !137, size: 32, offset: 32)
!654 = !DIDerivedType(tag: DW_TAG_member, name: "ip6h", scope: !624, file: !3, line: 639, baseType: !655, size: 64)
!655 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !656, size: 64)
!656 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !657, line: 118, size: 320, elements: !658)
!657 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!658 = !{!659, !660, !661, !665, !666, !667, !668}
!659 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !656, file: !657, line: 120, baseType: !123, size: 4, flags: DIFlagBitField, extraData: i64 0)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !656, file: !657, line: 121, baseType: !123, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!661 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !656, file: !657, line: 128, baseType: !662, size: 24, offset: 8)
!662 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 24, elements: !663)
!663 = !{!664}
!664 = !DISubrange(count: 3)
!665 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !656, file: !657, line: 130, baseType: !129, size: 16, offset: 32)
!666 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !656, file: !657, line: 131, baseType: !123, size: 8, offset: 48)
!667 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !656, file: !657, line: 132, baseType: !123, size: 8, offset: 56)
!668 = !DIDerivedType(tag: DW_TAG_member, scope: !656, file: !657, line: 134, baseType: !669, size: 256, offset: 64)
!669 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !656, file: !657, line: 134, size: 256, elements: !670)
!670 = !{!671, !676}
!671 = !DIDerivedType(tag: DW_TAG_member, scope: !669, file: !657, line: 134, baseType: !672, size: 256)
!672 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !669, file: !657, line: 134, size: 256, elements: !673)
!673 = !{!674, !675}
!674 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !672, file: !657, line: 134, baseType: !115, size: 128)
!675 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !672, file: !657, line: 134, baseType: !115, size: 128, offset: 128)
!676 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !669, file: !657, line: 134, baseType: !677, size: 256)
!677 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !669, file: !657, line: 134, size: 256, elements: !678)
!678 = !{!679, !680}
!679 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !677, file: !657, line: 134, baseType: !115, size: 128)
!680 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !677, file: !657, line: 134, baseType: !115, size: 128, offset: 128)
!681 = !DILocalVariable(name: "transporth_ptr", scope: !595, file: !3, line: 645, type: !682)
!682 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !595, file: !3, line: 641, size: 64, elements: !683)
!683 = !{!684, !706, !730}
!684 = !DIDerivedType(tag: DW_TAG_member, name: "tcph", scope: !682, file: !3, line: 642, baseType: !685, size: 64)
!685 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 64)
!686 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !687, line: 25, size: 160, elements: !688)
!687 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!688 = !{!689, !690, !691, !692, !693, !694, !695, !696, !697, !698, !699, !700, !701, !702, !703, !704, !705}
!689 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !686, file: !687, line: 26, baseType: !129, size: 16)
!690 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !686, file: !687, line: 27, baseType: !129, size: 16, offset: 16)
!691 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !686, file: !687, line: 28, baseType: !137, size: 32, offset: 32)
!692 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !686, file: !687, line: 29, baseType: !137, size: 32, offset: 64)
!693 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !686, file: !687, line: 31, baseType: !131, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !686, file: !687, line: 32, baseType: !131, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!695 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !686, file: !687, line: 33, baseType: !131, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!696 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !686, file: !687, line: 34, baseType: !131, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!697 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !686, file: !687, line: 35, baseType: !131, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!698 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !686, file: !687, line: 36, baseType: !131, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!699 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !686, file: !687, line: 37, baseType: !131, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!700 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !686, file: !687, line: 38, baseType: !131, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!701 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !686, file: !687, line: 39, baseType: !131, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!702 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !686, file: !687, line: 40, baseType: !131, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!703 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !686, file: !687, line: 55, baseType: !129, size: 16, offset: 112)
!704 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !686, file: !687, line: 56, baseType: !640, size: 16, offset: 128)
!705 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !686, file: !687, line: 57, baseType: !129, size: 16, offset: 144)
!706 = !DIDerivedType(tag: DW_TAG_member, name: "icmph", scope: !682, file: !3, line: 643, baseType: !707, size: 64)
!707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64)
!708 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !709, line: 89, size: 64, elements: !710)
!709 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!710 = !{!711, !712, !713, !714}
!711 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !708, file: !709, line: 90, baseType: !123, size: 8)
!712 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !708, file: !709, line: 91, baseType: !123, size: 8, offset: 8)
!713 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !708, file: !709, line: 92, baseType: !640, size: 16, offset: 16)
!714 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !708, file: !709, line: 104, baseType: !715, size: 32, offset: 32)
!715 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !708, file: !709, line: 93, size: 32, elements: !716)
!716 = !{!717, !722, !723, !728}
!717 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !715, file: !709, line: 97, baseType: !718, size: 32)
!718 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !715, file: !709, line: 94, size: 32, elements: !719)
!719 = !{!720, !721}
!720 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !718, file: !709, line: 95, baseType: !129, size: 16)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !718, file: !709, line: 96, baseType: !129, size: 16, offset: 16)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !715, file: !709, line: 98, baseType: !137, size: 32)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !715, file: !709, line: 102, baseType: !724, size: 32)
!724 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !715, file: !709, line: 99, size: 32, elements: !725)
!725 = !{!726, !727}
!726 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !724, file: !709, line: 100, baseType: !129, size: 16)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !724, file: !709, line: 101, baseType: !129, size: 16, offset: 16)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !715, file: !709, line: 103, baseType: !729, size: 32)
!729 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 32, elements: !139)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6h", scope: !682, file: !3, line: 644, baseType: !731, size: 64)
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!732 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !733, line: 8, size: 64, elements: !734)
!733 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!734 = !{!735, !736, !737, !738}
!735 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !732, file: !733, line: 10, baseType: !123, size: 8)
!736 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !732, file: !733, line: 11, baseType: !123, size: 8, offset: 8)
!737 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !732, file: !733, line: 12, baseType: !640, size: 16, offset: 16)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !732, file: !733, line: 63, baseType: !739, size: 32, offset: 32)
!739 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !732, file: !733, line: 15, size: 32, elements: !740)
!740 = !{!741, !743, !745, !746, !751, !759}
!741 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !739, file: !733, line: 16, baseType: !742, size: 32)
!742 = !DICompositeType(tag: DW_TAG_array_type, baseType: !137, size: 32, elements: !165)
!743 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !739, file: !733, line: 17, baseType: !744, size: 32)
!744 = !DICompositeType(tag: DW_TAG_array_type, baseType: !129, size: 32, elements: !285)
!745 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !739, file: !733, line: 18, baseType: !729, size: 32)
!746 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !739, file: !733, line: 23, baseType: !747, size: 32)
!747 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !733, line: 20, size: 32, elements: !748)
!748 = !{!749, !750}
!749 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !747, file: !733, line: 21, baseType: !129, size: 16)
!750 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !747, file: !733, line: 22, baseType: !129, size: 16, offset: 16)
!751 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !739, file: !733, line: 40, baseType: !752, size: 32)
!752 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !733, line: 25, size: 32, elements: !753)
!753 = !{!754, !755, !756, !757, !758}
!754 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !752, file: !733, line: 27, baseType: !138, size: 5, flags: DIFlagBitField, extraData: i64 0)
!755 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !752, file: !733, line: 28, baseType: !138, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!756 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !752, file: !733, line: 29, baseType: !138, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!757 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !752, file: !733, line: 30, baseType: !138, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !752, file: !733, line: 31, baseType: !138, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!759 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !739, file: !733, line: 61, baseType: !760, size: 32)
!760 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !733, line: 42, size: 32, elements: !761)
!761 = !{!762, !763, !764, !765, !766, !767, !768}
!762 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !760, file: !733, line: 43, baseType: !123, size: 8)
!763 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !760, file: !733, line: 45, baseType: !123, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!764 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !760, file: !733, line: 46, baseType: !123, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!765 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !760, file: !733, line: 47, baseType: !123, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!766 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !760, file: !733, line: 48, baseType: !123, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!767 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !760, file: !733, line: 49, baseType: !123, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !760, file: !733, line: 60, baseType: !129, size: 16, offset: 16)
!769 = !DILocalVariable(name: "ecn", scope: !595, file: !3, line: 646, type: !123)
!770 = !DILabel(scope: !595, name: "err_not_ip", file: !3, line: 731)
!771 = !DILocation(line: 636, column: 23, scope: !595)
!772 = !DILocation(line: 0, scope: !595)
!773 = !DILocation(line: 649, column: 2, scope: !595)
!774 = !DILocation(line: 650, column: 17, scope: !595)
!775 = !DILocation(line: 650, column: 10, scope: !595)
!776 = !DILocation(line: 650, column: 15, scope: !595)
!777 = !{!778, !576, i64 0}
!778 = !{!"packet_info", !576, i64 0, !573, i64 8, !573, i64 12, !779, i64 16, !779, i64 64, !573, i64 112, !574, i64 116, !783, i64 120, !784, i64 122, !784, i64 123, !784, i64 124, !784, i64 125, !574, i64 126, !574, i64 127, !784, i64 128, !784, i64 129}
!779 = !{!"packet_id", !780, i64 0, !573, i64 44}
!780 = !{!"network_tuple", !781, i64 0, !781, i64 20, !783, i64 40, !574, i64 42, !574, i64 43}
!781 = !{!"flow_address", !782, i64 0, !783, i64 16, !783, i64 18}
!782 = !{!"in6_addr", !574, i64 0}
!783 = !{!"short", !574, i64 0}
!784 = !{!"_Bool", !574, i64 0}
!785 = !DILocation(line: 651, column: 26, scope: !595)
!786 = !DILocation(line: 651, column: 10, scope: !595)
!787 = !DILocation(line: 651, column: 18, scope: !595)
!788 = !{!778, !573, i64 8}
!789 = !DILocation(line: 652, column: 30, scope: !595)
!790 = !DILocation(line: 652, column: 40, scope: !595)
!791 = !DILocalVariable(name: "nh", arg: 1, scope: !792, file: !559, line: 131, type: !795)
!792 = distinct !DISubprogram(name: "parse_ethhdr", scope: !559, file: !559, line: 131, type: !793, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !797)
!793 = !DISubroutineType(types: !794)
!794 = !{!164, !795, !106, !796}
!795 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !558, size: 64)
!796 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !605, size: 64)
!797 = !{!791, !798, !799}
!798 = !DILocalVariable(name: "data_end", arg: 2, scope: !792, file: !559, line: 132, type: !106)
!799 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !792, file: !559, line: 133, type: !796)
!800 = !DILocation(line: 0, scope: !792, inlinedAt: !801)
!801 = distinct !DILocation(line: 652, column: 10, scope: !595)
!802 = !DILocalVariable(name: "nh", arg: 1, scope: !803, file: !559, line: 86, type: !795)
!803 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !559, file: !559, line: 86, type: !804, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !811)
!804 = !DISubroutineType(types: !805)
!805 = !{!164, !795, !106, !796, !806}
!806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !807, size: 64)
!807 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !559, line: 71, size: 32, elements: !808)
!808 = !{!809}
!809 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !807, file: !559, line: 72, baseType: !810, size: 32)
!810 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 32, elements: !285)
!811 = !{!802, !812, !813, !814, !815, !816, !817, !823, !824}
!812 = !DILocalVariable(name: "data_end", arg: 2, scope: !803, file: !559, line: 87, type: !106)
!813 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !803, file: !559, line: 88, type: !796)
!814 = !DILocalVariable(name: "vlans", arg: 4, scope: !803, file: !559, line: 89, type: !806)
!815 = !DILocalVariable(name: "eth", scope: !803, file: !559, line: 91, type: !605)
!816 = !DILocalVariable(name: "hdrsize", scope: !803, file: !559, line: 92, type: !164)
!817 = !DILocalVariable(name: "vlh", scope: !803, file: !559, line: 93, type: !818)
!818 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !819, size: 64)
!819 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !559, line: 44, size: 32, elements: !820)
!820 = !{!821, !822}
!821 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !819, file: !559, line: 45, baseType: !129, size: 16)
!822 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !819, file: !559, line: 46, baseType: !129, size: 16, offset: 16)
!823 = !DILocalVariable(name: "h_proto", scope: !803, file: !559, line: 94, type: !131)
!824 = !DILocalVariable(name: "i", scope: !803, file: !559, line: 95, type: !164)
!825 = !DILocation(line: 0, scope: !803, inlinedAt: !826)
!826 = distinct !DILocation(line: 136, column: 9, scope: !792, inlinedAt: !801)
!827 = !DILocation(line: 91, column: 27, scope: !803, inlinedAt: !826)
!828 = !DILocation(line: 100, column: 14, scope: !829, inlinedAt: !826)
!829 = distinct !DILexicalBlock(scope: !803, file: !559, line: 100, column: 6)
!830 = !DILocation(line: 100, column: 24, scope: !829, inlinedAt: !826)
!831 = !DILocation(line: 100, column: 6, scope: !803, inlinedAt: !826)
!832 = !DILocation(line: 106, column: 17, scope: !803, inlinedAt: !826)
!833 = !{!783, !783, i64 0}
!834 = !DILocalVariable(name: "h_proto", arg: 1, scope: !835, file: !559, line: 75, type: !131)
!835 = distinct !DISubprogram(name: "proto_is_vlan", scope: !559, file: !559, line: 75, type: !836, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !838)
!836 = !DISubroutineType(types: !837)
!837 = !{!164, !131}
!838 = !{!834}
!839 = !DILocation(line: 0, scope: !835, inlinedAt: !840)
!840 = distinct !DILocation(line: 113, column: 8, scope: !841, inlinedAt: !826)
!841 = distinct !DILexicalBlock(scope: !842, file: !559, line: 113, column: 7)
!842 = distinct !DILexicalBlock(scope: !843, file: !559, line: 112, column: 39)
!843 = distinct !DILexicalBlock(scope: !844, file: !559, line: 112, column: 2)
!844 = distinct !DILexicalBlock(scope: !803, file: !559, line: 112, column: 2)
!845 = !DILocation(line: 77, column: 20, scope: !835, inlinedAt: !840)
!846 = !DILocation(line: 77, column: 46, scope: !835, inlinedAt: !840)
!847 = !DILocation(line: 113, column: 8, scope: !841, inlinedAt: !826)
!848 = !DILocation(line: 113, column: 7, scope: !842, inlinedAt: !826)
!849 = !DILocation(line: 119, column: 18, scope: !842, inlinedAt: !826)
!850 = !DILocation(line: 127, column: 10, scope: !803, inlinedAt: !826)
!851 = !DILocation(line: 655, column: 6, scope: !595)
!852 = !DILocation(line: 656, column: 20, scope: !853)
!853 = distinct !DILexicalBlock(scope: !854, file: !3, line: 655, column: 36)
!854 = distinct !DILexicalBlock(scope: !595, file: !3, line: 655, column: 6)
!855 = !DILocation(line: 656, column: 24, scope: !853)
!856 = !{!778, !574, i64 58}
!857 = !DILocalVariable(name: "nh", arg: 1, scope: !858, file: !559, line: 196, type: !795)
!858 = distinct !DISubprogram(name: "parse_iphdr", scope: !559, file: !559, line: 196, type: !859, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !862)
!859 = !DISubroutineType(types: !860)
!860 = !{!164, !795, !106, !861}
!861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !627, size: 64)
!862 = !{!857, !863, !864, !865, !866}
!863 = !DILocalVariable(name: "data_end", arg: 2, scope: !858, file: !559, line: 197, type: !106)
!864 = !DILocalVariable(name: "iphdr", arg: 3, scope: !858, file: !559, line: 198, type: !861)
!865 = !DILocalVariable(name: "iph", scope: !858, file: !559, line: 200, type: !627)
!866 = !DILocalVariable(name: "hdrsize", scope: !858, file: !559, line: 201, type: !164)
!867 = !DILocation(line: 0, scope: !858, inlinedAt: !868)
!868 = distinct !DILocation(line: 657, column: 11, scope: !853)
!869 = !DILocation(line: 203, column: 10, scope: !870, inlinedAt: !868)
!870 = distinct !DILexicalBlock(scope: !858, file: !559, line: 203, column: 6)
!871 = !DILocation(line: 203, column: 14, scope: !870, inlinedAt: !868)
!872 = !DILocation(line: 203, column: 6, scope: !858, inlinedAt: !868)
!873 = !DILocation(line: 206, column: 11, scope: !874, inlinedAt: !868)
!874 = distinct !DILexicalBlock(scope: !858, file: !559, line: 206, column: 6)
!875 = !DILocation(line: 206, column: 19, scope: !874, inlinedAt: !868)
!876 = !DILocation(line: 206, column: 6, scope: !858, inlinedAt: !868)
!877 = !DILocation(line: 209, column: 21, scope: !858, inlinedAt: !868)
!878 = !DILocation(line: 211, column: 13, scope: !879, inlinedAt: !868)
!879 = distinct !DILexicalBlock(scope: !858, file: !559, line: 211, column: 5)
!880 = !DILocation(line: 211, column: 5, scope: !858, inlinedAt: !868)
!881 = !DILocation(line: 215, column: 14, scope: !882, inlinedAt: !868)
!882 = distinct !DILexicalBlock(scope: !858, file: !559, line: 215, column: 6)
!883 = !DILocation(line: 215, column: 24, scope: !882, inlinedAt: !868)
!884 = !DILocation(line: 215, column: 6, scope: !858, inlinedAt: !868)
!885 = !DILocation(line: 659, column: 20, scope: !886)
!886 = distinct !DILexicalBlock(scope: !887, file: !3, line: 658, column: 45)
!887 = distinct !DILexicalBlock(scope: !854, file: !3, line: 658, column: 13)
!888 = !DILocation(line: 659, column: 24, scope: !886)
!889 = !DILocalVariable(name: "nh", arg: 1, scope: !890, file: !559, line: 174, type: !795)
!890 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !559, file: !559, line: 174, type: !891, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !894)
!891 = !DISubroutineType(types: !892)
!892 = !{!164, !795, !106, !893}
!893 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64)
!894 = !{!889, !895, !896, !897}
!895 = !DILocalVariable(name: "data_end", arg: 2, scope: !890, file: !559, line: 175, type: !106)
!896 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !890, file: !559, line: 176, type: !893)
!897 = !DILocalVariable(name: "ip6h", scope: !890, file: !559, line: 178, type: !655)
!898 = !DILocation(line: 0, scope: !890, inlinedAt: !899)
!899 = distinct !DILocation(line: 660, column: 11, scope: !886)
!900 = !DILocation(line: 184, column: 11, scope: !901, inlinedAt: !899)
!901 = distinct !DILexicalBlock(scope: !890, file: !559, line: 184, column: 6)
!902 = !DILocation(line: 184, column: 15, scope: !901, inlinedAt: !899)
!903 = !DILocation(line: 184, column: 6, scope: !890, inlinedAt: !899)
!904 = !DILocation(line: 187, column: 12, scope: !905, inlinedAt: !899)
!905 = distinct !DILexicalBlock(scope: !890, file: !559, line: 187, column: 6)
!906 = !DILocation(line: 187, column: 20, scope: !905, inlinedAt: !899)
!907 = !DILocation(line: 187, column: 6, scope: !890, inlinedAt: !899)
!908 = !DILocation(line: 190, column: 10, scope: !890, inlinedAt: !899)
!909 = !DILocation(line: 193, column: 44, scope: !890, inlinedAt: !899)
!910 = !{!911, !574, i64 6}
!911 = !{!"ipv6hdr", !574, i64 0, !574, i64 0, !574, i64 1, !783, i64 4, !574, i64 6, !574, i64 7, !574, i64 8}
!912 = !DILocalVariable(name: "nh", arg: 1, scope: !913, file: !559, line: 139, type: !795)
!913 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !559, file: !559, line: 139, type: !914, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !916)
!914 = !DISubroutineType(types: !915)
!915 = !{!164, !795, !106, !123}
!916 = !{!912, !917, !918, !919, !921}
!917 = !DILocalVariable(name: "data_end", arg: 2, scope: !913, file: !559, line: 140, type: !106)
!918 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !913, file: !559, line: 141, type: !123)
!919 = !DILocalVariable(name: "i", scope: !920, file: !559, line: 143, type: !164)
!920 = distinct !DILexicalBlock(scope: !913, file: !559, line: 143, column: 2)
!921 = !DILocalVariable(name: "hdr", scope: !922, file: !559, line: 144, type: !924)
!922 = distinct !DILexicalBlock(scope: !923, file: !559, line: 143, column: 47)
!923 = distinct !DILexicalBlock(scope: !920, file: !559, line: 143, column: 2)
!924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !925, size: 64)
!925 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !657, line: 63, size: 16, elements: !926)
!926 = !{!927, !928}
!927 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !925, file: !657, line: 64, baseType: !123, size: 8)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !925, file: !657, line: 65, baseType: !123, size: 8, offset: 8)
!929 = !DILocation(line: 0, scope: !913, inlinedAt: !930)
!930 = distinct !DILocation(line: 193, column: 9, scope: !890, inlinedAt: !899)
!931 = !DILocation(line: 0, scope: !920, inlinedAt: !930)
!932 = !DILocation(line: 0, scope: !922, inlinedAt: !930)
!933 = !DILocation(line: 146, column: 11, scope: !934, inlinedAt: !930)
!934 = distinct !DILexicalBlock(scope: !922, file: !559, line: 146, column: 7)
!935 = !DILocation(line: 146, column: 15, scope: !934, inlinedAt: !930)
!936 = !DILocation(line: 146, column: 7, scope: !922, inlinedAt: !930)
!937 = !DILocation(line: 149, column: 3, scope: !922, inlinedAt: !930)
!938 = !DILocation(line: 160, column: 4, scope: !939, inlinedAt: !930)
!939 = distinct !DILexicalBlock(scope: !922, file: !559, line: 149, column: 26)
!940 = !DILocation(line: 0, scope: !939, inlinedAt: !930)
!941 = !{!942, !574, i64 1}
!942 = !{!"ipv6_opt_hdr", !574, i64 0, !574, i64 1}
!943 = !{!942, !574, i64 0}
!944 = !DILocation(line: 156, column: 4, scope: !939, inlinedAt: !930)
!945 = !DILocation(line: 218, column: 10, scope: !858, inlinedAt: !868)
!946 = !DILocation(line: 221, column: 14, scope: !858, inlinedAt: !868)
!947 = !{!948, !574, i64 9}
!948 = !{!"iphdr", !574, i64 0, !574, i64 0, !574, i64 1, !783, i64 2, !783, i64 4, !783, i64 6, !574, i64 8, !574, i64 9, !783, i64 10, !574, i64 12}
!949 = !DILocation(line: 668, column: 27, scope: !595)
!950 = !DILocation(line: 668, column: 10, scope: !595)
!951 = !DILocation(line: 668, column: 19, scope: !595)
!952 = !DILocation(line: 668, column: 25, scope: !595)
!953 = !{!778, !783, i64 56}
!954 = !DILocation(line: 671, column: 19, scope: !955)
!955 = distinct !DILexicalBlock(scope: !956, file: !3, line: 669, column: 39)
!956 = distinct !DILexicalBlock(scope: !595, file: !3, line: 669, column: 6)
!957 = !{!574, !574, i64 0}
!958 = !DILocalVariable(name: "ipv6", arg: 1, scope: !959, file: !3, line: 212, type: !155)
!959 = distinct !DISubprogram(name: "map_ipv4_to_ipv6", scope: !3, file: !3, line: 212, type: !960, scopeLine: 213, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !962)
!960 = !DISubroutineType(types: !961)
!961 = !{null, !155, !137}
!962 = !{!958, !963}
!963 = !DILocalVariable(name: "ipv4", arg: 2, scope: !959, file: !3, line: 212, type: !137)
!964 = !DILocation(line: 0, scope: !959, inlinedAt: !965)
!965 = distinct !DILocation(line: 670, column: 3, scope: !955)
!966 = !DILocation(line: 214, column: 32, scope: !959, inlinedAt: !965)
!967 = !DILocation(line: 214, column: 20, scope: !959, inlinedAt: !965)
!968 = !DILocation(line: 214, column: 2, scope: !959, inlinedAt: !965)
!969 = !DILocation(line: 215, column: 20, scope: !959, inlinedAt: !965)
!970 = !DILocation(line: 215, column: 2, scope: !959, inlinedAt: !965)
!971 = !DILocation(line: 216, column: 2, scope: !959, inlinedAt: !965)
!972 = !DILocation(line: 216, column: 27, scope: !959, inlinedAt: !965)
!973 = !DILocation(line: 672, column: 44, scope: !955)
!974 = !DILocation(line: 673, column: 19, scope: !955)
!975 = !DILocation(line: 0, scope: !959, inlinedAt: !976)
!976 = distinct !DILocation(line: 672, column: 3, scope: !955)
!977 = !DILocation(line: 214, column: 32, scope: !959, inlinedAt: !976)
!978 = !DILocation(line: 214, column: 20, scope: !959, inlinedAt: !976)
!979 = !DILocation(line: 214, column: 2, scope: !959, inlinedAt: !976)
!980 = !DILocation(line: 215, column: 20, scope: !959, inlinedAt: !976)
!981 = !DILocation(line: 215, column: 2, scope: !959, inlinedAt: !976)
!982 = !DILocation(line: 216, column: 2, scope: !959, inlinedAt: !976)
!983 = !DILocation(line: 216, column: 27, scope: !959, inlinedAt: !976)
!984 = !DILocation(line: 674, column: 20, scope: !955)
!985 = !{!948, !783, i64 2}
!986 = !DILocation(line: 674, column: 11, scope: !955)
!987 = !DILocation(line: 674, column: 18, scope: !955)
!988 = !{!778, !783, i64 120}
!989 = !DILocation(line: 675, column: 42, scope: !955)
!990 = !{!948, !574, i64 1}
!991 = !DILocation(line: 675, column: 11, scope: !955)
!992 = !DILocation(line: 675, column: 18, scope: !955)
!993 = !DILocation(line: 675, column: 27, scope: !955)
!994 = !DILocalVariable(name: "iph", arg: 1, scope: !995, file: !3, line: 408, type: !627)
!995 = distinct !DISubprogram(name: "parse_ip_ecn", scope: !3, file: !3, line: 408, type: !996, scopeLine: 409, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !998)
!996 = !DISubroutineType(types: !997)
!997 = !{!123, !627}
!998 = !{!994}
!999 = !DILocation(line: 0, scope: !995, inlinedAt: !1000)
!1000 = distinct !DILocation(line: 676, column: 9, scope: !955)
!1001 = !DILocation(line: 410, column: 14, scope: !995, inlinedAt: !1000)
!1002 = !DILocation(line: 677, column: 2, scope: !955)
!1003 = !DILocation(line: 678, column: 45, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !956, file: !3, line: 677, column: 9)
!1005 = !{i64 0, i64 16, !957, i64 0, i64 16, !957, i64 0, i64 16, !957}
!1006 = !DILocation(line: 679, column: 26, scope: !1004)
!1007 = !DILocation(line: 679, column: 45, scope: !1004)
!1008 = !DILocation(line: 680, column: 20, scope: !1004)
!1009 = !{!911, !783, i64 4}
!1010 = !DILocation(line: 680, column: 11, scope: !1004)
!1011 = !DILocation(line: 680, column: 18, scope: !1004)
!1012 = !DILocation(line: 682, column: 23, scope: !1004)
!1013 = !DILocation(line: 682, column: 4, scope: !1004)
!1014 = !{!573, !573, i64 0}
!1015 = !DILocation(line: 682, column: 28, scope: !1004)
!1016 = !DILocation(line: 681, column: 18, scope: !1004)
!1017 = !DILocation(line: 681, column: 27, scope: !1004)
!1018 = !DILocalVariable(name: "iph6", arg: 1, scope: !1019, file: !3, line: 413, type: !655)
!1019 = distinct !DISubprogram(name: "parse_ipv6_ecn", scope: !3, file: !3, line: 413, type: !1020, scopeLine: 414, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1022)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!123, !655}
!1022 = !{!1018}
!1023 = !DILocation(line: 0, scope: !1019, inlinedAt: !1024)
!1024 = distinct !DILocation(line: 683, column: 9, scope: !1004)
!1025 = !DILocation(line: 415, column: 10, scope: !1019, inlinedAt: !1024)
!1026 = !DILocation(line: 415, column: 28, scope: !1019, inlinedAt: !1024)
!1027 = !DILocation(line: 668, column: 14, scope: !595)
!1028 = !DILocation(line: 669, column: 23, scope: !956)
!1029 = !DILocation(line: 0, scope: !956)
!1030 = !DILocation(line: 685, column: 2, scope: !595)
!1031 = !DILocation(line: 689, column: 13, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !595, file: !3, line: 689, column: 6)
!1033 = !{!1034, !784, i64 29}
!1034 = !{!"bpf_config", !576, i64 0, !576, i64 8, !576, i64 16, !573, i64 24, !784, i64 28, !784, i64 29, !784, i64 30, !784, i64 31, !784, i64 32, !784, i64 33, !784, i64 34, !784, i64 35}
!1035 = !{i8 0, i8 2}
!1036 = !DILocation(line: 689, column: 23, scope: !1032)
!1037 = !DILocation(line: 691, column: 33, scope: !1032)
!1038 = !DILocation(line: 692, column: 33, scope: !1032)
!1039 = !DILocalVariable(name: "pctx", arg: 1, scope: !1040, file: !3, line: 483, type: !598)
!1040 = distinct !DISubprogram(name: "parse_tcp_identifier", scope: !3, file: !3, line: 483, type: !1041, scopeLine: 486, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1046)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!164, !598, !1043, !1044, !1044, !1045}
!1043 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !685, size: 64)
!1044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!1045 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !614, size: 64)
!1046 = !{!1039, !1047, !1048, !1049, !1050, !1051}
!1047 = !DILocalVariable(name: "tcph", arg: 2, scope: !1040, file: !3, line: 484, type: !1043)
!1048 = !DILocalVariable(name: "sport", arg: 3, scope: !1040, file: !3, line: 484, type: !1044)
!1049 = !DILocalVariable(name: "dport", arg: 4, scope: !1040, file: !3, line: 485, type: !1044)
!1050 = !DILocalVariable(name: "proto_info", arg: 5, scope: !1040, file: !3, line: 485, type: !1045)
!1051 = !DILocalVariable(name: "hdr", scope: !1040, file: !3, line: 487, type: !685)
!1052 = !DILocation(line: 0, scope: !1040, inlinedAt: !1053)
!1053 = distinct !DILocation(line: 690, column: 9, scope: !1032)
!1054 = !DILocation(line: 488, column: 36, scope: !1055, inlinedAt: !1053)
!1055 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 488, column: 6)
!1056 = !DILocalVariable(name: "nh", arg: 1, scope: !1057, file: !559, line: 295, type: !795)
!1057 = distinct !DISubprogram(name: "parse_tcphdr", scope: !559, file: !559, line: 295, type: !1058, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1060)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!164, !795, !106, !1043}
!1060 = !{!1056, !1061, !1062, !1063, !1064}
!1061 = !DILocalVariable(name: "data_end", arg: 2, scope: !1057, file: !559, line: 296, type: !106)
!1062 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !1057, file: !559, line: 297, type: !1043)
!1063 = !DILocalVariable(name: "len", scope: !1057, file: !559, line: 299, type: !164)
!1064 = !DILocalVariable(name: "h", scope: !1057, file: !559, line: 300, type: !685)
!1065 = !DILocation(line: 0, scope: !1057, inlinedAt: !1066)
!1066 = distinct !DILocation(line: 488, column: 6, scope: !1055, inlinedAt: !1053)
!1067 = !DILocation(line: 300, column: 25, scope: !1057, inlinedAt: !1066)
!1068 = !DILocation(line: 302, column: 8, scope: !1069, inlinedAt: !1066)
!1069 = distinct !DILexicalBlock(scope: !1057, file: !559, line: 302, column: 6)
!1070 = !DILocation(line: 302, column: 12, scope: !1069, inlinedAt: !1066)
!1071 = !DILocation(line: 302, column: 6, scope: !1057, inlinedAt: !1066)
!1072 = !DILocation(line: 305, column: 11, scope: !1057, inlinedAt: !1066)
!1073 = !DILocation(line: 305, column: 16, scope: !1057, inlinedAt: !1066)
!1074 = !DILocation(line: 307, column: 9, scope: !1075, inlinedAt: !1066)
!1075 = distinct !DILexicalBlock(scope: !1057, file: !559, line: 307, column: 5)
!1076 = !DILocation(line: 307, column: 5, scope: !1057, inlinedAt: !1066)
!1077 = !DILocation(line: 311, column: 14, scope: !1078, inlinedAt: !1066)
!1078 = distinct !DILexicalBlock(scope: !1057, file: !559, line: 311, column: 6)
!1079 = !DILocation(line: 311, column: 20, scope: !1078, inlinedAt: !1066)
!1080 = !DILocation(line: 311, column: 6, scope: !1057, inlinedAt: !1066)
!1081 = !DILocation(line: 314, column: 10, scope: !1057, inlinedAt: !1066)
!1082 = !DILocation(line: 491, column: 13, scope: !1083, inlinedAt: !1053)
!1083 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 491, column: 6)
!1084 = !{!1034, !784, i64 32}
!1085 = !DILocation(line: 491, column: 22, scope: !1083, inlinedAt: !1053)
!1086 = !DILocalVariable(name: "tcph", arg: 1, scope: !1087, file: !3, line: 424, type: !685)
!1087 = distinct !DISubprogram(name: "parse_tcp_ts", scope: !3, file: !3, line: 424, type: !1088, scopeLine: 426, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1090)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!164, !685, !106, !151, !151}
!1090 = !{!1086, !1091, !1092, !1093, !1094, !1095, !1096, !1097, !1098, !1099}
!1091 = !DILocalVariable(name: "data_end", arg: 2, scope: !1087, file: !3, line: 424, type: !106)
!1092 = !DILocalVariable(name: "tsval", arg: 3, scope: !1087, file: !3, line: 424, type: !151)
!1093 = !DILocalVariable(name: "tsecr", arg: 4, scope: !1087, file: !3, line: 425, type: !151)
!1094 = !DILocalVariable(name: "len", scope: !1087, file: !3, line: 427, type: !164)
!1095 = !DILocalVariable(name: "opt_end", scope: !1087, file: !3, line: 428, type: !106)
!1096 = !DILocalVariable(name: "pos", scope: !1087, file: !3, line: 429, type: !150)
!1097 = !DILocalVariable(name: "i", scope: !1087, file: !3, line: 430, type: !123)
!1098 = !DILocalVariable(name: "opt", scope: !1087, file: !3, line: 430, type: !123)
!1099 = !DILocalVariable(name: "opt_size", scope: !1087, file: !3, line: 432, type: !1100)
!1100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !123)
!1101 = !DILocation(line: 0, scope: !1087, inlinedAt: !1102)
!1102 = distinct !DILocation(line: 494, column: 6, scope: !1103, inlinedAt: !1053)
!1103 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 494, column: 6)
!1104 = !DILocation(line: 427, column: 23, scope: !1087, inlinedAt: !1102)
!1105 = !DILocation(line: 428, column: 31, scope: !1087, inlinedAt: !1102)
!1106 = !DILocation(line: 431, column: 2, scope: !1087, inlinedAt: !1102)
!1107 = !DILocation(line: 432, column: 3, scope: !1087, inlinedAt: !1102)
!1108 = !DILocation(line: 434, column: 26, scope: !1109, inlinedAt: !1102)
!1109 = distinct !DILexicalBlock(scope: !1087, file: !3, line: 434, column: 6)
!1110 = !DILocation(line: 438, column: 11, scope: !1111, inlinedAt: !1102)
!1111 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 438, column: 7)
!1112 = distinct !DILexicalBlock(scope: !1113, file: !3, line: 437, column: 40)
!1113 = distinct !DILexicalBlock(scope: !1114, file: !3, line: 437, column: 2)
!1114 = distinct !DILexicalBlock(scope: !1087, file: !3, line: 437, column: 2)
!1115 = !DILocation(line: 438, column: 15, scope: !1111, inlinedAt: !1102)
!1116 = !DILocation(line: 438, column: 25, scope: !1111, inlinedAt: !1102)
!1117 = !DILocation(line: 441, column: 9, scope: !1112, inlinedAt: !1102)
!1118 = !DILocation(line: 442, column: 7, scope: !1112, inlinedAt: !1102)
!1119 = !DILocation(line: 451, column: 11, scope: !1120, inlinedAt: !1102)
!1120 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 451, column: 7)
!1121 = !DILocation(line: 451, column: 15, scope: !1120, inlinedAt: !1102)
!1122 = !DILocation(line: 451, column: 25, scope: !1120, inlinedAt: !1102)
!1123 = !DILocation(line: 453, column: 14, scope: !1112, inlinedAt: !1102)
!1124 = !DILocation(line: 453, column: 12, scope: !1112, inlinedAt: !1102)
!1125 = !DILocation(line: 454, column: 7, scope: !1126, inlinedAt: !1102)
!1126 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 454, column: 7)
!1127 = !DILocation(line: 454, column: 16, scope: !1126, inlinedAt: !1102)
!1128 = !DILocation(line: 454, column: 7, scope: !1112, inlinedAt: !1102)
!1129 = !DILocation(line: 458, column: 11, scope: !1130, inlinedAt: !1102)
!1130 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 458, column: 7)
!1131 = !DILocation(line: 458, column: 16, scope: !1130, inlinedAt: !1102)
!1132 = !DILocation(line: 458, column: 19, scope: !1130, inlinedAt: !1102)
!1133 = !DILocation(line: 458, column: 28, scope: !1130, inlinedAt: !1102)
!1134 = !DILocation(line: 458, column: 7, scope: !1112, inlinedAt: !1102)
!1135 = !DILocation(line: 459, column: 12, scope: !1136, inlinedAt: !1102)
!1136 = distinct !DILexicalBlock(scope: !1137, file: !3, line: 459, column: 8)
!1137 = distinct !DILexicalBlock(scope: !1130, file: !3, line: 458, column: 35)
!1138 = !DILocation(line: 459, column: 17, scope: !1136, inlinedAt: !1102)
!1139 = !DILocation(line: 459, column: 27, scope: !1136, inlinedAt: !1102)
!1140 = !DILocation(line: 467, column: 10, scope: !1112, inlinedAt: !1102)
!1141 = !DILocation(line: 467, column: 7, scope: !1112, inlinedAt: !1102)
!1142 = !DILocation(line: 468, column: 2, scope: !1112, inlinedAt: !1102)
!1143 = !DILocation(line: 0, scope: !1112, inlinedAt: !1102)
!1144 = !DILocation(line: 470, column: 1, scope: !1087, inlinedAt: !1102)
!1145 = !DILocation(line: 494, column: 6, scope: !1040, inlinedAt: !1053)
!1146 = !DILocation(line: 461, column: 13, scope: !1137, inlinedAt: !1102)
!1147 = !DILocation(line: 462, column: 13, scope: !1137, inlinedAt: !1102)
!1148 = !DILocation(line: 500, column: 24, scope: !1040, inlinedAt: !1053)
!1149 = !DILocation(line: 500, column: 16, scope: !1040, inlinedAt: !1053)
!1150 = !DILocation(line: 500, column: 37, scope: !1040, inlinedAt: !1053)
!1151 = !DILocation(line: 500, column: 31, scope: !1040, inlinedAt: !1053)
!1152 = !DILocation(line: 500, column: 29, scope: !1040, inlinedAt: !1053)
!1153 = !DILocation(line: 500, column: 45, scope: !1040, inlinedAt: !1053)
!1154 = !DILocation(line: 499, column: 24, scope: !1040, inlinedAt: !1053)
!1155 = !DILocation(line: 503, column: 30, scope: !1040, inlinedAt: !1053)
!1156 = !DILocation(line: 506, column: 6, scope: !1157, inlinedAt: !1053)
!1157 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 506, column: 6)
!1158 = !DILocation(line: 506, column: 6, scope: !1040, inlinedAt: !1053)
!1159 = !DILocation(line: 509, column: 13, scope: !1160, inlinedAt: !1053)
!1160 = distinct !DILexicalBlock(scope: !1157, file: !3, line: 509, column: 13)
!1161 = !DILocation(line: 509, column: 13, scope: !1157, inlinedAt: !1053)
!1162 = !DILocation(line: 515, column: 4, scope: !1163, inlinedAt: !1053)
!1163 = distinct !DILexicalBlock(scope: !1164, file: !3, line: 512, column: 23)
!1164 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 512, column: 13)
!1165 = !DILocation(line: 517, column: 2, scope: !1163, inlinedAt: !1053)
!1166 = !DILocation(line: 0, scope: !1157, inlinedAt: !1053)
!1167 = !DILocation(line: 523, column: 16, scope: !1040, inlinedAt: !1053)
!1168 = !{!1169, !783, i64 0}
!1169 = !{!"tcphdr", !783, i64 0, !783, i64 2, !573, i64 4, !573, i64 8, !783, i64 12, !783, i64 12, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 13, !783, i64 14, !783, i64 16, !783, i64 18}
!1170 = !DILocation(line: 523, column: 9, scope: !1040, inlinedAt: !1053)
!1171 = !DILocation(line: 524, column: 16, scope: !1040, inlinedAt: !1053)
!1172 = !{!1169, !783, i64 2}
!1173 = !DILocation(line: 524, column: 9, scope: !1040, inlinedAt: !1053)
!1174 = !DILocation(line: 243, column: 19, scope: !1175, inlinedAt: !1181)
!1175 = distinct !DISubprogram(name: "reverse_flow", scope: !3, file: !3, line: 241, type: !1176, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1178)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{null, !108, !108}
!1178 = !{!1179, !1180}
!1179 = !DILocalVariable(name: "dest", arg: 1, scope: !1175, file: !3, line: 241, type: !108)
!1180 = !DILocalVariable(name: "src", arg: 2, scope: !1175, file: !3, line: 241, type: !108)
!1181 = distinct !DILocation(line: 723, column: 3, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1183, file: !3, line: 710, column: 9)
!1183 = distinct !DILexicalBlock(scope: !595, file: !3, line: 707, column: 6)
!1184 = !{!780, !574, i64 42}
!1185 = !DILocation(line: 527, column: 2, scope: !1040, inlinedAt: !1053)
!1186 = !DILocation(line: 694, column: 18, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 694, column: 11)
!1188 = !{!1034, !784, i64 30}
!1189 = !DILocation(line: 694, column: 29, scope: !1187)
!1190 = !DILocation(line: 695, column: 21, scope: !1187)
!1191 = !DILocation(line: 695, column: 25, scope: !1187)
!1192 = !DILocation(line: 694, column: 11, scope: !1032)
!1193 = !DILocation(line: 700, column: 18, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 700, column: 11)
!1195 = !DILocation(line: 700, column: 29, scope: !1194)
!1196 = !DILocation(line: 697, column: 35, scope: !1187)
!1197 = !DILocation(line: 698, column: 35, scope: !1187)
!1198 = !DILocalVariable(name: "pctx", arg: 1, scope: !1199, file: !3, line: 545, type: !598)
!1199 = distinct !DISubprogram(name: "parse_icmp6_identifier", scope: !3, file: !3, line: 545, type: !1200, scopeLine: 549, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1203)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!164, !598, !1202, !1044, !1044, !1045}
!1202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !731, size: 64)
!1203 = !{!1198, !1204, !1205, !1206, !1207, !1208}
!1204 = !DILocalVariable(name: "icmp6h", arg: 2, scope: !1199, file: !3, line: 546, type: !1202)
!1205 = !DILocalVariable(name: "sport", arg: 3, scope: !1199, file: !3, line: 546, type: !1044)
!1206 = !DILocalVariable(name: "dport", arg: 4, scope: !1199, file: !3, line: 547, type: !1044)
!1207 = !DILocalVariable(name: "proto_info", arg: 5, scope: !1199, file: !3, line: 548, type: !1045)
!1208 = !DILocalVariable(name: "hdr", scope: !1199, file: !3, line: 550, type: !731)
!1209 = !DILocation(line: 0, scope: !1199, inlinedAt: !1210)
!1210 = distinct !DILocation(line: 696, column: 9, scope: !1187)
!1211 = !DILocation(line: 551, column: 38, scope: !1212, inlinedAt: !1210)
!1212 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 551, column: 6)
!1213 = !DILocalVariable(name: "nh", arg: 1, scope: !1214, file: !559, line: 224, type: !795)
!1214 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !559, file: !559, line: 224, type: !1215, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1217)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!164, !795, !106, !1202}
!1217 = !{!1213, !1218, !1219, !1220}
!1218 = !DILocalVariable(name: "data_end", arg: 2, scope: !1214, file: !559, line: 225, type: !106)
!1219 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !1214, file: !559, line: 226, type: !1202)
!1220 = !DILocalVariable(name: "icmp6h", scope: !1214, file: !559, line: 228, type: !731)
!1221 = !DILocation(line: 0, scope: !1214, inlinedAt: !1222)
!1222 = distinct !DILocation(line: 551, column: 6, scope: !1212, inlinedAt: !1210)
!1223 = !DILocation(line: 228, column: 32, scope: !1214, inlinedAt: !1222)
!1224 = !DILocation(line: 230, column: 13, scope: !1225, inlinedAt: !1222)
!1225 = distinct !DILexicalBlock(scope: !1214, file: !559, line: 230, column: 6)
!1226 = !DILocation(line: 230, column: 17, scope: !1225, inlinedAt: !1222)
!1227 = !DILocation(line: 230, column: 6, scope: !1214, inlinedAt: !1222)
!1228 = !DILocation(line: 233, column: 14, scope: !1214, inlinedAt: !1222)
!1229 = !DILocation(line: 233, column: 12, scope: !1214, inlinedAt: !1222)
!1230 = !DILocation(line: 554, column: 11, scope: !1231, inlinedAt: !1210)
!1231 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 554, column: 6)
!1232 = !{!1233, !574, i64 1}
!1233 = !{!"icmp6hdr", !574, i64 0, !574, i64 1, !783, i64 2, !574, i64 4}
!1234 = !DILocation(line: 554, column: 22, scope: !1231, inlinedAt: !1210)
!1235 = !DILocation(line: 554, column: 6, scope: !1199, inlinedAt: !1210)
!1236 = !DILocation(line: 557, column: 11, scope: !1237, inlinedAt: !1210)
!1237 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 557, column: 6)
!1238 = !{!1233, !574, i64 0}
!1239 = !DILocation(line: 557, column: 6, scope: !1199, inlinedAt: !1210)
!1240 = !DILocation(line: 558, column: 26, scope: !1241, inlinedAt: !1210)
!1241 = distinct !DILexicalBlock(scope: !1237, file: !3, line: 557, column: 46)
!1242 = !DILocation(line: 558, column: 21, scope: !1241, inlinedAt: !1210)
!1243 = !DILocation(line: 562, column: 2, scope: !1241, inlinedAt: !1210)
!1244 = !DILocation(line: 563, column: 32, scope: !1245, inlinedAt: !1210)
!1245 = distinct !DILexicalBlock(scope: !1246, file: !3, line: 562, column: 51)
!1246 = distinct !DILexicalBlock(scope: !1237, file: !3, line: 562, column: 13)
!1247 = !DILocation(line: 563, column: 27, scope: !1245, inlinedAt: !1210)
!1248 = !DILocation(line: 0, scope: !1237, inlinedAt: !1210)
!1249 = !DILocation(line: 574, column: 16, scope: !1199, inlinedAt: !1210)
!1250 = !DILocation(line: 574, column: 9, scope: !1199, inlinedAt: !1210)
!1251 = !DILocation(line: 575, column: 16, scope: !1199, inlinedAt: !1210)
!1252 = !DILocation(line: 575, column: 9, scope: !1199, inlinedAt: !1210)
!1253 = !DILocation(line: 578, column: 2, scope: !1199, inlinedAt: !1210)
!1254 = !DILocation(line: 701, column: 21, scope: !1194)
!1255 = !DILocation(line: 701, column: 25, scope: !1194)
!1256 = !DILocation(line: 700, column: 11, scope: !1187)
!1257 = !DILocation(line: 703, column: 34, scope: !1194)
!1258 = !DILocation(line: 704, column: 34, scope: !1194)
!1259 = !DILocalVariable(name: "pctx", arg: 1, scope: !1260, file: !3, line: 584, type: !598)
!1260 = distinct !DISubprogram(name: "parse_icmp_identifier", scope: !3, file: !3, line: 584, type: !1261, scopeLine: 587, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1264)
!1261 = !DISubroutineType(types: !1262)
!1262 = !{!164, !598, !1263, !1044, !1044, !1045}
!1263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64)
!1264 = !{!1259, !1265, !1266, !1267, !1268, !1269}
!1265 = !DILocalVariable(name: "icmph", arg: 2, scope: !1260, file: !3, line: 585, type: !1263)
!1266 = !DILocalVariable(name: "sport", arg: 3, scope: !1260, file: !3, line: 585, type: !1044)
!1267 = !DILocalVariable(name: "dport", arg: 4, scope: !1260, file: !3, line: 586, type: !1044)
!1268 = !DILocalVariable(name: "proto_info", arg: 5, scope: !1260, file: !3, line: 586, type: !1045)
!1269 = !DILocalVariable(name: "hdr", scope: !1260, file: !3, line: 588, type: !707)
!1270 = !DILocation(line: 0, scope: !1260, inlinedAt: !1271)
!1271 = distinct !DILocation(line: 702, column: 9, scope: !1194)
!1272 = !DILocation(line: 589, column: 37, scope: !1273, inlinedAt: !1271)
!1273 = distinct !DILexicalBlock(scope: !1260, file: !3, line: 589, column: 6)
!1274 = !DILocalVariable(name: "nh", arg: 1, scope: !1275, file: !559, line: 239, type: !795)
!1275 = distinct !DISubprogram(name: "parse_icmphdr", scope: !559, file: !559, line: 239, type: !1276, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1278)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!164, !795, !106, !1263}
!1278 = !{!1274, !1279, !1280, !1281}
!1279 = !DILocalVariable(name: "data_end", arg: 2, scope: !1275, file: !559, line: 240, type: !106)
!1280 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !1275, file: !559, line: 241, type: !1263)
!1281 = !DILocalVariable(name: "icmph", scope: !1275, file: !559, line: 243, type: !707)
!1282 = !DILocation(line: 0, scope: !1275, inlinedAt: !1283)
!1283 = distinct !DILocation(line: 589, column: 6, scope: !1273, inlinedAt: !1271)
!1284 = !DILocation(line: 243, column: 30, scope: !1275, inlinedAt: !1283)
!1285 = !DILocation(line: 245, column: 12, scope: !1286, inlinedAt: !1283)
!1286 = distinct !DILexicalBlock(scope: !1275, file: !559, line: 245, column: 6)
!1287 = !DILocation(line: 245, column: 16, scope: !1286, inlinedAt: !1283)
!1288 = !DILocation(line: 245, column: 6, scope: !1275, inlinedAt: !1283)
!1289 = !DILocation(line: 248, column: 13, scope: !1275, inlinedAt: !1283)
!1290 = !DILocation(line: 248, column: 11, scope: !1275, inlinedAt: !1283)
!1291 = !DILocation(line: 592, column: 11, scope: !1292, inlinedAt: !1271)
!1292 = distinct !DILexicalBlock(scope: !1260, file: !3, line: 592, column: 6)
!1293 = !{!1294, !574, i64 1}
!1294 = !{!"icmphdr", !574, i64 0, !574, i64 1, !783, i64 2, !574, i64 4}
!1295 = !DILocation(line: 592, column: 16, scope: !1292, inlinedAt: !1271)
!1296 = !DILocation(line: 592, column: 6, scope: !1260, inlinedAt: !1271)
!1297 = !DILocation(line: 595, column: 11, scope: !1298, inlinedAt: !1271)
!1298 = distinct !DILexicalBlock(scope: !1260, file: !3, line: 595, column: 6)
!1299 = !{!1294, !574, i64 0}
!1300 = !DILocation(line: 595, column: 6, scope: !1260, inlinedAt: !1271)
!1301 = !DILocation(line: 596, column: 26, scope: !1302, inlinedAt: !1271)
!1302 = distinct !DILexicalBlock(scope: !1298, file: !3, line: 595, column: 30)
!1303 = !DILocation(line: 596, column: 29, scope: !1302, inlinedAt: !1271)
!1304 = !DILocation(line: 596, column: 34, scope: !1302, inlinedAt: !1271)
!1305 = !DILocation(line: 596, column: 21, scope: !1302, inlinedAt: !1271)
!1306 = !DILocation(line: 600, column: 2, scope: !1302, inlinedAt: !1271)
!1307 = !DILocation(line: 601, column: 32, scope: !1308, inlinedAt: !1271)
!1308 = distinct !DILexicalBlock(scope: !1309, file: !3, line: 600, column: 42)
!1309 = distinct !DILexicalBlock(scope: !1298, file: !3, line: 600, column: 13)
!1310 = !DILocation(line: 601, column: 35, scope: !1308, inlinedAt: !1271)
!1311 = !DILocation(line: 601, column: 40, scope: !1308, inlinedAt: !1271)
!1312 = !DILocation(line: 601, column: 27, scope: !1308, inlinedAt: !1271)
!1313 = !DILocation(line: 0, scope: !1298, inlinedAt: !1271)
!1314 = !DILocation(line: 612, column: 16, scope: !1260, inlinedAt: !1271)
!1315 = !DILocation(line: 612, column: 24, scope: !1260, inlinedAt: !1271)
!1316 = !DILocation(line: 612, column: 9, scope: !1260, inlinedAt: !1271)
!1317 = !DILocation(line: 613, column: 24, scope: !1260, inlinedAt: !1271)
!1318 = !DILocation(line: 613, column: 9, scope: !1260, inlinedAt: !1271)
!1319 = !DILocation(line: 616, column: 2, scope: !1260, inlinedAt: !1271)
!1320 = !DILocation(line: 0, scope: !1183)
!1321 = !DILocation(line: 709, column: 25, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1183, file: !3, line: 707, column: 11)
!1323 = !{!778, !784, i64 129}
!1324 = !DILocation(line: 710, column: 2, scope: !1322)
!1325 = !DILocation(line: 713, column: 25, scope: !1182)
!1326 = !DILocation(line: 715, column: 15, scope: !1182)
!1327 = !DILocation(line: 715, column: 26, scope: !1182)
!1328 = !{!778, !573, i64 60}
!1329 = !DILocation(line: 716, column: 11, scope: !1182)
!1330 = !DILocation(line: 716, column: 21, scope: !1182)
!1331 = !{!778, !784, i64 124}
!1332 = !DILocation(line: 717, column: 21, scope: !1182)
!1333 = !DILocation(line: 717, column: 32, scope: !1182)
!1334 = !{!778, !573, i64 108}
!1335 = !DILocation(line: 718, column: 11, scope: !1182)
!1336 = !DILocation(line: 718, column: 27, scope: !1182)
!1337 = !{!778, !784, i64 125}
!1338 = !DILocation(line: 719, column: 11, scope: !1182)
!1339 = !DILocation(line: 719, column: 22, scope: !1182)
!1340 = !{!778, !574, i64 126}
!1341 = !DILocation(line: 720, column: 11, scope: !1182)
!1342 = !DILocation(line: 720, column: 24, scope: !1182)
!1343 = !{!778, !574, i64 127}
!1344 = !DILocation(line: 721, column: 11, scope: !1182)
!1345 = !DILocation(line: 721, column: 27, scope: !1182)
!1346 = !{!778, !784, i64 128}
!1347 = !DILocation(line: 723, column: 35, scope: !1182)
!1348 = !DILocation(line: 0, scope: !1175, inlinedAt: !1181)
!1349 = !DILocation(line: 243, column: 8, scope: !1175, inlinedAt: !1181)
!1350 = !DILocation(line: 243, column: 12, scope: !1175, inlinedAt: !1181)
!1351 = !DILocation(line: 244, column: 21, scope: !1175, inlinedAt: !1181)
!1352 = !{!780, !783, i64 40}
!1353 = !DILocation(line: 244, column: 8, scope: !1175, inlinedAt: !1181)
!1354 = !DILocation(line: 244, column: 14, scope: !1175, inlinedAt: !1181)
!1355 = !DILocation(line: 245, column: 21, scope: !1175, inlinedAt: !1181)
!1356 = !{i64 0, i64 16, !957, i64 0, i64 16, !957, i64 0, i64 16, !957, i64 16, i64 2, !833, i64 18, i64 2, !833}
!1357 = !DILocation(line: 246, column: 8, scope: !1175, inlinedAt: !1181)
!1358 = !DILocation(line: 246, column: 21, scope: !1175, inlinedAt: !1181)
!1359 = !DILocation(line: 247, column: 8, scope: !1175, inlinedAt: !1181)
!1360 = !DILocation(line: 247, column: 17, scope: !1175, inlinedAt: !1181)
!1361 = !{!780, !574, i64 43}
!1362 = !DILocation(line: 725, column: 31, scope: !1182)
!1363 = !DILocation(line: 725, column: 11, scope: !1182)
!1364 = !DILocation(line: 725, column: 29, scope: !1182)
!1365 = !{!778, !784, i64 123}
!1366 = !DILocalVariable(name: "ctx", arg: 1, scope: !1367, file: !3, line: 227, type: !598)
!1367 = distinct !DISubprogram(name: "remaining_pkt_payload", scope: !3, file: !3, line: 227, type: !1368, scopeLine: 228, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1370)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!138, !598}
!1370 = !{!1366, !1371}
!1371 = !DILocalVariable(name: "parsed_bytes", scope: !1367, file: !3, line: 231, type: !138)
!1372 = !DILocation(line: 0, scope: !1367, inlinedAt: !1373)
!1373 = distinct !DILocation(line: 726, column: 21, scope: !1182)
!1374 = !DILocation(line: 231, column: 31, scope: !1367, inlinedAt: !1373)
!1375 = !{!580, !581, i64 16}
!1376 = !DILocation(line: 231, column: 42, scope: !1367, inlinedAt: !1373)
!1377 = !DILocation(line: 231, column: 35, scope: !1367, inlinedAt: !1373)
!1378 = !DILocation(line: 231, column: 23, scope: !1367, inlinedAt: !1373)
!1379 = !DILocation(line: 232, column: 29, scope: !1367, inlinedAt: !1373)
!1380 = !DILocation(line: 232, column: 9, scope: !1367, inlinedAt: !1373)
!1381 = !DILocation(line: 726, column: 11, scope: !1182)
!1382 = !DILocation(line: 726, column: 19, scope: !1182)
!1383 = !{!778, !573, i64 12}
!1384 = !DILocation(line: 369, column: 14, scope: !1385, inlinedAt: !1395)
!1385 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 369, column: 6)
!1386 = distinct !DISubprogram(name: "update_global_counters", scope: !3, file: !3, line: 367, type: !1387, scopeLine: 368, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1389)
!1387 = !DISubroutineType(types: !1388)
!1388 = !{null, !123, !138, !123}
!1389 = !{!1390, !1391, !1392, !1393, !1394}
!1390 = !DILocalVariable(name: "ipproto", arg: 1, scope: !1386, file: !3, line: 367, type: !123)
!1391 = !DILocalVariable(name: "pkt_len", arg: 2, scope: !1386, file: !3, line: 367, type: !138)
!1392 = !DILocalVariable(name: "ecn", arg: 3, scope: !1386, file: !3, line: 367, type: !123)
!1393 = !DILocalVariable(name: "counters", scope: !1386, file: !3, line: 372, type: !301)
!1394 = !DILocalVariable(name: "key", scope: !1386, file: !3, line: 373, type: !138)
!1395 = distinct !DILocation(line: 732, column: 2, scope: !595)
!1396 = !DILocation(line: 731, column: 1, scope: !595)
!1397 = !DILocation(line: 0, scope: !1386, inlinedAt: !1395)
!1398 = !{!1034, !784, i64 34}
!1399 = !DILocation(line: 369, column: 6, scope: !1386, inlinedAt: !1395)
!1400 = !DILocation(line: 373, column: 2, scope: !1386, inlinedAt: !1395)
!1401 = !DILocation(line: 373, column: 8, scope: !1386, inlinedAt: !1395)
!1402 = !DILocation(line: 375, column: 13, scope: !1386, inlinedAt: !1395)
!1403 = !DILocation(line: 376, column: 7, scope: !1404, inlinedAt: !1395)
!1404 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 376, column: 6)
!1405 = !DILocation(line: 376, column: 6, scope: !1386, inlinedAt: !1395)
!1406 = !DILocation(line: 381, column: 13, scope: !1407, inlinedAt: !1395)
!1407 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 379, column: 19)
!1408 = !DILocation(line: 381, column: 23, scope: !1407, inlinedAt: !1395)
!1409 = !{!1410, !576, i64 56}
!1410 = !{!"global_counters", !1411, i64 0, !1412, i64 32, !576, i64 56, !576, i64 64, !576, i64 72, !576, i64 80, !576, i64 88, !576, i64 96, !576, i64 104, !576, i64 112, !576, i64 120, !576, i64 128, !574, i64 136}
!1411 = !{!"ecn_counters", !576, i64 0, !576, i64 8, !576, i64 16, !576, i64 24}
!1412 = !{!"pping_error_counters", !576, i64 0, !576, i64 8, !576, i64 16}
!1413 = !DILocation(line: 382, column: 28, scope: !1407, inlinedAt: !1395)
!1414 = !DILocation(line: 382, column: 13, scope: !1407, inlinedAt: !1395)
!1415 = !{!576, !576, i64 0}
!1416 = !DILocation(line: 406, column: 1, scope: !1386, inlinedAt: !1395)
!1417 = !DILocation(line: 734, column: 1, scope: !595)
!1418 = distinct !DISubprogram(name: "parse_packet_identifer_xdp", scope: !3, file: !3, line: 759, type: !1419, scopeLine: 761, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1430)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!164, !1421, !339}
!1421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1422, size: 64)
!1422 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !23, line: 4374, size: 192, elements: !1423)
!1423 = !{!1424, !1425, !1426, !1427, !1428, !1429}
!1424 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !1422, file: !23, line: 4375, baseType: !138, size: 32)
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !1422, file: !23, line: 4376, baseType: !138, size: 32, offset: 32)
!1426 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !1422, file: !23, line: 4377, baseType: !138, size: 32, offset: 64)
!1427 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !1422, file: !23, line: 4379, baseType: !138, size: 32, offset: 96)
!1428 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !1422, file: !23, line: 4380, baseType: !138, size: 32, offset: 128)
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !1422, file: !23, line: 4382, baseType: !138, size: 32, offset: 160)
!1430 = !{!1431, !1432, !1433}
!1431 = !DILocalVariable(name: "ctx", arg: 1, scope: !1418, file: !3, line: 759, type: !1421)
!1432 = !DILocalVariable(name: "p_info", arg: 2, scope: !1418, file: !3, line: 760, type: !339)
!1433 = !DILocalVariable(name: "pctx", scope: !1418, file: !3, line: 765, type: !553)
!1434 = !DILocation(line: 0, scope: !1418)
!1435 = !DILocation(line: 762, column: 7, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1418, file: !3, line: 762, column: 6)
!1437 = !DILocation(line: 762, column: 6, scope: !1418)
!1438 = !DILocation(line: 765, column: 2, scope: !1418)
!1439 = !DILocation(line: 765, column: 25, scope: !1418)
!1440 = !DILocation(line: 765, column: 32, scope: !1418)
!1441 = !DILocation(line: 766, column: 30, scope: !1418)
!1442 = !{!1443, !573, i64 0}
!1443 = !{!"xdp_md", !573, i64 0, !573, i64 4, !573, i64 8, !573, i64 12, !573, i64 16, !573, i64 20}
!1444 = !DILocation(line: 766, column: 19, scope: !1418)
!1445 = !DILocation(line: 766, column: 11, scope: !1418)
!1446 = !DILocation(line: 767, column: 34, scope: !1418)
!1447 = !{!1443, !573, i64 4}
!1448 = !DILocation(line: 767, column: 23, scope: !1418)
!1449 = !DILocation(line: 767, column: 15, scope: !1418)
!1450 = !DILocation(line: 768, column: 9, scope: !1418)
!1451 = !DILocation(line: 769, column: 14, scope: !1418)
!1452 = !DILocation(line: 772, column: 9, scope: !1418)
!1453 = !DILocation(line: 773, column: 1, scope: !1418)
!1454 = distinct !DISubprogram(name: "pping_tc_egress", scope: !3, file: !3, line: 1436, type: !1455, scopeLine: 1437, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1457)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!164, !461}
!1457 = !{!1458}
!1458 = !DILocalVariable(name: "skb", arg: 1, scope: !1454, file: !3, line: 1436, type: !461)
!1459 = !DILocation(line: 0, scope: !1454)
!1460 = !DILocalVariable(name: "ctx", arg: 1, scope: !1461, file: !3, line: 1353, type: !461)
!1461 = distinct !DISubprogram(name: "pping_tc", scope: !3, file: !3, line: 1353, type: !1462, scopeLine: 1354, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1464)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{null, !461, !204}
!1464 = !{!1460, !1465, !1466, !1467}
!1465 = !DILocalVariable(name: "is_ingress", arg: 2, scope: !1461, file: !3, line: 1353, type: !204)
!1466 = !DILocalVariable(name: "p_info", scope: !1461, file: !3, line: 1355, type: !339)
!1467 = !DILocalVariable(name: "key", scope: !1461, file: !3, line: 1356, type: !138)
!1468 = !DILocation(line: 0, scope: !1461, inlinedAt: !1469)
!1469 = distinct !DILocation(line: 1438, column: 2, scope: !1454)
!1470 = !DILocation(line: 1356, column: 2, scope: !1461, inlinedAt: !1469)
!1471 = !DILocation(line: 1356, column: 8, scope: !1461, inlinedAt: !1469)
!1472 = !DILocation(line: 1358, column: 11, scope: !1461, inlinedAt: !1469)
!1473 = !DILocation(line: 1359, column: 7, scope: !1474, inlinedAt: !1469)
!1474 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1359, column: 6)
!1475 = !DILocation(line: 1359, column: 6, scope: !1461, inlinedAt: !1469)
!1476 = !DILocation(line: 1362, column: 6, scope: !1477, inlinedAt: !1469)
!1477 = distinct !DILexicalBlock(scope: !1461, file: !3, line: 1362, column: 6)
!1478 = !DILocation(line: 1362, column: 45, scope: !1477, inlinedAt: !1469)
!1479 = !DILocation(line: 1362, column: 6, scope: !1461, inlinedAt: !1469)
!1480 = !DILocation(line: 1365, column: 10, scope: !1461, inlinedAt: !1469)
!1481 = !DILocation(line: 1365, column: 21, scope: !1461, inlinedAt: !1469)
!1482 = !{!778, !784, i64 122}
!1483 = !DILocation(line: 1366, column: 10, scope: !1461, inlinedAt: !1469)
!1484 = !DILocation(line: 1366, column: 26, scope: !1461, inlinedAt: !1469)
!1485 = !{!778, !573, i64 112}
!1486 = !DILocation(line: 1368, column: 22, scope: !1461, inlinedAt: !1469)
!1487 = !DILocation(line: 1368, column: 2, scope: !1461, inlinedAt: !1469)
!1488 = !DILocation(line: 1369, column: 1, scope: !1461, inlinedAt: !1469)
!1489 = !DILocation(line: 1440, column: 2, scope: !1454)
!1490 = distinct !DISubprogram(name: "pping_tc_ingress", scope: !3, file: !3, line: 1445, type: !1455, scopeLine: 1446, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1491)
!1491 = !{!1492}
!1492 = !DILocalVariable(name: "skb", arg: 1, scope: !1490, file: !3, line: 1445, type: !461)
!1493 = !DILocation(line: 0, scope: !1490)
!1494 = !DILocation(line: 0, scope: !1461, inlinedAt: !1495)
!1495 = distinct !DILocation(line: 1447, column: 2, scope: !1490)
!1496 = !DILocation(line: 1356, column: 2, scope: !1461, inlinedAt: !1495)
!1497 = !DILocation(line: 1356, column: 8, scope: !1461, inlinedAt: !1495)
!1498 = !DILocation(line: 1358, column: 11, scope: !1461, inlinedAt: !1495)
!1499 = !DILocation(line: 1359, column: 7, scope: !1474, inlinedAt: !1495)
!1500 = !DILocation(line: 1359, column: 6, scope: !1461, inlinedAt: !1495)
!1501 = !DILocation(line: 1362, column: 6, scope: !1477, inlinedAt: !1495)
!1502 = !DILocation(line: 1362, column: 45, scope: !1477, inlinedAt: !1495)
!1503 = !DILocation(line: 1362, column: 6, scope: !1461, inlinedAt: !1495)
!1504 = !DILocation(line: 1365, column: 10, scope: !1461, inlinedAt: !1495)
!1505 = !DILocation(line: 1365, column: 21, scope: !1461, inlinedAt: !1495)
!1506 = !DILocation(line: 1366, column: 46, scope: !1461, inlinedAt: !1495)
!1507 = !{!572, !573, i64 36}
!1508 = !DILocation(line: 1366, column: 10, scope: !1461, inlinedAt: !1495)
!1509 = !DILocation(line: 1366, column: 26, scope: !1461, inlinedAt: !1495)
!1510 = !DILocation(line: 1368, column: 22, scope: !1461, inlinedAt: !1495)
!1511 = !DILocation(line: 1368, column: 2, scope: !1461, inlinedAt: !1495)
!1512 = !DILocation(line: 1369, column: 1, scope: !1461, inlinedAt: !1495)
!1513 = !DILocation(line: 1449, column: 2, scope: !1490)
!1514 = distinct !DISubprogram(name: "pping_xdp_ingress", scope: !3, file: !3, line: 1454, type: !1515, scopeLine: 1455, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1517)
!1515 = !DISubroutineType(types: !1516)
!1516 = !{!164, !1421}
!1517 = !{!1518}
!1518 = !DILocalVariable(name: "ctx", arg: 1, scope: !1514, file: !3, line: 1454, type: !1421)
!1519 = !DILocation(line: 0, scope: !1514)
!1520 = !DILocalVariable(name: "ctx", arg: 1, scope: !1521, file: !3, line: 1371, type: !1421)
!1521 = distinct !DISubprogram(name: "pping_xdp", scope: !3, file: !3, line: 1371, type: !1522, scopeLine: 1372, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1524)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{null, !1421}
!1524 = !{!1520, !1525, !1526}
!1525 = !DILocalVariable(name: "p_info", scope: !1521, file: !3, line: 1373, type: !339)
!1526 = !DILocalVariable(name: "key", scope: !1521, file: !3, line: 1374, type: !138)
!1527 = !DILocation(line: 0, scope: !1521, inlinedAt: !1528)
!1528 = distinct !DILocation(line: 1456, column: 2, scope: !1514)
!1529 = !DILocation(line: 1374, column: 2, scope: !1521, inlinedAt: !1528)
!1530 = !DILocation(line: 1374, column: 8, scope: !1521, inlinedAt: !1528)
!1531 = !DILocation(line: 1376, column: 11, scope: !1521, inlinedAt: !1528)
!1532 = !DILocation(line: 1377, column: 7, scope: !1533, inlinedAt: !1528)
!1533 = distinct !DILexicalBlock(scope: !1521, file: !3, line: 1377, column: 6)
!1534 = !DILocation(line: 1377, column: 6, scope: !1521, inlinedAt: !1528)
!1535 = !DILocation(line: 1380, column: 6, scope: !1536, inlinedAt: !1528)
!1536 = distinct !DILexicalBlock(scope: !1521, file: !3, line: 1380, column: 6)
!1537 = !DILocation(line: 1380, column: 46, scope: !1536, inlinedAt: !1528)
!1538 = !DILocation(line: 1380, column: 6, scope: !1521, inlinedAt: !1528)
!1539 = !DILocation(line: 1383, column: 10, scope: !1521, inlinedAt: !1528)
!1540 = !DILocation(line: 1383, column: 21, scope: !1521, inlinedAt: !1528)
!1541 = !DILocation(line: 1384, column: 33, scope: !1521, inlinedAt: !1528)
!1542 = !{!1443, !573, i64 12}
!1543 = !DILocation(line: 1384, column: 10, scope: !1521, inlinedAt: !1528)
!1544 = !DILocation(line: 1384, column: 26, scope: !1521, inlinedAt: !1528)
!1545 = !DILocation(line: 1386, column: 22, scope: !1521, inlinedAt: !1528)
!1546 = !DILocation(line: 1386, column: 2, scope: !1521, inlinedAt: !1528)
!1547 = !DILocation(line: 1387, column: 1, scope: !1521, inlinedAt: !1528)
!1548 = !DILocation(line: 1458, column: 2, scope: !1514)
!1549 = distinct !DISubprogram(name: "tsmap_cleanup", scope: !3, file: !3, line: 1462, type: !1550, scopeLine: 1463, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1569)
!1550 = !DISubroutineType(types: !1551)
!1551 = !{!164, !1552}
!1552 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1553, size: 64)
!1553 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_iter__bpf_map_elem", file: !3, line: 59, size: 256, elements: !1554)
!1554 = !{!1555, !1564, !1567, !1568}
!1555 = !DIDerivedType(tag: DW_TAG_member, name: "meta", scope: !1553, file: !3, line: 60, baseType: !1556, size: 64)
!1556 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1557, size: 64)
!1557 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_iter_meta", file: !3, line: 53, size: 192, elements: !1558)
!1558 = !{!1559, !1562, !1563}
!1559 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !1557, file: !3, line: 54, baseType: !1560, size: 64)
!1560 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1561, size: 64)
!1561 = !DICompositeType(tag: DW_TAG_structure_type, name: "seq_file", file: !384, line: 24, flags: DIFlagFwdDecl)
!1562 = !DIDerivedType(tag: DW_TAG_member, name: "session_id", scope: !1557, file: !3, line: 55, baseType: !153, size: 64, offset: 64)
!1563 = !DIDerivedType(tag: DW_TAG_member, name: "seq_num", scope: !1557, file: !3, line: 56, baseType: !153, size: 64, offset: 128)
!1564 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !1553, file: !3, line: 61, baseType: !1565, size: 64, offset: 64)
!1565 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1566, size: 64)
!1566 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map", file: !3, line: 61, flags: DIFlagFwdDecl)
!1567 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !1553, file: !3, line: 62, baseType: !106, size: 64, offset: 128)
!1568 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !1553, file: !3, line: 63, baseType: !106, size: 64, offset: 192)
!1569 = !{!1570, !1571, !1572, !1574, !1575, !1576, !1577, !1578, !1579}
!1570 = !DILocalVariable(name: "ctx", arg: 1, scope: !1549, file: !3, line: 1462, type: !1552)
!1571 = !DILocalVariable(name: "local_pid", scope: !1549, file: !3, line: 1464, type: !169)
!1572 = !DILocalVariable(name: "f_state", scope: !1549, file: !3, line: 1465, type: !1573)
!1573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64)
!1574 = !DILocalVariable(name: "df_state", scope: !1549, file: !3, line: 1466, type: !186)
!1575 = !DILocalVariable(name: "df_key", scope: !1549, file: !3, line: 1467, type: !109)
!1576 = !DILocalVariable(name: "pid", scope: !1549, file: !3, line: 1468, type: !168)
!1577 = !DILocalVariable(name: "timestamp", scope: !1549, file: !3, line: 1469, type: !152)
!1578 = !DILocalVariable(name: "now", scope: !1549, file: !3, line: 1470, type: !153)
!1579 = !DILocalVariable(name: "rtt", scope: !1549, file: !3, line: 1471, type: !153)
!1580 = !DILocation(line: 0, scope: !1549)
!1581 = !DILocation(line: 1464, column: 2, scope: !1549)
!1582 = !DILocation(line: 1464, column: 19, scope: !1549)
!1583 = !DILocation(line: 1467, column: 2, scope: !1549)
!1584 = !DILocation(line: 1467, column: 23, scope: !1549)
!1585 = !DILocation(line: 1468, column: 31, scope: !1549)
!1586 = !{!1587, !581, i64 16}
!1587 = !{!"bpf_iter__bpf_map_elem", !581, i64 0, !581, i64 8, !581, i64 16, !581, i64 24}
!1588 = !DILocation(line: 1469, column: 26, scope: !1549)
!1589 = !{!1587, !581, i64 24}
!1590 = !DILocation(line: 1470, column: 14, scope: !1549)
!1591 = !DILocation(line: 1477, column: 7, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1549, file: !3, line: 1477, column: 6)
!1593 = !DILocation(line: 1477, column: 11, scope: !1592)
!1594 = !DILocation(line: 1479, column: 13, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1549, file: !3, line: 1479, column: 6)
!1596 = !DILocation(line: 1479, column: 10, scope: !1595)
!1597 = !DILocation(line: 1479, column: 6, scope: !1549)
!1598 = !DILocation(line: 1482, column: 35, scope: !1549)
!1599 = !DILocalVariable(name: "key", arg: 1, scope: !1600, file: !3, line: 275, type: !108)
!1600 = distinct !DISubprogram(name: "make_dualflow_key", scope: !3, file: !3, line: 275, type: !1176, scopeLine: 277, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1601)
!1601 = !{!1599, !1602}
!1602 = !DILocalVariable(name: "flow", arg: 2, scope: !1600, file: !3, line: 276, type: !108)
!1603 = !DILocation(line: 0, scope: !1600, inlinedAt: !1604)
!1604 = distinct !DILocation(line: 1482, column: 2, scope: !1549)
!1605 = !DILocation(line: 278, column: 6, scope: !1606, inlinedAt: !1604)
!1606 = distinct !DILexicalBlock(scope: !1600, file: !3, line: 278, column: 6)
!1607 = !DILocation(line: 278, column: 6, scope: !1600, inlinedAt: !1604)
!1608 = !DILocation(line: 279, column: 10, scope: !1606, inlinedAt: !1604)
!1609 = !{i64 0, i64 16, !957, i64 0, i64 16, !957, i64 0, i64 16, !957, i64 16, i64 2, !833, i64 18, i64 2, !833, i64 20, i64 16, !957, i64 20, i64 16, !957, i64 20, i64 16, !957, i64 36, i64 2, !833, i64 38, i64 2, !833, i64 40, i64 2, !833, i64 42, i64 1, !957, i64 43, i64 1, !957}
!1610 = !DILocation(line: 279, column: 3, scope: !1606, inlinedAt: !1604)
!1611 = !DILocation(line: 0, scope: !1175, inlinedAt: !1612)
!1612 = distinct !DILocation(line: 281, column: 3, scope: !1606, inlinedAt: !1604)
!1613 = !DILocation(line: 243, column: 19, scope: !1175, inlinedAt: !1612)
!1614 = !DILocation(line: 243, column: 8, scope: !1175, inlinedAt: !1612)
!1615 = !DILocation(line: 243, column: 12, scope: !1175, inlinedAt: !1612)
!1616 = !DILocation(line: 244, column: 21, scope: !1175, inlinedAt: !1612)
!1617 = !DILocation(line: 244, column: 8, scope: !1175, inlinedAt: !1612)
!1618 = !DILocation(line: 244, column: 14, scope: !1175, inlinedAt: !1612)
!1619 = !DILocation(line: 245, column: 21, scope: !1175, inlinedAt: !1612)
!1620 = !DILocation(line: 246, column: 8, scope: !1175, inlinedAt: !1612)
!1621 = !DILocation(line: 246, column: 21, scope: !1175, inlinedAt: !1612)
!1622 = !DILocation(line: 247, column: 8, scope: !1175, inlinedAt: !1612)
!1623 = !DILocation(line: 247, column: 17, scope: !1175, inlinedAt: !1612)
!1624 = !DILocation(line: 1483, column: 13, scope: !1549)
!1625 = !DILocation(line: 1484, column: 6, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1549, file: !3, line: 1484, column: 6)
!1627 = !DILocation(line: 1484, column: 6, scope: !1549)
!1628 = !DILocalVariable(name: "df_state", arg: 1, scope: !1629, file: !3, line: 297, type: !186)
!1629 = distinct !DISubprogram(name: "get_flowstate_from_dualflow", scope: !3, file: !3, line: 297, type: !1630, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1632)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{!1573, !186, !108}
!1632 = !{!1628, !1633}
!1633 = !DILocalVariable(name: "flow", arg: 2, scope: !1629, file: !3, line: 298, type: !108)
!1634 = !DILocation(line: 0, scope: !1629, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 1485, column: 13, scope: !1626)
!1636 = !DILocation(line: 300, column: 37, scope: !1629, inlinedAt: !1635)
!1637 = !DILocalVariable(name: "df_state", arg: 1, scope: !1638, file: !3, line: 284, type: !186)
!1638 = distinct !DISubprogram(name: "fstate_from_dfkey", scope: !3, file: !3, line: 284, type: !1639, scopeLine: 286, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1641)
!1639 = !DISubroutineType(types: !1640)
!1640 = !{!1573, !186, !204}
!1641 = !{!1637, !1642}
!1642 = !DILocalVariable(name: "is_dfkey", arg: 2, scope: !1638, file: !3, line: 285, type: !204)
!1643 = !DILocation(line: 0, scope: !1638, inlinedAt: !1644)
!1644 = distinct !DILocation(line: 300, column: 9, scope: !1629, inlinedAt: !1635)
!1645 = !DILocation(line: 0, scope: !1626)
!1646 = !DILocation(line: 287, column: 9, scope: !1638, inlinedAt: !1644)
!1647 = !DILocation(line: 1486, column: 27, scope: !1549)
!1648 = !{!1649, !576, i64 8}
!1649 = !{!"flow_state", !576, i64 0, !576, i64 8, !576, i64 16, !576, i64 24, !576, i64 32, !576, i64 40, !576, i64 48, !573, i64 56, !573, i64 60, !574, i64 64, !574, i64 65, !784, i64 66, !574, i64 67}
!1650 = !DILocation(line: 1488, column: 7, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1549, file: !3, line: 1488, column: 6)
!1652 = !DILocation(line: 1488, column: 11, scope: !1651)
!1653 = !DILocation(line: 1488, column: 20, scope: !1651)
!1654 = !DILocation(line: 1488, column: 18, scope: !1651)
!1655 = !DILocation(line: 1488, column: 37, scope: !1651)
!1656 = !DILocation(line: 1488, column: 31, scope: !1651)
!1657 = !DILocation(line: 1488, column: 63, scope: !1651)
!1658 = !DILocation(line: 1489, column: 12, scope: !1651)
!1659 = !DILocation(line: 1489, column: 10, scope: !1651)
!1660 = !DILocation(line: 1489, column: 23, scope: !1651)
!1661 = !DILocation(line: 1488, column: 6, scope: !1549)
!1662 = !DILocation(line: 1492, column: 3, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1651, file: !3, line: 1489, column: 45)
!1664 = !DILocation(line: 1493, column: 7, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1663, file: !3, line: 1493, column: 7)
!1666 = !DILocation(line: 1493, column: 51, scope: !1665)
!1667 = !DILocation(line: 1493, column: 7, scope: !1663)
!1668 = !DILocation(line: 1498, column: 16, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1670, file: !3, line: 1496, column: 8)
!1670 = distinct !DILexicalBlock(scope: !1665, file: !3, line: 1493, column: 57)
!1671 = !DILocation(line: 1497, column: 5, scope: !1669)
!1672 = !DILocation(line: 1503, column: 1, scope: !1549)
!1673 = distinct !DISubprogram(name: "flowmap_cleanup", scope: !3, file: !3, line: 1506, type: !1550, scopeLine: 1507, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1674)
!1674 = !{!1675, !1676, !1677, !1678, !1679, !1680, !1681, !1682, !1683, !1684, !1685}
!1675 = !DILocalVariable(name: "ctx", arg: 1, scope: !1673, file: !3, line: 1506, type: !1552)
!1676 = !DILocalVariable(name: "flow1", scope: !1673, file: !3, line: 1508, type: !109)
!1677 = !DILocalVariable(name: "flow2", scope: !1673, file: !3, line: 1508, type: !109)
!1678 = !DILocalVariable(name: "f_state1", scope: !1673, file: !3, line: 1509, type: !1573)
!1679 = !DILocalVariable(name: "f_state2", scope: !1673, file: !3, line: 1509, type: !1573)
!1680 = !DILocalVariable(name: "df_state", scope: !1673, file: !3, line: 1510, type: !186)
!1681 = !DILocalVariable(name: "now", scope: !1673, file: !3, line: 1511, type: !153)
!1682 = !DILocalVariable(name: "notify1", scope: !1673, file: !3, line: 1512, type: !204)
!1683 = !DILocalVariable(name: "notify2", scope: !1673, file: !3, line: 1512, type: !204)
!1684 = !DILocalVariable(name: "timeout1", scope: !1673, file: !3, line: 1512, type: !204)
!1685 = !DILocalVariable(name: "timeout2", scope: !1673, file: !3, line: 1512, type: !204)
!1686 = !DILocation(line: 0, scope: !1673)
!1687 = !DILocation(line: 1508, column: 2, scope: !1673)
!1688 = !DILocation(line: 1508, column: 23, scope: !1673)
!1689 = !DILocation(line: 1511, column: 14, scope: !1673)
!1690 = !DILocation(line: 1514, column: 30, scope: !1673)
!1691 = !DILocation(line: 1514, column: 50, scope: !1673)
!1692 = !DILocation(line: 1518, column: 7, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1673, file: !3, line: 1518, column: 6)
!1694 = !DILocation(line: 1518, column: 16, scope: !1693)
!1695 = !DILocation(line: 1518, column: 25, scope: !1693)
!1696 = !DILocation(line: 1518, column: 20, scope: !1693)
!1697 = !DILocation(line: 1518, column: 6, scope: !1673)
!1698 = !DILocation(line: 1521, column: 10, scope: !1673)
!1699 = !DILocation(line: 0, scope: !1175, inlinedAt: !1700)
!1700 = distinct !DILocation(line: 1522, column: 2, scope: !1673)
!1701 = !DILocation(line: 243, column: 19, scope: !1175, inlinedAt: !1700)
!1702 = !DILocation(line: 244, column: 21, scope: !1175, inlinedAt: !1700)
!1703 = !DILocation(line: 245, column: 21, scope: !1175, inlinedAt: !1700)
!1704 = !{i64 0, i64 15, !957, i64 0, i64 15, !957, i64 0, i64 15, !957, i64 15, i64 2, !833, i64 17, i64 2, !833}
!1705 = !{i64 0, i64 14, !957, i64 0, i64 14, !957, i64 0, i64 14, !957, i64 14, i64 2, !833, i64 16, i64 2, !833}
!1706 = !{i64 0, i64 13, !957, i64 0, i64 13, !957, i64 0, i64 13, !957, i64 13, i64 2, !833, i64 15, i64 2, !833}
!1707 = !{i64 0, i64 12, !957, i64 0, i64 12, !957, i64 0, i64 12, !957, i64 12, i64 2, !833, i64 14, i64 2, !833}
!1708 = !{i64 0, i64 11, !957, i64 0, i64 11, !957, i64 0, i64 11, !957, i64 11, i64 2, !833, i64 13, i64 2, !833}
!1709 = !{i64 0, i64 10, !957, i64 0, i64 10, !957, i64 0, i64 10, !957, i64 10, i64 2, !833, i64 12, i64 2, !833}
!1710 = !{i64 0, i64 9, !957, i64 0, i64 9, !957, i64 0, i64 9, !957, i64 9, i64 2, !833, i64 11, i64 2, !833}
!1711 = !{i64 0, i64 8, !957, i64 0, i64 8, !957, i64 0, i64 8, !957, i64 8, i64 2, !833, i64 10, i64 2, !833}
!1712 = !{i64 0, i64 7, !957, i64 0, i64 7, !957, i64 0, i64 7, !957, i64 7, i64 2, !833, i64 9, i64 2, !833}
!1713 = !{i64 0, i64 6, !957, i64 0, i64 6, !957, i64 0, i64 6, !957, i64 6, i64 2, !833, i64 8, i64 2, !833}
!1714 = !{i64 0, i64 5, !957, i64 0, i64 5, !957, i64 0, i64 5, !957, i64 5, i64 2, !833, i64 7, i64 2, !833}
!1715 = !{i64 0, i64 4, !957, i64 0, i64 4, !957, i64 0, i64 4, !957, i64 4, i64 2, !833, i64 6, i64 2, !833}
!1716 = !{i64 0, i64 3, !957, i64 0, i64 3, !957, i64 0, i64 3, !957, i64 3, i64 2, !833, i64 5, i64 2, !833}
!1717 = !{i64 0, i64 2, !957, i64 0, i64 2, !957, i64 0, i64 2, !957, i64 2, i64 2, !833, i64 4, i64 2, !833}
!1718 = !{i64 0, i64 1, !957, i64 0, i64 1, !957, i64 0, i64 1, !957, i64 1, i64 2, !833, i64 3, i64 2, !833}
!1719 = !{i64 0, i64 2, !833, i64 2, i64 2, !833}
!1720 = !{i64 0, i64 1, !833, i64 1, i64 2, !833}
!1721 = !{i64 0, i64 2, !833}
!1722 = !{i64 0, i64 1, !833}
!1723 = !DILocation(line: 246, column: 21, scope: !1175, inlinedAt: !1700)
!1724 = !DILocation(line: 0, scope: !1629, inlinedAt: !1725)
!1725 = distinct !DILocation(line: 1525, column: 13, scope: !1673)
!1726 = !DILocalVariable(name: "flow", arg: 1, scope: !1727, file: !3, line: 270, type: !108)
!1727 = distinct !DISubprogram(name: "is_dualflow_key", scope: !3, file: !3, line: 270, type: !1728, scopeLine: 271, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1730)
!1728 = !DISubroutineType(types: !1729)
!1729 = !{!204, !108}
!1730 = !{!1726}
!1731 = !DILocation(line: 0, scope: !1727, inlinedAt: !1732)
!1732 = distinct !DILocation(line: 300, column: 37, scope: !1629, inlinedAt: !1725)
!1733 = !DILocalVariable(name: "s1_", arg: 1, scope: !1734, file: !3, line: 257, type: !388)
!1734 = distinct !DISubprogram(name: "my_memcmp", scope: !3, file: !3, line: 257, type: !1735, scopeLine: 258, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1737)
!1735 = !DISubroutineType(types: !1736)
!1736 = !{!164, !388, !388, !138}
!1737 = !{!1733, !1738, !1739, !1740, !1743, !1744}
!1738 = !DILocalVariable(name: "s2_", arg: 2, scope: !1734, file: !3, line: 257, type: !388)
!1739 = !DILocalVariable(name: "size", arg: 3, scope: !1734, file: !3, line: 257, type: !138)
!1740 = !DILocalVariable(name: "s1", scope: !1734, file: !3, line: 259, type: !1741)
!1741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1742, size: 64)
!1742 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !123)
!1743 = !DILocalVariable(name: "s2", scope: !1734, file: !3, line: 259, type: !1741)
!1744 = !DILocalVariable(name: "i", scope: !1734, file: !3, line: 260, type: !164)
!1745 = !DILocation(line: 0, scope: !1734, inlinedAt: !1746)
!1746 = distinct !DILocation(line: 272, column: 9, scope: !1727, inlinedAt: !1732)
!1747 = !DILocation(line: 263, column: 13, scope: !1748, inlinedAt: !1746)
!1748 = distinct !DILexicalBlock(scope: !1749, file: !3, line: 263, column: 7)
!1749 = distinct !DILexicalBlock(scope: !1750, file: !3, line: 262, column: 52)
!1750 = distinct !DILexicalBlock(scope: !1751, file: !3, line: 262, column: 2)
!1751 = distinct !DILexicalBlock(scope: !1734, file: !3, line: 262, column: 2)
!1752 = !DILocation(line: 263, column: 7, scope: !1749, inlinedAt: !1746)
!1753 = !DILocation(line: 0, scope: !1638, inlinedAt: !1754)
!1754 = distinct !DILocation(line: 300, column: 9, scope: !1629, inlinedAt: !1725)
!1755 = !DILocation(line: 287, column: 9, scope: !1638, inlinedAt: !1754)
!1756 = !DILocation(line: 263, column: 7, scope: !1748, inlinedAt: !1746)
!1757 = !DILocation(line: 263, column: 16, scope: !1748, inlinedAt: !1746)
!1758 = !DILocation(line: 264, column: 17, scope: !1748, inlinedAt: !1746)
!1759 = !DILocation(line: 0, scope: !1629, inlinedAt: !1760)
!1760 = distinct !DILocation(line: 1526, column: 13, scope: !1673)
!1761 = !DILocation(line: 0, scope: !1727, inlinedAt: !1762)
!1762 = distinct !DILocation(line: 300, column: 37, scope: !1629, inlinedAt: !1760)
!1763 = !DILocation(line: 0, scope: !1734, inlinedAt: !1764)
!1764 = distinct !DILocation(line: 272, column: 9, scope: !1727, inlinedAt: !1762)
!1765 = !DILocation(line: 263, column: 7, scope: !1749, inlinedAt: !1764)
!1766 = !DILocation(line: 263, column: 13, scope: !1748, inlinedAt: !1764)
!1767 = !DILocation(line: 263, column: 7, scope: !1748, inlinedAt: !1764)
!1768 = !DILocation(line: 263, column: 16, scope: !1748, inlinedAt: !1764)
!1769 = !DILocation(line: 264, column: 17, scope: !1748, inlinedAt: !1764)
!1770 = !DILocation(line: 0, scope: !1638, inlinedAt: !1771)
!1771 = distinct !DILocation(line: 300, column: 9, scope: !1629, inlinedAt: !1760)
!1772 = !DILocation(line: 287, column: 9, scope: !1638, inlinedAt: !1771)
!1773 = !DILocalVariable(name: "flow", arg: 1, scope: !1774, file: !3, line: 1389, type: !108)
!1774 = distinct !DISubprogram(name: "is_flow_old", scope: !3, file: !3, line: 1389, type: !1775, scopeLine: 1391, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1777)
!1775 = !DISubroutineType(types: !1776)
!1776 = !{!204, !108, !1573, !153}
!1777 = !{!1773, !1778, !1779, !1780, !1781}
!1778 = !DILocalVariable(name: "f_state", arg: 2, scope: !1774, file: !3, line: 1389, type: !1573)
!1779 = !DILocalVariable(name: "time", arg: 3, scope: !1774, file: !3, line: 1390, type: !153)
!1780 = !DILocalVariable(name: "age", scope: !1774, file: !3, line: 1392, type: !153)
!1781 = !DILocalVariable(name: "ts", scope: !1774, file: !3, line: 1393, type: !153)
!1782 = !DILocation(line: 0, scope: !1774, inlinedAt: !1783)
!1783 = distinct !DILocation(line: 1528, column: 13, scope: !1673)
!1784 = !DILocalVariable(name: "f_state", arg: 1, scope: !1785, file: !3, line: 984, type: !1573)
!1785 = distinct !DISubprogram(name: "is_flowstate_active", scope: !3, file: !3, line: 984, type: !1786, scopeLine: 985, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1788)
!1786 = !DISubroutineType(types: !1787)
!1787 = !{!204, !1573}
!1788 = !{!1784}
!1789 = !DILocation(line: 0, scope: !1785, inlinedAt: !1790)
!1790 = distinct !DILocation(line: 1395, column: 19, scope: !1791, inlinedAt: !1783)
!1791 = distinct !DILexicalBlock(scope: !1774, file: !3, line: 1395, column: 6)
!1792 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !1790)
!1793 = !{!1649, !574, i64 64}
!1794 = !DILocation(line: 1395, column: 6, scope: !1774, inlinedAt: !1783)
!1795 = !DILocation(line: 1398, column: 16, scope: !1774, inlinedAt: !1783)
!1796 = !{!1649, !576, i64 16}
!1797 = !DILocation(line: 1399, column: 9, scope: !1798, inlinedAt: !1783)
!1798 = distinct !DILexicalBlock(scope: !1774, file: !3, line: 1399, column: 6)
!1799 = !DILocation(line: 1399, column: 6, scope: !1774, inlinedAt: !1783)
!1800 = !DILocation(line: 1401, column: 13, scope: !1774, inlinedAt: !1783)
!1801 = !DILocation(line: 1403, column: 30, scope: !1774, inlinedAt: !1783)
!1802 = !DILocation(line: 1403, column: 59, scope: !1774, inlinedAt: !1783)
!1803 = !DILocation(line: 1405, column: 23, scope: !1774, inlinedAt: !1783)
!1804 = !DILocation(line: 1405, column: 39, scope: !1774, inlinedAt: !1783)
!1805 = !DILocation(line: 1406, column: 16, scope: !1774, inlinedAt: !1783)
!1806 = !DILocation(line: 1406, column: 35, scope: !1774, inlinedAt: !1783)
!1807 = !DILocation(line: 1407, column: 29, scope: !1774, inlinedAt: !1783)
!1808 = !DILocation(line: 1408, column: 13, scope: !1774, inlinedAt: !1783)
!1809 = !DILocation(line: 0, scope: !1774, inlinedAt: !1810)
!1810 = distinct !DILocation(line: 1529, column: 13, scope: !1673)
!1811 = !DILocation(line: 0, scope: !1785, inlinedAt: !1812)
!1812 = distinct !DILocation(line: 1395, column: 19, scope: !1791, inlinedAt: !1810)
!1813 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !1812)
!1814 = !DILocation(line: 1395, column: 6, scope: !1774, inlinedAt: !1810)
!1815 = !DILocation(line: 1398, column: 16, scope: !1774, inlinedAt: !1810)
!1816 = !DILocation(line: 1399, column: 9, scope: !1798, inlinedAt: !1810)
!1817 = !DILocation(line: 1399, column: 6, scope: !1774, inlinedAt: !1810)
!1818 = !DILocation(line: 1401, column: 13, scope: !1774, inlinedAt: !1810)
!1819 = !DILocation(line: 1403, column: 30, scope: !1774, inlinedAt: !1810)
!1820 = !DILocation(line: 1403, column: 59, scope: !1774, inlinedAt: !1810)
!1821 = !DILocation(line: 1405, column: 23, scope: !1774, inlinedAt: !1810)
!1822 = !DILocation(line: 1405, column: 39, scope: !1774, inlinedAt: !1810)
!1823 = !DILocation(line: 1406, column: 16, scope: !1774, inlinedAt: !1810)
!1824 = !DILocation(line: 1406, column: 35, scope: !1774, inlinedAt: !1810)
!1825 = !DILocation(line: 1407, column: 29, scope: !1774, inlinedAt: !1810)
!1826 = !DILocation(line: 1408, column: 13, scope: !1774, inlinedAt: !1810)
!1827 = !DILocation(line: 0, scope: !1785, inlinedAt: !1828)
!1828 = distinct !DILocation(line: 1531, column: 8, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1673, file: !3, line: 1531, column: 6)
!1830 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !1828)
!1831 = !DILocation(line: 1531, column: 38, scope: !1829)
!1832 = !DILocation(line: 0, scope: !1785, inlinedAt: !1833)
!1833 = distinct !DILocation(line: 1532, column: 8, scope: !1829)
!1834 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !1833)
!1835 = !DILocation(line: 1532, column: 38, scope: !1829)
!1836 = !DILocalVariable(name: "f_state", arg: 1, scope: !1837, file: !3, line: 1020, type: !1573)
!1837 = distinct !DISubprogram(name: "should_notify_closing", scope: !3, file: !3, line: 1020, type: !1786, scopeLine: 1021, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1838)
!1838 = !{!1836}
!1839 = !DILocation(line: 0, scope: !1837, inlinedAt: !1840)
!1840 = distinct !DILocation(line: 1534, column: 13, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1829, file: !3, line: 1532, column: 52)
!1842 = !DILocation(line: 0, scope: !1837, inlinedAt: !1843)
!1843 = distinct !DILocation(line: 1535, column: 13, scope: !1841)
!1844 = !DILocation(line: 1022, column: 29, scope: !1837, inlinedAt: !1843)
!1845 = !DILocation(line: 1535, column: 45, scope: !1841)
!1846 = !DILocation(line: 1536, column: 7, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1841, file: !3, line: 1536, column: 7)
!1848 = !DILocation(line: 1536, column: 48, scope: !1847)
!1849 = !DILocation(line: 1536, column: 7, scope: !1841)
!1850 = !DILocation(line: 1022, column: 29, scope: !1837, inlinedAt: !1840)
!1851 = !DILocation(line: 1534, column: 45, scope: !1841)
!1852 = !DILocation(line: 1538, column: 8, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1847, file: !3, line: 1536, column: 54)
!1854 = !DILocalVariable(name: "ctx", arg: 1, scope: !1855, file: !3, line: 1411, type: !106)
!1855 = distinct !DISubprogram(name: "send_flow_timeout_message", scope: !3, file: !3, line: 1411, type: !1856, scopeLine: 1413, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1858)
!1856 = !DISubroutineType(types: !1857)
!1857 = !{null, !106, !108, !153}
!1858 = !{!1854, !1859, !1860, !1861}
!1859 = !DILocalVariable(name: "flow", arg: 2, scope: !1855, file: !3, line: 1411, type: !108)
!1860 = !DILocalVariable(name: "time", arg: 3, scope: !1855, file: !3, line: 1412, type: !153)
!1861 = !DILocalVariable(name: "fe", scope: !1855, file: !3, line: 1417, type: !1862)
!1862 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_event", file: !6, line: 205, size: 512, elements: !1863)
!1863 = !{!1864, !1865, !1866, !1867, !1868, !1869, !1870}
!1864 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !1862, file: !6, line: 206, baseType: !153, size: 64)
!1865 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !1862, file: !6, line: 207, baseType: !153, size: 64, offset: 64)
!1866 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !1862, file: !6, line: 208, baseType: !109, size: 352, offset: 128)
!1867 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event_type", scope: !1862, file: !6, line: 209, baseType: !5, size: 8, offset: 480)
!1868 = !DIDerivedType(tag: DW_TAG_member, name: "reason", scope: !1862, file: !6, line: 210, baseType: !13, size: 8, offset: 488)
!1869 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !1862, file: !6, line: 211, baseType: !100, size: 8, offset: 496)
!1870 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !1862, file: !6, line: 212, baseType: !123, size: 8, offset: 504)
!1871 = !DILocation(line: 0, scope: !1855, inlinedAt: !1872)
!1872 = distinct !DILocation(line: 1539, column: 5, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1853, file: !3, line: 1538, column: 8)
!1874 = !DILocation(line: 1414, column: 14, scope: !1875, inlinedAt: !1872)
!1875 = distinct !DILexicalBlock(scope: !1855, file: !3, line: 1414, column: 6)
!1876 = !{!1034, !784, i64 33}
!1877 = !DILocation(line: 1414, column: 6, scope: !1855, inlinedAt: !1872)
!1878 = !DILocation(line: 1417, column: 2, scope: !1855, inlinedAt: !1872)
!1879 = !DILocation(line: 1417, column: 20, scope: !1855, inlinedAt: !1872)
!1880 = !DILocation(line: 1417, column: 25, scope: !1855, inlinedAt: !1872)
!1881 = !{!1882, !576, i64 0}
!1882 = !{!"flow_event", !576, i64 0, !576, i64 8, !780, i64 16, !574, i64 60, !574, i64 61, !574, i64 62, !574, i64 63}
!1883 = !{!1882, !576, i64 8}
!1884 = !{!1882, !574, i64 60}
!1885 = !{!1882, !574, i64 61}
!1886 = !{!1882, !574, i64 62}
!1887 = !{!1882, !574, i64 63}
!1888 = !DILocation(line: 0, scope: !1175, inlinedAt: !1889)
!1889 = distinct !DILocation(line: 1427, column: 2, scope: !1855, inlinedAt: !1872)
!1890 = !DILocation(line: 243, column: 19, scope: !1175, inlinedAt: !1889)
!1891 = !DILocation(line: 243, column: 8, scope: !1175, inlinedAt: !1889)
!1892 = !DILocation(line: 243, column: 12, scope: !1175, inlinedAt: !1889)
!1893 = !DILocation(line: 244, column: 21, scope: !1175, inlinedAt: !1889)
!1894 = !DILocation(line: 244, column: 8, scope: !1175, inlinedAt: !1889)
!1895 = !DILocation(line: 244, column: 14, scope: !1175, inlinedAt: !1889)
!1896 = !DILocation(line: 245, column: 21, scope: !1175, inlinedAt: !1889)
!1897 = !DILocation(line: 246, column: 8, scope: !1175, inlinedAt: !1889)
!1898 = !DILocation(line: 246, column: 21, scope: !1175, inlinedAt: !1889)
!1899 = !DILocation(line: 247, column: 8, scope: !1175, inlinedAt: !1889)
!1900 = !DILocation(line: 247, column: 17, scope: !1175, inlinedAt: !1889)
!1901 = !DILocation(line: 1429, column: 2, scope: !1855, inlinedAt: !1872)
!1902 = !DILocation(line: 1430, column: 1, scope: !1855, inlinedAt: !1872)
!1903 = !DILocation(line: 1540, column: 8, scope: !1853)
!1904 = !DILocation(line: 0, scope: !1855, inlinedAt: !1905)
!1905 = distinct !DILocation(line: 1541, column: 5, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1853, file: !3, line: 1540, column: 8)
!1907 = !DILocation(line: 1414, column: 14, scope: !1875, inlinedAt: !1905)
!1908 = !DILocation(line: 1414, column: 6, scope: !1855, inlinedAt: !1905)
!1909 = !DILocation(line: 1417, column: 2, scope: !1855, inlinedAt: !1905)
!1910 = !DILocation(line: 1417, column: 20, scope: !1855, inlinedAt: !1905)
!1911 = !DILocation(line: 1417, column: 25, scope: !1855, inlinedAt: !1905)
!1912 = !DILocation(line: 0, scope: !1175, inlinedAt: !1913)
!1913 = distinct !DILocation(line: 1427, column: 2, scope: !1855, inlinedAt: !1905)
!1914 = !DILocation(line: 243, column: 8, scope: !1175, inlinedAt: !1913)
!1915 = !DILocation(line: 243, column: 12, scope: !1175, inlinedAt: !1913)
!1916 = !DILocation(line: 244, column: 8, scope: !1175, inlinedAt: !1913)
!1917 = !DILocation(line: 244, column: 14, scope: !1175, inlinedAt: !1913)
!1918 = !DILocation(line: 245, column: 21, scope: !1175, inlinedAt: !1913)
!1919 = !DILocation(line: 246, column: 21, scope: !1175, inlinedAt: !1913)
!1920 = !DILocation(line: 247, column: 8, scope: !1175, inlinedAt: !1913)
!1921 = !DILocation(line: 247, column: 17, scope: !1175, inlinedAt: !1913)
!1922 = !DILocation(line: 1429, column: 2, scope: !1855, inlinedAt: !1905)
!1923 = !DILocation(line: 1430, column: 1, scope: !1855, inlinedAt: !1905)
!1924 = !DILocation(line: 1546, column: 1, scope: !1673)
!1925 = !DILocation(line: 0, scope: !1386)
!1926 = !DILocation(line: 369, column: 14, scope: !1385)
!1927 = !DILocation(line: 369, column: 6, scope: !1386)
!1928 = !DILocation(line: 373, column: 2, scope: !1386)
!1929 = !DILocation(line: 373, column: 8, scope: !1386)
!1930 = !DILocation(line: 375, column: 13, scope: !1386)
!1931 = !DILocation(line: 376, column: 7, scope: !1404)
!1932 = !DILocation(line: 376, column: 6, scope: !1386)
!1933 = !DILocation(line: 379, column: 2, scope: !1386)
!1934 = !DILocation(line: 381, column: 13, scope: !1407)
!1935 = !DILocation(line: 381, column: 23, scope: !1407)
!1936 = !DILocation(line: 382, column: 28, scope: !1407)
!1937 = !DILocation(line: 382, column: 13, scope: !1407)
!1938 = !DILocation(line: 404, column: 6, scope: !1386)
!1939 = !DILocation(line: 385, column: 13, scope: !1407)
!1940 = !DILocation(line: 385, column: 21, scope: !1407)
!1941 = !{!1410, !576, i64 72}
!1942 = !DILocation(line: 386, column: 26, scope: !1407)
!1943 = !DILocation(line: 386, column: 13, scope: !1407)
!1944 = !DILocation(line: 386, column: 23, scope: !1407)
!1945 = !{!1410, !576, i64 80}
!1946 = !DILocation(line: 387, column: 3, scope: !1407)
!1947 = !DILocation(line: 389, column: 13, scope: !1407)
!1948 = !DILocation(line: 389, column: 21, scope: !1407)
!1949 = !{!1410, !576, i64 88}
!1950 = !DILocation(line: 390, column: 26, scope: !1407)
!1951 = !DILocation(line: 390, column: 13, scope: !1407)
!1952 = !DILocation(line: 390, column: 23, scope: !1407)
!1953 = !{!1410, !576, i64 96}
!1954 = !DILocation(line: 391, column: 3, scope: !1407)
!1955 = !DILocation(line: 393, column: 13, scope: !1407)
!1956 = !DILocation(line: 393, column: 22, scope: !1407)
!1957 = !{!1410, !576, i64 104}
!1958 = !DILocation(line: 394, column: 27, scope: !1407)
!1959 = !DILocation(line: 394, column: 13, scope: !1407)
!1960 = !DILocation(line: 394, column: 24, scope: !1407)
!1961 = !{!1410, !576, i64 112}
!1962 = !DILocation(line: 395, column: 3, scope: !1407)
!1963 = !DILocation(line: 397, column: 13, scope: !1407)
!1964 = !DILocation(line: 397, column: 23, scope: !1407)
!1965 = !{!1410, !576, i64 120}
!1966 = !DILocation(line: 398, column: 28, scope: !1407)
!1967 = !DILocation(line: 398, column: 13, scope: !1407)
!1968 = !DILocation(line: 398, column: 25, scope: !1407)
!1969 = !{!1410, !576, i64 128}
!1970 = !DILocation(line: 399, column: 3, scope: !1407)
!1971 = !DILocation(line: 401, column: 13, scope: !1407)
!1972 = !DILocation(line: 401, column: 3, scope: !1407)
!1973 = !DILocation(line: 401, column: 36, scope: !1407)
!1974 = !DILocalVariable(name: "counters", arg: 1, scope: !1975, file: !3, line: 349, type: !1978)
!1975 = distinct !DISubprogram(name: "update_ecn_counters", scope: !3, file: !3, line: 349, type: !1976, scopeLine: 350, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1979)
!1976 = !DISubroutineType(types: !1977)
!1977 = !{null, !1978, !123}
!1978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64)
!1979 = !{!1974, !1980}
!1980 = !DILocalVariable(name: "ecn", arg: 2, scope: !1975, file: !3, line: 349, type: !123)
!1981 = !DILocation(line: 0, scope: !1975, inlinedAt: !1982)
!1982 = distinct !DILocation(line: 405, column: 3, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 404, column: 6)
!1984 = !DILocation(line: 351, column: 2, scope: !1975, inlinedAt: !1982)
!1985 = !DILocation(line: 356, column: 13, scope: !1986, inlinedAt: !1982)
!1986 = distinct !DILexicalBlock(scope: !1975, file: !3, line: 351, column: 15)
!1987 = !DILocation(line: 357, column: 3, scope: !1986, inlinedAt: !1982)
!1988 = !DILocation(line: 359, column: 13, scope: !1986, inlinedAt: !1982)
!1989 = !DILocation(line: 360, column: 3, scope: !1986, inlinedAt: !1982)
!1990 = !DILocation(line: 362, column: 13, scope: !1986, inlinedAt: !1982)
!1991 = !DILocation(line: 363, column: 3, scope: !1986, inlinedAt: !1982)
!1992 = !DILocation(line: 406, column: 1, scope: !1386)
!1993 = !DILocation(line: 0, scope: !1727)
!1994 = !DILocation(line: 272, column: 19, scope: !1727)
!1995 = !DILocation(line: 272, column: 40, scope: !1727)
!1996 = !DILocation(line: 272, column: 33, scope: !1727)
!1997 = !DILocation(line: 0, scope: !1734, inlinedAt: !1998)
!1998 = distinct !DILocation(line: 272, column: 9, scope: !1727)
!1999 = !DILocation(line: 263, column: 7, scope: !1748, inlinedAt: !1998)
!2000 = !DILocation(line: 263, column: 16, scope: !1748, inlinedAt: !1998)
!2001 = !DILocation(line: 263, column: 13, scope: !1748, inlinedAt: !1998)
!2002 = !DILocation(line: 263, column: 7, scope: !1749, inlinedAt: !1998)
!2003 = !DILocation(line: 264, column: 17, scope: !1748, inlinedAt: !1998)
!2004 = !DILocation(line: 264, column: 4, scope: !1748, inlinedAt: !1998)
!2005 = !DILocation(line: 272, column: 2, scope: !1727)
!2006 = distinct !DISubprogram(name: "pping_parsed_packet", scope: !3, file: !3, line: 1317, type: !2007, scopeLine: 1318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2009)
!2007 = !DISubroutineType(types: !2008)
!2008 = !{null, !106, !339}
!2009 = !{!2010, !2011, !2012, !2013, !2014, !2015, !2016}
!2010 = !DILocalVariable(name: "ctx", arg: 1, scope: !2006, file: !3, line: 1317, type: !106)
!2011 = !DILocalVariable(name: "p_info", arg: 2, scope: !2006, file: !3, line: 1317, type: !339)
!2012 = !DILocalVariable(name: "df_state", scope: !2006, file: !3, line: 1319, type: !186)
!2013 = !DILocalVariable(name: "fw_flow", scope: !2006, file: !3, line: 1320, type: !1573)
!2014 = !DILocalVariable(name: "rev_flow", scope: !2006, file: !3, line: 1320, type: !1573)
!2015 = !DILocalVariable(name: "src_stats", scope: !2006, file: !3, line: 1321, type: !229)
!2016 = !DILocalVariable(name: "dst_stats", scope: !2006, file: !3, line: 1321, type: !229)
!2017 = !DILocation(line: 0, scope: !2006)
!2018 = !DILocalVariable(name: "src_stats", arg: 1, scope: !2019, file: !3, line: 1289, type: !2022)
!2019 = distinct !DISubprogram(name: "update_aggregate_stats", scope: !3, file: !3, line: 1289, type: !2020, scopeLine: 1292, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2023)
!2020 = !DISubroutineType(types: !2021)
!2021 = !{null, !2022, !2022, !339}
!2022 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!2023 = !{!2018, !2024, !2025}
!2024 = !DILocalVariable(name: "dst_stats", arg: 2, scope: !2019, file: !3, line: 1290, type: !2022)
!2025 = !DILocalVariable(name: "p_info", arg: 3, scope: !2019, file: !3, line: 1291, type: !339)
!2026 = !DILocation(line: 0, scope: !2019, inlinedAt: !2027)
!2027 = distinct !DILocation(line: 1323, column: 2, scope: !2006)
!2028 = !DILocation(line: 1293, column: 14, scope: !2029, inlinedAt: !2027)
!2029 = distinct !DILexicalBlock(scope: !2019, file: !3, line: 1293, column: 6)
!2030 = !DILocation(line: 1293, column: 6, scope: !2019, inlinedAt: !2027)
!2031 = !DILocation(line: 1297, column: 62, scope: !2019, inlinedAt: !2027)
!2032 = !DILocation(line: 1298, column: 27, scope: !2019, inlinedAt: !2027)
!2033 = !DILocation(line: 1299, column: 18, scope: !2019, inlinedAt: !2027)
!2034 = !DILocation(line: 1297, column: 3, scope: !2019, inlinedAt: !2027)
!2035 = !DILocalVariable(name: "stats", arg: 1, scope: !2036, file: !3, line: 1260, type: !229)
!2036 = distinct !DISubprogram(name: "update_subnet_pktcnt", scope: !3, file: !3, line: 1260, type: !2037, scopeLine: 1262, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2039)
!2037 = !DISubroutineType(types: !2038)
!2038 = !{null, !229, !339, !204}
!2039 = !{!2035, !2040, !2041, !2042}
!2040 = !DILocalVariable(name: "p_info", arg: 2, scope: !2036, file: !3, line: 1261, type: !339)
!2041 = !DILocalVariable(name: "as_tx", arg: 3, scope: !2036, file: !3, line: 1261, type: !204)
!2042 = !DILocalVariable(name: "counters", scope: !2036, file: !3, line: 1263, type: !2043)
!2043 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !234, size: 64)
!2044 = !DILocation(line: 0, scope: !2036, inlinedAt: !2045)
!2045 = distinct !DILocation(line: 1300, column: 2, scope: !2019, inlinedAt: !2027)
!2046 = !DILocation(line: 1265, column: 7, scope: !2047, inlinedAt: !2045)
!2047 = distinct !DILexicalBlock(scope: !2036, file: !3, line: 1265, column: 6)
!2048 = !DILocation(line: 1265, column: 6, scope: !2036, inlinedAt: !2045)
!2049 = !DILocation(line: 1273, column: 23, scope: !2050, inlinedAt: !2045)
!2050 = distinct !DILexicalBlock(scope: !2036, file: !3, line: 1273, column: 6)
!2051 = !DILocation(line: 1273, column: 29, scope: !2050, inlinedAt: !2045)
!2052 = !DILocation(line: 1273, column: 6, scope: !2036, inlinedAt: !2045)
!2053 = !DILocation(line: 1274, column: 15, scope: !2054, inlinedAt: !2045)
!2054 = distinct !DILexicalBlock(scope: !2055, file: !3, line: 1274, column: 7)
!2055 = distinct !DILexicalBlock(scope: !2050, file: !3, line: 1273, column: 45)
!2056 = !DILocation(line: 1274, column: 7, scope: !2055, inlinedAt: !2045)
!2057 = !DILocation(line: 1275, column: 14, scope: !2058, inlinedAt: !2045)
!2058 = distinct !DILexicalBlock(scope: !2054, file: !3, line: 1274, column: 30)
!2059 = !DILocation(line: 1275, column: 25, scope: !2058, inlinedAt: !2045)
!2060 = !{!2061, !576, i64 0}
!2061 = !{!"traffic_counters", !576, i64 0, !576, i64 8, !576, i64 16, !576, i64 24, !576, i64 32, !576, i64 40}
!2062 = !DILocation(line: 1276, column: 14, scope: !2058, inlinedAt: !2045)
!2063 = !DILocation(line: 1277, column: 3, scope: !2058, inlinedAt: !2045)
!2064 = !DILocation(line: 1278, column: 14, scope: !2065, inlinedAt: !2045)
!2065 = distinct !DILexicalBlock(scope: !2054, file: !3, line: 1277, column: 10)
!2066 = !DILocation(line: 1278, column: 27, scope: !2065, inlinedAt: !2045)
!2067 = !{!2061, !576, i64 16}
!2068 = !DILocation(line: 1279, column: 14, scope: !2065, inlinedAt: !2045)
!2069 = !DILocation(line: 1282, column: 13, scope: !2070, inlinedAt: !2045)
!2070 = distinct !DILexicalBlock(scope: !2050, file: !3, line: 1281, column: 9)
!2071 = !DILocation(line: 1282, column: 23, scope: !2070, inlinedAt: !2045)
!2072 = !{!2061, !576, i64 32}
!2073 = !DILocation(line: 1283, column: 13, scope: !2070, inlinedAt: !2045)
!2074 = !DILocation(line: 0, scope: !2050, inlinedAt: !2045)
!2075 = !DILocation(line: 1286, column: 32, scope: !2036, inlinedAt: !2045)
!2076 = !DILocation(line: 1286, column: 9, scope: !2036, inlinedAt: !2045)
!2077 = !DILocation(line: 1286, column: 22, scope: !2036, inlinedAt: !2045)
!2078 = !{!2079, !576, i64 0}
!2079 = !{!"aggregated_stats", !576, i64 0, !2061, i64 8, !2061, i64 56, !576, i64 104, !576, i64 112, !574, i64 120}
!2080 = !DILocation(line: 1287, column: 1, scope: !2036, inlinedAt: !2045)
!2081 = !DILocation(line: 1303, column: 62, scope: !2019, inlinedAt: !2027)
!2082 = !DILocation(line: 1304, column: 27, scope: !2019, inlinedAt: !2027)
!2083 = !DILocation(line: 1305, column: 18, scope: !2019, inlinedAt: !2027)
!2084 = !DILocation(line: 1303, column: 3, scope: !2019, inlinedAt: !2027)
!2085 = !DILocation(line: 0, scope: !2036, inlinedAt: !2086)
!2086 = distinct !DILocation(line: 1306, column: 2, scope: !2019, inlinedAt: !2027)
!2087 = !DILocation(line: 1265, column: 7, scope: !2047, inlinedAt: !2086)
!2088 = !DILocation(line: 1265, column: 6, scope: !2036, inlinedAt: !2086)
!2089 = !DILocation(line: 1273, column: 23, scope: !2050, inlinedAt: !2086)
!2090 = !DILocation(line: 1273, column: 29, scope: !2050, inlinedAt: !2086)
!2091 = !DILocation(line: 1273, column: 6, scope: !2036, inlinedAt: !2086)
!2092 = !DILocation(line: 1274, column: 15, scope: !2054, inlinedAt: !2086)
!2093 = !DILocation(line: 1274, column: 7, scope: !2055, inlinedAt: !2086)
!2094 = !DILocation(line: 1275, column: 14, scope: !2058, inlinedAt: !2086)
!2095 = !DILocation(line: 1275, column: 25, scope: !2058, inlinedAt: !2086)
!2096 = !DILocation(line: 1276, column: 14, scope: !2058, inlinedAt: !2086)
!2097 = !DILocation(line: 1277, column: 3, scope: !2058, inlinedAt: !2086)
!2098 = !DILocation(line: 1278, column: 14, scope: !2065, inlinedAt: !2086)
!2099 = !DILocation(line: 1278, column: 27, scope: !2065, inlinedAt: !2086)
!2100 = !DILocation(line: 1279, column: 14, scope: !2065, inlinedAt: !2086)
!2101 = !DILocation(line: 1282, column: 13, scope: !2070, inlinedAt: !2086)
!2102 = !DILocation(line: 1282, column: 23, scope: !2070, inlinedAt: !2086)
!2103 = !DILocation(line: 1283, column: 13, scope: !2070, inlinedAt: !2086)
!2104 = !DILocation(line: 0, scope: !2050, inlinedAt: !2086)
!2105 = !DILocation(line: 1286, column: 32, scope: !2036, inlinedAt: !2086)
!2106 = !DILocation(line: 1286, column: 9, scope: !2036, inlinedAt: !2086)
!2107 = !DILocation(line: 1286, column: 22, scope: !2036, inlinedAt: !2086)
!2108 = !DILocation(line: 1287, column: 1, scope: !2036, inlinedAt: !2086)
!2109 = !DILocation(line: 1324, column: 15, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2006, file: !3, line: 1324, column: 6)
!2111 = !DILocation(line: 1324, column: 6, scope: !2006)
!2112 = !DILocalVariable(name: "ctx", arg: 1, scope: !2113, file: !3, line: 966, type: !106)
!2113 = distinct !DISubprogram(name: "lookup_or_create_dualflow_state", scope: !3, file: !3, line: 966, type: !2114, scopeLine: 967, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2116)
!2114 = !DISubroutineType(types: !2115)
!2115 = !{!186, !106, !339}
!2116 = !{!2112, !2117, !2118}
!2117 = !DILocalVariable(name: "p_info", arg: 2, scope: !2113, file: !3, line: 966, type: !339)
!2118 = !DILocalVariable(name: "df_state", scope: !2113, file: !3, line: 968, type: !186)
!2119 = !DILocation(line: 0, scope: !2113, inlinedAt: !2120)
!2120 = distinct !DILocation(line: 1327, column: 13, scope: !2006)
!2121 = !DILocalVariable(name: "p_info", arg: 1, scope: !2122, file: !3, line: 318, type: !339)
!2122 = distinct !DISubprogram(name: "get_dualflow_key_from_packet", scope: !3, file: !3, line: 318, type: !2123, scopeLine: 319, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2125)
!2123 = !DISubroutineType(types: !2124)
!2124 = !{!108, !339}
!2125 = !{!2121}
!2126 = !DILocation(line: 0, scope: !2122, inlinedAt: !2127)
!2127 = distinct !DILocation(line: 971, column: 12, scope: !2113, inlinedAt: !2120)
!2128 = !DILocation(line: 320, column: 17, scope: !2122, inlinedAt: !2127)
!2129 = !DILocation(line: 320, column: 9, scope: !2122, inlinedAt: !2127)
!2130 = !DILocation(line: 971, column: 12, scope: !2113, inlinedAt: !2120)
!2131 = !DILocation(line: 970, column: 13, scope: !2113, inlinedAt: !2120)
!2132 = !DILocation(line: 973, column: 6, scope: !2133, inlinedAt: !2120)
!2133 = distinct !DILexicalBlock(scope: !2113, file: !3, line: 973, column: 6)
!2134 = !DILocation(line: 973, column: 6, scope: !2113, inlinedAt: !2120)
!2135 = !DILocation(line: 974, column: 3, scope: !2133, inlinedAt: !2120)
!2136 = !DILocation(line: 977, column: 15, scope: !2137, inlinedAt: !2120)
!2137 = distinct !DILexicalBlock(scope: !2113, file: !3, line: 977, column: 6)
!2138 = !DILocation(line: 977, column: 25, scope: !2137, inlinedAt: !2120)
!2139 = !DILocation(line: 977, column: 36, scope: !2137, inlinedAt: !2120)
!2140 = !DILocation(line: 977, column: 69, scope: !2137, inlinedAt: !2120)
!2141 = !DILocalVariable(name: "ctx", arg: 1, scope: !2142, file: !3, line: 948, type: !106)
!2142 = distinct !DISubprogram(name: "create_dualflow_state", scope: !3, file: !3, line: 948, type: !2114, scopeLine: 949, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2143)
!2143 = !{!2141, !2144, !2145, !2146}
!2144 = !DILocalVariable(name: "p_info", arg: 2, scope: !2142, file: !3, line: 948, type: !339)
!2145 = !DILocalVariable(name: "key", scope: !2142, file: !3, line: 950, type: !108)
!2146 = !DILocalVariable(name: "new_state", scope: !2142, file: !3, line: 951, type: !187)
!2147 = !DILocation(line: 0, scope: !2142, inlinedAt: !2148)
!2148 = distinct !DILocation(line: 981, column: 9, scope: !2113, inlinedAt: !2120)
!2149 = !DILocation(line: 0, scope: !2122, inlinedAt: !2150)
!2150 = distinct !DILocation(line: 950, column: 30, scope: !2142, inlinedAt: !2148)
!2151 = !DILocation(line: 320, column: 17, scope: !2122, inlinedAt: !2150)
!2152 = !DILocation(line: 320, column: 9, scope: !2122, inlinedAt: !2150)
!2153 = !DILocation(line: 951, column: 2, scope: !2142, inlinedAt: !2148)
!2154 = !DILocation(line: 951, column: 25, scope: !2142, inlinedAt: !2148)
!2155 = !DILocalVariable(name: "df_state", arg: 1, scope: !2156, file: !3, line: 935, type: !186)
!2156 = distinct !DISubprogram(name: "init_dualflow_state", scope: !3, file: !3, line: 935, type: !2157, scopeLine: 937, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2159)
!2157 = !DISubroutineType(types: !2158)
!2158 = !{null, !186, !339}
!2159 = !{!2155, !2160, !2161, !2162}
!2160 = !DILocalVariable(name: "p_info", arg: 2, scope: !2156, file: !3, line: 936, type: !339)
!2161 = !DILocalVariable(name: "fw_state", scope: !2156, file: !3, line: 938, type: !1573)
!2162 = !DILocalVariable(name: "rev_state", scope: !2156, file: !3, line: 940, type: !1573)
!2163 = !DILocation(line: 0, scope: !2156, inlinedAt: !2164)
!2164 = distinct !DILocation(line: 953, column: 2, scope: !2142, inlinedAt: !2148)
!2165 = !DILocalVariable(name: "f_state", arg: 1, scope: !2166, file: !3, line: 911, type: !1573)
!2166 = distinct !DISubprogram(name: "init_flowstate", scope: !3, file: !3, line: 911, type: !2167, scopeLine: 913, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2169)
!2167 = !DISubroutineType(types: !2168)
!2168 = !{null, !1573, !339}
!2169 = !{!2165, !2170}
!2170 = !DILocalVariable(name: "p_info", arg: 2, scope: !2166, file: !3, line: 912, type: !339)
!2171 = !DILocation(line: 0, scope: !2166, inlinedAt: !2172)
!2172 = distinct !DILocation(line: 943, column: 2, scope: !2156, inlinedAt: !2164)
!2173 = !DILocation(line: 914, column: 11, scope: !2166, inlinedAt: !2172)
!2174 = !DILocation(line: 914, column: 22, scope: !2166, inlinedAt: !2172)
!2175 = !DILocation(line: 915, column: 36, scope: !2166, inlinedAt: !2172)
!2176 = !DILocation(line: 915, column: 11, scope: !2166, inlinedAt: !2172)
!2177 = !DILocation(line: 915, column: 26, scope: !2166, inlinedAt: !2172)
!2178 = !DILocation(line: 918, column: 33, scope: !2166, inlinedAt: !2172)
!2179 = !DILocation(line: 918, column: 11, scope: !2166, inlinedAt: !2172)
!2180 = !DILocation(line: 918, column: 19, scope: !2166, inlinedAt: !2172)
!2181 = !{!1649, !573, i64 56}
!2182 = !DILocation(line: 919, column: 47, scope: !2166, inlinedAt: !2172)
!2183 = !DILocation(line: 919, column: 28, scope: !2166, inlinedAt: !2172)
!2184 = !DILocation(line: 920, column: 16, scope: !2166, inlinedAt: !2172)
!2185 = !DILocation(line: 919, column: 11, scope: !2166, inlinedAt: !2172)
!2186 = !DILocation(line: 919, column: 26, scope: !2166, inlinedAt: !2172)
!2187 = !{!1649, !574, i64 65}
!2188 = !DILocation(line: 922, column: 11, scope: !2166, inlinedAt: !2172)
!2189 = !DILocation(line: 922, column: 32, scope: !2166, inlinedAt: !2172)
!2190 = !{!1649, !784, i64 66}
!2191 = !DILocalVariable(name: "f_state", arg: 1, scope: !2192, file: !3, line: 925, type: !1573)
!2192 = distinct !DISubprogram(name: "init_empty_flowstate", scope: !3, file: !3, line: 925, type: !2193, scopeLine: 926, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2195)
!2193 = !DISubroutineType(types: !2194)
!2194 = !{null, !1573}
!2195 = !{!2191}
!2196 = !DILocation(line: 0, scope: !2192, inlinedAt: !2197)
!2197 = distinct !DILocation(line: 944, column: 2, scope: !2156, inlinedAt: !2164)
!2198 = !DILocation(line: 927, column: 11, scope: !2192, inlinedAt: !2197)
!2199 = !DILocation(line: 927, column: 22, scope: !2192, inlinedAt: !2197)
!2200 = !DILocation(line: 928, column: 11, scope: !2192, inlinedAt: !2197)
!2201 = !DILocation(line: 928, column: 32, scope: !2192, inlinedAt: !2197)
!2202 = !DILocation(line: 955, column: 39, scope: !2203, inlinedAt: !2148)
!2203 = distinct !DILexicalBlock(scope: !2142, file: !3, line: 955, column: 6)
!2204 = !DILocation(line: 955, column: 6, scope: !2203, inlinedAt: !2148)
!2205 = !DILocation(line: 955, column: 69, scope: !2203, inlinedAt: !2148)
!2206 = !DILocation(line: 955, column: 6, scope: !2142, inlinedAt: !2148)
!2207 = !DILocalVariable(name: "err", arg: 1, scope: !2208, file: !3, line: 324, type: !78)
!2208 = distinct !DISubprogram(name: "update_pping_error", scope: !3, file: !3, line: 324, type: !2209, scopeLine: 325, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2211)
!2209 = !DISubroutineType(types: !2210)
!2210 = !{null, !78}
!2211 = !{!2207, !2212, !2213}
!2212 = !DILocalVariable(name: "counters", scope: !2208, file: !3, line: 329, type: !301)
!2213 = !DILocalVariable(name: "key", scope: !2208, file: !3, line: 330, type: !138)
!2214 = !DILocation(line: 0, scope: !2208, inlinedAt: !2215)
!2215 = distinct !DILocation(line: 957, column: 3, scope: !2216, inlinedAt: !2148)
!2216 = distinct !DILexicalBlock(scope: !2203, file: !3, line: 956, column: 9)
!2217 = !DILocation(line: 326, column: 14, scope: !2218, inlinedAt: !2215)
!2218 = distinct !DILexicalBlock(scope: !2208, file: !3, line: 326, column: 6)
!2219 = !DILocation(line: 326, column: 6, scope: !2208, inlinedAt: !2215)
!2220 = !DILocation(line: 330, column: 2, scope: !2208, inlinedAt: !2215)
!2221 = !DILocation(line: 330, column: 8, scope: !2208, inlinedAt: !2215)
!2222 = !DILocation(line: 332, column: 13, scope: !2208, inlinedAt: !2215)
!2223 = !DILocation(line: 333, column: 7, scope: !2224, inlinedAt: !2215)
!2224 = distinct !DILexicalBlock(scope: !2208, file: !3, line: 333, column: 6)
!2225 = !DILocation(line: 333, column: 6, scope: !2208, inlinedAt: !2215)
!2226 = !DILocation(line: 0, scope: !2227, inlinedAt: !2215)
!2227 = distinct !DILexicalBlock(scope: !2208, file: !3, line: 336, column: 15)
!2228 = !DILocation(line: 347, column: 1, scope: !2208, inlinedAt: !2215)
!2229 = !DILocalVariable(name: "ctx", arg: 1, scope: !2230, file: !3, line: 863, type: !106)
!2230 = distinct !DISubprogram(name: "send_map_full_event", scope: !3, file: !3, line: 863, type: !2231, scopeLine: 865, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2233)
!2231 = !DISubroutineType(types: !2232)
!2232 = !{null, !106, !339, !37}
!2233 = !{!2229, !2234, !2235, !2236}
!2234 = !DILocalVariable(name: "p_info", arg: 2, scope: !2230, file: !3, line: 863, type: !339)
!2235 = !DILocalVariable(name: "map", arg: 3, scope: !2230, file: !3, line: 864, type: !37)
!2236 = !DILocalVariable(name: "me", scope: !2230, file: !3, line: 866, type: !2237)
!2237 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_full_event", file: !6, line: 219, size: 512, elements: !2238)
!2238 = !{!2239, !2240, !2241, !2242, !2243}
!2239 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !2237, file: !6, line: 220, baseType: !153, size: 64)
!2240 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !2237, file: !6, line: 221, baseType: !153, size: 64, offset: 64)
!2241 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !2237, file: !6, line: 222, baseType: !109, size: 352, offset: 128)
!2242 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !2237, file: !6, line: 223, baseType: !37, size: 8, offset: 480)
!2243 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2237, file: !6, line: 224, baseType: !662, size: 24, offset: 488)
!2244 = !DILocation(line: 0, scope: !2230, inlinedAt: !2245)
!2245 = distinct !DILocation(line: 958, column: 3, scope: !2216, inlinedAt: !2148)
!2246 = !DILocation(line: 866, column: 2, scope: !2230, inlinedAt: !2245)
!2247 = !DILocation(line: 866, column: 24, scope: !2230, inlinedAt: !2245)
!2248 = !DILocation(line: 868, column: 14, scope: !2249, inlinedAt: !2245)
!2249 = distinct !DILexicalBlock(scope: !2230, file: !3, line: 868, column: 6)
!2250 = !DILocation(line: 868, column: 21, scope: !2249, inlinedAt: !2245)
!2251 = !DILocation(line: 868, column: 19, scope: !2249, inlinedAt: !2245)
!2252 = !DILocation(line: 868, column: 41, scope: !2249, inlinedAt: !2245)
!2253 = !DILocation(line: 869, column: 21, scope: !2249, inlinedAt: !2245)
!2254 = !DILocation(line: 869, column: 19, scope: !2249, inlinedAt: !2245)
!2255 = !DILocation(line: 869, column: 41, scope: !2249, inlinedAt: !2245)
!2256 = !DILocation(line: 868, column: 6, scope: !2230, inlinedAt: !2245)
!2257 = !DILocation(line: 872, column: 22, scope: !2230, inlinedAt: !2245)
!2258 = !DILocation(line: 874, column: 2, scope: !2230, inlinedAt: !2245)
!2259 = !DILocation(line: 875, column: 5, scope: !2230, inlinedAt: !2245)
!2260 = !DILocation(line: 875, column: 16, scope: !2230, inlinedAt: !2245)
!2261 = !{!2262, !576, i64 0}
!2262 = !{!"map_full_event", !576, i64 0, !576, i64 8, !780, i64 16, !574, i64 60, !574, i64 61}
!2263 = !DILocation(line: 876, column: 5, scope: !2230, inlinedAt: !2245)
!2264 = !DILocation(line: 876, column: 15, scope: !2230, inlinedAt: !2245)
!2265 = !{!2262, !576, i64 8}
!2266 = !DILocation(line: 877, column: 5, scope: !2230, inlinedAt: !2245)
!2267 = !DILocation(line: 877, column: 24, scope: !2230, inlinedAt: !2245)
!2268 = !DILocation(line: 880, column: 2, scope: !2230, inlinedAt: !2245)
!2269 = !DILocation(line: 881, column: 1, scope: !2230, inlinedAt: !2245)
!2270 = !DILocation(line: 959, column: 3, scope: !2216, inlinedAt: !2148)
!2271 = !DILocation(line: 962, column: 9, scope: !2142, inlinedAt: !2148)
!2272 = !DILocation(line: 962, column: 2, scope: !2142, inlinedAt: !2148)
!2273 = !DILocation(line: 963, column: 1, scope: !2142, inlinedAt: !2148)
!2274 = !DILocation(line: 981, column: 2, scope: !2113, inlinedAt: !2120)
!2275 = !DILocation(line: 1328, column: 7, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2006, file: !3, line: 1328, column: 6)
!2277 = !DILocation(line: 1328, column: 6, scope: !2006)
!2278 = !DILocalVariable(name: "df_state", arg: 1, scope: !2279, file: !3, line: 304, type: !186)
!2279 = distinct !DISubprogram(name: "get_flowstate_from_packet", scope: !3, file: !3, line: 304, type: !2280, scopeLine: 306, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2282)
!2280 = !DISubroutineType(types: !2281)
!2281 = !{!1573, !186, !339}
!2282 = !{!2278, !2283}
!2283 = !DILocalVariable(name: "p_info", arg: 2, scope: !2279, file: !3, line: 305, type: !339)
!2284 = !DILocation(line: 0, scope: !2279, inlinedAt: !2285)
!2285 = distinct !DILocation(line: 1331, column: 12, scope: !2006)
!2286 = !DILocation(line: 307, column: 45, scope: !2279, inlinedAt: !2285)
!2287 = !DILocation(line: 0, scope: !1638, inlinedAt: !2288)
!2288 = distinct !DILocation(line: 307, column: 9, scope: !2279, inlinedAt: !2285)
!2289 = !DILocation(line: 287, column: 9, scope: !1638, inlinedAt: !2288)
!2290 = !DILocalVariable(name: "p_info", arg: 1, scope: !2291, file: !3, line: 990, type: !339)
!2291 = distinct !DISubprogram(name: "update_forward_flowstate", scope: !3, file: !3, line: 990, type: !2292, scopeLine: 992, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2294)
!2292 = !DISubroutineType(types: !2293)
!2293 = !{null, !339, !1573}
!2294 = !{!2290, !2295}
!2295 = !DILocalVariable(name: "f_state", arg: 2, scope: !2291, file: !3, line: 991, type: !1573)
!2296 = !DILocation(line: 0, scope: !2291, inlinedAt: !2297)
!2297 = distinct !DILocation(line: 1332, column: 2, scope: !2006)
!2298 = !DILocation(line: 994, column: 15, scope: !2299, inlinedAt: !2297)
!2299 = distinct !DILexicalBlock(scope: !2291, file: !3, line: 994, column: 6)
!2300 = !DILocation(line: 994, column: 52, scope: !2299, inlinedAt: !2297)
!2301 = !DILocation(line: 994, column: 63, scope: !2299, inlinedAt: !2297)
!2302 = !DILocation(line: 994, column: 6, scope: !2291, inlinedAt: !2297)
!2303 = !DILocation(line: 0, scope: !2166, inlinedAt: !2304)
!2304 = distinct !DILocation(line: 995, column: 3, scope: !2299, inlinedAt: !2297)
!2305 = !DILocation(line: 914, column: 22, scope: !2166, inlinedAt: !2304)
!2306 = !DILocation(line: 915, column: 36, scope: !2166, inlinedAt: !2304)
!2307 = !DILocation(line: 915, column: 11, scope: !2166, inlinedAt: !2304)
!2308 = !DILocation(line: 915, column: 26, scope: !2166, inlinedAt: !2304)
!2309 = !DILocation(line: 918, column: 33, scope: !2166, inlinedAt: !2304)
!2310 = !DILocation(line: 918, column: 11, scope: !2166, inlinedAt: !2304)
!2311 = !DILocation(line: 918, column: 19, scope: !2166, inlinedAt: !2304)
!2312 = !DILocation(line: 919, column: 36, scope: !2166, inlinedAt: !2304)
!2313 = !DILocation(line: 919, column: 47, scope: !2166, inlinedAt: !2304)
!2314 = !DILocation(line: 919, column: 28, scope: !2166, inlinedAt: !2304)
!2315 = !DILocation(line: 920, column: 16, scope: !2166, inlinedAt: !2304)
!2316 = !DILocation(line: 919, column: 11, scope: !2166, inlinedAt: !2304)
!2317 = !DILocation(line: 919, column: 26, scope: !2166, inlinedAt: !2304)
!2318 = !DILocation(line: 922, column: 11, scope: !2166, inlinedAt: !2304)
!2319 = !DILocation(line: 922, column: 32, scope: !2166, inlinedAt: !2304)
!2320 = !DILocalVariable(name: "f_state", arg: 1, scope: !2321, file: !3, line: 1184, type: !1573)
!2321 = distinct !DISubprogram(name: "pping_timestamp_packet", scope: !3, file: !3, line: 1184, type: !2322, scopeLine: 1186, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2324)
!2322 = !DISubroutineType(types: !2323)
!2323 = !{null, !1573, !106, !339}
!2324 = !{!2320, !2325, !2326}
!2325 = !DILocalVariable(name: "ctx", arg: 2, scope: !2321, file: !3, line: 1184, type: !106)
!2326 = !DILocalVariable(name: "p_info", arg: 3, scope: !2321, file: !3, line: 1185, type: !339)
!2327 = !DILocation(line: 0, scope: !2321, inlinedAt: !2328)
!2328 = distinct !DILocation(line: 1333, column: 2, scope: !2006)
!2329 = !DILocation(line: 0, scope: !1785, inlinedAt: !2330)
!2330 = distinct !DILocation(line: 1187, column: 7, scope: !2331, inlinedAt: !2328)
!2331 = distinct !DILexicalBlock(scope: !2321, file: !3, line: 1187, column: 6)
!2332 = !DILocation(line: 1187, column: 36, scope: !2331, inlinedAt: !2328)
!2333 = !DILocation(line: 998, column: 12, scope: !2334, inlinedAt: !2297)
!2334 = distinct !DILexicalBlock(scope: !2335, file: !3, line: 997, column: 36)
!2335 = distinct !DILexicalBlock(scope: !2291, file: !3, line: 997, column: 6)
!2336 = !DILocation(line: 998, column: 21, scope: !2334, inlinedAt: !2297)
!2337 = !{!1649, !576, i64 24}
!2338 = !DILocation(line: 999, column: 34, scope: !2334, inlinedAt: !2297)
!2339 = !DILocation(line: 999, column: 26, scope: !2334, inlinedAt: !2297)
!2340 = !DILocation(line: 999, column: 12, scope: !2334, inlinedAt: !2297)
!2341 = !DILocation(line: 999, column: 23, scope: !2334, inlinedAt: !2297)
!2342 = !{!1649, !576, i64 32}
!2343 = !DILocation(line: 1187, column: 48, scope: !2331, inlinedAt: !2328)
!2344 = !DILocation(line: 1187, column: 6, scope: !2321, inlinedAt: !2328)
!2345 = !DILocation(line: 1190, column: 13, scope: !2346, inlinedAt: !2328)
!2346 = distinct !DILexicalBlock(scope: !2321, file: !3, line: 1190, column: 6)
!2347 = !{!1034, !784, i64 31}
!2348 = !DILocation(line: 1190, column: 23, scope: !2346, inlinedAt: !2328)
!2349 = !DILocation(line: 1190, column: 34, scope: !2346, inlinedAt: !2328)
!2350 = !DILocation(line: 1190, column: 45, scope: !2346, inlinedAt: !2328)
!2351 = !DILocalVariable(name: "p_info", arg: 1, scope: !2352, file: !3, line: 1061, type: !339)
!2352 = distinct !DISubprogram(name: "is_local_address", scope: !3, file: !3, line: 1061, type: !2353, scopeLine: 1062, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2355)
!2353 = !DISubroutineType(types: !2354)
!2354 = !{!204, !339, !106}
!2355 = !{!2351, !2356, !2357, !2358, !2359, !2363}
!2356 = !DILocalVariable(name: "ctx", arg: 2, scope: !2352, file: !3, line: 1061, type: !106)
!2357 = !DILocalVariable(name: "ret", scope: !2352, file: !3, line: 1063, type: !164)
!2358 = !DILocalVariable(name: "lookup", scope: !2352, file: !3, line: 1064, type: !407)
!2359 = !DILocalVariable(name: "src", scope: !2360, file: !3, line: 1076, type: !155)
!2360 = distinct !DILexicalBlock(scope: !2361, file: !3, line: 1075, column: 40)
!2361 = distinct !DILexicalBlock(scope: !2362, file: !3, line: 1075, column: 13)
!2362 = distinct !DILexicalBlock(scope: !2352, file: !3, line: 1071, column: 6)
!2363 = !DILocalVariable(name: "dst", scope: !2360, file: !3, line: 1077, type: !155)
!2364 = !DILocation(line: 0, scope: !2352, inlinedAt: !2365)
!2365 = distinct !DILocation(line: 1191, column: 6, scope: !2346, inlinedAt: !2328)
!2366 = !DILocation(line: 1064, column: 2, scope: !2352, inlinedAt: !2365)
!2367 = !DILocation(line: 1064, column: 24, scope: !2352, inlinedAt: !2365)
!2368 = !DILocation(line: 1065, column: 2, scope: !2352, inlinedAt: !2365)
!2369 = !DILocation(line: 1067, column: 27, scope: !2352, inlinedAt: !2365)
!2370 = !DILocation(line: 1067, column: 9, scope: !2352, inlinedAt: !2365)
!2371 = !DILocation(line: 1067, column: 17, scope: !2352, inlinedAt: !2365)
!2372 = !{!2373, !573, i64 8}
!2373 = !{!"bpf_fib_lookup", !574, i64 0, !574, i64 1, !783, i64 2, !783, i64 4, !783, i64 6, !573, i64 8, !574, i64 12, !574, i64 16, !574, i64 32, !783, i64 48, !783, i64 50, !574, i64 52, !574, i64 58}
!2374 = !DILocation(line: 1068, column: 35, scope: !2352, inlinedAt: !2365)
!2375 = !DILocation(line: 1068, column: 16, scope: !2352, inlinedAt: !2365)
!2376 = !{!2373, !574, i64 0}
!2377 = !DILocation(line: 1069, column: 27, scope: !2352, inlinedAt: !2365)
!2378 = !DILocation(line: 1069, column: 9, scope: !2352, inlinedAt: !2365)
!2379 = !DILocation(line: 1069, column: 17, scope: !2352, inlinedAt: !2365)
!2380 = !{!2373, !783, i64 6}
!2381 = !DILocation(line: 1071, column: 6, scope: !2352, inlinedAt: !2365)
!2382 = !DILocation(line: 1072, column: 24, scope: !2383, inlinedAt: !2365)
!2383 = distinct !DILexicalBlock(scope: !2362, file: !3, line: 1071, column: 32)
!2384 = !DILocation(line: 1072, column: 31, scope: !2383, inlinedAt: !2365)
!2385 = !DILocation(line: 1072, column: 10, scope: !2383, inlinedAt: !2365)
!2386 = !DILocation(line: 1072, column: 14, scope: !2383, inlinedAt: !2365)
!2387 = !DILocalVariable(name: "ipv6", arg: 1, scope: !2388, file: !3, line: 219, type: !155)
!2388 = distinct !DISubprogram(name: "ipv4_from_ipv6", scope: !3, file: !3, line: 219, type: !2389, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2391)
!2389 = !DISubroutineType(types: !2390)
!2390 = !{!137, !155}
!2391 = !{!2387}
!2392 = !DILocation(line: 0, scope: !2388, inlinedAt: !2393)
!2393 = distinct !DILocation(line: 1073, column: 21, scope: !2383, inlinedAt: !2365)
!2394 = !DILocation(line: 221, column: 9, scope: !2388, inlinedAt: !2393)
!2395 = !DILocation(line: 1073, column: 10, scope: !2383, inlinedAt: !2365)
!2396 = !DILocation(line: 1073, column: 19, scope: !2383, inlinedAt: !2365)
!2397 = !DILocation(line: 0, scope: !2388, inlinedAt: !2398)
!2398 = distinct !DILocation(line: 1074, column: 21, scope: !2383, inlinedAt: !2365)
!2399 = !DILocation(line: 221, column: 9, scope: !2388, inlinedAt: !2398)
!2400 = !DILocation(line: 1074, column: 10, scope: !2383, inlinedAt: !2365)
!2401 = !DILocation(line: 1074, column: 19, scope: !2383, inlinedAt: !2365)
!2402 = !DILocation(line: 1075, column: 2, scope: !2383, inlinedAt: !2365)
!2403 = !DILocation(line: 1076, column: 45, scope: !2360, inlinedAt: !2365)
!2404 = !DILocation(line: 0, scope: !2360, inlinedAt: !2365)
!2405 = !DILocation(line: 1077, column: 45, scope: !2360, inlinedAt: !2365)
!2406 = !DILocation(line: 1079, column: 36, scope: !2360, inlinedAt: !2365)
!2407 = !DILocation(line: 1079, column: 10, scope: !2360, inlinedAt: !2365)
!2408 = !DILocation(line: 1079, column: 19, scope: !2360, inlinedAt: !2365)
!2409 = !DILocation(line: 1080, column: 33, scope: !2360, inlinedAt: !2365)
!2410 = !DILocation(line: 1081, column: 33, scope: !2360, inlinedAt: !2365)
!2411 = !DILocation(line: 1082, column: 2, scope: !2360, inlinedAt: !2365)
!2412 = !DILocation(line: 1084, column: 40, scope: !2352, inlinedAt: !2365)
!2413 = !DILocation(line: 1084, column: 23, scope: !2352, inlinedAt: !2365)
!2414 = !DILocation(line: 1084, column: 9, scope: !2352, inlinedAt: !2365)
!2415 = !DILocation(line: 1084, column: 21, scope: !2352, inlinedAt: !2365)
!2416 = !{!2373, !574, i64 1}
!2417 = !DILocation(line: 1085, column: 9, scope: !2352, inlinedAt: !2365)
!2418 = !DILocation(line: 1085, column: 15, scope: !2352, inlinedAt: !2365)
!2419 = !{!2373, !783, i64 2}
!2420 = !DILocation(line: 1086, column: 9, scope: !2352, inlinedAt: !2365)
!2421 = !DILocation(line: 1086, column: 15, scope: !2352, inlinedAt: !2365)
!2422 = !{!2373, !783, i64 4}
!2423 = !DILocation(line: 1088, column: 8, scope: !2352, inlinedAt: !2365)
!2424 = !DILocation(line: 1090, column: 13, scope: !2352, inlinedAt: !2365)
!2425 = !DILocation(line: 1090, column: 43, scope: !2352, inlinedAt: !2365)
!2426 = !DILocation(line: 1092, column: 1, scope: !2352, inlinedAt: !2365)
!2427 = !DILocation(line: 1190, column: 6, scope: !2321, inlinedAt: !2328)
!2428 = !DILocation(line: 1195, column: 16, scope: !2429, inlinedAt: !2328)
!2429 = distinct !DILexicalBlock(scope: !2321, file: !3, line: 1195, column: 6)
!2430 = !DILocation(line: 1195, column: 37, scope: !2429, inlinedAt: !2328)
!2431 = !DILocation(line: 1195, column: 48, scope: !2429, inlinedAt: !2328)
!2432 = !DILocation(line: 1195, column: 65, scope: !2429, inlinedAt: !2328)
!2433 = !DILocation(line: 1198, column: 33, scope: !2321, inlinedAt: !2328)
!2434 = !DILocation(line: 1198, column: 11, scope: !2321, inlinedAt: !2328)
!2435 = !DILocation(line: 1198, column: 19, scope: !2321, inlinedAt: !2328)
!2436 = !DILocation(line: 1201, column: 36, scope: !2437, inlinedAt: !2328)
!2437 = distinct !DILexicalBlock(scope: !2321, file: !3, line: 1201, column: 6)
!2438 = !DILocalVariable(name: "pid", arg: 1, scope: !2439, file: !3, line: 1094, type: !168)
!2439 = distinct !DISubprogram(name: "is_new_identifier", scope: !3, file: !3, line: 1094, type: !2440, scopeLine: 1095, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2442)
!2440 = !DISubroutineType(types: !2441)
!2441 = !{!204, !168, !1573}
!2442 = !{!2438, !2443}
!2443 = !DILocalVariable(name: "f_state", arg: 2, scope: !2439, file: !3, line: 1094, type: !1573)
!2444 = !DILocation(line: 0, scope: !2439, inlinedAt: !2445)
!2445 = distinct !DILocation(line: 1196, column: 7, scope: !2429, inlinedAt: !2328)
!2446 = !DILocation(line: 1096, column: 16, scope: !2447, inlinedAt: !2445)
!2447 = distinct !DILexicalBlock(scope: !2439, file: !3, line: 1096, column: 6)
!2448 = !{!779, !783, i64 40}
!2449 = !DILocation(line: 1096, column: 22, scope: !2447, inlinedAt: !2445)
!2450 = !{!779, !573, i64 44}
!2451 = !DILocation(line: 1096, column: 6, scope: !2439, inlinedAt: !2445)
!2452 = !DILocation(line: 1195, column: 6, scope: !2321, inlinedAt: !2328)
!2453 = !DILocation(line: 1202, column: 30, scope: !2437, inlinedAt: !2328)
!2454 = !DILocation(line: 1202, column: 45, scope: !2437, inlinedAt: !2328)
!2455 = !DILocation(line: 1203, column: 15, scope: !2437, inlinedAt: !2328)
!2456 = !{!1034, !784, i64 28}
!2457 = !DILocation(line: 1203, column: 8, scope: !2437, inlinedAt: !2328)
!2458 = !DILocalVariable(name: "now", arg: 1, scope: !2459, file: !3, line: 789, type: !153)
!2459 = distinct !DISubprogram(name: "is_rate_limited", scope: !3, file: !3, line: 789, type: !2460, scopeLine: 790, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2462)
!2460 = !DISubroutineType(types: !2461)
!2461 = !{!204, !153, !153, !153}
!2462 = !{!2458, !2463, !2464}
!2463 = !DILocalVariable(name: "last_ts", arg: 2, scope: !2459, file: !3, line: 789, type: !153)
!2464 = !DILocalVariable(name: "rtt", arg: 3, scope: !2459, file: !3, line: 789, type: !153)
!2465 = !DILocation(line: 0, scope: !2459, inlinedAt: !2466)
!2466 = distinct !DILocation(line: 1202, column: 6, scope: !2437, inlinedAt: !2328)
!2467 = !DILocation(line: 791, column: 10, scope: !2468, inlinedAt: !2466)
!2468 = distinct !DILexicalBlock(scope: !2459, file: !3, line: 791, column: 6)
!2469 = !DILocation(line: 791, column: 6, scope: !2459, inlinedAt: !2466)
!2470 = !DILocation(line: 795, column: 13, scope: !2471, inlinedAt: !2466)
!2471 = distinct !DILexicalBlock(scope: !2459, file: !3, line: 795, column: 6)
!2472 = !{!1034, !576, i64 8}
!2473 = !DILocation(line: 795, column: 6, scope: !2471, inlinedAt: !2466)
!2474 = !DILocation(line: 795, column: 22, scope: !2471, inlinedAt: !2466)
!2475 = !DILocation(line: 796, column: 26, scope: !2471, inlinedAt: !2466)
!2476 = !DILocation(line: 796, column: 24, scope: !2471, inlinedAt: !2466)
!2477 = !DILocation(line: 1201, column: 6, scope: !2321, inlinedAt: !2328)
!2478 = !DILocation(line: 799, column: 32, scope: !2459, inlinedAt: !2466)
!2479 = !{!1034, !576, i64 0}
!2480 = !DILocation(line: 799, column: 23, scope: !2459, inlinedAt: !2466)
!2481 = !DILocation(line: 1198, column: 29, scope: !2321, inlinedAt: !2328)
!2482 = !DILocation(line: 1212, column: 32, scope: !2321, inlinedAt: !2328)
!2483 = !DILocation(line: 1213, column: 36, scope: !2321, inlinedAt: !2328)
!2484 = !DILocation(line: 1213, column: 11, scope: !2321, inlinedAt: !2328)
!2485 = !DILocation(line: 1213, column: 26, scope: !2321, inlinedAt: !2328)
!2486 = !DILocation(line: 1215, column: 38, scope: !2487, inlinedAt: !2328)
!2487 = distinct !DILexicalBlock(scope: !2321, file: !3, line: 1215, column: 6)
!2488 = !DILocation(line: 1215, column: 52, scope: !2487, inlinedAt: !2328)
!2489 = !DILocation(line: 1215, column: 6, scope: !2487, inlinedAt: !2328)
!2490 = !DILocation(line: 1216, column: 18, scope: !2487, inlinedAt: !2328)
!2491 = !DILocation(line: 1215, column: 6, scope: !2321, inlinedAt: !2328)
!2492 = !DILocation(line: 1217, column: 34, scope: !2493, inlinedAt: !2328)
!2493 = distinct !DILexicalBlock(scope: !2487, file: !3, line: 1216, column: 24)
!2494 = !DILocation(line: 1217, column: 3, scope: !2493, inlinedAt: !2328)
!2495 = !DILocation(line: 1218, column: 2, scope: !2493, inlinedAt: !2328)
!2496 = !DILocation(line: 0, scope: !2208, inlinedAt: !2497)
!2497 = distinct !DILocation(line: 1219, column: 3, scope: !2498, inlinedAt: !2328)
!2498 = distinct !DILexicalBlock(scope: !2487, file: !3, line: 1218, column: 9)
!2499 = !DILocation(line: 326, column: 14, scope: !2218, inlinedAt: !2497)
!2500 = !DILocation(line: 326, column: 6, scope: !2208, inlinedAt: !2497)
!2501 = !DILocation(line: 330, column: 2, scope: !2208, inlinedAt: !2497)
!2502 = !DILocation(line: 330, column: 8, scope: !2208, inlinedAt: !2497)
!2503 = !DILocation(line: 332, column: 13, scope: !2208, inlinedAt: !2497)
!2504 = !DILocation(line: 333, column: 7, scope: !2224, inlinedAt: !2497)
!2505 = !DILocation(line: 333, column: 6, scope: !2208, inlinedAt: !2497)
!2506 = !DILocation(line: 0, scope: !2227, inlinedAt: !2497)
!2507 = !DILocation(line: 347, column: 1, scope: !2208, inlinedAt: !2497)
!2508 = !DILocation(line: 0, scope: !2230, inlinedAt: !2509)
!2509 = distinct !DILocation(line: 1220, column: 3, scope: !2498, inlinedAt: !2328)
!2510 = !DILocation(line: 866, column: 2, scope: !2230, inlinedAt: !2509)
!2511 = !DILocation(line: 866, column: 24, scope: !2230, inlinedAt: !2509)
!2512 = !DILocation(line: 868, column: 14, scope: !2249, inlinedAt: !2509)
!2513 = !DILocation(line: 868, column: 21, scope: !2249, inlinedAt: !2509)
!2514 = !DILocation(line: 868, column: 19, scope: !2249, inlinedAt: !2509)
!2515 = !DILocation(line: 868, column: 41, scope: !2249, inlinedAt: !2509)
!2516 = !DILocation(line: 869, column: 21, scope: !2249, inlinedAt: !2509)
!2517 = !DILocation(line: 869, column: 19, scope: !2249, inlinedAt: !2509)
!2518 = !DILocation(line: 869, column: 41, scope: !2249, inlinedAt: !2509)
!2519 = !DILocation(line: 868, column: 6, scope: !2230, inlinedAt: !2509)
!2520 = !DILocation(line: 872, column: 22, scope: !2230, inlinedAt: !2509)
!2521 = !DILocation(line: 874, column: 2, scope: !2230, inlinedAt: !2509)
!2522 = !DILocation(line: 875, column: 5, scope: !2230, inlinedAt: !2509)
!2523 = !DILocation(line: 875, column: 16, scope: !2230, inlinedAt: !2509)
!2524 = !DILocation(line: 876, column: 5, scope: !2230, inlinedAt: !2509)
!2525 = !DILocation(line: 876, column: 15, scope: !2230, inlinedAt: !2509)
!2526 = !DILocation(line: 877, column: 5, scope: !2230, inlinedAt: !2509)
!2527 = !DILocation(line: 877, column: 24, scope: !2230, inlinedAt: !2509)
!2528 = !DILocation(line: 880, column: 2, scope: !2230, inlinedAt: !2509)
!2529 = !DILocation(line: 881, column: 1, scope: !2230, inlinedAt: !2509)
!2530 = !DILocalVariable(name: "df_state", arg: 1, scope: !2531, file: !3, line: 311, type: !186)
!2531 = distinct !DISubprogram(name: "get_reverse_flowstate_from_packet", scope: !3, file: !3, line: 311, type: !2280, scopeLine: 313, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2532)
!2532 = !{!2530, !2533}
!2533 = !DILocalVariable(name: "p_info", arg: 2, scope: !2531, file: !3, line: 312, type: !339)
!2534 = !DILocation(line: 0, scope: !2531, inlinedAt: !2535)
!2535 = distinct !DILocation(line: 1335, column: 13, scope: !2006)
!2536 = !DILocation(line: 314, column: 46, scope: !2531, inlinedAt: !2535)
!2537 = !DILocation(line: 0, scope: !1638, inlinedAt: !2538)
!2538 = distinct !DILocation(line: 314, column: 9, scope: !2531, inlinedAt: !2535)
!2539 = !DILocation(line: 287, column: 9, scope: !1638, inlinedAt: !2538)
!2540 = !DILocalVariable(name: "ctx", arg: 1, scope: !2541, file: !3, line: 1003, type: !106)
!2541 = distinct !DISubprogram(name: "update_reverse_flowstate", scope: !3, file: !3, line: 1003, type: !2542, scopeLine: 1005, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2544)
!2542 = !DISubroutineType(types: !2543)
!2543 = !{null, !106, !339, !1573}
!2544 = !{!2540, !2545, !2546}
!2545 = !DILocalVariable(name: "p_info", arg: 2, scope: !2541, file: !3, line: 1003, type: !339)
!2546 = !DILocalVariable(name: "f_state", arg: 3, scope: !2541, file: !3, line: 1004, type: !1573)
!2547 = !DILocation(line: 0, scope: !2541, inlinedAt: !2548)
!2548 = distinct !DILocation(line: 1336, column: 2, scope: !2006)
!2549 = !DILocation(line: 0, scope: !1785, inlinedAt: !2550)
!2550 = distinct !DILocation(line: 1006, column: 7, scope: !2551, inlinedAt: !2548)
!2551 = distinct !DILexicalBlock(scope: !2541, file: !3, line: 1006, column: 6)
!2552 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !2550)
!2553 = !DILocation(line: 1006, column: 6, scope: !2541, inlinedAt: !2548)
!2554 = !DILocation(line: 1011, column: 14, scope: !2555, inlinedAt: !2548)
!2555 = distinct !DILexicalBlock(scope: !2541, file: !3, line: 1010, column: 6)
!2556 = !DILocation(line: 1011, column: 25, scope: !2555, inlinedAt: !2548)
!2557 = !DILocation(line: 1010, column: 6, scope: !2541, inlinedAt: !2548)
!2558 = !DILocation(line: 1012, column: 23, scope: !2559, inlinedAt: !2548)
!2559 = distinct !DILexicalBlock(scope: !2555, file: !3, line: 1011, column: 53)
!2560 = !DILocalVariable(name: "ctx", arg: 1, scope: !2561, file: !3, line: 808, type: !106)
!2561 = distinct !DISubprogram(name: "send_flow_open_event", scope: !3, file: !3, line: 808, type: !2542, scopeLine: 810, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2562)
!2562 = !{!2560, !2563, !2564, !2565}
!2563 = !DILocalVariable(name: "p_info", arg: 2, scope: !2561, file: !3, line: 808, type: !339)
!2564 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2561, file: !3, line: 809, type: !1573)
!2565 = !DILocalVariable(name: "fe", scope: !2561, file: !3, line: 814, type: !1862)
!2566 = !DILocation(line: 0, scope: !2561, inlinedAt: !2567)
!2567 = distinct !DILocation(line: 1013, column: 3, scope: !2559, inlinedAt: !2548)
!2568 = !DILocation(line: 811, column: 14, scope: !2569, inlinedAt: !2567)
!2569 = distinct !DILexicalBlock(scope: !2561, file: !3, line: 811, column: 6)
!2570 = !DILocation(line: 811, column: 6, scope: !2561, inlinedAt: !2567)
!2571 = !DILocation(line: 814, column: 2, scope: !2561, inlinedAt: !2567)
!2572 = !DILocation(line: 814, column: 20, scope: !2561, inlinedAt: !2567)
!2573 = !DILocation(line: 814, column: 25, scope: !2561, inlinedAt: !2567)
!2574 = !DILocation(line: 820, column: 26, scope: !2561, inlinedAt: !2567)
!2575 = !DILocation(line: 818, column: 23, scope: !2561, inlinedAt: !2567)
!2576 = !DILocation(line: 819, column: 23, scope: !2561, inlinedAt: !2567)
!2577 = !DILocation(line: 824, column: 2, scope: !2561, inlinedAt: !2567)
!2578 = !DILocation(line: 825, column: 1, scope: !2561, inlinedAt: !2567)
!2579 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !2580)
!2580 = distinct !DILocation(line: 1234, column: 7, scope: !2581, inlinedAt: !2592)
!2581 = distinct !DILexicalBlock(scope: !2582, file: !3, line: 1234, column: 6)
!2582 = distinct !DISubprogram(name: "pping_match_packet", scope: !3, file: !3, line: 1227, type: !2583, scopeLine: 1230, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2585)
!2583 = !DISubroutineType(types: !2584)
!2584 = !{null, !1573, !106, !339, !229}
!2585 = !{!2586, !2587, !2588, !2589, !2590, !2591}
!2586 = !DILocalVariable(name: "f_state", arg: 1, scope: !2582, file: !3, line: 1227, type: !1573)
!2587 = !DILocalVariable(name: "ctx", arg: 2, scope: !2582, file: !3, line: 1227, type: !106)
!2588 = !DILocalVariable(name: "p_info", arg: 3, scope: !2582, file: !3, line: 1228, type: !339)
!2589 = !DILocalVariable(name: "agg_stats", arg: 4, scope: !2582, file: !3, line: 1229, type: !229)
!2590 = !DILocalVariable(name: "rtt", scope: !2582, file: !3, line: 1231, type: !153)
!2591 = !DILocalVariable(name: "p_ts", scope: !2582, file: !3, line: 1232, type: !152)
!2592 = distinct !DILocation(line: 1337, column: 2, scope: !2006)
!2593 = !DILocation(line: 1016, column: 11, scope: !2541, inlinedAt: !2548)
!2594 = !DILocation(line: 1016, column: 19, scope: !2541, inlinedAt: !2548)
!2595 = !{!1649, !576, i64 40}
!2596 = !DILocation(line: 1017, column: 32, scope: !2541, inlinedAt: !2548)
!2597 = !DILocation(line: 1017, column: 24, scope: !2541, inlinedAt: !2548)
!2598 = !DILocation(line: 1017, column: 11, scope: !2541, inlinedAt: !2548)
!2599 = !DILocation(line: 1017, column: 21, scope: !2541, inlinedAt: !2548)
!2600 = !{!1649, !576, i64 48}
!2601 = !DILocation(line: 1018, column: 1, scope: !2541, inlinedAt: !2548)
!2602 = !DILocation(line: 1338, column: 14, scope: !2006)
!2603 = !{!1034, !784, i64 35}
!2604 = !DILocation(line: 1338, column: 7, scope: !2006)
!2605 = !DILocation(line: 0, scope: !2582, inlinedAt: !2592)
!2606 = !DILocation(line: 0, scope: !1785, inlinedAt: !2580)
!2607 = !DILocation(line: 1234, column: 36, scope: !2581, inlinedAt: !2592)
!2608 = !DILocation(line: 1234, column: 48, scope: !2581, inlinedAt: !2592)
!2609 = !DILocation(line: 1234, column: 6, scope: !2582, inlinedAt: !2592)
!2610 = !DILocation(line: 1237, column: 15, scope: !2611, inlinedAt: !2592)
!2611 = distinct !DILexicalBlock(scope: !2582, file: !3, line: 1237, column: 6)
!2612 = !{!1649, !573, i64 60}
!2613 = !DILocation(line: 1237, column: 38, scope: !2611, inlinedAt: !2592)
!2614 = !DILocation(line: 1237, column: 6, scope: !2582, inlinedAt: !2592)
!2615 = !DILocation(line: 1240, column: 50, scope: !2582, inlinedAt: !2592)
!2616 = !DILocation(line: 1240, column: 41, scope: !2582, inlinedAt: !2592)
!2617 = !DILocation(line: 1240, column: 9, scope: !2582, inlinedAt: !2592)
!2618 = !DILocation(line: 1241, column: 7, scope: !2619, inlinedAt: !2592)
!2619 = distinct !DILexicalBlock(scope: !2582, file: !3, line: 1241, column: 6)
!2620 = !DILocation(line: 1241, column: 12, scope: !2619, inlinedAt: !2592)
!2621 = !DILocation(line: 1241, column: 23, scope: !2619, inlinedAt: !2592)
!2622 = !DILocation(line: 1241, column: 30, scope: !2619, inlinedAt: !2592)
!2623 = !DILocation(line: 1241, column: 28, scope: !2619, inlinedAt: !2592)
!2624 = !DILocation(line: 1241, column: 6, scope: !2582, inlinedAt: !2592)
!2625 = !DILocation(line: 1244, column: 21, scope: !2582, inlinedAt: !2592)
!2626 = !DILocation(line: 1247, column: 6, scope: !2627, inlinedAt: !2592)
!2627 = distinct !DILexicalBlock(scope: !2582, file: !3, line: 1247, column: 6)
!2628 = !DILocation(line: 1247, column: 58, scope: !2627, inlinedAt: !2592)
!2629 = !DILocation(line: 1247, column: 6, scope: !2582, inlinedAt: !2592)
!2630 = !DILocation(line: 1248, column: 3, scope: !2631, inlinedAt: !2592)
!2631 = distinct !DILexicalBlock(scope: !2627, file: !3, line: 1247, column: 64)
!2632 = !DILocation(line: 1250, column: 2, scope: !2631, inlinedAt: !2592)
!2633 = !DILocation(line: 1252, column: 15, scope: !2634, inlinedAt: !2592)
!2634 = distinct !DILexicalBlock(scope: !2582, file: !3, line: 1252, column: 6)
!2635 = !{!1649, !576, i64 0}
!2636 = !DILocation(line: 1252, column: 23, scope: !2634, inlinedAt: !2592)
!2637 = !DILocation(line: 1252, column: 28, scope: !2634, inlinedAt: !2592)
!2638 = !DILocation(line: 1253, column: 20, scope: !2634, inlinedAt: !2592)
!2639 = !DILocation(line: 1253, column: 3, scope: !2634, inlinedAt: !2592)
!2640 = !DILocation(line: 1254, column: 42, scope: !2582, inlinedAt: !2592)
!2641 = !DILocalVariable(name: "prev_srtt", arg: 1, scope: !2642, file: !3, line: 781, type: !153)
!2642 = distinct !DISubprogram(name: "calculate_srtt", scope: !3, file: !3, line: 781, type: !2643, scopeLine: 782, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2645)
!2643 = !DISubroutineType(types: !2644)
!2644 = !{!153, !153, !153}
!2645 = !{!2641, !2646}
!2646 = !DILocalVariable(name: "rtt", arg: 2, scope: !2642, file: !3, line: 781, type: !153)
!2647 = !DILocation(line: 0, scope: !2642, inlinedAt: !2648)
!2648 = distinct !DILocation(line: 1254, column: 18, scope: !2582, inlinedAt: !2592)
!2649 = !DILocation(line: 783, column: 7, scope: !2650, inlinedAt: !2648)
!2650 = distinct !DILexicalBlock(scope: !2642, file: !3, line: 783, column: 6)
!2651 = !DILocation(line: 783, column: 6, scope: !2642, inlinedAt: !2648)
!2652 = !DILocation(line: 1254, column: 16, scope: !2582, inlinedAt: !2592)
!2653 = !DILocalVariable(name: "ctx", arg: 1, scope: !2654, file: !3, line: 883, type: !106)
!2654 = distinct !DISubprogram(name: "send_rtt_event", scope: !3, file: !3, line: 883, type: !2655, scopeLine: 885, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2657)
!2655 = !DISubroutineType(types: !2656)
!2656 = !{null, !106, !153, !1573, !339}
!2657 = !{!2653, !2658, !2659, !2660, !2661}
!2658 = !DILocalVariable(name: "rtt", arg: 2, scope: !2654, file: !3, line: 883, type: !153)
!2659 = !DILocalVariable(name: "f_state", arg: 3, scope: !2654, file: !3, line: 883, type: !1573)
!2660 = !DILocalVariable(name: "p_info", arg: 4, scope: !2654, file: !3, line: 884, type: !339)
!2661 = !DILocalVariable(name: "re", scope: !2654, file: !3, line: 889, type: !2662)
!2662 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rtt_event", file: !6, line: 187, size: 960, elements: !2663)
!2663 = !{!2664, !2665, !2666, !2667, !2668, !2669, !2670, !2671, !2672, !2673, !2674, !2675}
!2664 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !2662, file: !6, line: 188, baseType: !153, size: 64)
!2665 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !2662, file: !6, line: 189, baseType: !153, size: 64, offset: 64)
!2666 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !2662, file: !6, line: 190, baseType: !109, size: 352, offset: 128)
!2667 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !2662, file: !6, line: 191, baseType: !138, size: 32, offset: 480)
!2668 = !DIDerivedType(tag: DW_TAG_member, name: "rtt", scope: !2662, file: !6, line: 192, baseType: !153, size: 64, offset: 512)
!2669 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !2662, file: !6, line: 193, baseType: !153, size: 64, offset: 576)
!2670 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !2662, file: !6, line: 194, baseType: !153, size: 64, offset: 640)
!2671 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !2662, file: !6, line: 195, baseType: !153, size: 64, offset: 704)
!2672 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !2662, file: !6, line: 196, baseType: !153, size: 64, offset: 768)
!2673 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !2662, file: !6, line: 197, baseType: !153, size: 64, offset: 832)
!2674 = !DIDerivedType(tag: DW_TAG_member, name: "match_on_egress", scope: !2662, file: !6, line: 198, baseType: !204, size: 8, offset: 896)
!2675 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2662, file: !6, line: 199, baseType: !2676, size: 56, offset: 904)
!2676 = !DICompositeType(tag: DW_TAG_array_type, baseType: !123, size: 56, elements: !2677)
!2677 = !{!2678}
!2678 = !DISubrange(count: 7)
!2679 = !DILocation(line: 0, scope: !2654, inlinedAt: !2680)
!2680 = distinct !DILocation(line: 1256, column: 2, scope: !2582, inlinedAt: !2592)
!2681 = !DILocation(line: 886, column: 14, scope: !2682, inlinedAt: !2680)
!2682 = distinct !DILexicalBlock(scope: !2654, file: !3, line: 886, column: 6)
!2683 = !DILocation(line: 886, column: 6, scope: !2654, inlinedAt: !2680)
!2684 = !DILocation(line: 889, column: 2, scope: !2654, inlinedAt: !2680)
!2685 = !DILocation(line: 889, column: 19, scope: !2654, inlinedAt: !2680)
!2686 = !DILocation(line: 889, column: 24, scope: !2654, inlinedAt: !2680)
!2687 = !{!2688, !576, i64 0}
!2688 = !{!"rtt_event", !576, i64 0, !576, i64 8, !780, i64 16, !573, i64 60, !576, i64 64, !576, i64 72, !576, i64 80, !576, i64 88, !576, i64 96, !576, i64 104, !784, i64 112, !574, i64 113}
!2689 = !DILocation(line: 891, column: 24, scope: !2654, inlinedAt: !2680)
!2690 = !{!2688, !576, i64 8}
!2691 = !DILocation(line: 892, column: 23, scope: !2654, inlinedAt: !2680)
!2692 = !{!2688, !573, i64 60}
!2693 = !{!2688, !576, i64 64}
!2694 = !{!2688, !576, i64 72}
!2695 = !DILocation(line: 896, column: 25, scope: !2654, inlinedAt: !2680)
!2696 = !{!2688, !576, i64 80}
!2697 = !DILocation(line: 897, column: 26, scope: !2654, inlinedAt: !2680)
!2698 = !{!2688, !576, i64 88}
!2699 = !DILocation(line: 898, column: 24, scope: !2654, inlinedAt: !2680)
!2700 = !{!2688, !576, i64 96}
!2701 = !DILocation(line: 899, column: 25, scope: !2654, inlinedAt: !2680)
!2702 = !{!2688, !576, i64 104}
!2703 = !DILocation(line: 900, column: 31, scope: !2654, inlinedAt: !2680)
!2704 = !{!2688, !784, i64 112}
!2705 = !DILocation(line: 901, column: 15, scope: !2654, inlinedAt: !2680)
!2706 = !DILocation(line: 904, column: 2, scope: !2654, inlinedAt: !2680)
!2707 = !DILocation(line: 905, column: 1, scope: !2654, inlinedAt: !2680)
!2708 = !DILocalVariable(name: "rtt", arg: 1, scope: !2709, file: !3, line: 1164, type: !153)
!2709 = distinct !DISubprogram(name: "aggregate_rtt", scope: !3, file: !3, line: 1164, type: !2710, scopeLine: 1165, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2712)
!2710 = !DISubroutineType(types: !2711)
!2711 = !{null, !153, !229}
!2712 = !{!2708, !2713, !2714}
!2713 = !DILocalVariable(name: "agg_stats", arg: 2, scope: !2709, file: !3, line: 1164, type: !229)
!2714 = !DILocalVariable(name: "bin_idx", scope: !2709, file: !3, line: 1169, type: !164)
!2715 = !DILocation(line: 0, scope: !2709, inlinedAt: !2716)
!2716 = distinct !DILocation(line: 1257, column: 2, scope: !2582, inlinedAt: !2592)
!2717 = !DILocation(line: 1166, column: 14, scope: !2718, inlinedAt: !2716)
!2718 = distinct !DILexicalBlock(scope: !2709, file: !3, line: 1166, column: 6)
!2719 = !DILocation(line: 1166, column: 23, scope: !2718, inlinedAt: !2716)
!2720 = !DILocation(line: 1171, column: 18, scope: !2721, inlinedAt: !2716)
!2721 = distinct !DILexicalBlock(scope: !2709, file: !3, line: 1171, column: 6)
!2722 = !{!2079, !576, i64 104}
!2723 = !DILocation(line: 1171, column: 26, scope: !2721, inlinedAt: !2716)
!2724 = !DILocation(line: 1172, column: 22, scope: !2721, inlinedAt: !2716)
!2725 = !DILocation(line: 1172, column: 3, scope: !2721, inlinedAt: !2716)
!2726 = !DILocation(line: 1173, column: 23, scope: !2727, inlinedAt: !2716)
!2727 = distinct !DILexicalBlock(scope: !2709, file: !3, line: 1173, column: 6)
!2728 = !{!2079, !576, i64 112}
!2729 = !DILocation(line: 1173, column: 10, scope: !2727, inlinedAt: !2716)
!2730 = !DILocation(line: 1173, column: 6, scope: !2709, inlinedAt: !2716)
!2731 = !DILocation(line: 1174, column: 22, scope: !2727, inlinedAt: !2716)
!2732 = !DILocation(line: 1174, column: 3, scope: !2727, inlinedAt: !2716)
!2733 = !DILocation(line: 1176, column: 16, scope: !2709, inlinedAt: !2716)
!2734 = !DILocation(line: 1177, column: 12, scope: !2709, inlinedAt: !2716)
!2735 = !DILocation(line: 1178, column: 2, scope: !2709, inlinedAt: !2716)
!2736 = !DILocation(line: 1178, column: 30, scope: !2709, inlinedAt: !2716)
!2737 = !DILocalVariable(name: "ctx", arg: 1, scope: !2738, file: !3, line: 1025, type: !106)
!2738 = distinct !DISubprogram(name: "close_and_delete_flows", scope: !3, file: !3, line: 1025, type: !2739, scopeLine: 1028, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2741)
!2739 = !DISubroutineType(types: !2740)
!2740 = !{null, !106, !339, !1573, !1573}
!2741 = !{!2737, !2742, !2743, !2744}
!2742 = !DILocalVariable(name: "p_info", arg: 2, scope: !2738, file: !3, line: 1025, type: !339)
!2743 = !DILocalVariable(name: "fw_flow", arg: 3, scope: !2738, file: !3, line: 1026, type: !1573)
!2744 = !DILocalVariable(name: "rev_flow", arg: 4, scope: !2738, file: !3, line: 1027, type: !1573)
!2745 = !DILocation(line: 0, scope: !2738, inlinedAt: !2746)
!2746 = distinct !DILocation(line: 1340, column: 2, scope: !2006)
!2747 = !DILocation(line: 1030, column: 14, scope: !2748, inlinedAt: !2746)
!2748 = distinct !DILexicalBlock(scope: !2738, file: !3, line: 1030, column: 6)
!2749 = !DILocation(line: 1030, column: 47, scope: !2748, inlinedAt: !2746)
!2750 = !DILocation(line: 0, scope: !1837, inlinedAt: !2751)
!2751 = distinct !DILocation(line: 1032, column: 7, scope: !2752, inlinedAt: !2746)
!2752 = distinct !DILexicalBlock(scope: !2753, file: !3, line: 1032, column: 7)
!2753 = distinct !DILexicalBlock(scope: !2748, file: !3, line: 1031, column: 53)
!2754 = !DILocation(line: 1022, column: 18, scope: !1837, inlinedAt: !2751)
!2755 = !DILocation(line: 1022, column: 29, scope: !1837, inlinedAt: !2751)
!2756 = !DILocation(line: 1032, column: 7, scope: !2753, inlinedAt: !2746)
!2757 = !DILocalVariable(name: "ctx", arg: 1, scope: !2758, file: !3, line: 834, type: !106)
!2758 = distinct !DISubprogram(name: "send_flow_event", scope: !3, file: !3, line: 834, type: !2759, scopeLine: 836, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2761)
!2759 = !DISubroutineType(types: !2760)
!2760 = !{null, !106, !339, !204}
!2761 = !{!2757, !2762, !2763, !2764}
!2762 = !DILocalVariable(name: "p_info", arg: 2, scope: !2758, file: !3, line: 834, type: !339)
!2763 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2758, file: !3, line: 835, type: !204)
!2764 = !DILocalVariable(name: "fe", scope: !2758, file: !3, line: 840, type: !1862)
!2765 = !DILocation(line: 0, scope: !2758, inlinedAt: !2766)
!2766 = distinct !DILocation(line: 1033, column: 4, scope: !2752, inlinedAt: !2746)
!2767 = !DILocation(line: 837, column: 14, scope: !2768, inlinedAt: !2766)
!2768 = distinct !DILexicalBlock(scope: !2758, file: !3, line: 837, column: 6)
!2769 = !DILocation(line: 837, column: 6, scope: !2758, inlinedAt: !2766)
!2770 = !DILocation(line: 840, column: 2, scope: !2758, inlinedAt: !2766)
!2771 = !DILocation(line: 840, column: 20, scope: !2758, inlinedAt: !2766)
!2772 = !DILocation(line: 840, column: 25, scope: !2758, inlinedAt: !2766)
!2773 = !DILocation(line: 844, column: 24, scope: !2758, inlinedAt: !2766)
!2774 = !DILocation(line: 843, column: 21, scope: !2758, inlinedAt: !2766)
!2775 = !DILocation(line: 0, scope: !2776, inlinedAt: !2766)
!2776 = distinct !DILexicalBlock(scope: !2758, file: !3, line: 848, column: 6)
!2777 = !DILocation(line: 856, column: 2, scope: !2758, inlinedAt: !2766)
!2778 = !DILocation(line: 857, column: 1, scope: !2758, inlinedAt: !2766)
!2779 = !DILocation(line: 1038, column: 14, scope: !2780, inlinedAt: !2746)
!2780 = distinct !DILexicalBlock(scope: !2738, file: !3, line: 1038, column: 6)
!2781 = !DILocation(line: 1034, column: 23, scope: !2753, inlinedAt: !2746)
!2782 = !DILocation(line: 1038, column: 25, scope: !2780, inlinedAt: !2746)
!2783 = !DILocation(line: 1038, column: 6, scope: !2738, inlinedAt: !2746)
!2784 = !DILocation(line: 0, scope: !1837, inlinedAt: !2785)
!2785 = distinct !DILocation(line: 1039, column: 7, scope: !2786, inlinedAt: !2746)
!2786 = distinct !DILexicalBlock(scope: !2787, file: !3, line: 1039, column: 7)
!2787 = distinct !DILexicalBlock(scope: !2780, file: !3, line: 1038, column: 53)
!2788 = !DILocation(line: 1022, column: 18, scope: !1837, inlinedAt: !2785)
!2789 = !DILocation(line: 1022, column: 29, scope: !1837, inlinedAt: !2785)
!2790 = !DILocation(line: 1039, column: 7, scope: !2787, inlinedAt: !2746)
!2791 = !DILocation(line: 0, scope: !2758, inlinedAt: !2792)
!2792 = distinct !DILocation(line: 1040, column: 4, scope: !2786, inlinedAt: !2746)
!2793 = !DILocation(line: 837, column: 14, scope: !2768, inlinedAt: !2792)
!2794 = !DILocation(line: 837, column: 6, scope: !2758, inlinedAt: !2792)
!2795 = !DILocation(line: 840, column: 2, scope: !2758, inlinedAt: !2792)
!2796 = !DILocation(line: 840, column: 20, scope: !2758, inlinedAt: !2792)
!2797 = !DILocation(line: 840, column: 25, scope: !2758, inlinedAt: !2792)
!2798 = !DILocation(line: 844, column: 24, scope: !2758, inlinedAt: !2792)
!2799 = !DILocation(line: 843, column: 21, scope: !2758, inlinedAt: !2792)
!2800 = !DILocation(line: 0, scope: !2776, inlinedAt: !2792)
!2801 = !DILocation(line: 856, column: 2, scope: !2758, inlinedAt: !2792)
!2802 = !DILocation(line: 857, column: 1, scope: !2758, inlinedAt: !2792)
!2803 = !DILocation(line: 1041, column: 24, scope: !2787, inlinedAt: !2746)
!2804 = !DILocation(line: 1042, column: 2, scope: !2787, inlinedAt: !2746)
!2805 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !2806)
!2806 = distinct !DILocation(line: 1045, column: 7, scope: !2807, inlinedAt: !2746)
!2807 = distinct !DILexicalBlock(scope: !2738, file: !3, line: 1045, column: 6)
!2808 = !DILocation(line: 0, scope: !1785, inlinedAt: !2806)
!2809 = !DILocation(line: 1045, column: 36, scope: !2807, inlinedAt: !2746)
!2810 = !DILocation(line: 0, scope: !1785, inlinedAt: !2811)
!2811 = distinct !DILocation(line: 1045, column: 40, scope: !2807, inlinedAt: !2746)
!2812 = !DILocation(line: 986, column: 18, scope: !1785, inlinedAt: !2811)
!2813 = !DILocation(line: 1045, column: 6, scope: !2738, inlinedAt: !2746)
!2814 = !DILocation(line: 0, scope: !2122, inlinedAt: !2815)
!2815 = distinct !DILocation(line: 1047, column: 6, scope: !2816, inlinedAt: !2746)
!2816 = distinct !DILexicalBlock(scope: !2817, file: !3, line: 1046, column: 7)
!2817 = distinct !DILexicalBlock(scope: !2807, file: !3, line: 1045, column: 71)
!2818 = !DILocation(line: 320, column: 17, scope: !2122, inlinedAt: !2815)
!2819 = !DILocation(line: 320, column: 9, scope: !2122, inlinedAt: !2815)
!2820 = !DILocation(line: 1047, column: 6, scope: !2816, inlinedAt: !2746)
!2821 = !DILocation(line: 1046, column: 7, scope: !2816, inlinedAt: !2746)
!2822 = !DILocation(line: 1046, column: 7, scope: !2817, inlinedAt: !2746)
!2823 = !DILocation(line: 1341, column: 1, scope: !2006)
!2824 = distinct !DISubprogram(name: "lookup_or_create_aggregation_stats", scope: !3, file: !3, line: 1119, type: !2825, scopeLine: 1120, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2827)
!2825 = !DISubroutineType(types: !2826)
!2826 = !{!229, !155, !123, !204}
!2827 = !{!2828, !2829, !2830, !2831, !2832, !2840, !2841, !2842, !2843}
!2828 = !DILocalVariable(name: "ip", arg: 1, scope: !2824, file: !3, line: 1119, type: !155)
!2829 = !DILocalVariable(name: "ipv", arg: 2, scope: !2824, file: !3, line: 1119, type: !123)
!2830 = !DILocalVariable(name: "create", arg: 3, scope: !2824, file: !3, line: 1119, type: !204)
!2831 = !DILocalVariable(name: "agg", scope: !2824, file: !3, line: 1121, type: !229)
!2832 = !DILocalVariable(name: "key", scope: !2824, file: !3, line: 1122, type: !2833)
!2833 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipprefix_key", file: !6, line: 107, size: 64, elements: !2834)
!2834 = !{!2835}
!2835 = !DIDerivedType(tag: DW_TAG_member, scope: !2833, file: !6, line: 108, baseType: !2836, size: 64)
!2836 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2833, file: !6, line: 108, size: 64, elements: !2837)
!2837 = !{!2838, !2839}
!2838 = !DIDerivedType(tag: DW_TAG_member, name: "v4", scope: !2836, file: !6, line: 109, baseType: !138, size: 32)
!2839 = !DIDerivedType(tag: DW_TAG_member, name: "v6", scope: !2836, file: !6, line: 110, baseType: !153, size: 64)
!2840 = !DILocalVariable(name: "map_choice", scope: !2824, file: !3, line: 1123, type: !151)
!2841 = !DILocalVariable(name: "zero", scope: !2824, file: !3, line: 1124, type: !138)
!2842 = !DILocalVariable(name: "agg_map", scope: !2824, file: !3, line: 1125, type: !106)
!2843 = !DILocalVariable(name: "err", scope: !2824, file: !3, line: 1126, type: !164)
!2844 = !DILocation(line: 0, scope: !2824)
!2845 = !DILocation(line: 1122, column: 2, scope: !2824)
!2846 = !DILocation(line: 1122, column: 22, scope: !2824)
!2847 = !DILocation(line: 1124, column: 2, scope: !2824)
!2848 = !DILocation(line: 1124, column: 8, scope: !2824)
!2849 = !DILocation(line: 1128, column: 15, scope: !2824)
!2850 = !DILocation(line: 1129, column: 7, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2824, file: !3, line: 1129, column: 6)
!2852 = !DILocation(line: 1129, column: 6, scope: !2824)
!2853 = !DILocation(line: 1132, column: 10, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2824, file: !3, line: 1132, column: 6)
!2855 = !DILocation(line: 1132, column: 6, scope: !2824)
!2856 = !DILocation(line: 1133, column: 31, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2854, file: !3, line: 1132, column: 22)
!2858 = !DILocalVariable(name: "prefix_key", arg: 1, scope: !2859, file: !3, line: 1107, type: !151)
!2859 = distinct !DISubprogram(name: "create_ipprefix_key_v4", scope: !3, file: !3, line: 1107, type: !2860, scopeLine: 1108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2862)
!2860 = !DISubroutineType(types: !2861)
!2861 = !{null, !151, !155}
!2862 = !{!2858, !2863}
!2863 = !DILocalVariable(name: "ip", arg: 2, scope: !2859, file: !3, line: 1107, type: !155)
!2864 = !DILocation(line: 0, scope: !2859, inlinedAt: !2865)
!2865 = distinct !DILocation(line: 1133, column: 3, scope: !2857)
!2866 = !DILocation(line: 1109, column: 16, scope: !2859, inlinedAt: !2865)
!2867 = !DILocation(line: 1109, column: 42, scope: !2859, inlinedAt: !2865)
!2868 = !{!1034, !573, i64 24}
!2869 = !DILocation(line: 1109, column: 33, scope: !2859, inlinedAt: !2865)
!2870 = !DILocation(line: 1109, column: 14, scope: !2859, inlinedAt: !2865)
!2871 = !DILocation(line: 1134, column: 13, scope: !2857)
!2872 = !DILocation(line: 1134, column: 25, scope: !2857)
!2873 = !DILocation(line: 1136, column: 2, scope: !2857)
!2874 = !DILocation(line: 1137, column: 31, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2854, file: !3, line: 1136, column: 9)
!2876 = !DILocalVariable(name: "prefix_key", arg: 1, scope: !2877, file: !3, line: 1112, type: !152)
!2877 = distinct !DISubprogram(name: "create_ipprefix_key_v6", scope: !3, file: !3, line: 1112, type: !2878, scopeLine: 1113, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2880)
!2878 = !DISubroutineType(types: !2879)
!2879 = !{null, !152, !155}
!2880 = !{!2876, !2881}
!2881 = !DILocalVariable(name: "ip", arg: 2, scope: !2877, file: !3, line: 1112, type: !155)
!2882 = !DILocation(line: 0, scope: !2877, inlinedAt: !2883)
!2883 = distinct !DILocation(line: 1137, column: 3, scope: !2875)
!2884 = !DILocation(line: 1114, column: 16, scope: !2877, inlinedAt: !2883)
!2885 = !DILocation(line: 1114, column: 46, scope: !2877, inlinedAt: !2883)
!2886 = !{!1034, !576, i64 16}
!2887 = !DILocation(line: 1114, column: 37, scope: !2877, inlinedAt: !2883)
!2888 = !DILocation(line: 1114, column: 14, scope: !2877, inlinedAt: !2883)
!2889 = !DILocation(line: 1138, column: 13, scope: !2875)
!2890 = !DILocation(line: 1138, column: 25, scope: !2875)
!2891 = !DILocation(line: 0, scope: !2854)
!2892 = !DILocation(line: 1142, column: 8, scope: !2824)
!2893 = !DILocation(line: 1143, column: 6, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2824, file: !3, line: 1143, column: 6)
!2895 = !DILocation(line: 1143, column: 6, scope: !2824)
!2896 = !DILocation(line: 1144, column: 3, scope: !2894)
!2897 = !DILocation(line: 1147, column: 6, scope: !2824)
!2898 = !DILocation(line: 1148, column: 9, scope: !2899)
!2899 = distinct !DILexicalBlock(scope: !2824, file: !3, line: 1147, column: 6)
!2900 = !DILocation(line: 1151, column: 22, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2824, file: !3, line: 1151, column: 6)
!2902 = !DILocation(line: 0, scope: !2208, inlinedAt: !2903)
!2903 = distinct !DILocation(line: 1153, column: 4, scope: !2904)
!2904 = distinct !DILexicalBlock(scope: !2905, file: !3, line: 1152, column: 7)
!2905 = distinct !DILexicalBlock(scope: !2901, file: !3, line: 1151, column: 42)
!2906 = !DILocation(line: 326, column: 14, scope: !2218, inlinedAt: !2903)
!2907 = !DILocation(line: 326, column: 6, scope: !2208, inlinedAt: !2903)
!2908 = !DILocation(line: 330, column: 2, scope: !2208, inlinedAt: !2903)
!2909 = !DILocation(line: 330, column: 8, scope: !2208, inlinedAt: !2903)
!2910 = !DILocation(line: 332, column: 13, scope: !2208, inlinedAt: !2903)
!2911 = !DILocation(line: 333, column: 7, scope: !2224, inlinedAt: !2903)
!2912 = !DILocation(line: 333, column: 6, scope: !2208, inlinedAt: !2903)
!2913 = !DILocation(line: 0, scope: !2227, inlinedAt: !2903)
!2914 = !DILocation(line: 347, column: 1, scope: !2208, inlinedAt: !2903)
!2915 = !DILocation(line: 1155, column: 7, scope: !2905)
!2916 = !DILocation(line: 1156, column: 8, scope: !2917)
!2917 = distinct !DILexicalBlock(scope: !2905, file: !3, line: 1155, column: 7)
!2918 = !DILocation(line: 1156, column: 11, scope: !2917)
!2919 = !DILocation(line: 1156, column: 4, scope: !2917)
!2920 = !DILocation(line: 1158, column: 8, scope: !2917)
!2921 = !DILocation(line: 1158, column: 11, scope: !2917)
!2922 = !DILocation(line: 1161, column: 9, scope: !2824)
!2923 = !DILocation(line: 1161, column: 2, scope: !2824)
!2924 = !DILocation(line: 1162, column: 1, scope: !2824)
