; ModuleID = 'xdp_cpumap_qinq.c'
source_filename = "xdp_cpumap_qinq.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [2 x i32]*, i32*, i32*, [1 x i32]* }
%struct.anon.0 = type { [2 x i32]*, i32*, i32*, [24 x i32]* }
%struct.anon.1 = type { [16 x i32]*, [4 x i32]*, [8 x i32]*, [24 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.collect_vlans = type { [2 x i16] }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vlan_hdr = type { i16, i16 }

@global_max_cpus = dso_local local_unnamed_addr global i32 12, align 4, !dbg !0
@cpus_count = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !65
@cpus_enabled = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8, !dbg !51
@cpumap = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !26
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (%struct.anon.1* @cpumap to i8*), i8* bitcast (%struct.anon* @cpus_count to i8*), i8* bitcast (%struct.anon.0* @cpus_enabled to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_cpumap_qinq to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_cpumap_qinq(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !97 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !110, metadata !DIExpression()), !dbg !147
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !148
  %5 = load i32, i32* %4, align 4, !dbg !148, !tbaa !149
  %6 = zext i32 %5 to i64, !dbg !154
  %7 = inttoptr i64 %6 to i8*, !dbg !155
  call void @llvm.dbg.value(metadata i8* %7, metadata !111, metadata !DIExpression()), !dbg !147
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !156
  %9 = load i32, i32* %8, align 4, !dbg !156, !tbaa !157
  %10 = zext i32 %9 to i64, !dbg !158
  %11 = inttoptr i64 %10 to i8*, !dbg !159
  call void @llvm.dbg.value(metadata i8* %11, metadata !112, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata %struct.collect_vlans* undef, metadata !113, metadata !DIExpression()), !dbg !160
  %12 = bitcast i32* %2 to i8*, !dbg !161
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #5, !dbg !161
  call void @llvm.dbg.value(metadata i32 0, metadata !136, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata i8* %7, metadata !140, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !162, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i8* %11, metadata !170, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !171, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !172, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i8* %7, metadata !173, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i32 14, metadata !174, metadata !DIExpression()) #5, !dbg !183
  %13 = getelementptr i8, i8* %7, i64 14, !dbg !185
  %14 = icmp ugt i8* %13, %11, !dbg !187
  br i1 %14, label %103, label %15, !dbg !188

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %7, metadata !173, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i8* %13, metadata !140, metadata !DIExpression()), !dbg !147
  %16 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !189
  call void @llvm.dbg.value(metadata i8* %13, metadata !175, metadata !DIExpression()) #5, !dbg !183
  %17 = getelementptr inbounds i8, i8* %7, i64 12, !dbg !190
  %18 = bitcast i8* %17 to i16*, !dbg !190
  %19 = load i16, i16* %18, align 1, !dbg !190, !tbaa !191
  call void @llvm.dbg.value(metadata i16 %19, metadata !181, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i32 0, metadata !182, metadata !DIExpression()) #5, !dbg !183
  %20 = inttoptr i64 %10 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i64 0, metadata !182, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i16 %19, metadata !194, metadata !DIExpression()) #5, !dbg !199
  %21 = icmp eq i16 %19, 129, !dbg !205
  %22 = icmp eq i16 %19, -22392, !dbg !206
  %23 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %21) #5
  %24 = or i1 %22, %23, !dbg !206
  %25 = xor i1 %24, true, !dbg !207
  %26 = getelementptr i8, i8* %7, i64 18
  %27 = bitcast i8* %26 to %struct.vlan_hdr*
  %28 = icmp ugt %struct.vlan_hdr* %27, %20
  %29 = select i1 %25, i1 true, i1 %28, !dbg !208
  br i1 %29, label %57, label %30, !dbg !208

30:                                               ; preds = %15
  %31 = getelementptr i8, i8* %7, i64 16, !dbg !209
  %32 = bitcast i8* %31 to i16*, !dbg !209
  %33 = load i16, i16* %32, align 2, !dbg !209, !tbaa !210
  call void @llvm.dbg.value(metadata i16 %33, metadata !181, metadata !DIExpression()) #5, !dbg !183
  %34 = bitcast i8* %13 to i16*, !dbg !212
  %35 = load i16, i16* %34, align 2, !dbg !212, !tbaa !214
  %36 = and i16 %35, -241, !dbg !215
  %37 = tail call i16 @llvm.bswap.i16(i16 %36) #5, !dbg !215
  call void @llvm.dbg.value(metadata i64 1, metadata !182, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !175, metadata !DIExpression()) #5, !dbg !183
  call void @llvm.dbg.value(metadata i16 %33, metadata !194, metadata !DIExpression()) #5, !dbg !199
  %38 = icmp eq i16 %33, 129, !dbg !205
  %39 = icmp eq i16 %33, -22392, !dbg !206
  %40 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %38) #5
  %41 = or i1 %39, %40, !dbg !206
  %42 = xor i1 %41, true, !dbg !207
  %43 = getelementptr i8, i8* %7, i64 22
  %44 = bitcast i8* %43 to %struct.vlan_hdr*
  %45 = icmp ugt %struct.vlan_hdr* %44, %20
  %46 = select i1 %42, i1 true, i1 %45, !dbg !208
  br i1 %46, label %57, label %47, !dbg !208

47:                                               ; preds = %30
  %48 = getelementptr i8, i8* %7, i64 20, !dbg !209
  %49 = bitcast i8* %48 to i16*, !dbg !209
  %50 = load i16, i16* %49, align 2, !dbg !209, !tbaa !210
  call void @llvm.dbg.value(metadata i16 %50, metadata !181, metadata !DIExpression()) #5, !dbg !183
  %51 = bitcast i8* %26 to i16*, !dbg !212
  %52 = load i16, i16* %51, align 2, !dbg !212, !tbaa !214
  %53 = and i16 %52, -241, !dbg !215
  %54 = tail call i16 @llvm.bswap.i16(i16 %53) #5, !dbg !215
  %55 = zext i16 %54 to i32, !dbg !216
  %56 = shl nuw nsw i32 %55, 11, !dbg !216
  br label %57, !dbg !216

57:                                               ; preds = %15, %30, %47
  %58 = phi i16 [ 0, %15 ], [ %37, %30 ], [ %37, %47 ], !dbg !147
  %59 = phi i32 [ 0, %15 ], [ 0, %30 ], [ %56, %47 ]
  %60 = phi i16 [ %19, %15 ], [ %33, %30 ], [ %50, %47 ], !dbg !183
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !140, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata i16 %60, metadata !144, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !147
  %61 = icmp eq i16 %60, 1544, !dbg !217
  br i1 %61, label %103, label %62, !dbg !219

62:                                               ; preds = %57
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !121, metadata !DIExpression()), !dbg !147
  %63 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 2, !dbg !220
  %64 = load i16, i16* %63, align 1, !dbg !220, !tbaa !191
  call void @llvm.dbg.value(metadata i16 %64, metadata !194, metadata !DIExpression()) #5, !dbg !222
  %65 = icmp eq i16 %64, 129, !dbg !224
  %66 = icmp eq i16 %64, -22392, !dbg !225
  %67 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %65) #5
  %68 = or i1 %66, %67, !dbg !225
  br i1 %68, label %69, label %103, !dbg !226

69:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i32 0, metadata !145, metadata !DIExpression()), !dbg !147
  store i32 0, i32* %3, align 4, !dbg !227, !tbaa !228
  %70 = bitcast i32* %3 to i8*, !dbg !229
  call void @llvm.dbg.value(metadata i32* %3, metadata !145, metadata !DIExpression(DW_OP_deref)), !dbg !147
  %71 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon* @cpus_count to i8*), i8* noundef nonnull %70) #5, !dbg !230
  call void @llvm.dbg.value(metadata i8* %71, metadata !139, metadata !DIExpression()), !dbg !147
  %72 = icmp eq i8* %71, null, !dbg !231
  br i1 %72, label %103, label %73, !dbg !233

73:                                               ; preds = %69
  %74 = bitcast i8* %71 to i32*, !dbg !230
  call void @llvm.dbg.value(metadata i32* %74, metadata !139, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i16 %58), metadata !120, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !147
  call void @llvm.dbg.value(metadata i32* undef, metadata !120, metadata !DIExpression(DW_OP_deref)), !dbg !147
  call void @llvm.dbg.value(metadata i32 15485863, metadata !234, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i32 undef, metadata !243, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i8* undef, metadata !242, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i32 15485863, metadata !244, metadata !DIExpression()), !dbg !247
  %75 = zext i16 %58 to i32, !dbg !249
  %76 = add nuw nsw i32 %75, 15485863, !dbg !253
  call void @llvm.dbg.value(metadata i32 %76, metadata !244, metadata !DIExpression()), !dbg !247
  %77 = xor i32 %76, %59, !dbg !254
  call void @llvm.dbg.value(metadata i32 %77, metadata !245, metadata !DIExpression()), !dbg !247
  %78 = shl i32 %76, 16, !dbg !255
  %79 = xor i32 %77, %78, !dbg !256
  call void @llvm.dbg.value(metadata i32 %79, metadata !244, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i8* undef, metadata !242, metadata !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value)), !dbg !247
  %80 = lshr i32 %79, 11, !dbg !257
  %81 = add i32 %80, %79, !dbg !258
  call void @llvm.dbg.value(metadata i32 %81, metadata !244, metadata !DIExpression()), !dbg !247
  %82 = shl i32 %81, 3, !dbg !259
  %83 = xor i32 %82, %81, !dbg !260
  call void @llvm.dbg.value(metadata i32 %83, metadata !244, metadata !DIExpression()), !dbg !247
  %84 = lshr i32 %83, 5, !dbg !261
  %85 = add i32 %84, %83, !dbg !262
  call void @llvm.dbg.value(metadata i32 %85, metadata !244, metadata !DIExpression()), !dbg !247
  %86 = shl i32 %85, 4, !dbg !263
  %87 = xor i32 %86, %85, !dbg !264
  call void @llvm.dbg.value(metadata i32 %87, metadata !244, metadata !DIExpression()), !dbg !247
  %88 = lshr i32 %87, 17, !dbg !265
  %89 = add i32 %88, %87, !dbg !266
  call void @llvm.dbg.value(metadata i32 %89, metadata !244, metadata !DIExpression()), !dbg !247
  %90 = shl i32 %89, 25, !dbg !267
  %91 = xor i32 %90, %89, !dbg !268
  call void @llvm.dbg.value(metadata i32 %91, metadata !244, metadata !DIExpression()), !dbg !247
  %92 = lshr i32 %91, 6, !dbg !269
  %93 = add i32 %92, %91, !dbg !270
  call void @llvm.dbg.value(metadata i32 %93, metadata !244, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i32 %93, metadata !119, metadata !DIExpression()), !dbg !147
  %94 = load i32, i32* %74, align 4, !dbg !271, !tbaa !228
  %95 = urem i32 %93, %94, !dbg !272
  call void @llvm.dbg.value(metadata i32 %95, metadata !135, metadata !DIExpression()), !dbg !147
  store i32 %95, i32* %2, align 4, !dbg !273, !tbaa !228
  call void @llvm.dbg.value(metadata i32* %2, metadata !135, metadata !DIExpression(DW_OP_deref)), !dbg !147
  %96 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.0* @cpus_enabled to i8*), i8* noundef nonnull %12) #5, !dbg !274
  call void @llvm.dbg.value(metadata i8* %96, metadata !137, metadata !DIExpression()), !dbg !147
  %97 = icmp eq i8* %96, null, !dbg !275
  br i1 %97, label %103, label %98, !dbg !277

98:                                               ; preds = %73
  %99 = bitcast i8* %96 to i32*, !dbg !274
  call void @llvm.dbg.value(metadata i32* %99, metadata !137, metadata !DIExpression()), !dbg !147
  %100 = load i32, i32* %99, align 4, !dbg !278, !tbaa !228
  call void @llvm.dbg.value(metadata i32 %100, metadata !136, metadata !DIExpression()), !dbg !147
  %101 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* noundef bitcast (%struct.anon.1* @cpumap to i8*), i32 noundef %100, i64 noundef 2) #5, !dbg !279
  call void @llvm.dbg.value(metadata i64 %101, metadata !138, metadata !DIExpression()), !dbg !147
  %102 = trunc i64 %101 to i32, !dbg !280
  br label %103, !dbg !280

103:                                              ; preds = %1, %98, %57, %62, %73, %69
  %104 = phi i32 [ 0, %69 ], [ 0, %73 ], [ %102, %98 ], [ 2, %57 ], [ 2, %62 ], [ 0, %1 ], !dbg !147
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #5, !dbg !281
  ret i32 %104, !dbg !281
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
!llvm.module.flags = !{!92, !93, !94, !95}
!llvm.ident = !{!96}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "global_max_cpus", scope: !2, file: !3, line: 20, type: !62, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !25, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_cpumap_qinq.c", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "75f1f902952488b5878bacc2cd2f79c5")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 4363, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !16, !17, !20, !22, !24}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!24 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!0, !26, !51, !65, !77, !85}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "cpumap", scope: !2, file: !3, line: 28, type: !28, isLocal: false, isDefinition: true)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 23, size: 256, elements: !29)
!29 = !{!30, !36, !41, !46}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !28, file: !3, line: 24, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !34)
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !{!35}
!35 = !DISubrange(count: 16)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !28, file: !3, line: 25, baseType: !37, size: 64, offset: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 128, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 4)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !28, file: !3, line: 26, baseType: !42, size: 64, offset: 128)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 8)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !28, file: !3, line: 27, baseType: !47, size: 64, offset: 192)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 768, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 24)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "cpus_enabled", scope: !2, file: !3, line: 36, type: !53, isLocal: false, isDefinition: true)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 31, size: 256, elements: !54)
!54 = !{!55, !60, !63, !64}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !53, file: !3, line: 32, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 2)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !53, file: !3, line: 33, baseType: !61, size: 64, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !53, file: !3, line: 34, baseType: !61, size: 64, offset: 128)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !53, file: !3, line: 35, baseType: !47, size: 64, offset: 192)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "cpus_count", scope: !2, file: !3, line: 42, type: !67, isLocal: false, isDefinition: true)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 37, size: 256, elements: !68)
!68 = !{!69, !70, !71, !72}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !67, file: !3, line: 38, baseType: !56, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !67, file: !3, line: 39, baseType: !61, size: 64, offset: 64)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !67, file: !3, line: 40, baseType: !61, size: 64, offset: 128)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !67, file: !3, line: 41, baseType: !73, size: 64, offset: 192)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 32, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 1)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !79, line: 55, type: !80, isLocal: true, isDefinition: true)
!79 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DISubroutineType(types: !82)
!82 = !{!15, !15, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !79, line: 1309, type: !87, isLocal: true, isDefinition: true)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DISubroutineType(types: !89)
!89 = !{!16, !15, !62, !90}
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !18, line: 31, baseType: !91)
!91 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!92 = !{i32 7, !"Dwarf Version", i32 5}
!93 = !{i32 2, !"Debug Info Version", i32 3}
!94 = !{i32 1, !"wchar_size", i32 4}
!95 = !{i32 7, !"frame-pointer", i32 2}
!96 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!97 = distinct !DISubprogram(name: "xdp_cpumap_qinq", scope: !3, file: !3, line: 53, type: !98, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !109)
!98 = !DISubroutineType(types: !99)
!99 = !{!33, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 4374, size: 192, elements: !102)
!102 = !{!103, !104, !105, !106, !107, !108}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !101, file: !6, line: 4375, baseType: !62, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !101, file: !6, line: 4376, baseType: !62, size: 32, offset: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !101, file: !6, line: 4377, baseType: !62, size: 32, offset: 64)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !101, file: !6, line: 4379, baseType: !62, size: 32, offset: 96)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !101, file: !6, line: 4380, baseType: !62, size: 32, offset: 128)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !101, file: !6, line: 4382, baseType: !62, size: 32, offset: 160)
!109 = !{!110, !111, !112, !113, !119, !120, !121, !135, !136, !137, !138, !139, !140, !144, !145, !146}
!110 = !DILocalVariable(name: "ctx", arg: 1, scope: !97, file: !3, line: 53, type: !100)
!111 = !DILocalVariable(name: "data", scope: !97, file: !3, line: 55, type: !15)
!112 = !DILocalVariable(name: "data_end", scope: !97, file: !3, line: 56, type: !15)
!113 = !DILocalVariable(name: "vlans", scope: !97, file: !3, line: 57, type: !114)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !115, line: 71, size: 32, elements: !116)
!115 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!116 = !{!117}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !114, file: !115, line: 72, baseType: !118, size: 32)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !58)
!119 = !DILocalVariable(name: "hash_key", scope: !97, file: !3, line: 58, type: !62)
!120 = !DILocalVariable(name: "vlan_key", scope: !97, file: !3, line: 58, type: !62)
!121 = !DILocalVariable(name: "eth", scope: !97, file: !3, line: 59, type: !122)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !124, line: 168, size: 112, elements: !125)
!124 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!125 = !{!126, !131, !132}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !123, file: !124, line: 169, baseType: !127, size: 48)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !128, size: 48, elements: !129)
!128 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!129 = !{!130}
!130 = !DISubrange(count: 6)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !123, file: !124, line: 170, baseType: !127, size: 48, offset: 48)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !123, file: !124, line: 171, baseType: !133, size: 16, offset: 96)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !134, line: 25, baseType: !17)
!134 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!135 = !DILocalVariable(name: "cpu_idx", scope: !97, file: !3, line: 60, type: !62)
!136 = !DILocalVariable(name: "cpu_dest", scope: !97, file: !3, line: 60, type: !62)
!137 = !DILocalVariable(name: "cpu_lookup", scope: !97, file: !3, line: 61, type: !61)
!138 = !DILocalVariable(name: "action", scope: !97, file: !3, line: 62, type: !90)
!139 = !DILocalVariable(name: "cpu_max", scope: !97, file: !3, line: 63, type: !61)
!140 = !DILocalVariable(name: "nh", scope: !97, file: !3, line: 67, type: !141)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !115, line: 35, size: 64, elements: !142)
!142 = !{!143}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !141, file: !115, line: 36, baseType: !15, size: 64)
!144 = !DILocalVariable(name: "eth_type", scope: !97, file: !3, line: 68, type: !33)
!145 = !DILocalVariable(name: "key0", scope: !97, file: !3, line: 89, type: !33)
!146 = !DILabel(scope: !97, name: "out", file: !3, line: 109)
!147 = !DILocation(line: 0, scope: !97)
!148 = !DILocation(line: 55, column: 38, scope: !97)
!149 = !{!150, !151, i64 0}
!150 = !{!"xdp_md", !151, i64 0, !151, i64 4, !151, i64 8, !151, i64 12, !151, i64 16, !151, i64 20}
!151 = !{!"int", !152, i64 0}
!152 = !{!"omnipotent char", !153, i64 0}
!153 = !{!"Simple C/C++ TBAA"}
!154 = !DILocation(line: 55, column: 27, scope: !97)
!155 = !DILocation(line: 55, column: 19, scope: !97)
!156 = !DILocation(line: 56, column: 38, scope: !97)
!157 = !{!150, !151, i64 4}
!158 = !DILocation(line: 56, column: 27, scope: !97)
!159 = !DILocation(line: 56, column: 19, scope: !97)
!160 = !DILocation(line: 57, column: 23, scope: !97)
!161 = !DILocation(line: 60, column: 2, scope: !97)
!162 = !DILocalVariable(name: "nh", arg: 1, scope: !163, file: !115, line: 86, type: !166)
!163 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !115, file: !115, line: 86, type: !164, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !169)
!164 = !DISubroutineType(types: !165)
!165 = !{!33, !166, !15, !167, !168}
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!169 = !{!162, !170, !171, !172, !173, !174, !175, !181, !182}
!170 = !DILocalVariable(name: "data_end", arg: 2, scope: !163, file: !115, line: 87, type: !15)
!171 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !163, file: !115, line: 88, type: !167)
!172 = !DILocalVariable(name: "vlans", arg: 4, scope: !163, file: !115, line: 89, type: !168)
!173 = !DILocalVariable(name: "eth", scope: !163, file: !115, line: 91, type: !122)
!174 = !DILocalVariable(name: "hdrsize", scope: !163, file: !115, line: 92, type: !33)
!175 = !DILocalVariable(name: "vlh", scope: !163, file: !115, line: 93, type: !176)
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !115, line: 44, size: 32, elements: !178)
!178 = !{!179, !180}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !177, file: !115, line: 45, baseType: !133, size: 16)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !177, file: !115, line: 46, baseType: !133, size: 16, offset: 16)
!181 = !DILocalVariable(name: "h_proto", scope: !163, file: !115, line: 94, type: !17)
!182 = !DILocalVariable(name: "i", scope: !163, file: !115, line: 95, type: !33)
!183 = !DILocation(line: 0, scope: !163, inlinedAt: !184)
!184 = distinct !DILocation(line: 71, column: 13, scope: !97)
!185 = !DILocation(line: 100, column: 14, scope: !186, inlinedAt: !184)
!186 = distinct !DILexicalBlock(scope: !163, file: !115, line: 100, column: 6)
!187 = !DILocation(line: 100, column: 24, scope: !186, inlinedAt: !184)
!188 = !DILocation(line: 100, column: 6, scope: !163, inlinedAt: !184)
!189 = !DILocation(line: 104, column: 10, scope: !163, inlinedAt: !184)
!190 = !DILocation(line: 106, column: 17, scope: !163, inlinedAt: !184)
!191 = !{!192, !193, i64 12}
!192 = !{!"ethhdr", !152, i64 0, !152, i64 6, !193, i64 12}
!193 = !{!"short", !152, i64 0}
!194 = !DILocalVariable(name: "h_proto", arg: 1, scope: !195, file: !115, line: 75, type: !17)
!195 = distinct !DISubprogram(name: "proto_is_vlan", scope: !115, file: !115, line: 75, type: !196, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !198)
!196 = !DISubroutineType(types: !197)
!197 = !{!33, !17}
!198 = !{!194}
!199 = !DILocation(line: 0, scope: !195, inlinedAt: !200)
!200 = distinct !DILocation(line: 113, column: 8, scope: !201, inlinedAt: !184)
!201 = distinct !DILexicalBlock(scope: !202, file: !115, line: 113, column: 7)
!202 = distinct !DILexicalBlock(scope: !203, file: !115, line: 112, column: 39)
!203 = distinct !DILexicalBlock(scope: !204, file: !115, line: 112, column: 2)
!204 = distinct !DILexicalBlock(scope: !163, file: !115, line: 112, column: 2)
!205 = !DILocation(line: 77, column: 20, scope: !195, inlinedAt: !200)
!206 = !DILocation(line: 77, column: 46, scope: !195, inlinedAt: !200)
!207 = !DILocation(line: 113, column: 8, scope: !201, inlinedAt: !184)
!208 = !DILocation(line: 113, column: 7, scope: !202, inlinedAt: !184)
!209 = !DILocation(line: 119, column: 18, scope: !202, inlinedAt: !184)
!210 = !{!211, !193, i64 2}
!211 = !{!"vlan_hdr", !193, i64 0, !193, i64 2}
!212 = !DILocation(line: 122, column: 6, scope: !213, inlinedAt: !184)
!213 = distinct !DILexicalBlock(scope: !202, file: !115, line: 120, column: 7)
!214 = !{!211, !193, i64 0}
!215 = !DILocation(line: 122, column: 33, scope: !213, inlinedAt: !184)
!216 = !DILocation(line: 121, column: 4, scope: !213, inlinedAt: !184)
!217 = !DILocation(line: 78, column: 15, scope: !218)
!218 = distinct !DILexicalBlock(scope: !97, file: !3, line: 78, column: 6)
!219 = !DILocation(line: 78, column: 6, scope: !97)
!220 = !DILocation(line: 83, column: 26, scope: !221)
!221 = distinct !DILexicalBlock(scope: !97, file: !3, line: 83, column: 6)
!222 = !DILocation(line: 0, scope: !195, inlinedAt: !223)
!223 = distinct !DILocation(line: 83, column: 7, scope: !221)
!224 = !DILocation(line: 77, column: 20, scope: !195, inlinedAt: !223)
!225 = !DILocation(line: 77, column: 46, scope: !195, inlinedAt: !223)
!226 = !DILocation(line: 83, column: 6, scope: !97)
!227 = !DILocation(line: 89, column: 6, scope: !97)
!228 = !{!151, !151, i64 0}
!229 = !DILocation(line: 90, column: 45, scope: !97)
!230 = !DILocation(line: 90, column: 12, scope: !97)
!231 = !DILocation(line: 91, column: 7, scope: !232)
!232 = distinct !DILexicalBlock(scope: !97, file: !3, line: 91, column: 6)
!233 = !DILocation(line: 91, column: 6, scope: !97)
!234 = !DILocalVariable(name: "initval", arg: 3, scope: !235, file: !236, line: 10, type: !62)
!235 = distinct !DISubprogram(name: "SuperFastHash", scope: !236, file: !236, line: 10, type: !237, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !241)
!236 = !DIFile(filename: "./hash_func01.h", directory: "/home/nir_ophir/code/bpf-examples/traffic-pacing-edt", checksumkind: CSK_MD5, checksum: "84976bae7b325b9b8d9a46e5b1acb704")
!237 = !DISubroutineType(types: !238)
!238 = !{!62, !239, !33, !62}
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!241 = !{!242, !243, !234, !244, !245, !246}
!242 = !DILocalVariable(name: "data", arg: 1, scope: !235, file: !236, line: 10, type: !239)
!243 = !DILocalVariable(name: "len", arg: 2, scope: !235, file: !236, line: 10, type: !33)
!244 = !DILocalVariable(name: "hash", scope: !235, file: !236, line: 11, type: !62)
!245 = !DILocalVariable(name: "tmp", scope: !235, file: !236, line: 12, type: !62)
!246 = !DILocalVariable(name: "rem", scope: !235, file: !236, line: 13, type: !33)
!247 = !DILocation(line: 0, scope: !235, inlinedAt: !248)
!248 = distinct !DILocation(line: 96, column: 13, scope: !97)
!249 = !DILocation(line: 23, column: 12, scope: !250, inlinedAt: !248)
!250 = distinct !DILexicalBlock(scope: !251, file: !236, line: 22, column: 24)
!251 = distinct !DILexicalBlock(scope: !252, file: !236, line: 22, column: 2)
!252 = distinct !DILexicalBlock(scope: !235, file: !236, line: 22, column: 2)
!253 = !DILocation(line: 23, column: 9, scope: !250, inlinedAt: !248)
!254 = !DILocation(line: 24, column: 39, scope: !250, inlinedAt: !248)
!255 = !DILocation(line: 25, column: 18, scope: !250, inlinedAt: !248)
!256 = !DILocation(line: 25, column: 25, scope: !250, inlinedAt: !248)
!257 = !DILocation(line: 27, column: 17, scope: !250, inlinedAt: !248)
!258 = !DILocation(line: 27, column: 9, scope: !250, inlinedAt: !248)
!259 = !DILocation(line: 47, column: 15, scope: !235, inlinedAt: !248)
!260 = !DILocation(line: 47, column: 7, scope: !235, inlinedAt: !248)
!261 = !DILocation(line: 48, column: 15, scope: !235, inlinedAt: !248)
!262 = !DILocation(line: 48, column: 7, scope: !235, inlinedAt: !248)
!263 = !DILocation(line: 49, column: 15, scope: !235, inlinedAt: !248)
!264 = !DILocation(line: 49, column: 7, scope: !235, inlinedAt: !248)
!265 = !DILocation(line: 50, column: 15, scope: !235, inlinedAt: !248)
!266 = !DILocation(line: 50, column: 7, scope: !235, inlinedAt: !248)
!267 = !DILocation(line: 51, column: 15, scope: !235, inlinedAt: !248)
!268 = !DILocation(line: 51, column: 7, scope: !235, inlinedAt: !248)
!269 = !DILocation(line: 52, column: 15, scope: !235, inlinedAt: !248)
!270 = !DILocation(line: 52, column: 7, scope: !235, inlinedAt: !248)
!271 = !DILocation(line: 97, column: 23, scope: !97)
!272 = !DILocation(line: 97, column: 21, scope: !97)
!273 = !DILocation(line: 97, column: 10, scope: !97)
!274 = !DILocation(line: 102, column: 15, scope: !97)
!275 = !DILocation(line: 103, column: 7, scope: !276)
!276 = distinct !DILexicalBlock(scope: !97, file: !3, line: 103, column: 6)
!277 = !DILocation(line: 103, column: 6, scope: !97)
!278 = !DILocation(line: 105, column: 13, scope: !97)
!279 = !DILocation(line: 108, column: 11, scope: !97)
!280 = !DILocation(line: 108, column: 2, scope: !97)
!281 = !DILocation(line: 111, column: 1, scope: !97)
