; ModuleID = 'ktrace01_kern.c'
source_filename = "ktrace01_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@____udp_send_skb.____fmt = internal global [38 x i8] c"skb->hash=0x%x len=%d btf_id(skb)=%d\00\00", align 1, !dbg !23
@"llvm.pt_regs:0:112$0:14" = external global i64, !llvm.preserve.access.index !30 #0
@"llvm.sk_buff___local:0:4$0:1" = external global i64, !llvm.preserve.access.index !16 #0
@"llvm.sk_buff___local:0:0$0:0" = external global i64, !llvm.preserve.access.index !16 #0
@"llvm.btf_type_id.0$7" = external global i64, !llvm.preserve.access.index !16 #1
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.pt_regs*)* @udp_send_skb to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @udp_send_skb(%struct.pt_regs* noundef readonly %0) #2 section "kprobe/udp_send_skb.isra.0" !dbg !87 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.pt_regs* %0, metadata !91, metadata !DIExpression()), !dbg !92
  %4 = load i64, i64* @"llvm.pt_regs:0:112$0:14", align 8
  %5 = bitcast %struct.pt_regs* %0 to i8*
  %6 = getelementptr i8, i8* %5, i64 %4
  %7 = bitcast i8* %6 to i64*
  %8 = tail call i64* @llvm.bpf.passthrough.p0i64.p0i64(i32 0, i64* %7)
  %9 = load i64, i64* %8, align 8, !dbg !93, !tbaa !94
  call void @llvm.dbg.value(metadata %struct.pt_regs* undef, metadata !56, metadata !DIExpression()) #6, !dbg !99
  call void @llvm.dbg.value(metadata i64 %9, metadata !57, metadata !DIExpression()) #6, !dbg !99
  %10 = bitcast i32* %2 to i8*, !dbg !101
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #6, !dbg !101
  %11 = bitcast i32* %3 to i8*, !dbg !102
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #6, !dbg !102
  %12 = load i64, i64* @"llvm.btf_type_id.0$7", align 8
  %13 = tail call i64 @llvm.bpf.passthrough.i64.i64(i32 3, i64 %12) #6
  %14 = trunc i64 %13 to i32, !dbg !103
  call void @llvm.dbg.value(metadata i32 %14, metadata !59, metadata !DIExpression()) #6, !dbg !99
  %15 = load i64, i64* @"llvm.sk_buff___local:0:4$0:1", align 8
  %16 = inttoptr i64 %9 to i8*
  %17 = getelementptr i8, i8* %16, i64 %15
  %18 = bitcast i8* %17 to i32*
  %19 = tail call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 1, i32* %18) #6
  %20 = bitcast i32* %19 to i8*, !dbg !104
  call void @llvm.dbg.value(metadata i32* %3, metadata !60, metadata !DIExpression(DW_OP_deref)) #6, !dbg !99
  %21 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %11, i32 noundef 4, i8* noundef %20) #6, !dbg !104
  %22 = load i64, i64* @"llvm.sk_buff___local:0:0$0:0", align 8
  %23 = getelementptr i8, i8* %16, i64 %22
  %24 = bitcast i8* %23 to i32*
  %25 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 2, i32* %24) #6
  %26 = bitcast i32* %25 to i8*, !dbg !106
  call void @llvm.dbg.value(metadata i32* %2, metadata !58, metadata !DIExpression(DW_OP_deref)) #6, !dbg !99
  %27 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %10, i32 noundef 4, i8* noundef %26) #6, !dbg !106
  store i8 10, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @____udp_send_skb.____fmt, i64 0, i64 36), align 1, !dbg !108, !tbaa !112
  %28 = load i32, i32* %3, align 4, !dbg !108, !tbaa !113
  call void @llvm.dbg.value(metadata i32 %28, metadata !60, metadata !DIExpression()) #6, !dbg !99
  %29 = load i32, i32* %2, align 4, !dbg !108, !tbaa !113
  call void @llvm.dbg.value(metadata i32 %29, metadata !58, metadata !DIExpression()) #6, !dbg !99
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @____udp_send_skb.____fmt, i64 0, i64 0), i32 noundef 38, i32 noundef %28, i32 noundef %29, i32 noundef %14) #6, !dbg !108
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #6, !dbg !115
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #6, !dbg !115
  ret i32 0, !dbg !93
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nosync nounwind readnone
declare i64* @llvm.bpf.passthrough.p0i64.p0i64(i32, i64*) #4

; Function Attrs: nofree nosync nounwind readnone
declare i32* @llvm.bpf.passthrough.p0i32.p0i32(i32, i32*) #4

; Function Attrs: nofree nosync nounwind readnone
declare i64 @llvm.bpf.passthrough.i64.i64(i32, i64) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { "btf_ama" }
attributes #1 = { "btf_type_id" }
attributes #2 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nofree nosync nounwind readnone }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!82, !83, !84, !85}
!llvm.ident = !{!86}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 15, type: !79, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !22, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ktrace01_kern.c", directory: "/home/nir_ophir/code/bpf-examples/ktrace-CO-RE", checksumkind: CSK_MD5, checksum: "fb97f08452a4df06bbf412a818e6d9aa")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_type_id_kind", file: !6, line: 23, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/install/include/bpf/bpf_core_read.h", directory: "/home/nir_ophir/code/bpf-examples/ktrace-CO-RE", checksumkind: CSK_MD5, checksum: "3441d4105e978a1f6a56f472c2d0c17e")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "BPF_TYPE_ID_LOCAL", value: 0)
!10 = !DIEnumerator(name: "BPF_TYPE_ID_TARGET", value: 1)
!11 = !{!12, !13, !15}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_buff___local", file: !3, line: 43, size: 64, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !16, file: !3, line: 44, baseType: !7, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !16, file: !3, line: 45, baseType: !20, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !21, line: 27, baseType: !7)
!21 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!22 = !{!0, !23, !65, !72}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "____fmt", scope: !25, file: !3, line: 62, type: !61, isLocal: true, isDefinition: true)
!25 = distinct !DISubprogram(name: "____udp_send_skb", scope: !3, file: !3, line: 49, type: !26, scopeLine: 51, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !55)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !29, !15}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pt_regs", file: !31, line: 11, size: 1344, elements: !32)
!31 = !DIFile(filename: "../lib/../headers/vmlinux/arch/x86/vmlinux.h", directory: "/home/nir_ophir/code/bpf-examples/ktrace-CO-RE", checksumkind: CSK_MD5, checksum: "4f1b29a30549d7a60bab87753eeb7856")
!32 = !{!33, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "r15", scope: !30, file: !31, line: 12, baseType: !34, size: 64)
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "r14", scope: !30, file: !31, line: 13, baseType: !34, size: 64, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "r13", scope: !30, file: !31, line: 14, baseType: !34, size: 64, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "r12", scope: !30, file: !31, line: 15, baseType: !34, size: 64, offset: 192)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "bp", scope: !30, file: !31, line: 16, baseType: !34, size: 64, offset: 256)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "bx", scope: !30, file: !31, line: 17, baseType: !34, size: 64, offset: 320)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "r11", scope: !30, file: !31, line: 18, baseType: !34, size: 64, offset: 384)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "r10", scope: !30, file: !31, line: 19, baseType: !34, size: 64, offset: 448)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "r9", scope: !30, file: !31, line: 20, baseType: !34, size: 64, offset: 512)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "r8", scope: !30, file: !31, line: 21, baseType: !34, size: 64, offset: 576)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ax", scope: !30, file: !31, line: 22, baseType: !34, size: 64, offset: 640)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "cx", scope: !30, file: !31, line: 23, baseType: !34, size: 64, offset: 704)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "dx", scope: !30, file: !31, line: 24, baseType: !34, size: 64, offset: 768)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "si", scope: !30, file: !31, line: 25, baseType: !34, size: 64, offset: 832)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "di", scope: !30, file: !31, line: 26, baseType: !34, size: 64, offset: 896)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "orig_ax", scope: !30, file: !31, line: 27, baseType: !34, size: 64, offset: 960)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !30, file: !31, line: 28, baseType: !34, size: 64, offset: 1024)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "cs", scope: !30, file: !31, line: 29, baseType: !34, size: 64, offset: 1088)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !30, file: !31, line: 30, baseType: !34, size: 64, offset: 1152)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sp", scope: !30, file: !31, line: 31, baseType: !34, size: 64, offset: 1216)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "ss", scope: !30, file: !31, line: 32, baseType: !34, size: 64, offset: 1280)
!55 = !{!56, !57, !58, !59, !60}
!56 = !DILocalVariable(name: "ctx", arg: 1, scope: !25, file: !3, line: 49, type: !29)
!57 = !DILocalVariable(name: "skb", arg: 2, scope: !25, file: !3, line: 49, type: !15)
!58 = !DILocalVariable(name: "len", scope: !25, file: !3, line: 52, type: !7)
!59 = !DILocalVariable(name: "id", scope: !25, file: !3, line: 53, type: !20)
!60 = !DILocalVariable(name: "h", scope: !25, file: !3, line: 54, type: !20)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 304, elements: !63)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !{!64}
!64 = !DISubrange(count: 38)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "bpf_probe_read_kernel", scope: !2, file: !67, line: 2779, type: !68, isLocal: true, isDefinition: true)
!67 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/ktrace-CO-RE", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !12, !20, !13}
!71 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !67, line: 176, type: !74, isLocal: true, isDefinition: true)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{!71, !77, !20, null}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 32, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 4)
!82 = !{i32 7, !"Dwarf Version", i32 5}
!83 = !{i32 2, !"Debug Info Version", i32 3}
!84 = !{i32 1, !"wchar_size", i32 4}
!85 = !{i32 7, !"frame-pointer", i32 2}
!86 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!87 = distinct !DISubprogram(name: "udp_send_skb", scope: !3, file: !3, line: 49, type: !88, scopeLine: 49, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !90)
!88 = !DISubroutineType(types: !89)
!89 = !{!28, !29}
!90 = !{!91}
!91 = !DILocalVariable(name: "ctx", arg: 1, scope: !87, file: !3, line: 49, type: !29)
!92 = !DILocation(line: 0, scope: !87)
!93 = !DILocation(line: 49, column: 5, scope: !87)
!94 = !{!95, !96, i64 112}
!95 = !{!"pt_regs", !96, i64 0, !96, i64 8, !96, i64 16, !96, i64 24, !96, i64 32, !96, i64 40, !96, i64 48, !96, i64 56, !96, i64 64, !96, i64 72, !96, i64 80, !96, i64 88, !96, i64 96, !96, i64 104, !96, i64 112, !96, i64 120, !96, i64 128, !96, i64 136, !96, i64 144, !96, i64 152, !96, i64 160}
!96 = !{!"long", !97, i64 0}
!97 = !{!"omnipotent char", !98, i64 0}
!98 = !{!"Simple C/C++ TBAA"}
!99 = !DILocation(line: 0, scope: !25, inlinedAt: !100)
!100 = distinct !DILocation(line: 49, column: 5, scope: !87)
!101 = !DILocation(line: 52, column: 2, scope: !25, inlinedAt: !100)
!102 = !DILocation(line: 54, column: 2, scope: !25, inlinedAt: !100)
!103 = !DILocation(line: 57, column: 7, scope: !25, inlinedAt: !100)
!104 = !DILocation(line: 59, column: 2, scope: !105, inlinedAt: !100)
!105 = distinct !DILexicalBlock(scope: !25, file: !3, line: 59, column: 2)
!106 = !DILocation(line: 60, column: 2, scope: !107, inlinedAt: !100)
!107 = distinct !DILexicalBlock(scope: !25, file: !3, line: 60, column: 2)
!108 = !DILocation(line: 62, column: 2, scope: !109, inlinedAt: !100)
!109 = distinct !DILexicalBlock(scope: !110, file: !3, line: 62, column: 2)
!110 = distinct !DILexicalBlock(scope: !111, file: !3, line: 62, column: 2)
!111 = distinct !DILexicalBlock(scope: !25, file: !3, line: 62, column: 2)
!112 = !{!97, !97, i64 0}
!113 = !{!114, !114, i64 0}
!114 = !{!"int", !97, i64 0}
!115 = !DILocation(line: 65, column: 1, scope: !25, inlinedAt: !100)
