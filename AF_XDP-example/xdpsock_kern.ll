; ModuleID = 'xdpsock_kern.c'
source_filename = "xdpsock_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [17 x i32]*, [33 x i32]*, [4 x i32]*, [4 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@index = internal global i32 0, align 4, !dbg !0
@xsks_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !23
@_license = dso_local global [13 x i8] c"Dual BSD/GPL\00", section "license", align 1, !dbg !17
@llvm.compiler.used = appending global [3 x i8*] [i8* getelementptr inbounds ([13 x i8], [13 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_sock_prog to i8*), i8* bitcast (%struct.anon* @xsks_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_sock_prog(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_sock" !dbg !69 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 4, !dbg !84
  %3 = load i32, i32* %2, align 4, !dbg !84, !tbaa !85
  store i32 %3, i32* @index, align 4, !dbg !90, !tbaa !91
  %4 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon* @xsks_map to i8*), i8* noundef bitcast (i32* @index to i8*)) #2, !dbg !92
  %5 = icmp eq i8* %4, null, !dbg !94
  br i1 %5, label %10, label %6, !dbg !95

6:                                                ; preds = %1
  %7 = load i32, i32* @index, align 4, !dbg !96, !tbaa !91
  %8 = tail call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* noundef bitcast (%struct.anon* @xsks_map to i8*), i32 noundef %7, i64 noundef 0) #2, !dbg !97
  %9 = trunc i64 %8 to i32, !dbg !97
  br label %10, !dbg !98

10:                                               ; preds = %1, %6
  %11 = phi i32 [ %9, %6 ], [ 2, %1 ], !dbg !83
  ret i32 %11, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!64, !65, !66, !67}
!llvm.ident = !{!68}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "index", scope: !2, file: !3, line: 25, type: !62, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdpsock_kern.c", directory: "/home/nir_ophir/git/XDP/packet_reciever/AF_XDP-example", checksumkind: CSK_MD5, checksum: "d6563346aa2c7134e6bc2ee0cd37cf66")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 4363, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/git/XDP/packet_reciever/AF_XDP-example", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !{!17, !23, !0, !44, !52}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 52, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 104, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 13)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "xsks_map", scope: !2, file: !3, line: 21, type: !25, isLocal: false, isDefinition: true)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 16, size: 256, elements: !26)
!26 = !{!27, !33, !38, !43}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !25, file: !3, line: 17, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 544, elements: !31)
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{!32}
!32 = !DISubrange(count: 17)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !25, file: !3, line: 18, baseType: !34, size: 64, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 1056, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 33)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !25, file: !3, line: 19, baseType: !39, size: 64, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 4)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !25, file: !3, line: 20, baseType: !39, size: 64, offset: 192)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !46, line: 55, type: !47, isLocal: true, isDefinition: true)
!46 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/git/XDP/packet_reciever/AF_XDP-example", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DISubroutineType(types: !49)
!49 = !{!15, !15, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !46, line: 1309, type: !54, isLocal: true, isDefinition: true)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !15, !58, !60}
!57 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !59, line: 27, baseType: !7)
!59 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !59, line: 31, baseType: !61)
!61 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !63, line: 17, baseType: !58)
!63 = !DIFile(filename: "./xdpsock.h", directory: "/home/nir_ophir/git/XDP/packet_reciever/AF_XDP-example", checksumkind: CSK_MD5, checksum: "7465655776d0db94a74c24418f0eae97")
!64 = !{i32 7, !"Dwarf Version", i32 5}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"frame-pointer", i32 2}
!68 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!69 = distinct !DISubprogram(name: "xdp_sock_prog", scope: !3, file: !3, line: 27, type: !70, scopeLine: 28, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !81)
!70 = !DISubroutineType(types: !71)
!71 = !{!30, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 4374, size: 192, elements: !74)
!74 = !{!75, !76, !77, !78, !79, !80}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !73, file: !6, line: 4375, baseType: !58, size: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !73, file: !6, line: 4376, baseType: !58, size: 32, offset: 32)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !73, file: !6, line: 4377, baseType: !58, size: 32, offset: 64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !73, file: !6, line: 4379, baseType: !58, size: 32, offset: 96)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !73, file: !6, line: 4380, baseType: !58, size: 32, offset: 128)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !73, file: !6, line: 4382, baseType: !58, size: 32, offset: 160)
!81 = !{!82}
!82 = !DILocalVariable(name: "ctx", arg: 1, scope: !69, file: !3, line: 27, type: !72)
!83 = !DILocation(line: 0, scope: !69)
!84 = !DILocation(line: 30, column: 18, scope: !69)
!85 = !{!86, !87, i64 16}
!86 = !{!"xdp_md", !87, i64 0, !87, i64 4, !87, i64 8, !87, i64 12, !87, i64 16, !87, i64 20}
!87 = !{!"int", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !DILocation(line: 30, column: 11, scope: !69)
!91 = !{!87, !87, i64 0}
!92 = !DILocation(line: 46, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !69, file: !3, line: 46, column: 8)
!94 = !DILocation(line: 46, column: 47, scope: !93)
!95 = !DILocation(line: 46, column: 8, scope: !69)
!96 = !DILocation(line: 48, column: 39, scope: !69)
!97 = !DILocation(line: 48, column: 11, scope: !69)
!98 = !DILocation(line: 48, column: 4, scope: !69)
!99 = !DILocation(line: 50, column: 1, scope: !69)
