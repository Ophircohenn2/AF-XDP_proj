; ModuleID = 'xdp_encap.c'
source_filename = "xdp_encap.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@__const.encap_ipv4.encap_hdr = private unnamed_addr constant %struct.iphdr { i8 69, i8 0, i16 0, i16 0, i16 0, i8 16, i8 41, i16 0, %union.anon { %struct.anon { i32 33688330, i32 16911114 } } }, align 4
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_encap to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_encap(%struct.xdp_md* noundef %0) #0 section "prog" !dbg !58 {
  %2 = alloca %struct.iphdr, align 4
  %3 = alloca %struct.ethhdr, align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !62, metadata !DIExpression()), !dbg !88
  %4 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %3, i64 0, i32 0, i64 0, !dbg !89
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %4), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.ethhdr* %3, metadata !77, metadata !DIExpression()), !dbg !90
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %4, i8 0, i64 14, i1 true), !dbg !90
  call void @llvm.dbg.value(metadata i64 20, metadata !82, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata i32 0, metadata !86, metadata !DIExpression()), !dbg !88
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !91
  %6 = load i32, i32* %5, align 4, !dbg !91, !tbaa !92
  %7 = zext i32 %6 to i64, !dbg !97
  call void @llvm.dbg.value(metadata i64 %7, metadata !78, metadata !DIExpression()), !dbg !88
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !98
  %9 = load i32, i32* %8, align 4, !dbg !98, !tbaa !99
  %10 = zext i32 %9 to i64, !dbg !100
  call void @llvm.dbg.value(metadata i64 %10, metadata !81, metadata !DIExpression()), !dbg !88
  %11 = inttoptr i64 %7 to %struct.ethhdr*, !dbg !101
  call void @llvm.dbg.value(metadata %struct.ethhdr* %11, metadata !63, metadata !DIExpression()), !dbg !88
  %12 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 1, !dbg !102
  %13 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !104
  %14 = icmp ugt %struct.ethhdr* %12, %13, !dbg !105
  br i1 %14, label %57, label %15, !dbg !106

15:                                               ; preds = %1
  %16 = inttoptr i64 %7 to i8*, !dbg !107
  call void @llvm.dbg.value(metadata i8* %16, metadata !78, metadata !DIExpression()), !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %4, i8* align 1 %16, i64 14, i1 true), !dbg !108, !tbaa.struct !109
  %17 = tail call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -20) #6, !dbg !113
  %18 = icmp eq i64 %17, 0, !dbg !113
  br i1 %18, label %19, label %57, !dbg !115

19:                                               ; preds = %15
  %20 = load i32, i32* %5, align 4, !dbg !116, !tbaa !92
  %21 = zext i32 %20 to i64, !dbg !117
  %22 = inttoptr i64 %21 to i8*, !dbg !118
  call void @llvm.dbg.value(metadata i8* %22, metadata !78, metadata !DIExpression()), !dbg !88
  %23 = load i32, i32* %8, align 4, !dbg !119, !tbaa !99
  %24 = zext i32 %23 to i64, !dbg !120
  call void @llvm.dbg.value(metadata i64 %24, metadata !81, metadata !DIExpression()), !dbg !88
  %25 = inttoptr i64 %21 to %struct.ethhdr*, !dbg !121
  call void @llvm.dbg.value(metadata %struct.ethhdr* %25, metadata !63, metadata !DIExpression()), !dbg !88
  %26 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %25, i64 1, !dbg !122
  %27 = inttoptr i64 %24 to %struct.ethhdr*, !dbg !124
  %28 = icmp ugt %struct.ethhdr* %26, %27, !dbg !125
  br i1 %28, label %57, label %29, !dbg !126

29:                                               ; preds = %19
  %30 = inttoptr i64 %24 to i8*, !dbg !127
  call void @llvm.dbg.value(metadata i8* %30, metadata !81, metadata !DIExpression()), !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %22, i8* nonnull align 1 %4, i64 14, i1 true), !dbg !128, !tbaa.struct !109
  call void @llvm.dbg.value(metadata i8* %22, metadata !129, metadata !DIExpression()) #6, !dbg !169
  call void @llvm.dbg.value(metadata i8* %30, metadata !135, metadata !DIExpression()) #6, !dbg !169
  %31 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %2, i64 0, i32 0, !dbg !171
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %31), !dbg !171
  call void @llvm.dbg.declare(metadata %struct.iphdr* %2, metadata !168, metadata !DIExpression()) #6, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %31, i8* noundef nonnull align 4 dereferenceable(20) getelementptr inbounds (%struct.iphdr, %struct.iphdr* @__const.encap_ipv4.encap_hdr, i64 0, i32 0), i64 20, i1 false) #6, !dbg !172
  call void @llvm.dbg.value(metadata i8* %22, metadata !136, metadata !DIExpression()) #6, !dbg !169
  %32 = getelementptr inbounds i8, i8* %22, i64 14, !dbg !173
  call void @llvm.dbg.value(metadata i8* %32, metadata !137, metadata !DIExpression()) #6, !dbg !169
  %33 = getelementptr inbounds i8, i8* %22, i64 34, !dbg !174
  %34 = icmp ugt i8* %33, %30, !dbg !176
  br i1 %34, label %56, label %35, !dbg !177

35:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i8* %22, metadata !136, metadata !DIExpression()) #6, !dbg !169
  %36 = getelementptr inbounds i8, i8* %22, i64 12, !dbg !178
  %37 = bitcast i8* %36 to i16*, !dbg !178
  store volatile i16 8, i16* %37, align 1, !dbg !179, !tbaa !180
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %32, i8* nonnull align 4 %31, i64 20, i1 true) #6, !dbg !182, !tbaa.struct !183
  call void @llvm.dbg.value(metadata !DIArgList(i64 %24, i64 %21), metadata !167, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #6, !dbg !169
  call void @llvm.dbg.value(metadata !DIArgList(i64 %24, i64 %21), metadata !167, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #6, !dbg !169
  %38 = sub i32 %23, %20, !dbg !185
  %39 = trunc i32 %38 to i16, !dbg !186
  %40 = add i16 %39, -14, !dbg !186
  %41 = tail call i16 @llvm.bswap.i16(i16 %40) #6, !dbg !186
  %42 = getelementptr inbounds i8, i8* %22, i64 16, !dbg !187
  %43 = bitcast i8* %42 to i16*, !dbg !187
  store volatile i16 %41, i16* %43, align 2, !dbg !188, !tbaa !189
  %44 = bitcast i8* %32 to i32*, !dbg !191
  %45 = tail call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* noundef nonnull %44, i32 noundef 0, i32* noundef nonnull %44, i32 noundef 20, i32 noundef 0) #6, !dbg !192
  %46 = trunc i64 %45 to i32, !dbg !192
  call void @llvm.dbg.value(metadata i32 %46, metadata !193, metadata !DIExpression()) #6, !dbg !199
  %47 = lshr i32 %46, 16, !dbg !201
  %48 = and i32 %46, 65535, !dbg !202
  %49 = add nuw nsw i32 %47, %48, !dbg !203
  call void @llvm.dbg.value(metadata i32 %49, metadata !198, metadata !DIExpression()) #6, !dbg !199
  %50 = lshr i32 %49, 16, !dbg !204
  %51 = add nuw nsw i32 %50, %49, !dbg !205
  call void @llvm.dbg.value(metadata i32 %51, metadata !198, metadata !DIExpression()) #6, !dbg !199
  %52 = trunc i32 %51 to i16, !dbg !206
  %53 = xor i16 %52, -1, !dbg !206
  %54 = getelementptr inbounds i8, i8* %22, i64 24, !dbg !207
  %55 = bitcast i8* %54 to i16*, !dbg !207
  store volatile i16 %53, i16* %55, align 2, !dbg !208, !tbaa !209
  br label %56, !dbg !210

56:                                               ; preds = %29, %35
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %31), !dbg !210
  call void @llvm.dbg.value(metadata i32 2, metadata !86, metadata !DIExpression()), !dbg !88
  br label %57, !dbg !211

57:                                               ; preds = %19, %15, %1, %56
  %58 = phi i32 [ 0, %1 ], [ 0, %15 ], [ 0, %19 ], [ 2, %56 ], !dbg !88
  call void @llvm.dbg.value(metadata i32 %58, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.label(metadata !87), !dbg !212
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %4), !dbg !213
  ret i32 %58, !dbg !214
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

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
!llvm.module.flags = !{!53, !54, !55, !56}
!llvm.ident = !{!57}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 50, type: !49, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !24, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_encap.c", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "2fb6f90ebbb2244abde05d26189da352")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 4363, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !16, !17, !20}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !22, line: 27, baseType: !23)
!22 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!24 = !{!0, !25, !41}
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_head", scope: !2, file: !27, line: 1130, type: !28, isLocal: true, isDefinition: true)
!27 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DISubroutineType(types: !30)
!30 = !{!16, !31, !40}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 4374, size: 192, elements: !33)
!33 = !{!34, !35, !36, !37, !38, !39}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !32, file: !6, line: 4375, baseType: !23, size: 32)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !32, file: !6, line: 4376, baseType: !23, size: 32, offset: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !32, file: !6, line: 4377, baseType: !23, size: 32, offset: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !32, file: !6, line: 4379, baseType: !23, size: 32, offset: 96)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !32, file: !6, line: 4380, baseType: !23, size: 32, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !32, file: !6, line: 4382, baseType: !23, size: 32, offset: 160)
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !2, file: !27, line: 790, type: !43, isLocal: true, isDefinition: true)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !20, !23, !20, !23, !48}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !18, line: 30, baseType: !47)
!47 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !22, line: 32, baseType: !23)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 32, elements: !51)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !{i32 7, !"Dwarf Version", i32 5}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{i32 7, !"frame-pointer", i32 2}
!57 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!58 = distinct !DISubprogram(name: "xdp_encap", scope: !3, file: !3, line: 13, type: !59, scopeLine: 14, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !61)
!59 = !DISubroutineType(types: !60)
!60 = !{!40, !31}
!61 = !{!62, !63, !77, !78, !81, !82, !86, !87}
!62 = !DILocalVariable(name: "ctx", arg: 1, scope: !58, file: !3, line: 13, type: !31)
!63 = !DILocalVariable(name: "ehdr", scope: !58, file: !3, line: 15, type: !64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !66)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !67, line: 168, size: 112, elements: !68)
!67 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!68 = !{!69, !74, !75}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !66, file: !67, line: 169, baseType: !70, size: 48)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 48, elements: !72)
!71 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!72 = !{!73}
!73 = !DISubrange(count: 6)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !66, file: !67, line: 170, baseType: !70, size: 48, offset: 48)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !66, file: !67, line: 171, baseType: !76, size: 16, offset: 96)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !22, line: 25, baseType: !17)
!77 = !DILocalVariable(name: "old_ehdr", scope: !58, file: !3, line: 15, type: !65)
!78 = !DILocalVariable(name: "data", scope: !58, file: !3, line: 16, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!81 = !DILocalVariable(name: "data_end", scope: !58, file: !3, line: 16, type: !79)
!82 = !DILocalVariable(name: "offset", scope: !58, file: !3, line: 17, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !84, line: 46, baseType: !85)
!84 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!85 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!86 = !DILocalVariable(name: "ret", scope: !58, file: !3, line: 18, type: !40)
!87 = !DILabel(scope: !58, name: "out", file: !3, line: 46)
!88 = !DILocation(line: 0, scope: !58)
!89 = !DILocation(line: 15, column: 2, scope: !58)
!90 = !DILocation(line: 15, column: 32, scope: !58)
!91 = !DILocation(line: 20, column: 28, scope: !58)
!92 = !{!93, !94, i64 0}
!93 = !{!"xdp_md", !94, i64 0, !94, i64 4, !94, i64 8, !94, i64 12, !94, i64 16, !94, i64 20}
!94 = !{!"int", !95, i64 0}
!95 = !{!"omnipotent char", !96, i64 0}
!96 = !{!"Simple C/C++ TBAA"}
!97 = !DILocation(line: 20, column: 17, scope: !58)
!98 = !DILocation(line: 21, column: 32, scope: !58)
!99 = !{!93, !94, i64 4}
!100 = !DILocation(line: 21, column: 21, scope: !58)
!101 = !DILocation(line: 23, column: 9, scope: !58)
!102 = !DILocation(line: 24, column: 11, scope: !103)
!103 = distinct !DILexicalBlock(scope: !58, file: !3, line: 24, column: 6)
!104 = !DILocation(line: 24, column: 17, scope: !103)
!105 = !DILocation(line: 24, column: 15, scope: !103)
!106 = !DILocation(line: 24, column: 6, scope: !58)
!107 = !DILocation(line: 20, column: 9, scope: !58)
!108 = !DILocation(line: 26, column: 13, scope: !58)
!109 = !{i64 0, i64 6, !110, i64 6, i64 6, !110, i64 12, i64 2, !111}
!110 = !{!95, !95, i64 0}
!111 = !{!112, !112, i64 0}
!112 = !{!"short", !95, i64 0}
!113 = !DILocation(line: 28, column: 6, scope: !114)
!114 = distinct !DILexicalBlock(scope: !58, file: !3, line: 28, column: 6)
!115 = !DILocation(line: 28, column: 6, scope: !58)
!116 = !DILocation(line: 31, column: 28, scope: !58)
!117 = !DILocation(line: 31, column: 17, scope: !58)
!118 = !DILocation(line: 31, column: 9, scope: !58)
!119 = !DILocation(line: 32, column: 32, scope: !58)
!120 = !DILocation(line: 32, column: 21, scope: !58)
!121 = !DILocation(line: 34, column: 9, scope: !58)
!122 = !DILocation(line: 36, column: 11, scope: !123)
!123 = distinct !DILexicalBlock(scope: !58, file: !3, line: 36, column: 6)
!124 = !DILocation(line: 36, column: 17, scope: !123)
!125 = !DILocation(line: 36, column: 15, scope: !123)
!126 = !DILocation(line: 36, column: 6, scope: !58)
!127 = !DILocation(line: 32, column: 13, scope: !58)
!128 = !DILocation(line: 38, column: 10, scope: !58)
!129 = !DILocalVariable(name: "data", arg: 1, scope: !130, file: !131, line: 43, type: !79)
!130 = distinct !DISubprogram(name: "encap_ipv4", scope: !131, file: !131, line: 43, type: !132, scopeLine: 44, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !134)
!131 = !DIFile(filename: "./encap.h", directory: "/home/nir_ophir/code/bpf-examples/encap-forward", checksumkind: CSK_MD5, checksum: "c706b1e1f5efa2d501609ca71d8a59bb")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !79, !79}
!134 = !{!129, !135, !136, !137, !167, !168}
!135 = !DILocalVariable(name: "data_end", arg: 2, scope: !130, file: !131, line: 43, type: !79)
!136 = !DILocalVariable(name: "eth", scope: !130, file: !131, line: 45, type: !64)
!137 = !DILocalVariable(name: "iph", scope: !130, file: !131, line: 46, type: !138)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !140)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !141, line: 87, size: 160, elements: !142)
!141 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!142 = !{!143, !145, !146, !147, !148, !149, !150, !151, !152, !154}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !140, file: !141, line: 89, baseType: !144, size: 4, flags: DIFlagBitField, extraData: i64 0)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !71)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !140, file: !141, line: 90, baseType: !144, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !140, file: !141, line: 97, baseType: !144, size: 8, offset: 8)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !140, file: !141, line: 98, baseType: !76, size: 16, offset: 16)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !140, file: !141, line: 99, baseType: !76, size: 16, offset: 32)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !140, file: !141, line: 100, baseType: !76, size: 16, offset: 48)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !140, file: !141, line: 101, baseType: !144, size: 8, offset: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !140, file: !141, line: 102, baseType: !144, size: 8, offset: 72)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !140, file: !141, line: 103, baseType: !153, size: 16, offset: 80)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !22, line: 31, baseType: !17)
!154 = !DIDerivedType(tag: DW_TAG_member, scope: !140, file: !141, line: 104, baseType: !155, size: 64, offset: 96)
!155 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !140, file: !141, line: 104, size: 64, elements: !156)
!156 = !{!157, !162}
!157 = !DIDerivedType(tag: DW_TAG_member, scope: !155, file: !141, line: 104, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !141, line: 104, size: 64, elements: !159)
!159 = !{!160, !161}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !158, file: !141, line: 104, baseType: !21, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !158, file: !141, line: 104, baseType: !21, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !155, file: !141, line: 104, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !141, line: 104, size: 64, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !163, file: !141, line: 104, baseType: !21, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !163, file: !141, line: 104, baseType: !21, size: 32, offset: 32)
!167 = !DILocalVariable(name: "len", scope: !130, file: !131, line: 47, type: !83)
!168 = !DILocalVariable(name: "encap_hdr", scope: !130, file: !131, line: 49, type: !140)
!169 = !DILocation(line: 0, scope: !130, inlinedAt: !170)
!170 = distinct !DILocation(line: 43, column: 2, scope: !58)
!171 = !DILocation(line: 49, column: 2, scope: !130, inlinedAt: !170)
!172 = !DILocation(line: 49, column: 15, scope: !130, inlinedAt: !170)
!173 = !DILocation(line: 59, column: 21, scope: !130, inlinedAt: !170)
!174 = !DILocation(line: 60, column: 10, scope: !175, inlinedAt: !170)
!175 = distinct !DILexicalBlock(scope: !130, file: !131, line: 60, column: 6)
!176 = !DILocation(line: 60, column: 14, scope: !175, inlinedAt: !170)
!177 = !DILocation(line: 60, column: 6, scope: !130, inlinedAt: !170)
!178 = !DILocation(line: 63, column: 7, scope: !130, inlinedAt: !170)
!179 = !DILocation(line: 63, column: 15, scope: !130, inlinedAt: !170)
!180 = !{!181, !112, i64 12}
!181 = !{!"ethhdr", !95, i64 0, !95, i64 6, !112, i64 12}
!182 = !DILocation(line: 64, column: 9, scope: !130, inlinedAt: !170)
!183 = !{i64 0, i64 1, !110, i64 0, i64 1, !110, i64 1, i64 1, !110, i64 2, i64 2, !111, i64 4, i64 2, !111, i64 6, i64 2, !111, i64 8, i64 1, !110, i64 9, i64 1, !110, i64 10, i64 2, !111, i64 12, i64 4, !184, i64 16, i64 4, !184, i64 12, i64 4, !184, i64 16, i64 4, !184}
!184 = !{!94, !94, i64 0}
!185 = !DILocation(line: 66, column: 18, scope: !130, inlinedAt: !170)
!186 = !DILocation(line: 67, column: 17, scope: !130, inlinedAt: !170)
!187 = !DILocation(line: 67, column: 7, scope: !130, inlinedAt: !170)
!188 = !DILocation(line: 67, column: 15, scope: !130, inlinedAt: !170)
!189 = !{!190, !112, i64 2}
!190 = !{!"iphdr", !95, i64 0, !95, i64 0, !95, i64 1, !112, i64 2, !112, i64 4, !112, i64 6, !95, i64 8, !95, i64 9, !112, i64 10, !95, i64 12}
!191 = !DILocation(line: 68, column: 46, scope: !130, inlinedAt: !170)
!192 = !DILocation(line: 68, column: 32, scope: !130, inlinedAt: !170)
!193 = !DILocalVariable(name: "csum", arg: 1, scope: !194, file: !131, line: 35, type: !23)
!194 = distinct !DISubprogram(name: "csum_fold_helper", scope: !131, file: !131, line: 35, type: !195, scopeLine: 36, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !197)
!195 = !DISubroutineType(types: !196)
!196 = !{!17, !23}
!197 = !{!193, !198}
!198 = !DILocalVariable(name: "sum", scope: !194, file: !131, line: 37, type: !23)
!199 = !DILocation(line: 0, scope: !194, inlinedAt: !200)
!200 = distinct !DILocation(line: 68, column: 15, scope: !130, inlinedAt: !170)
!201 = !DILocation(line: 38, column: 14, scope: !194, inlinedAt: !200)
!202 = !DILocation(line: 38, column: 29, scope: !194, inlinedAt: !200)
!203 = !DILocation(line: 38, column: 21, scope: !194, inlinedAt: !200)
!204 = !DILocation(line: 39, column: 14, scope: !194, inlinedAt: !200)
!205 = !DILocation(line: 39, column: 6, scope: !194, inlinedAt: !200)
!206 = !DILocation(line: 40, column: 9, scope: !194, inlinedAt: !200)
!207 = !DILocation(line: 68, column: 7, scope: !130, inlinedAt: !170)
!208 = !DILocation(line: 68, column: 13, scope: !130, inlinedAt: !170)
!209 = !{!190, !112, i64 10}
!210 = !DILocation(line: 69, column: 1, scope: !130, inlinedAt: !170)
!211 = !DILocation(line: 45, column: 2, scope: !58)
!212 = !DILocation(line: 46, column: 1, scope: !58)
!213 = !DILocation(line: 48, column: 1, scope: !58)
!214 = !DILocation(line: 47, column: 2, scope: !58)
