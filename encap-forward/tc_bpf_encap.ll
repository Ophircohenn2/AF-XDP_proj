; ModuleID = 'tc_bpf_encap.c'
source_filename = "tc_bpf_encap.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.6 }
%union.anon.6 = type { %struct.anon.7 }
%struct.anon.7 = type { i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.3, %union.anon.4, %union.anon.5, i16, i16, [6 x i8], [6 x i8] }
%union.anon.3 = type { i32 }
%union.anon.4 = type { [4 x i32] }
%union.anon.5 = type { [4 x i32] }
%struct.bpf_redir_neigh = type { i32, %union.anon.9 }
%union.anon.9 = type { [4 x i32] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@__const.encap_ipv4.encap_hdr = private unnamed_addr constant %struct.iphdr { i8 69, i8 0, i16 0, i16 0, i16 0, i8 16, i8 41, i16 0, %union.anon.6 { %struct.anon.7 { i32 33688330, i32 16911114 } } }, align 4
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_encap to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @tc_encap(%struct.__sk_buff* noundef %0) #0 section "classifier" !dbg !223 {
  %2 = alloca %struct.iphdr, align 4
  %3 = alloca %struct.bpf_fib_lookup, align 4
  %4 = alloca %struct.bpf_redir_neigh, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !227, metadata !DIExpression()), !dbg !280
  %5 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 0, !dbg !281
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %5) #6, !dbg !281
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %3, metadata !228, metadata !DIExpression()), !dbg !282
  %6 = getelementptr inbounds i8, i8* %5, i64 12, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(64) %6, i8 0, i64 52, i1 false), !dbg !282
  call void @llvm.dbg.value(metadata i64 20, metadata !233, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.value(metadata i32 2, metadata !237, metadata !DIExpression()), !dbg !280
  %7 = tail call i64 inttoptr (i64 50 to i64 (%struct.__sk_buff*, i32, i32, i64)*)(%struct.__sk_buff* noundef %0, i32 noundef 20, i32 noundef 1, i64 noundef 2) #6, !dbg !283
  %8 = icmp eq i64 %7, 0, !dbg !283
  br i1 %8, label %9, label %98, !dbg !285

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !286
  %11 = load i32, i32* %10, align 4, !dbg !286, !tbaa !287
  %12 = zext i32 %11 to i64, !dbg !293
  %13 = inttoptr i64 %12 to i8*, !dbg !294
  call void @llvm.dbg.value(metadata i8* %13, metadata !229, metadata !DIExpression()), !dbg !280
  %14 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !295
  %15 = load i32, i32* %14, align 8, !dbg !295, !tbaa !296
  %16 = zext i32 %15 to i64, !dbg !297
  %17 = inttoptr i64 %16 to i8*, !dbg !298
  call void @llvm.dbg.value(metadata i8* %17, metadata !232, metadata !DIExpression()), !dbg !280
  %18 = inttoptr i64 %12 to %struct.ethhdr*, !dbg !299
  call void @llvm.dbg.value(metadata %struct.ethhdr* %18, metadata !238, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.value(metadata i8* %13, metadata !300, metadata !DIExpression()) #6, !dbg !315
  call void @llvm.dbg.value(metadata i8* %17, metadata !306, metadata !DIExpression()) #6, !dbg !315
  %19 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %2, i64 0, i32 0, !dbg !317
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %19), !dbg !317
  call void @llvm.dbg.declare(metadata %struct.iphdr* %2, metadata !314, metadata !DIExpression()) #6, !dbg !318
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %19, i8* noundef nonnull align 4 dereferenceable(20) getelementptr inbounds (%struct.iphdr, %struct.iphdr* @__const.encap_ipv4.encap_hdr, i64 0, i32 0), i64 20, i1 false) #6, !dbg !318
  call void @llvm.dbg.value(metadata i8* %13, metadata !307, metadata !DIExpression()) #6, !dbg !315
  %20 = getelementptr inbounds i8, i8* %13, i64 14, !dbg !319
  call void @llvm.dbg.value(metadata i8* %20, metadata !310, metadata !DIExpression()) #6, !dbg !315
  %21 = getelementptr inbounds i8, i8* %13, i64 34, !dbg !320
  %22 = icmp ugt i8* %21, %17, !dbg !322
  br i1 %22, label %44, label %23, !dbg !323

23:                                               ; preds = %9
  call void @llvm.dbg.value(metadata i8* %13, metadata !307, metadata !DIExpression()) #6, !dbg !315
  %24 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !324
  %25 = bitcast i8* %24 to i16*, !dbg !324
  store volatile i16 8, i16* %25, align 1, !dbg !325, !tbaa !326
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %20, i8* nonnull align 4 %19, i64 20, i1 true) #6, !dbg !329, !tbaa.struct !330
  call void @llvm.dbg.value(metadata !DIArgList(i64 %16, i64 %12), metadata !313, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #6, !dbg !315
  call void @llvm.dbg.value(metadata !DIArgList(i64 %16, i64 %12), metadata !313, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #6, !dbg !315
  %26 = sub i32 %15, %11, !dbg !334
  %27 = trunc i32 %26 to i16, !dbg !335
  %28 = add i16 %27, -14, !dbg !335
  %29 = tail call i16 @llvm.bswap.i16(i16 %28) #6, !dbg !335
  %30 = getelementptr inbounds i8, i8* %13, i64 16, !dbg !336
  %31 = bitcast i8* %30 to i16*, !dbg !336
  store volatile i16 %29, i16* %31, align 2, !dbg !337, !tbaa !338
  %32 = bitcast i8* %20 to i32*, !dbg !340
  %33 = tail call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %32, i32 noundef 0, i32* noundef nonnull %32, i32 noundef 20, i32 noundef 0) #6, !dbg !341
  %34 = trunc i64 %33 to i32, !dbg !341
  call void @llvm.dbg.value(metadata i32 %34, metadata !342, metadata !DIExpression()) #6, !dbg !348
  %35 = lshr i32 %34, 16, !dbg !350
  %36 = and i32 %34, 65535, !dbg !351
  %37 = add nuw nsw i32 %35, %36, !dbg !352
  call void @llvm.dbg.value(metadata i32 %37, metadata !347, metadata !DIExpression()) #6, !dbg !348
  %38 = lshr i32 %37, 16, !dbg !353
  %39 = add nuw nsw i32 %38, %37, !dbg !354
  call void @llvm.dbg.value(metadata i32 %39, metadata !347, metadata !DIExpression()) #6, !dbg !348
  %40 = trunc i32 %39 to i16, !dbg !355
  %41 = xor i16 %40, -1, !dbg !355
  %42 = getelementptr inbounds i8, i8* %13, i64 24, !dbg !356
  %43 = bitcast i8* %42 to i16*, !dbg !356
  store volatile i16 %41, i16* %43, align 2, !dbg !357, !tbaa !358
  br label %44, !dbg !359

44:                                               ; preds = %9, %23
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %19), !dbg !359
  call void @llvm.dbg.value(metadata %struct.ethhdr* %18, metadata !247, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !280
  %45 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 20, !dbg !360
  %46 = bitcast i8* %45 to %struct.iphdr*, !dbg !360
  %47 = inttoptr i64 %16 to %struct.iphdr*, !dbg !362
  %48 = icmp ugt %struct.iphdr* %46, %47, !dbg !363
  br i1 %48, label %98, label %49, !dbg !364

49:                                               ; preds = %44
  store i8 2, i8* %5, align 4, !dbg !365, !tbaa !366
  %50 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 1, !dbg !368
  %51 = load i8, i8* %50, align 1, !dbg !368, !tbaa !369
  %52 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 6, !dbg !370
  %53 = bitcast %union.anon.3* %52 to i8*, !dbg !370
  store i8 %51, i8* %53, align 4, !dbg !371, !tbaa !331
  %54 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 9, !dbg !372
  %55 = load i8, i8* %54, align 1, !dbg !372, !tbaa !373
  %56 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 1, !dbg !374
  store i8 %55, i8* %56, align 1, !dbg !375, !tbaa !376
  %57 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 2, !dbg !377
  store i16 0, i16* %57, align 2, !dbg !378, !tbaa !379
  %58 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 3, !dbg !380
  store i16 0, i16* %58, align 4, !dbg !381, !tbaa !382
  %59 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 2, !dbg !383
  %60 = bitcast i8* %59 to i16*, !dbg !383
  %61 = load i16, i16* %60, align 2, !dbg !383, !tbaa !338
  %62 = tail call i16 @llvm.bswap.i16(i16 %61), !dbg !383
  %63 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 4, !dbg !384
  store i16 %62, i16* %63, align 2, !dbg !385, !tbaa !386
  %64 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 12, !dbg !387
  %65 = bitcast i8* %64 to i32*, !dbg !387
  %66 = load i32, i32* %65, align 4, !dbg !387, !tbaa !331
  %67 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 7, i32 0, i64 0, !dbg !388
  store i32 %66, i32* %67, align 4, !dbg !389, !tbaa !331
  %68 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 1, i32 0, i64 16, !dbg !390
  %69 = bitcast i8* %68 to i32*, !dbg !390
  %70 = load i32, i32* %69, align 4, !dbg !390, !tbaa !331
  %71 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 8, !dbg !391
  %72 = getelementptr inbounds %union.anon.5, %union.anon.5* %71, i64 0, i32 0, i64 0, !dbg !391
  store i32 %70, i32* %72, align 4, !dbg !392, !tbaa !331
  %73 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 9, !dbg !393
  %74 = load i32, i32* %73, align 4, !dbg !393, !tbaa !394
  %75 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 5, !dbg !395
  store i32 %74, i32* %75, align 4, !dbg !396, !tbaa !397
  %76 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !398
  %77 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* noundef %76, %struct.bpf_fib_lookup* noundef nonnull %3, i32 noundef 64, i32 noundef 0) #6, !dbg !399
  %78 = trunc i64 %77 to i32, !dbg !399
  call void @llvm.dbg.value(metadata i32 %78, metadata !237, metadata !DIExpression()), !dbg !280
  switch i32 %78, label %98 [
    i32 0, label %79
    i32 7, label %87
  ], !dbg !400

79:                                               ; preds = %49
  %80 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 0, i32 0, i64 0, !dbg !401
  %81 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 12, i64 0, !dbg !401
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %80, i8* noundef nonnull align 2 dereferenceable(6) %81, i64 6, i1 false), !dbg !401
  %82 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 0, i32 1, i64 0, !dbg !403
  %83 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 11, i64 0, !dbg !403
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %82, i8* noundef nonnull align 4 dereferenceable(6) %83, i64 6, i1 false), !dbg !403
  %84 = load i32, i32* %75, align 4, !dbg !404, !tbaa !397
  %85 = call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 noundef %84, i64 noundef 0) #6, !dbg !405
  %86 = trunc i64 %85 to i32, !dbg !405
  br label %98, !dbg !406

87:                                               ; preds = %49
  %88 = bitcast %struct.bpf_redir_neigh* %4 to i8*, !dbg !407
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %88) #6, !dbg !407
  call void @llvm.dbg.declare(metadata %struct.bpf_redir_neigh* %4, metadata !275, metadata !DIExpression()), !dbg !408
  %89 = load i8, i8* %5, align 4, !dbg !409, !tbaa !366
  %90 = zext i8 %89 to i32, !dbg !410
  %91 = getelementptr inbounds %struct.bpf_redir_neigh, %struct.bpf_redir_neigh* %4, i64 0, i32 0, !dbg !411
  store i32 %90, i32* %91, align 4, !dbg !412, !tbaa !413
  %92 = getelementptr inbounds %struct.bpf_redir_neigh, %struct.bpf_redir_neigh* %4, i64 0, i32 1, i32 0, !dbg !415
  %93 = bitcast [4 x i32]* %92 to i8*, !dbg !416
  %94 = bitcast %union.anon.5* %71 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %93, i8* noundef nonnull align 4 dereferenceable(16) %94, i64 16, i1 false), !dbg !416
  %95 = load i32, i32* %75, align 4, !dbg !417, !tbaa !397
  %96 = call i64 inttoptr (i64 152 to i64 (i32, %struct.bpf_redir_neigh*, i32, i64)*)(i32 noundef %95, %struct.bpf_redir_neigh* noundef nonnull %4, i32 noundef 20, i64 noundef 0) #6, !dbg !418
  %97 = trunc i64 %96 to i32, !dbg !418
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %88) #6, !dbg !419
  br label %98

98:                                               ; preds = %1, %44, %49, %87, %79
  %99 = phi i32 [ %86, %79 ], [ %97, %87 ], [ 2, %1 ], [ 2, %44 ], [ 0, %49 ], !dbg !280
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %5) #6, !dbg !420
  ret i32 %99, !dbg !420
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!218, !219, !220, !221}
!llvm.ident = !{!222}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 77, type: !216, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !36, globals: !46, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "tc_bpf_encap.c", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "f8d72045ebb0edb82f1ae9e173953efb")
!4 = !{!5, !13, !17, !25}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_ret_code", file: !6, line: 4255, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_OK", value: 0)
!10 = !DIEnumerator(name: "BPF_DROP", value: 2)
!11 = !DIEnumerator(name: "BPF_REDIRECT", value: 7)
!12 = !DIEnumerator(name: "BPF_LWT_REROUTE", value: 128)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_adj_room_mode", file: !6, line: 4151, baseType: !7, size: 32, elements: !14)
!14 = !{!15, !16}
!15 = !DIEnumerator(name: "BPF_ADJ_ROOM_NET", value: 0)
!16 = !DIEnumerator(name: "BPF_ADJ_ROOM_MAC", value: 1)
!17 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4084, baseType: !7, size: 32, elements: !18)
!18 = !{!19, !20, !21, !22, !23, !24}
!19 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_FIXED_GSO", value: 1)
!20 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_ENCAP_L3_IPV4", value: 2)
!21 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_ENCAP_L3_IPV6", value: 4)
!22 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_ENCAP_L4_GRE", value: 8)
!23 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_ENCAP_L4_UDP", value: 16)
!24 = !DIEnumerator(name: "BPF_F_ADJ_ROOM_NO_CSUM_RESET", value: 32)
!25 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4955, baseType: !7, size: 32, elements: !26)
!26 = !{!27, !28, !29, !30, !31, !32, !33, !34, !35}
!27 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0)
!28 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1)
!29 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2)
!30 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3)
!31 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4)
!32 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5)
!33 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6)
!34 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7)
!35 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8)
!36 = !{!37, !38, !39, !42}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!38 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !40, line: 24, baseType: !41)
!40 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!41 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !44, line: 27, baseType: !45)
!44 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !40, line: 27, baseType: !7)
!46 = !{!0, !47, !152, !160, !197, !202}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "bpf_skb_adjust_room", scope: !2, file: !49, line: 1280, type: !50, isLocal: true, isDefinition: true)
!49 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DISubroutineType(types: !52)
!52 = !{!38, !53, !149, !45, !124}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !55)
!55 = !{!56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !72, !73, !74, !75, !76, !77, !78, !79, !80, !84, !85, !86, !87, !88, !123, !126, !127, !128, !151}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !54, file: !6, line: 4184, baseType: !45, size: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !54, file: !6, line: 4185, baseType: !45, size: 32, offset: 32)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !54, file: !6, line: 4186, baseType: !45, size: 32, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !54, file: !6, line: 4187, baseType: !45, size: 32, offset: 96)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !54, file: !6, line: 4188, baseType: !45, size: 32, offset: 128)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !54, file: !6, line: 4189, baseType: !45, size: 32, offset: 160)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !54, file: !6, line: 4190, baseType: !45, size: 32, offset: 192)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !54, file: !6, line: 4191, baseType: !45, size: 32, offset: 224)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !54, file: !6, line: 4192, baseType: !45, size: 32, offset: 256)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !54, file: !6, line: 4193, baseType: !45, size: 32, offset: 288)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !54, file: !6, line: 4194, baseType: !45, size: 32, offset: 320)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !54, file: !6, line: 4195, baseType: !45, size: 32, offset: 352)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !54, file: !6, line: 4196, baseType: !69, size: 160, offset: 384)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 160, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 5)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !54, file: !6, line: 4197, baseType: !45, size: 32, offset: 544)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !54, file: !6, line: 4198, baseType: !45, size: 32, offset: 576)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !54, file: !6, line: 4199, baseType: !45, size: 32, offset: 608)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !54, file: !6, line: 4200, baseType: !45, size: 32, offset: 640)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !54, file: !6, line: 4201, baseType: !45, size: 32, offset: 672)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !54, file: !6, line: 4204, baseType: !45, size: 32, offset: 704)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !54, file: !6, line: 4205, baseType: !45, size: 32, offset: 736)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !54, file: !6, line: 4206, baseType: !45, size: 32, offset: 768)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !54, file: !6, line: 4207, baseType: !81, size: 128, offset: 800)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 128, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 4)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !54, file: !6, line: 4208, baseType: !81, size: 128, offset: 928)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !54, file: !6, line: 4209, baseType: !45, size: 32, offset: 1056)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !54, file: !6, line: 4210, baseType: !45, size: 32, offset: 1088)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !54, file: !6, line: 4213, baseType: !45, size: 32, offset: 1120)
!88 = !DIDerivedType(tag: DW_TAG_member, scope: !54, file: !6, line: 4214, baseType: !89, size: 64, align: 64, offset: 1152)
!89 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !54, file: !6, line: 4214, size: 64, align: 64, elements: !90)
!90 = !{!91}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !89, file: !6, line: 4214, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !94)
!94 = !{!95, !96, !97, !98, !101, !102, !103, !104, !106, !107, !108, !121, !122}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !93, file: !6, line: 5042, baseType: !39, size: 16)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !93, file: !6, line: 5043, baseType: !39, size: 16, offset: 16)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !93, file: !6, line: 5044, baseType: !39, size: 16, offset: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !93, file: !6, line: 5045, baseType: !99, size: 8, offset: 48)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !40, line: 21, baseType: !100)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !93, file: !6, line: 5046, baseType: !99, size: 8, offset: 56)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !93, file: !6, line: 5047, baseType: !99, size: 8, offset: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !93, file: !6, line: 5048, baseType: !99, size: 8, offset: 72)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !93, file: !6, line: 5049, baseType: !105, size: 16, offset: 80)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !44, line: 25, baseType: !39)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !93, file: !6, line: 5050, baseType: !105, size: 16, offset: 96)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !93, file: !6, line: 5051, baseType: !105, size: 16, offset: 112)
!108 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !6, line: 5052, baseType: !109, size: 256, offset: 128)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !6, line: 5052, size: 256, elements: !110)
!110 = !{!111, !116}
!111 = !DIDerivedType(tag: DW_TAG_member, scope: !109, file: !6, line: 5053, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !109, file: !6, line: 5053, size: 64, elements: !113)
!113 = !{!114, !115}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !112, file: !6, line: 5054, baseType: !43, size: 32)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !112, file: !6, line: 5055, baseType: !43, size: 32, offset: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, scope: !109, file: !6, line: 5057, baseType: !117, size: 256)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !109, file: !6, line: 5057, size: 256, elements: !118)
!118 = !{!119, !120}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !117, file: !6, line: 5058, baseType: !81, size: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !117, file: !6, line: 5059, baseType: !81, size: 128, offset: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !93, file: !6, line: 5062, baseType: !45, size: 32, offset: 384)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !93, file: !6, line: 5063, baseType: !43, size: 32, offset: 416)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !54, file: !6, line: 4215, baseType: !124, size: 64, offset: 1216)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !40, line: 31, baseType: !125)
!125 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !54, file: !6, line: 4216, baseType: !45, size: 32, offset: 1280)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !54, file: !6, line: 4217, baseType: !45, size: 32, offset: 1312)
!128 = !DIDerivedType(tag: DW_TAG_member, scope: !54, file: !6, line: 4218, baseType: !129, size: 64, align: 64, offset: 1344)
!129 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !54, file: !6, line: 4218, size: 64, align: 64, elements: !130)
!130 = !{!131}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !129, file: !6, line: 4218, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !134)
!134 = !{!135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !133, file: !6, line: 4273, baseType: !45, size: 32)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !133, file: !6, line: 4274, baseType: !45, size: 32, offset: 32)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !133, file: !6, line: 4275, baseType: !45, size: 32, offset: 64)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !133, file: !6, line: 4276, baseType: !45, size: 32, offset: 96)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !133, file: !6, line: 4277, baseType: !45, size: 32, offset: 128)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !133, file: !6, line: 4278, baseType: !45, size: 32, offset: 160)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !133, file: !6, line: 4280, baseType: !45, size: 32, offset: 192)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !133, file: !6, line: 4281, baseType: !81, size: 128, offset: 224)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !133, file: !6, line: 4282, baseType: !45, size: 32, offset: 352)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !133, file: !6, line: 4283, baseType: !45, size: 32, offset: 384)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !133, file: !6, line: 4284, baseType: !45, size: 32, offset: 416)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !133, file: !6, line: 4285, baseType: !81, size: 128, offset: 448)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !133, file: !6, line: 4286, baseType: !45, size: 32, offset: 576)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !133, file: !6, line: 4287, baseType: !149, size: 32, offset: 608)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !40, line: 26, baseType: !150)
!150 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !54, file: !6, line: 4219, baseType: !45, size: 32, offset: 1408)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !2, file: !49, line: 790, type: !154, isLocal: true, isDefinition: true)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = !DISubroutineType(types: !156)
!156 = !{!157, !42, !45, !42, !45, !159}
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !40, line: 30, baseType: !158)
!158 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !44, line: 32, baseType: !45)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !49, line: 1839, type: !162, isLocal: true, isDefinition: true)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DISubroutineType(types: !164)
!164 = !{!38, !37, !165, !150, !45}
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 4967, size: 512, elements: !167)
!167 = !{!168, !169, !170, !171, !172, !173, !174, !180, !185, !190, !191, !192, !196}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !166, file: !6, line: 4971, baseType: !99, size: 8)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !166, file: !6, line: 4974, baseType: !99, size: 8, offset: 8)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !166, file: !6, line: 4975, baseType: !105, size: 16, offset: 16)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !166, file: !6, line: 4976, baseType: !105, size: 16, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !166, file: !6, line: 4979, baseType: !39, size: 16, offset: 48)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !166, file: !6, line: 4984, baseType: !45, size: 32, offset: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, scope: !166, file: !6, line: 4986, baseType: !175, size: 32, offset: 96)
!175 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !166, file: !6, line: 4986, size: 32, elements: !176)
!176 = !{!177, !178, !179}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !175, file: !6, line: 4988, baseType: !99, size: 8)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !175, file: !6, line: 4989, baseType: !43, size: 32)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !175, file: !6, line: 4992, baseType: !45, size: 32)
!180 = !DIDerivedType(tag: DW_TAG_member, scope: !166, file: !6, line: 4995, baseType: !181, size: 128, offset: 128)
!181 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !166, file: !6, line: 4995, size: 128, elements: !182)
!182 = !{!183, !184}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !181, file: !6, line: 4996, baseType: !43, size: 32)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !181, file: !6, line: 4997, baseType: !81, size: 128)
!185 = !DIDerivedType(tag: DW_TAG_member, scope: !166, file: !6, line: 5004, baseType: !186, size: 128, offset: 256)
!186 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !166, file: !6, line: 5004, size: 128, elements: !187)
!187 = !{!188, !189}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !186, file: !6, line: 5005, baseType: !43, size: 32)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !186, file: !6, line: 5006, baseType: !81, size: 128)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !166, file: !6, line: 5010, baseType: !105, size: 16, offset: 384)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !166, file: !6, line: 5011, baseType: !105, size: 16, offset: 400)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !166, file: !6, line: 5012, baseType: !193, size: 48, offset: 416)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 48, elements: !194)
!194 = !{!195}
!195 = !DISubrange(count: 6)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !166, file: !6, line: 5013, baseType: !193, size: 48, offset: 464)
!197 = !DIGlobalVariableExpression(var: !198, expr: !DIExpression())
!198 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !49, line: 615, type: !199, isLocal: true, isDefinition: true)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!200 = !DISubroutineType(types: !201)
!201 = !{!38, !45, !124}
!202 = !DIGlobalVariableExpression(var: !203, expr: !DIExpression())
!203 = distinct !DIGlobalVariable(name: "bpf_redirect_neigh", scope: !2, file: !49, line: 3621, type: !204, isLocal: true, isDefinition: true)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DISubroutineType(types: !206)
!206 = !{!38, !45, !207, !150, !124}
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_redir_neigh", file: !6, line: 5016, size: 160, elements: !209)
!209 = !{!210, !211}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "nh_family", scope: !208, file: !6, line: 5018, baseType: !45, size: 32)
!211 = !DIDerivedType(tag: DW_TAG_member, scope: !208, file: !6, line: 5020, baseType: !212, size: 128, offset: 32)
!212 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !208, file: !6, line: 5020, size: 128, elements: !213)
!213 = !{!214, !215}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_nh", scope: !212, file: !6, line: 5021, baseType: !43, size: 32)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_nh", scope: !212, file: !6, line: 5022, baseType: !81, size: 128)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !217, size: 32, elements: !82)
!217 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!218 = !{i32 7, !"Dwarf Version", i32 5}
!219 = !{i32 2, !"Debug Info Version", i32 3}
!220 = !{i32 1, !"wchar_size", i32 4}
!221 = !{i32 7, !"frame-pointer", i32 2}
!222 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!223 = distinct !DISubprogram(name: "tc_encap", scope: !3, file: !3, line: 19, type: !224, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !226)
!224 = !DISubroutineType(types: !225)
!225 = !{!150, !53}
!226 = !{!227, !228, !229, !232, !233, !237, !238, !247, !275, !279}
!227 = !DILocalVariable(name: "skb", arg: 1, scope: !223, file: !3, line: 19, type: !53)
!228 = !DILocalVariable(name: "fib_params", scope: !223, file: !3, line: 21, type: !166)
!229 = !DILocalVariable(name: "data", scope: !223, file: !3, line: 22, type: !230)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 64)
!231 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!232 = !DILocalVariable(name: "data_end", scope: !223, file: !3, line: 22, type: !230)
!233 = !DILocalVariable(name: "offset", scope: !223, file: !3, line: 23, type: !234)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !235, line: 46, baseType: !236)
!235 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!236 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!237 = !DILocalVariable(name: "ret", scope: !223, file: !3, line: 24, type: !150)
!238 = !DILocalVariable(name: "eth", scope: !223, file: !3, line: 25, type: !239)
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !241, line: 168, size: 112, elements: !242)
!241 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!242 = !{!243, !245, !246}
!243 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !240, file: !241, line: 169, baseType: !244, size: 48)
!244 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 48, elements: !194)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !240, file: !241, line: 170, baseType: !244, size: 48, offset: 48)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !240, file: !241, line: 171, baseType: !105, size: 16, offset: 96)
!247 = !DILocalVariable(name: "iph", scope: !223, file: !3, line: 26, type: !248)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !250, line: 87, size: 160, elements: !251)
!250 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!251 = !{!252, !253, !254, !255, !256, !257, !258, !259, !260, !262}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !249, file: !250, line: 89, baseType: !99, size: 4, flags: DIFlagBitField, extraData: i64 0)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !249, file: !250, line: 90, baseType: !99, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !249, file: !250, line: 97, baseType: !99, size: 8, offset: 8)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !249, file: !250, line: 98, baseType: !105, size: 16, offset: 16)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !249, file: !250, line: 99, baseType: !105, size: 16, offset: 32)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !249, file: !250, line: 100, baseType: !105, size: 16, offset: 48)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !249, file: !250, line: 101, baseType: !99, size: 8, offset: 64)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !249, file: !250, line: 102, baseType: !99, size: 8, offset: 72)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !249, file: !250, line: 103, baseType: !261, size: 16, offset: 80)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !44, line: 31, baseType: !39)
!262 = !DIDerivedType(tag: DW_TAG_member, scope: !249, file: !250, line: 104, baseType: !263, size: 64, offset: 96)
!263 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !249, file: !250, line: 104, size: 64, elements: !264)
!264 = !{!265, !270}
!265 = !DIDerivedType(tag: DW_TAG_member, scope: !263, file: !250, line: 104, baseType: !266, size: 64)
!266 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !263, file: !250, line: 104, size: 64, elements: !267)
!267 = !{!268, !269}
!268 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !266, file: !250, line: 104, baseType: !43, size: 32)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !266, file: !250, line: 104, baseType: !43, size: 32, offset: 32)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !263, file: !250, line: 104, baseType: !271, size: 64)
!271 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !263, file: !250, line: 104, size: 64, elements: !272)
!272 = !{!273, !274}
!273 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !271, file: !250, line: 104, baseType: !43, size: 32)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !271, file: !250, line: 104, baseType: !43, size: 32, offset: 32)
!275 = !DILocalVariable(name: "nh_params", scope: !276, file: !3, line: 61, type: !208)
!276 = distinct !DILexicalBlock(scope: !277, file: !3, line: 60, column: 47)
!277 = distinct !DILexicalBlock(scope: !278, file: !3, line: 60, column: 13)
!278 = distinct !DILexicalBlock(scope: !223, file: !3, line: 55, column: 6)
!279 = !DILabel(scope: !223, name: "out", file: !3, line: 73)
!280 = !DILocation(line: 0, scope: !223)
!281 = !DILocation(line: 21, column: 2, scope: !223)
!282 = !DILocation(line: 21, column: 24, scope: !223)
!283 = !DILocation(line: 28, column: 6, scope: !284)
!284 = distinct !DILexicalBlock(scope: !223, file: !3, line: 28, column: 6)
!285 = !DILocation(line: 28, column: 6, scope: !223)
!286 = !DILocation(line: 31, column: 28, scope: !223)
!287 = !{!288, !289, i64 76}
!288 = !{!"__sk_buff", !289, i64 0, !289, i64 4, !289, i64 8, !289, i64 12, !289, i64 16, !289, i64 20, !289, i64 24, !289, i64 28, !289, i64 32, !289, i64 36, !289, i64 40, !289, i64 44, !290, i64 48, !289, i64 68, !289, i64 72, !289, i64 76, !289, i64 80, !289, i64 84, !289, i64 88, !289, i64 92, !289, i64 96, !290, i64 100, !290, i64 116, !289, i64 132, !289, i64 136, !289, i64 140, !290, i64 144, !292, i64 152, !289, i64 160, !289, i64 164, !290, i64 168, !289, i64 176}
!289 = !{!"int", !290, i64 0}
!290 = !{!"omnipotent char", !291, i64 0}
!291 = !{!"Simple C/C++ TBAA"}
!292 = !{!"long long", !290, i64 0}
!293 = !DILocation(line: 31, column: 17, scope: !223)
!294 = !DILocation(line: 31, column: 9, scope: !223)
!295 = !DILocation(line: 32, column: 32, scope: !223)
!296 = !{!288, !289, i64 80}
!297 = !DILocation(line: 32, column: 21, scope: !223)
!298 = !DILocation(line: 32, column: 13, scope: !223)
!299 = !DILocation(line: 33, column: 8, scope: !223)
!300 = !DILocalVariable(name: "data", arg: 1, scope: !301, file: !302, line: 43, type: !230)
!301 = distinct !DISubprogram(name: "encap_ipv4", scope: !302, file: !302, line: 43, type: !303, scopeLine: 44, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !305)
!302 = !DIFile(filename: "./encap.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "c706b1e1f5efa2d501609ca71d8a59bb")
!303 = !DISubroutineType(types: !304)
!304 = !{null, !230, !230}
!305 = !{!300, !306, !307, !310, !313, !314}
!306 = !DILocalVariable(name: "data_end", arg: 2, scope: !301, file: !302, line: 43, type: !230)
!307 = !DILocalVariable(name: "eth", scope: !301, file: !302, line: 45, type: !308)
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!309 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !240)
!310 = !DILocalVariable(name: "iph", scope: !301, file: !302, line: 46, type: !311)
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!312 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !249)
!313 = !DILocalVariable(name: "len", scope: !301, file: !302, line: 47, type: !234)
!314 = !DILocalVariable(name: "encap_hdr", scope: !301, file: !302, line: 49, type: !249)
!315 = !DILocation(line: 0, scope: !301, inlinedAt: !316)
!316 = distinct !DILocation(line: 38, column: 2, scope: !223)
!317 = !DILocation(line: 49, column: 2, scope: !301, inlinedAt: !316)
!318 = !DILocation(line: 49, column: 15, scope: !301, inlinedAt: !316)
!319 = !DILocation(line: 59, column: 21, scope: !301, inlinedAt: !316)
!320 = !DILocation(line: 60, column: 10, scope: !321, inlinedAt: !316)
!321 = distinct !DILexicalBlock(scope: !301, file: !302, line: 60, column: 6)
!322 = !DILocation(line: 60, column: 14, scope: !321, inlinedAt: !316)
!323 = !DILocation(line: 60, column: 6, scope: !301, inlinedAt: !316)
!324 = !DILocation(line: 63, column: 7, scope: !301, inlinedAt: !316)
!325 = !DILocation(line: 63, column: 15, scope: !301, inlinedAt: !316)
!326 = !{!327, !328, i64 12}
!327 = !{!"ethhdr", !290, i64 0, !290, i64 6, !328, i64 12}
!328 = !{!"short", !290, i64 0}
!329 = !DILocation(line: 64, column: 9, scope: !301, inlinedAt: !316)
!330 = !{i64 0, i64 1, !331, i64 0, i64 1, !331, i64 1, i64 1, !331, i64 2, i64 2, !332, i64 4, i64 2, !332, i64 6, i64 2, !332, i64 8, i64 1, !331, i64 9, i64 1, !331, i64 10, i64 2, !332, i64 12, i64 4, !333, i64 16, i64 4, !333, i64 12, i64 4, !333, i64 16, i64 4, !333}
!331 = !{!290, !290, i64 0}
!332 = !{!328, !328, i64 0}
!333 = !{!289, !289, i64 0}
!334 = !DILocation(line: 66, column: 18, scope: !301, inlinedAt: !316)
!335 = !DILocation(line: 67, column: 17, scope: !301, inlinedAt: !316)
!336 = !DILocation(line: 67, column: 7, scope: !301, inlinedAt: !316)
!337 = !DILocation(line: 67, column: 15, scope: !301, inlinedAt: !316)
!338 = !{!339, !328, i64 2}
!339 = !{!"iphdr", !290, i64 0, !290, i64 0, !290, i64 1, !328, i64 2, !328, i64 4, !328, i64 6, !290, i64 8, !290, i64 9, !328, i64 10, !290, i64 12}
!340 = !DILocation(line: 68, column: 46, scope: !301, inlinedAt: !316)
!341 = !DILocation(line: 68, column: 32, scope: !301, inlinedAt: !316)
!342 = !DILocalVariable(name: "csum", arg: 1, scope: !343, file: !302, line: 35, type: !45)
!343 = distinct !DISubprogram(name: "csum_fold_helper", scope: !302, file: !302, line: 35, type: !344, scopeLine: 36, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !346)
!344 = !DISubroutineType(types: !345)
!345 = !{!39, !45}
!346 = !{!342, !347}
!347 = !DILocalVariable(name: "sum", scope: !343, file: !302, line: 37, type: !45)
!348 = !DILocation(line: 0, scope: !343, inlinedAt: !349)
!349 = distinct !DILocation(line: 68, column: 15, scope: !301, inlinedAt: !316)
!350 = !DILocation(line: 38, column: 14, scope: !343, inlinedAt: !349)
!351 = !DILocation(line: 38, column: 29, scope: !343, inlinedAt: !349)
!352 = !DILocation(line: 38, column: 21, scope: !343, inlinedAt: !349)
!353 = !DILocation(line: 39, column: 14, scope: !343, inlinedAt: !349)
!354 = !DILocation(line: 39, column: 6, scope: !343, inlinedAt: !349)
!355 = !DILocation(line: 40, column: 9, scope: !343, inlinedAt: !349)
!356 = !DILocation(line: 68, column: 7, scope: !301, inlinedAt: !316)
!357 = !DILocation(line: 68, column: 13, scope: !301, inlinedAt: !316)
!358 = !{!339, !328, i64 10}
!359 = !DILocation(line: 69, column: 1, scope: !301, inlinedAt: !316)
!360 = !DILocation(line: 41, column: 10, scope: !361)
!361 = distinct !DILexicalBlock(scope: !223, file: !3, line: 41, column: 6)
!362 = !DILocation(line: 41, column: 15, scope: !361)
!363 = !DILocation(line: 41, column: 13, scope: !361)
!364 = !DILocation(line: 41, column: 6, scope: !223)
!365 = !DILocation(line: 44, column: 20, scope: !223)
!366 = !{!367, !290, i64 0}
!367 = !{!"bpf_fib_lookup", !290, i64 0, !290, i64 1, !328, i64 2, !328, i64 4, !328, i64 6, !289, i64 8, !290, i64 12, !290, i64 16, !290, i64 32, !328, i64 48, !328, i64 50, !290, i64 52, !290, i64 58}
!368 = !DILocation(line: 45, column: 24, scope: !223)
!369 = !{!339, !290, i64 1}
!370 = !DILocation(line: 45, column: 13, scope: !223)
!371 = !DILocation(line: 45, column: 17, scope: !223)
!372 = !DILocation(line: 46, column: 32, scope: !223)
!373 = !{!339, !290, i64 9}
!374 = !DILocation(line: 46, column: 13, scope: !223)
!375 = !DILocation(line: 46, column: 25, scope: !223)
!376 = !{!367, !290, i64 1}
!377 = !DILocation(line: 47, column: 13, scope: !223)
!378 = !DILocation(line: 47, column: 19, scope: !223)
!379 = !{!367, !328, i64 2}
!380 = !DILocation(line: 48, column: 13, scope: !223)
!381 = !DILocation(line: 48, column: 19, scope: !223)
!382 = !{!367, !328, i64 4}
!383 = !DILocation(line: 49, column: 23, scope: !223)
!384 = !DILocation(line: 49, column: 13, scope: !223)
!385 = !DILocation(line: 49, column: 21, scope: !223)
!386 = !{!367, !328, i64 6}
!387 = !DILocation(line: 50, column: 29, scope: !223)
!388 = !DILocation(line: 50, column: 13, scope: !223)
!389 = !DILocation(line: 50, column: 22, scope: !223)
!390 = !DILocation(line: 51, column: 29, scope: !223)
!391 = !DILocation(line: 51, column: 13, scope: !223)
!392 = !DILocation(line: 51, column: 22, scope: !223)
!393 = !DILocation(line: 52, column: 28, scope: !223)
!394 = !{!288, !289, i64 36}
!395 = !DILocation(line: 52, column: 13, scope: !223)
!396 = !DILocation(line: 52, column: 21, scope: !223)
!397 = !{!367, !289, i64 8}
!398 = !DILocation(line: 54, column: 23, scope: !223)
!399 = !DILocation(line: 54, column: 8, scope: !223)
!400 = !DILocation(line: 55, column: 6, scope: !223)
!401 = !DILocation(line: 56, column: 3, scope: !402)
!402 = distinct !DILexicalBlock(scope: !278, file: !3, line: 55, column: 39)
!403 = !DILocation(line: 57, column: 3, scope: !402)
!404 = !DILocation(line: 59, column: 34, scope: !402)
!405 = !DILocation(line: 59, column: 10, scope: !402)
!406 = !DILocation(line: 59, column: 3, scope: !402)
!407 = !DILocation(line: 61, column: 3, scope: !276)
!408 = !DILocation(line: 61, column: 26, scope: !276)
!409 = !DILocation(line: 63, column: 36, scope: !276)
!410 = !DILocation(line: 63, column: 25, scope: !276)
!411 = !DILocation(line: 63, column: 13, scope: !276)
!412 = !DILocation(line: 63, column: 23, scope: !276)
!413 = !{!414, !289, i64 0}
!414 = !{!"bpf_redir_neigh", !289, i64 0, !290, i64 4}
!415 = !DILocation(line: 64, column: 31, scope: !276)
!416 = !DILocation(line: 64, column: 3, scope: !276)
!417 = !DILocation(line: 66, column: 40, scope: !276)
!418 = !DILocation(line: 66, column: 10, scope: !276)
!419 = !DILocation(line: 68, column: 2, scope: !277)
!420 = !DILocation(line: 75, column: 1, scope: !223)
