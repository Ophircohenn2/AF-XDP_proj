; ModuleID = 'tc_txq_policy_kern.c'
source_filename = "tc_txq_policy_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }

@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i32 (%struct.__sk_buff*)* @not_txq_zero to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @queue_map_4 to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define dso_local i32 @queue_map_4(%struct.__sk_buff* nocapture noundef writeonly %0) #0 section "classifier" !dbg !7 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.value(metadata i16 4, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 3, !dbg !121
  store i32 4, i32* %2, align 4, !dbg !122, !tbaa !123
  ret i32 0, !dbg !129
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define dso_local i32 @not_txq_zero(%struct.__sk_buff* nocapture noundef %0) #1 section "tc" !dbg !130 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !132, metadata !DIExpression()), !dbg !133
  %2 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 3, !dbg !134
  %3 = load i32, i32* %2, align 4, !dbg !134, !tbaa !123
  switch i32 %3, label %7 [
    i32 1, label %5
    i32 0, label %4
  ], !dbg !136

4:                                                ; preds = %1
  br label %5, !dbg !137

5:                                                ; preds = %1, %4
  %6 = phi i32 [ 3, %4 ], [ 4, %1 ]
  store i32 %6, i32* %2, align 4, !dbg !133, !tbaa !123
  br label %7, !dbg !139

7:                                                ; preds = %5, %1
  ret i32 0, !dbg !139
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "tc_txq_policy_kern.c", directory: "/home/nir_ophir/code/bpf-examples/tc-policy", checksumkind: CSK_MD5, checksum: "ef650e471882e020a9f2f1a0539d566b")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!7 = distinct !DISubprogram(name: "queue_map_4", scope: !1, file: !1, line: 31, type: !8, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !117)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !13, line: 4183, size: 1472, elements: !14)
!13 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/nir_ophir/code/bpf-examples/tc-policy", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!14 = !{!15, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !34, !35, !36, !37, !38, !39, !40, !41, !42, !46, !47, !48, !49, !50, !89, !92, !93, !94, !116}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !12, file: !13, line: 4184, baseType: !16, size: 32)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !17, line: 27, baseType: !18)
!17 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !12, file: !13, line: 4185, baseType: !16, size: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !12, file: !13, line: 4186, baseType: !16, size: 32, offset: 64)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !12, file: !13, line: 4187, baseType: !16, size: 32, offset: 96)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !12, file: !13, line: 4188, baseType: !16, size: 32, offset: 128)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !12, file: !13, line: 4189, baseType: !16, size: 32, offset: 160)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !12, file: !13, line: 4190, baseType: !16, size: 32, offset: 192)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !12, file: !13, line: 4191, baseType: !16, size: 32, offset: 224)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !12, file: !13, line: 4192, baseType: !16, size: 32, offset: 256)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !12, file: !13, line: 4193, baseType: !16, size: 32, offset: 288)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !12, file: !13, line: 4194, baseType: !16, size: 32, offset: 320)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !12, file: !13, line: 4195, baseType: !16, size: 32, offset: 352)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !12, file: !13, line: 4196, baseType: !31, size: 160, offset: 384)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 160, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 5)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !12, file: !13, line: 4197, baseType: !16, size: 32, offset: 544)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !12, file: !13, line: 4198, baseType: !16, size: 32, offset: 576)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !12, file: !13, line: 4199, baseType: !16, size: 32, offset: 608)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !12, file: !13, line: 4200, baseType: !16, size: 32, offset: 640)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !12, file: !13, line: 4201, baseType: !16, size: 32, offset: 672)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !12, file: !13, line: 4204, baseType: !16, size: 32, offset: 704)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !12, file: !13, line: 4205, baseType: !16, size: 32, offset: 736)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !12, file: !13, line: 4206, baseType: !16, size: 32, offset: 768)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !12, file: !13, line: 4207, baseType: !43, size: 128, offset: 800)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 128, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 4)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !12, file: !13, line: 4208, baseType: !43, size: 128, offset: 928)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !12, file: !13, line: 4209, baseType: !16, size: 32, offset: 1056)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !12, file: !13, line: 4210, baseType: !16, size: 32, offset: 1088)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !12, file: !13, line: 4213, baseType: !16, size: 32, offset: 1120)
!50 = !DIDerivedType(tag: DW_TAG_member, scope: !12, file: !13, line: 4214, baseType: !51, size: 64, align: 64, offset: 1152)
!51 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !12, file: !13, line: 4214, size: 64, align: 64, elements: !52)
!52 = !{!53}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !51, file: !13, line: 4214, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !13, line: 5041, size: 448, elements: !56)
!56 = !{!57, !60, !61, !62, !65, !66, !67, !68, !71, !72, !73, !87, !88}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !55, file: !13, line: 5042, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !17, line: 24, baseType: !59)
!59 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !55, file: !13, line: 5043, baseType: !58, size: 16, offset: 16)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !55, file: !13, line: 5044, baseType: !58, size: 16, offset: 32)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !55, file: !13, line: 5045, baseType: !63, size: 8, offset: 48)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !17, line: 21, baseType: !64)
!64 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !55, file: !13, line: 5046, baseType: !63, size: 8, offset: 56)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !55, file: !13, line: 5047, baseType: !63, size: 8, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !55, file: !13, line: 5048, baseType: !63, size: 8, offset: 72)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !55, file: !13, line: 5049, baseType: !69, size: 16, offset: 80)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !70, line: 25, baseType: !58)
!70 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!71 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !55, file: !13, line: 5050, baseType: !69, size: 16, offset: 96)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !55, file: !13, line: 5051, baseType: !69, size: 16, offset: 112)
!73 = !DIDerivedType(tag: DW_TAG_member, scope: !55, file: !13, line: 5052, baseType: !74, size: 256, offset: 128)
!74 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !55, file: !13, line: 5052, size: 256, elements: !75)
!75 = !{!76, !82}
!76 = !DIDerivedType(tag: DW_TAG_member, scope: !74, file: !13, line: 5053, baseType: !77, size: 64)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !74, file: !13, line: 5053, size: 64, elements: !78)
!78 = !{!79, !81}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !77, file: !13, line: 5054, baseType: !80, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !70, line: 27, baseType: !16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !77, file: !13, line: 5055, baseType: !80, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, scope: !74, file: !13, line: 5057, baseType: !83, size: 256)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !74, file: !13, line: 5057, size: 256, elements: !84)
!84 = !{!85, !86}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !83, file: !13, line: 5058, baseType: !43, size: 128)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !83, file: !13, line: 5059, baseType: !43, size: 128, offset: 128)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !55, file: !13, line: 5062, baseType: !16, size: 32, offset: 384)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !55, file: !13, line: 5063, baseType: !80, size: 32, offset: 416)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !12, file: !13, line: 4215, baseType: !90, size: 64, offset: 1216)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !17, line: 31, baseType: !91)
!91 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !12, file: !13, line: 4216, baseType: !16, size: 32, offset: 1280)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !12, file: !13, line: 4217, baseType: !16, size: 32, offset: 1312)
!94 = !DIDerivedType(tag: DW_TAG_member, scope: !12, file: !13, line: 4218, baseType: !95, size: 64, align: 64, offset: 1344)
!95 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !12, file: !13, line: 4218, size: 64, align: 64, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !95, file: !13, line: 4218, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !13, line: 4272, size: 640, elements: !100)
!100 = !{!101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !99, file: !13, line: 4273, baseType: !16, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !99, file: !13, line: 4274, baseType: !16, size: 32, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !99, file: !13, line: 4275, baseType: !16, size: 32, offset: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !99, file: !13, line: 4276, baseType: !16, size: 32, offset: 96)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !99, file: !13, line: 4277, baseType: !16, size: 32, offset: 128)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !99, file: !13, line: 4278, baseType: !16, size: 32, offset: 160)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !99, file: !13, line: 4280, baseType: !16, size: 32, offset: 192)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !99, file: !13, line: 4281, baseType: !43, size: 128, offset: 224)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !99, file: !13, line: 4282, baseType: !16, size: 32, offset: 352)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !99, file: !13, line: 4283, baseType: !16, size: 32, offset: 384)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !99, file: !13, line: 4284, baseType: !16, size: 32, offset: 416)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !99, file: !13, line: 4285, baseType: !43, size: 128, offset: 448)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !99, file: !13, line: 4286, baseType: !16, size: 32, offset: 576)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !99, file: !13, line: 4287, baseType: !115, size: 32, offset: 608)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !17, line: 26, baseType: !10)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !12, file: !13, line: 4219, baseType: !16, size: 32, offset: 1408)
!117 = !{!118, !119}
!118 = !DILocalVariable(name: "skb", arg: 1, scope: !7, file: !1, line: 31, type: !11)
!119 = !DILocalVariable(name: "txq_root_handle", scope: !7, file: !1, line: 33, type: !58)
!120 = !DILocation(line: 0, scope: !7)
!121 = !DILocation(line: 43, column: 7, scope: !7)
!122 = !DILocation(line: 43, column: 21, scope: !7)
!123 = !{!124, !125, i64 12}
!124 = !{!"__sk_buff", !125, i64 0, !125, i64 4, !125, i64 8, !125, i64 12, !125, i64 16, !125, i64 20, !125, i64 24, !125, i64 28, !125, i64 32, !125, i64 36, !125, i64 40, !125, i64 44, !126, i64 48, !125, i64 68, !125, i64 72, !125, i64 76, !125, i64 80, !125, i64 84, !125, i64 88, !125, i64 92, !125, i64 96, !126, i64 100, !126, i64 116, !125, i64 132, !125, i64 136, !125, i64 140, !126, i64 144, !128, i64 152, !125, i64 160, !125, i64 164, !126, i64 168, !125, i64 176}
!125 = !{!"int", !126, i64 0}
!126 = !{!"omnipotent char", !127, i64 0}
!127 = !{!"Simple C/C++ TBAA"}
!128 = !{!"long long", !126, i64 0}
!129 = !DILocation(line: 53, column: 2, scope: !7)
!130 = distinct !DISubprogram(name: "not_txq_zero", scope: !1, file: !1, line: 62, type: !8, scopeLine: 63, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !131)
!131 = !{!132}
!132 = !DILocalVariable(name: "skb", arg: 1, scope: !130, file: !1, line: 62, type: !11)
!133 = !DILocation(line: 0, scope: !130)
!134 = !DILocation(line: 70, column: 11, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !1, line: 70, column: 6)
!136 = !DILocation(line: 70, column: 6, scope: !130)
!137 = !DILocation(line: 77, column: 3, scope: !138)
!138 = distinct !DILexicalBlock(scope: !130, file: !1, line: 76, column: 6)
!139 = !DILocation(line: 79, column: 2, scope: !130)
