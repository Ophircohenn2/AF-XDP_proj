; ModuleID = 'get-bond-active.kern.c'
source_filename = "get-bond-active.kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.atomic64_t = type { i64 }
%struct.net_device = type { i32, %struct.anon }
%struct.anon = type { %struct.net* }
%struct.net = type { i64 }
%struct.bonding = type { %struct.net_device*, %struct.slave* }
%struct.slave = type { %struct.net_device* }

@bond_ifindex = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@active_slave_ifindex = dso_local local_unnamed_addr global i32 0, align 4, !dbg !56
@netns_cookie = dso_local constant i32 1, align 4, !dbg !58
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !62
@"llvm.net_device:0:8$0:1:0" = external global i64, !llvm.preserve.access.index !23 #0
@"llvm.net_device:0:0$0:0" = external global i64, !llvm.preserve.access.index !23 #0
@"llvm.net:2:1$0:0" = external global i32, !llvm.preserve.access.index !32 #0
@"llvm.net:0:0$0:0" = external global i64, !llvm.preserve.access.index !32 #0
@"llvm.net___old:0:0$0:0" = external global i64, !llvm.preserve.access.index !46 #0
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.pt_regs*)* @handle_select_slave to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @handle_select_slave(%struct.pt_regs* nocapture noundef readonly %0) #1 section "kprobe/bond_select_active_slave" !dbg !83 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.atomic64_t, align 8
  %4 = alloca %struct.net_device*, align 8
  %5 = alloca %struct.net*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.net_device*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.pt_regs* %0, metadata !113, metadata !DIExpression()), !dbg !114
  %10 = getelementptr inbounds %struct.pt_regs, %struct.pt_regs* %0, i64 0, i32 14, !dbg !115
  %11 = load i64, i64* %10, align 8, !dbg !115, !tbaa !116
  %12 = inttoptr i64 %11 to %struct.bonding*, !dbg !115
  call void @llvm.dbg.value(metadata %struct.pt_regs* undef, metadata !121, metadata !DIExpression()) #6, !dbg !146
  call void @llvm.dbg.value(metadata %struct.bonding* %12, metadata !126, metadata !DIExpression()) #6, !dbg !146
  %13 = bitcast %struct.net_device** %4 to i8*, !dbg !148
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #6, !dbg !148
  %14 = inttoptr i64 %11 to i8*, !dbg !149
  call void @llvm.dbg.value(metadata %struct.net_device** %4, metadata !128, metadata !DIExpression(DW_OP_deref)) #6, !dbg !151
  %15 = call i64 inttoptr (i64 4 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %13, i32 noundef 8, i8* noundef %14) #6, !dbg !149
  %16 = bitcast %struct.net_device** %4 to i8**, !dbg !148
  %17 = load i8*, i8** %16, align 8, !dbg !148, !tbaa !152
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !128, metadata !DIExpression()) #6, !dbg !151
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #6, !dbg !154
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !127, metadata !DIExpression()) #6, !dbg !146
  %18 = bitcast %struct.net** %5 to i8*, !dbg !155
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18) #6, !dbg !155
  %19 = load i64, i64* @"llvm.net_device:0:8$0:1:0", align 8
  %20 = getelementptr i8, i8* %17, i64 %19
  %21 = bitcast i8* %20 to %struct.net**
  %22 = call %struct.net** @llvm.bpf.passthrough.p0p0s_struct.nets.p0p0s_struct.nets(i32 0, %struct.net** %21) #6
  %23 = bitcast %struct.net** %22 to i8*, !dbg !156
  call void @llvm.dbg.value(metadata %struct.net** %5, metadata !131, metadata !DIExpression(DW_OP_deref)) #6, !dbg !158
  %24 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %18, i32 noundef 8, i8* noundef %23) #6, !dbg !156
  %25 = load %struct.net*, %struct.net** %5, align 8, !dbg !155, !tbaa !152
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !131, metadata !DIExpression()) #6, !dbg !158
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18) #6, !dbg !159
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !130, metadata !DIExpression()) #6, !dbg !146
  %26 = bitcast i32* %6 to i8*, !dbg !160
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %26) #6, !dbg !160
  %27 = load i64, i64* @"llvm.net_device:0:0$0:0", align 8
  %28 = getelementptr i8, i8* %17, i64 %27
  %29 = bitcast i8* %28 to i32*
  %30 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 1, i32* %29) #6
  %31 = bitcast i32* %30 to i8*, !dbg !161
  call void @llvm.dbg.value(metadata i32* %6, metadata !134, metadata !DIExpression(DW_OP_deref)) #6, !dbg !163
  %32 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %26, i32 noundef 4, i8* noundef %31) #6, !dbg !161
  %33 = load i32, i32* %6, align 4, !dbg !160, !tbaa !164
  call void @llvm.dbg.value(metadata i32 %33, metadata !134, metadata !DIExpression()) #6, !dbg !163
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %26) #6, !dbg !166
  call void @llvm.dbg.value(metadata i32 %33, metadata !133, metadata !DIExpression()) #6, !dbg !146
  call void @llvm.dbg.value(metadata %struct.net* %25, metadata !167, metadata !DIExpression()) #6, !dbg !181
  %34 = load i32, i32* @"llvm.net:2:1$0:0", align 4
  %35 = call i32 @llvm.bpf.passthrough.i32.i32(i32 3, i32 %34) #6
  %36 = icmp eq i32 %35, 0, !dbg !183
  br i1 %36, label %47, label %37, !dbg !184

37:                                               ; preds = %1
  %38 = bitcast i64* %2 to i8*, !dbg !185
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #6, !dbg !185
  %39 = load i64, i64* @"llvm.net:0:0$0:0", align 8
  %40 = bitcast %struct.net* %25 to i8*
  %41 = getelementptr i8, i8* %40, i64 %39
  %42 = bitcast i8* %41 to i64*
  %43 = call i64* @llvm.bpf.passthrough.p0i64.p0i64(i32 4, i64* %42) #6
  %44 = bitcast i64* %43 to i8*, !dbg !186
  call void @llvm.dbg.value(metadata i64* %2, metadata !172, metadata !DIExpression(DW_OP_deref)) #6, !dbg !188
  %45 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %38, i32 noundef 8, i8* noundef %44) #6, !dbg !186
  %46 = load i64, i64* %2, align 8, !dbg !185, !tbaa !189
  call void @llvm.dbg.value(metadata i64 %46, metadata !172, metadata !DIExpression()) #6, !dbg !188
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #6, !dbg !191
  br label %58, !dbg !192

47:                                               ; preds = %1
  %48 = bitcast %struct.net* %25 to i8*, !dbg !193
  call void @llvm.dbg.value(metadata i8* %48, metadata !176, metadata !DIExpression()) #6, !dbg !194
  %49 = bitcast %struct.atomic64_t* %3 to i8*, !dbg !195
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %49) #6, !dbg !195
  call void @llvm.dbg.declare(metadata %struct.atomic64_t* %3, metadata !179, metadata !DIExpression()) #6, !dbg !195
  %50 = load i64, i64* @"llvm.net___old:0:0$0:0", align 8
  %51 = getelementptr i8, i8* %48, i64 %50
  %52 = bitcast i8* %51 to %struct.atomic64_t*
  %53 = call %struct.atomic64_t* @llvm.bpf.passthrough.p0s_struct.atomic64_ts.p0s_struct.atomic64_ts(i32 5, %struct.atomic64_t* %52) #6
  %54 = bitcast %struct.atomic64_t* %53 to i8*, !dbg !196
  %55 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %49, i32 noundef 8, i8* noundef %54) #6, !dbg !196
  %56 = getelementptr inbounds %struct.atomic64_t, %struct.atomic64_t* %3, i64 0, i32 0, !dbg !195
  %57 = load i64, i64* %56, align 8, !dbg !195, !tbaa.struct !198
  call void @llvm.dbg.value(metadata i64 %57, metadata !178, metadata !DIExpression()) #6, !dbg !194
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %49) #6, !dbg !199
  br label %58

58:                                               ; preds = %47, %37
  %59 = phi i64 [ %46, %37 ], [ %57, %47 ], !dbg !200
  call void @llvm.dbg.value(metadata i64 %59, metadata !136, metadata !DIExpression()) #6, !dbg !146
  %60 = load volatile i32, i32* @netns_cookie, align 4, !dbg !201, !tbaa !164
  %61 = sext i32 %60 to i64, !dbg !201
  %62 = icmp eq i64 %59, %61, !dbg !202
  %63 = load i32, i32* @bond_ifindex, align 4
  %64 = icmp eq i32 %33, %63
  %65 = select i1 %62, i1 %64, i1 false, !dbg !203
  br i1 %65, label %66, label %84, !dbg !203

66:                                               ; preds = %58
  %67 = bitcast %struct.net_device** %7 to i8*, !dbg !204
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %67) #6, !dbg !204
  %68 = bitcast i8** %8 to i8*, !dbg !205
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %68) #6, !dbg !205
  %69 = getelementptr inbounds %struct.bonding, %struct.bonding* %12, i64 0, i32 1, !dbg !205
  %70 = bitcast %struct.slave** %69 to i8*, !dbg !205
  call void @llvm.dbg.value(metadata i8** %8, metadata !142, metadata !DIExpression(DW_OP_deref)) #6, !dbg !206
  %71 = call i64 inttoptr (i64 4 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %68, i32 noundef 8, i8* noundef nonnull %70) #6, !dbg !205
  %72 = load i8*, i8** %8, align 8, !dbg !205, !tbaa !152
  call void @llvm.dbg.value(metadata i8* undef, metadata !142, metadata !DIExpression()) #6, !dbg !206
  call void @llvm.dbg.value(metadata %struct.net_device** %7, metadata !140, metadata !DIExpression(DW_OP_deref)) #6, !dbg !207
  %73 = call i64 inttoptr (i64 4 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %67, i32 noundef 8, i8* noundef %72) #6, !dbg !205
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %68) #6, !dbg !204
  %74 = bitcast %struct.net_device** %7 to i8**, !dbg !204
  %75 = load i8*, i8** %74, align 8, !dbg !204, !tbaa !152
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !140, metadata !DIExpression()) #6, !dbg !207
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %67) #6, !dbg !208
  call void @llvm.dbg.value(metadata %struct.net_device* undef, metadata !137, metadata !DIExpression()) #6, !dbg !209
  %76 = bitcast i32* %9 to i8*, !dbg !210
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %76) #6, !dbg !210
  %77 = load i64, i64* @"llvm.net_device:0:0$0:0", align 8
  %78 = getelementptr i8, i8* %75, i64 %77
  %79 = bitcast i8* %78 to i32*
  %80 = call i32* @llvm.bpf.passthrough.p0i32.p0i32(i32 2, i32* %79) #6
  %81 = bitcast i32* %80 to i8*, !dbg !211
  call void @llvm.dbg.value(metadata i32* %9, metadata !144, metadata !DIExpression(DW_OP_deref)) #6, !dbg !213
  %82 = call i64 inttoptr (i64 113 to i64 (i8*, i32, i8*)*)(i8* noundef nonnull %76, i32 noundef 4, i8* noundef %81) #6, !dbg !211
  %83 = load i32, i32* %9, align 4, !dbg !210, !tbaa !164
  call void @llvm.dbg.value(metadata i32 %83, metadata !144, metadata !DIExpression()) #6, !dbg !213
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %76) #6, !dbg !214
  store i32 %83, i32* @active_slave_ifindex, align 4, !dbg !215, !tbaa !164
  br label %84, !dbg !216

84:                                               ; preds = %58, %66
  ret i32 0, !dbg !115
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nosync nounwind readnone
declare %struct.net** @llvm.bpf.passthrough.p0p0s_struct.nets.p0p0s_struct.nets(i32, %struct.net**) #4

; Function Attrs: nofree nosync nounwind readnone
declare i32* @llvm.bpf.passthrough.p0i32.p0i32(i32, i32*) #4

; Function Attrs: nofree nosync nounwind readnone
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #4

; Function Attrs: nofree nosync nounwind readnone
declare i64* @llvm.bpf.passthrough.p0i64.p0i64(i32, i64*) #4

; Function Attrs: nofree nosync nounwind readnone
declare %struct.atomic64_t* @llvm.bpf.passthrough.p0s_struct.atomic64_ts.p0s_struct.atomic64_ts(i32, %struct.atomic64_t*) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { "btf_ama" }
attributes #1 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nofree nosync nounwind readnone }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!78, !79, !80, !81}
!llvm.ident = !{!82}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "bond_ifindex", scope: !2, file: !3, line: 10, type: !26, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !15, globals: !55, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "get-bond-active.kern.c", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "6abf37914f4a114a19528c241ff67260")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_field_info_kind", file: !6, line: 13, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/install/include/bpf/bpf_core_read.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "3441d4105e978a1f6a56f472c2d0c17e")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14}
!9 = !DIEnumerator(name: "BPF_FIELD_BYTE_OFFSET", value: 0)
!10 = !DIEnumerator(name: "BPF_FIELD_BYTE_SIZE", value: 1)
!11 = !DIEnumerator(name: "BPF_FIELD_EXISTS", value: 2)
!12 = !DIEnumerator(name: "BPF_FIELD_SIGNED", value: 3)
!13 = !DIEnumerator(name: "BPF_FIELD_LSHIFT_U64", value: 4)
!14 = !DIEnumerator(name: "BPF_FIELD_RSHIFT_U64", value: 5)
!15 = !{!16, !17, !43, !22, !39, !31, !45}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bonding", file: !19, line: 20, size: 128, elements: !20)
!19 = !DIFile(filename: "./bpf-defs.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "23c57a1138f1023ebfadde4430d695e3")
!20 = !{!21, !38}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "dev", scope: !18, file: !19, line: 21, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net_device", file: !19, line: 38, size: 128, elements: !24)
!24 = !{!25, !27}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !23, file: !19, line: 39, baseType: !26, size: 32)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "nd_net", scope: !23, file: !19, line: 42, baseType: !28, size: 64, offset: 64)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !23, file: !19, line: 40, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "net", scope: !28, file: !19, line: 41, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net", file: !19, line: 26, size: 64, elements: !33)
!33 = !{!34}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "net_cookie", scope: !32, file: !19, line: 27, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !36, line: 31, baseType: !37)
!36 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!37 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "curr_active_slave", scope: !18, file: !19, line: 22, baseType: !39, size: 64, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "slave", file: !19, line: 16, size: 64, elements: !41)
!41 = !{!42}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "dev", scope: !40, file: !19, line: 17, baseType: !22, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "net___old", file: !19, line: 34, size: 64, elements: !47)
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "net_cookie", scope: !46, file: !19, line: 35, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "atomic64_t", file: !19, line: 32, baseType: !50)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !19, line: 30, size: 64, elements: !51)
!51 = !{!52}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !50, file: !19, line: 31, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !36, line: 30, baseType: !54)
!54 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!55 = !{!0, !56, !58, !62, !68, !76}
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "active_slave_ifindex", scope: !2, file: !3, line: 11, type: !26, isLocal: false, isDefinition: true)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "netns_cookie", scope: !2, file: !3, line: 12, type: !60, isLocal: false, isDefinition: true)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 30, type: !64, isLocal: false, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 32, elements: !66)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !{!67}
!67 = !DISubrange(count: 4)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "bpf_probe_read", scope: !2, file: !70, line: 101, type: !71, isLocal: true, isDefinition: true)
!70 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nir_ophir/code/bpf-examples/pkt-loop-filter", checksumkind: CSK_MD5, checksum: "32b0945df61015e3dd6be9ac5ea42778")
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !16, !75, !43}
!74 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !36, line: 27, baseType: !7)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "bpf_probe_read_kernel", scope: !2, file: !70, line: 2779, type: !71, isLocal: true, isDefinition: true)
!78 = !{i32 7, !"Dwarf Version", i32 5}
!79 = !{i32 2, !"Debug Info Version", i32 3}
!80 = !{i32 1, !"wchar_size", i32 4}
!81 = !{i32 7, !"frame-pointer", i32 2}
!82 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!83 = distinct !DISubprogram(name: "handle_select_slave", scope: !3, file: !3, line: 15, type: !84, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !112)
!84 = !DISubroutineType(types: !85)
!85 = !{!26, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pt_regs", file: !88, line: 41, size: 1344, elements: !89)
!88 = !DIFile(filename: "/usr/include/asm/ptrace.h", directory: "", checksumkind: CSK_MD5, checksum: "d091e897972e0058ad5ca62f6e366c3e")
!89 = !{!90, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "r15", scope: !87, file: !88, line: 46, baseType: !91, size: 64)
!91 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "r14", scope: !87, file: !88, line: 47, baseType: !91, size: 64, offset: 64)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "r13", scope: !87, file: !88, line: 48, baseType: !91, size: 64, offset: 128)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "r12", scope: !87, file: !88, line: 49, baseType: !91, size: 64, offset: 192)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "rbp", scope: !87, file: !88, line: 50, baseType: !91, size: 64, offset: 256)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "rbx", scope: !87, file: !88, line: 51, baseType: !91, size: 64, offset: 320)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "r11", scope: !87, file: !88, line: 53, baseType: !91, size: 64, offset: 384)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "r10", scope: !87, file: !88, line: 54, baseType: !91, size: 64, offset: 448)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "r9", scope: !87, file: !88, line: 55, baseType: !91, size: 64, offset: 512)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "r8", scope: !87, file: !88, line: 56, baseType: !91, size: 64, offset: 576)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "rax", scope: !87, file: !88, line: 57, baseType: !91, size: 64, offset: 640)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "rcx", scope: !87, file: !88, line: 58, baseType: !91, size: 64, offset: 704)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "rdx", scope: !87, file: !88, line: 59, baseType: !91, size: 64, offset: 768)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "rsi", scope: !87, file: !88, line: 60, baseType: !91, size: 64, offset: 832)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "rdi", scope: !87, file: !88, line: 61, baseType: !91, size: 64, offset: 896)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "orig_rax", scope: !87, file: !88, line: 66, baseType: !91, size: 64, offset: 960)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "rip", scope: !87, file: !88, line: 68, baseType: !91, size: 64, offset: 1024)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "cs", scope: !87, file: !88, line: 69, baseType: !91, size: 64, offset: 1088)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "eflags", scope: !87, file: !88, line: 70, baseType: !91, size: 64, offset: 1152)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "rsp", scope: !87, file: !88, line: 71, baseType: !91, size: 64, offset: 1216)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "ss", scope: !87, file: !88, line: 72, baseType: !91, size: 64, offset: 1280)
!112 = !{!113}
!113 = !DILocalVariable(name: "ctx", arg: 1, scope: !83, file: !3, line: 15, type: !86)
!114 = !DILocation(line: 0, scope: !83)
!115 = !DILocation(line: 15, column: 5, scope: !83)
!116 = !{!117, !118, i64 112}
!117 = !{!"pt_regs", !118, i64 0, !118, i64 8, !118, i64 16, !118, i64 24, !118, i64 32, !118, i64 40, !118, i64 48, !118, i64 56, !118, i64 64, !118, i64 72, !118, i64 80, !118, i64 88, !118, i64 96, !118, i64 104, !118, i64 112, !118, i64 120, !118, i64 128, !118, i64 136, !118, i64 144, !118, i64 152, !118, i64 160}
!118 = !{!"long", !119, i64 0}
!119 = !{!"omnipotent char", !120, i64 0}
!120 = !{!"Simple C/C++ TBAA"}
!121 = !DILocalVariable(name: "ctx", arg: 1, scope: !122, file: !3, line: 15, type: !86)
!122 = distinct !DISubprogram(name: "____handle_select_slave", scope: !3, file: !3, line: 15, type: !123, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !125)
!123 = !DISubroutineType(types: !124)
!124 = !{!26, !86, !17}
!125 = !{!121, !126, !127, !128, !130, !131, !133, !134, !136, !137, !140, !142, !144}
!126 = !DILocalVariable(name: "bond", arg: 2, scope: !122, file: !3, line: 15, type: !17)
!127 = !DILocalVariable(name: "dev", scope: !122, file: !3, line: 17, type: !22)
!128 = !DILocalVariable(name: "__r", scope: !129, file: !3, line: 17, type: !22)
!129 = distinct !DILexicalBlock(scope: !122, file: !3, line: 17, column: 34)
!130 = !DILocalVariable(name: "net", scope: !122, file: !3, line: 18, type: !31)
!131 = !DILocalVariable(name: "__r", scope: !132, file: !3, line: 18, type: !31)
!132 = distinct !DILexicalBlock(scope: !122, file: !3, line: 18, column: 20)
!133 = !DILocalVariable(name: "ifindex", scope: !122, file: !3, line: 19, type: !26)
!134 = !DILocalVariable(name: "__r", scope: !135, file: !3, line: 19, type: !26)
!135 = distinct !DILexicalBlock(scope: !122, file: !3, line: 19, column: 16)
!136 = !DILocalVariable(name: "cookie", scope: !122, file: !3, line: 20, type: !35)
!137 = !DILocalVariable(name: "active_dev", scope: !138, file: !3, line: 23, type: !22)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 22, column: 64)
!139 = distinct !DILexicalBlock(scope: !122, file: !3, line: 22, column: 13)
!140 = !DILocalVariable(name: "__r", scope: !141, file: !3, line: 23, type: !22)
!141 = distinct !DILexicalBlock(scope: !138, file: !3, line: 23, column: 49)
!142 = !DILocalVariable(name: "__t", scope: !143, file: !3, line: 23, type: !43)
!143 = distinct !DILexicalBlock(scope: !141, file: !3, line: 23, column: 49)
!144 = !DILocalVariable(name: "__r", scope: !145, file: !3, line: 24, type: !26)
!145 = distinct !DILexicalBlock(scope: !138, file: !3, line: 24, column: 40)
!146 = !DILocation(line: 0, scope: !122, inlinedAt: !147)
!147 = distinct !DILocation(line: 15, column: 5, scope: !83)
!148 = !DILocation(line: 17, column: 34, scope: !129, inlinedAt: !147)
!149 = !DILocation(line: 17, column: 34, scope: !150, inlinedAt: !147)
!150 = distinct !DILexicalBlock(scope: !129, file: !3, line: 17, column: 34)
!151 = !DILocation(line: 0, scope: !129, inlinedAt: !147)
!152 = !{!153, !153, i64 0}
!153 = !{!"any pointer", !119, i64 0}
!154 = !DILocation(line: 17, column: 34, scope: !122, inlinedAt: !147)
!155 = !DILocation(line: 18, column: 20, scope: !132, inlinedAt: !147)
!156 = !DILocation(line: 18, column: 20, scope: !157, inlinedAt: !147)
!157 = distinct !DILexicalBlock(scope: !132, file: !3, line: 18, column: 20)
!158 = !DILocation(line: 0, scope: !132, inlinedAt: !147)
!159 = !DILocation(line: 18, column: 20, scope: !122, inlinedAt: !147)
!160 = !DILocation(line: 19, column: 16, scope: !135, inlinedAt: !147)
!161 = !DILocation(line: 19, column: 16, scope: !162, inlinedAt: !147)
!162 = distinct !DILexicalBlock(scope: !135, file: !3, line: 19, column: 16)
!163 = !DILocation(line: 0, scope: !135, inlinedAt: !147)
!164 = !{!165, !165, i64 0}
!165 = !{!"int", !119, i64 0}
!166 = !DILocation(line: 19, column: 16, scope: !122, inlinedAt: !147)
!167 = !DILocalVariable(name: "net", arg: 1, scope: !168, file: !19, line: 49, type: !31)
!168 = distinct !DISubprogram(name: "read_net_cookie", scope: !19, file: !19, line: 49, type: !169, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !171)
!169 = !DISubroutineType(types: !170)
!170 = !{!35, !31}
!171 = !{!167, !172, !176, !178, !179}
!172 = !DILocalVariable(name: "__r", scope: !173, file: !19, line: 52, type: !35)
!173 = distinct !DILexicalBlock(scope: !174, file: !19, line: 52, column: 10)
!174 = distinct !DILexicalBlock(scope: !175, file: !19, line: 51, column: 46)
!175 = distinct !DILexicalBlock(scope: !168, file: !19, line: 51, column: 6)
!176 = !DILocalVariable(name: "n_old", scope: !177, file: !19, line: 54, type: !45)
!177 = distinct !DILexicalBlock(scope: !175, file: !19, line: 53, column: 9)
!178 = !DILocalVariable(name: "cookie_old", scope: !177, file: !19, line: 55, type: !49)
!179 = !DILocalVariable(name: "__r", scope: !180, file: !19, line: 57, type: !49)
!180 = distinct !DILexicalBlock(scope: !177, file: !19, line: 57, column: 16)
!181 = !DILocation(line: 0, scope: !168, inlinedAt: !182)
!182 = distinct !DILocation(line: 20, column: 17, scope: !122, inlinedAt: !147)
!183 = !DILocation(line: 51, column: 6, scope: !175, inlinedAt: !182)
!184 = !DILocation(line: 51, column: 6, scope: !168, inlinedAt: !182)
!185 = !DILocation(line: 52, column: 10, scope: !173, inlinedAt: !182)
!186 = !DILocation(line: 52, column: 10, scope: !187, inlinedAt: !182)
!187 = distinct !DILexicalBlock(scope: !173, file: !19, line: 52, column: 10)
!188 = !DILocation(line: 0, scope: !173, inlinedAt: !182)
!189 = !{!190, !190, i64 0}
!190 = !{!"long long", !119, i64 0}
!191 = !DILocation(line: 52, column: 10, scope: !174, inlinedAt: !182)
!192 = !DILocation(line: 52, column: 3, scope: !174, inlinedAt: !182)
!193 = !DILocation(line: 54, column: 29, scope: !177, inlinedAt: !182)
!194 = !DILocation(line: 0, scope: !177, inlinedAt: !182)
!195 = !DILocation(line: 57, column: 16, scope: !180, inlinedAt: !182)
!196 = !DILocation(line: 57, column: 16, scope: !197, inlinedAt: !182)
!197 = distinct !DILexicalBlock(scope: !180, file: !19, line: 57, column: 16)
!198 = !{i64 0, i64 8, !189}
!199 = !DILocation(line: 57, column: 16, scope: !177, inlinedAt: !182)
!200 = !DILocation(line: 0, scope: !175, inlinedAt: !182)
!201 = !DILocation(line: 22, column: 23, scope: !139, inlinedAt: !147)
!202 = !DILocation(line: 22, column: 20, scope: !139, inlinedAt: !147)
!203 = !DILocation(line: 22, column: 36, scope: !139, inlinedAt: !147)
!204 = !DILocation(line: 23, column: 49, scope: !141, inlinedAt: !147)
!205 = !DILocation(line: 23, column: 49, scope: !143, inlinedAt: !147)
!206 = !DILocation(line: 0, scope: !143, inlinedAt: !147)
!207 = !DILocation(line: 0, scope: !141, inlinedAt: !147)
!208 = !DILocation(line: 23, column: 49, scope: !138, inlinedAt: !147)
!209 = !DILocation(line: 0, scope: !138, inlinedAt: !147)
!210 = !DILocation(line: 24, column: 40, scope: !145, inlinedAt: !147)
!211 = !DILocation(line: 24, column: 40, scope: !212, inlinedAt: !147)
!212 = distinct !DILexicalBlock(scope: !145, file: !3, line: 24, column: 40)
!213 = !DILocation(line: 0, scope: !145, inlinedAt: !147)
!214 = !DILocation(line: 24, column: 40, scope: !138, inlinedAt: !147)
!215 = !DILocation(line: 24, column: 38, scope: !138, inlinedAt: !147)
!216 = !DILocation(line: 25, column: 9, scope: !138, inlinedAt: !147)
