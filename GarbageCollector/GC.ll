; ModuleID = 'GC.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

%struct.ptrTree = type { i8*, i64, %struct.ptrTree*, %struct.ptrTree* }

@ptrsTable = global %struct.ptrTree* null, align 8
@changes = common global i32 0, align 4
@.str = private unnamed_addr constant [33 x i8] c"Node info.: &->%p, counter: %lu\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.ptrTree* @insertNode(%struct.ptrTree* %tree, i8* %ID, i64 %cnt) #0 {
  %1 = alloca %struct.ptrTree*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store %struct.ptrTree* %tree, %struct.ptrTree** %1, align 8
  store i8* %ID, i8** %2, align 8
  store i64 %cnt, i64* %3, align 8
  %4 = load %struct.ptrTree** %1, align 8
  %5 = icmp ne %struct.ptrTree* %4, null
  br i1 %5, label %6, label %33

; <label>:6                                       ; preds = %0
  %7 = load i8** %2, align 8
  %8 = ptrtoint i8* %7 to i64
  %9 = load %struct.ptrTree** %1, align 8
  %10 = getelementptr inbounds %struct.ptrTree* %9, i32 0, i32 0
  %11 = load i8** %10, align 8
  %12 = ptrtoint i8* %11 to i64
  %13 = icmp ult i64 %8, %12
  br i1 %13, label %14, label %23

; <label>:14                                      ; preds = %6
  %15 = load %struct.ptrTree** %1, align 8
  %16 = getelementptr inbounds %struct.ptrTree* %15, i32 0, i32 2
  %17 = load %struct.ptrTree** %16, align 8
  %18 = load i8** %2, align 8
  %19 = load i64* %3, align 8
  %20 = call %struct.ptrTree* @insertNode(%struct.ptrTree* %17, i8* %18, i64 %19)
  %21 = load %struct.ptrTree** %1, align 8
  %22 = getelementptr inbounds %struct.ptrTree* %21, i32 0, i32 2
  store %struct.ptrTree* %20, %struct.ptrTree** %22, align 8
  br label %32

; <label>:23                                      ; preds = %6
  %24 = load %struct.ptrTree** %1, align 8
  %25 = getelementptr inbounds %struct.ptrTree* %24, i32 0, i32 3
  %26 = load %struct.ptrTree** %25, align 8
  %27 = load i8** %2, align 8
  %28 = load i64* %3, align 8
  %29 = call %struct.ptrTree* @insertNode(%struct.ptrTree* %26, i8* %27, i64 %28)
  %30 = load %struct.ptrTree** %1, align 8
  %31 = getelementptr inbounds %struct.ptrTree* %30, i32 0, i32 3
  store %struct.ptrTree* %29, %struct.ptrTree** %31, align 8
  br label %32

; <label>:32                                      ; preds = %23, %14
  br label %46

; <label>:33                                      ; preds = %0
  %34 = call i8* @malloc(i64 32)
  %35 = bitcast i8* %34 to %struct.ptrTree*
  store %struct.ptrTree* %35, %struct.ptrTree** %1, align 8
  %36 = load i8** %2, align 8
  %37 = load %struct.ptrTree** %1, align 8
  %38 = getelementptr inbounds %struct.ptrTree* %37, i32 0, i32 0
  store i8* %36, i8** %38, align 8
  %39 = load i64* %3, align 8
  %40 = load %struct.ptrTree** %1, align 8
  %41 = getelementptr inbounds %struct.ptrTree* %40, i32 0, i32 1
  store i64 %39, i64* %41, align 8
  %42 = load %struct.ptrTree** %1, align 8
  %43 = getelementptr inbounds %struct.ptrTree* %42, i32 0, i32 2
  store %struct.ptrTree* null, %struct.ptrTree** %43, align 8
  %44 = load %struct.ptrTree** %1, align 8
  %45 = getelementptr inbounds %struct.ptrTree* %44, i32 0, i32 3
  store %struct.ptrTree* null, %struct.ptrTree** %45, align 8
  br label %46

; <label>:46                                      ; preds = %33, %32
  %47 = load %struct.ptrTree** %1, align 8
  ret %struct.ptrTree* %47
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define %struct.ptrTree* @removeNode(%struct.ptrTree* %tree, i8* %ID) #0 {
  %1 = alloca %struct.ptrTree*, align 8
  %2 = alloca %struct.ptrTree*, align 8
  %3 = alloca i8*, align 8
  %aux = alloca %struct.ptrTree*, align 8
  store %struct.ptrTree* %tree, %struct.ptrTree** %2, align 8
  store i8* %ID, i8** %3, align 8
  store %struct.ptrTree* null, %struct.ptrTree** %aux, align 8
  %4 = load %struct.ptrTree** %2, align 8
  %5 = icmp ne %struct.ptrTree* %4, null
  br i1 %5, label %6, label %115

; <label>:6                                       ; preds = %0
  %7 = load i8** %3, align 8
  %8 = ptrtoint i8* %7 to i64
  %9 = load %struct.ptrTree** %2, align 8
  %10 = getelementptr inbounds %struct.ptrTree* %9, i32 0, i32 0
  %11 = load i8** %10, align 8
  %12 = ptrtoint i8* %11 to i64
  %13 = icmp ult i64 %8, %12
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %6
  %15 = load %struct.ptrTree** %2, align 8
  %16 = getelementptr inbounds %struct.ptrTree* %15, i32 0, i32 2
  %17 = load %struct.ptrTree** %16, align 8
  %18 = load i8** %3, align 8
  %19 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %17, i8* %18)
  %20 = load %struct.ptrTree** %2, align 8
  %21 = getelementptr inbounds %struct.ptrTree* %20, i32 0, i32 2
  store %struct.ptrTree* %19, %struct.ptrTree** %21, align 8
  br label %114

; <label>:22                                      ; preds = %6
  %23 = load i8** %3, align 8
  %24 = ptrtoint i8* %23 to i64
  %25 = load %struct.ptrTree** %2, align 8
  %26 = getelementptr inbounds %struct.ptrTree* %25, i32 0, i32 0
  %27 = load i8** %26, align 8
  %28 = ptrtoint i8* %27 to i64
  %29 = icmp ugt i64 %24, %28
  br i1 %29, label %30, label %38

; <label>:30                                      ; preds = %22
  %31 = load %struct.ptrTree** %2, align 8
  %32 = getelementptr inbounds %struct.ptrTree* %31, i32 0, i32 3
  %33 = load %struct.ptrTree** %32, align 8
  %34 = load i8** %3, align 8
  %35 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %33, i8* %34)
  %36 = load %struct.ptrTree** %2, align 8
  %37 = getelementptr inbounds %struct.ptrTree* %36, i32 0, i32 3
  store %struct.ptrTree* %35, %struct.ptrTree** %37, align 8
  br label %113

; <label>:38                                      ; preds = %22
  %39 = load %struct.ptrTree** %2, align 8
  %40 = getelementptr inbounds %struct.ptrTree* %39, i32 0, i32 2
  %41 = load %struct.ptrTree** %40, align 8
  %42 = icmp eq %struct.ptrTree* %41, null
  br i1 %42, label %43, label %51

; <label>:43                                      ; preds = %38
  %44 = load %struct.ptrTree** %2, align 8
  %45 = getelementptr inbounds %struct.ptrTree* %44, i32 0, i32 3
  %46 = load %struct.ptrTree** %45, align 8
  %47 = icmp eq %struct.ptrTree* %46, null
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %43
  %49 = load %struct.ptrTree** %2, align 8
  %50 = bitcast %struct.ptrTree* %49 to i8*
  call void @free(i8* %50)
  store %struct.ptrTree* null, %struct.ptrTree** %1
  br label %117

; <label>:51                                      ; preds = %43, %38
  %52 = load %struct.ptrTree** %2, align 8
  %53 = getelementptr inbounds %struct.ptrTree* %52, i32 0, i32 2
  %54 = load %struct.ptrTree** %53, align 8
  %55 = icmp eq %struct.ptrTree* %54, null
  br i1 %55, label %61, label %56

; <label>:56                                      ; preds = %51
  %57 = load %struct.ptrTree** %2, align 8
  %58 = getelementptr inbounds %struct.ptrTree* %57, i32 0, i32 3
  %59 = load %struct.ptrTree** %58, align 8
  %60 = icmp eq %struct.ptrTree* %59, null
  br i1 %60, label %61, label %78

; <label>:61                                      ; preds = %56, %51
  %62 = load %struct.ptrTree** %2, align 8
  %63 = getelementptr inbounds %struct.ptrTree* %62, i32 0, i32 2
  %64 = load %struct.ptrTree** %63, align 8
  %65 = icmp eq %struct.ptrTree* %64, null
  br i1 %65, label %66, label %70

; <label>:66                                      ; preds = %61
  %67 = load %struct.ptrTree** %2, align 8
  %68 = getelementptr inbounds %struct.ptrTree* %67, i32 0, i32 3
  %69 = load %struct.ptrTree** %68, align 8
  store %struct.ptrTree* %69, %struct.ptrTree** %aux, align 8
  br label %74

; <label>:70                                      ; preds = %61
  %71 = load %struct.ptrTree** %2, align 8
  %72 = getelementptr inbounds %struct.ptrTree* %71, i32 0, i32 2
  %73 = load %struct.ptrTree** %72, align 8
  store %struct.ptrTree* %73, %struct.ptrTree** %aux, align 8
  br label %74

; <label>:74                                      ; preds = %70, %66
  %75 = load %struct.ptrTree** %2, align 8
  %76 = bitcast %struct.ptrTree* %75 to i8*
  call void @free(i8* %76)
  %77 = load %struct.ptrTree** %aux, align 8
  store %struct.ptrTree* %77, %struct.ptrTree** %1
  br label %117

; <label>:78                                      ; preds = %56
  %79 = load %struct.ptrTree** %2, align 8
  %80 = getelementptr inbounds %struct.ptrTree* %79, i32 0, i32 2
  %81 = load %struct.ptrTree** %80, align 8
  store %struct.ptrTree* %81, %struct.ptrTree** %aux, align 8
  br label %82

; <label>:82                                      ; preds = %87, %78
  %83 = load %struct.ptrTree** %aux, align 8
  %84 = getelementptr inbounds %struct.ptrTree* %83, i32 0, i32 3
  %85 = load %struct.ptrTree** %84, align 8
  %86 = icmp ne %struct.ptrTree* %85, null
  br i1 %86, label %87, label %91

; <label>:87                                      ; preds = %82
  %88 = load %struct.ptrTree** %aux, align 8
  %89 = getelementptr inbounds %struct.ptrTree* %88, i32 0, i32 3
  %90 = load %struct.ptrTree** %89, align 8
  store %struct.ptrTree* %90, %struct.ptrTree** %aux, align 8
  br label %82

; <label>:91                                      ; preds = %82
  %92 = load %struct.ptrTree** %aux, align 8
  %93 = getelementptr inbounds %struct.ptrTree* %92, i32 0, i32 0
  %94 = load i8** %93, align 8
  %95 = load %struct.ptrTree** %2, align 8
  %96 = getelementptr inbounds %struct.ptrTree* %95, i32 0, i32 0
  store i8* %94, i8** %96, align 8
  %97 = load %struct.ptrTree** %aux, align 8
  %98 = getelementptr inbounds %struct.ptrTree* %97, i32 0, i32 1
  %99 = load i64* %98, align 8
  %100 = load %struct.ptrTree** %2, align 8
  %101 = getelementptr inbounds %struct.ptrTree* %100, i32 0, i32 1
  store i64 %99, i64* %101, align 8
  %102 = load %struct.ptrTree** %2, align 8
  %103 = getelementptr inbounds %struct.ptrTree* %102, i32 0, i32 2
  %104 = load %struct.ptrTree** %103, align 8
  %105 = load %struct.ptrTree** %aux, align 8
  %106 = getelementptr inbounds %struct.ptrTree* %105, i32 0, i32 0
  %107 = load i8** %106, align 8
  %108 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %104, i8* %107)
  %109 = load %struct.ptrTree** %2, align 8
  %110 = getelementptr inbounds %struct.ptrTree* %109, i32 0, i32 2
  store %struct.ptrTree* %108, %struct.ptrTree** %110, align 8
  br label %111

; <label>:111                                     ; preds = %91
  br label %112

; <label>:112                                     ; preds = %111
  br label %113

; <label>:113                                     ; preds = %112, %30
  br label %114

; <label>:114                                     ; preds = %113, %14
  br label %115

; <label>:115                                     ; preds = %114, %0
  %116 = load %struct.ptrTree** %2, align 8
  store %struct.ptrTree* %116, %struct.ptrTree** %1
  br label %117

; <label>:117                                     ; preds = %115, %74, %48
  %118 = load %struct.ptrTree** %1
  ret %struct.ptrTree* %118
}

declare void @free(i8*) #1

; Function Attrs: nounwind ssp uwtable
define i64 @height(%struct.ptrTree* %tree) #0 {
  %1 = alloca i64, align 8
  %2 = alloca %struct.ptrTree*, align 8
  %hl = alloca i64, align 8
  %hr = alloca i64, align 8
  store %struct.ptrTree* %tree, %struct.ptrTree** %2, align 8
  %3 = load %struct.ptrTree** %2, align 8
  %4 = icmp eq %struct.ptrTree* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i64 0, i64* %1
  br label %26

; <label>:6                                       ; preds = %0
  %7 = load %struct.ptrTree** %2, align 8
  %8 = getelementptr inbounds %struct.ptrTree* %7, i32 0, i32 2
  %9 = load %struct.ptrTree** %8, align 8
  %10 = call i64 @height(%struct.ptrTree* %9)
  store i64 %10, i64* %hl, align 8
  %11 = load %struct.ptrTree** %2, align 8
  %12 = getelementptr inbounds %struct.ptrTree* %11, i32 0, i32 3
  %13 = load %struct.ptrTree** %12, align 8
  %14 = call i64 @height(%struct.ptrTree* %13)
  store i64 %14, i64* %hr, align 8
  %15 = load i64* %hl, align 8
  %16 = load i64* %hr, align 8
  %17 = icmp sge i64 %15, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %6
  %19 = load i64* %hl, align 8
  %20 = add nsw i64 1, %19
  br label %24

; <label>:21                                      ; preds = %6
  %22 = load i64* %hr, align 8
  %23 = add nsw i64 1, %22
  br label %24

; <label>:24                                      ; preds = %21, %18
  %25 = phi i64 [ %20, %18 ], [ %23, %21 ]
  store i64 %25, i64* %1
  br label %26

; <label>:26                                      ; preds = %24, %5
  %27 = load i64* %1
  ret i64 %27
}

; Function Attrs: nounwind ssp uwtable
define %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %tree) #0 {
  %1 = alloca %struct.ptrTree*, align 8
  %hl = alloca i64, align 8
  %hr = alloca i64, align 8
  %count1 = alloca i64, align 8
  %count2 = alloca i64, align 8
  %p = alloca %struct.ptrTree*, align 8
  %auxp1 = alloca i8*, align 8
  %auxp2 = alloca i8*, align 8
  store %struct.ptrTree* %tree, %struct.ptrTree** %1, align 8
  %2 = load %struct.ptrTree** %1, align 8
  %3 = icmp ne %struct.ptrTree* %2, null
  br i1 %3, label %4, label %134

; <label>:4                                       ; preds = %0
  %5 = load %struct.ptrTree** %1, align 8
  %6 = getelementptr inbounds %struct.ptrTree* %5, i32 0, i32 2
  %7 = load %struct.ptrTree** %6, align 8
  %8 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %7)
  %9 = load %struct.ptrTree** %1, align 8
  %10 = getelementptr inbounds %struct.ptrTree* %9, i32 0, i32 2
  store %struct.ptrTree* %8, %struct.ptrTree** %10, align 8
  %11 = load %struct.ptrTree** %1, align 8
  %12 = getelementptr inbounds %struct.ptrTree* %11, i32 0, i32 3
  %13 = load %struct.ptrTree** %12, align 8
  %14 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %13)
  %15 = load %struct.ptrTree** %1, align 8
  %16 = getelementptr inbounds %struct.ptrTree* %15, i32 0, i32 3
  store %struct.ptrTree* %14, %struct.ptrTree** %16, align 8
  %17 = load %struct.ptrTree** %1, align 8
  %18 = getelementptr inbounds %struct.ptrTree* %17, i32 0, i32 2
  %19 = load %struct.ptrTree** %18, align 8
  %20 = call i64 @height(%struct.ptrTree* %19)
  store i64 %20, i64* %hl, align 8
  %21 = load %struct.ptrTree** %1, align 8
  %22 = getelementptr inbounds %struct.ptrTree* %21, i32 0, i32 3
  %23 = load %struct.ptrTree** %22, align 8
  %24 = call i64 @height(%struct.ptrTree* %23)
  store i64 %24, i64* %hr, align 8
  %25 = load i64* %hl, align 8
  %26 = load i64* %hr, align 8
  %27 = sub nsw i64 %25, %26
  %28 = icmp sgt i64 %27, 1
  br i1 %28, label %29, label %78

; <label>:29                                      ; preds = %4
  %30 = load %struct.ptrTree** %1, align 8
  %31 = getelementptr inbounds %struct.ptrTree* %30, i32 0, i32 2
  %32 = load %struct.ptrTree** %31, align 8
  store %struct.ptrTree* %32, %struct.ptrTree** %p, align 8
  br label %33

; <label>:33                                      ; preds = %38, %29
  %34 = load %struct.ptrTree** %p, align 8
  %35 = getelementptr inbounds %struct.ptrTree* %34, i32 0, i32 3
  %36 = load %struct.ptrTree** %35, align 8
  %37 = icmp ne %struct.ptrTree* %36, null
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %33
  %39 = load %struct.ptrTree** %p, align 8
  %40 = getelementptr inbounds %struct.ptrTree* %39, i32 0, i32 3
  %41 = load %struct.ptrTree** %40, align 8
  store %struct.ptrTree* %41, %struct.ptrTree** %p, align 8
  br label %33

; <label>:42                                      ; preds = %33
  %43 = load %struct.ptrTree** %1, align 8
  %44 = getelementptr inbounds %struct.ptrTree* %43, i32 0, i32 0
  %45 = load i8** %44, align 8
  store i8* %45, i8** %auxp1, align 8
  %46 = load %struct.ptrTree** %1, align 8
  %47 = getelementptr inbounds %struct.ptrTree* %46, i32 0, i32 1
  %48 = load i64* %47, align 8
  store i64 %48, i64* %count1, align 8
  %49 = load %struct.ptrTree** %p, align 8
  %50 = getelementptr inbounds %struct.ptrTree* %49, i32 0, i32 0
  %51 = load i8** %50, align 8
  store i8* %51, i8** %auxp2, align 8
  %52 = load %struct.ptrTree** %p, align 8
  %53 = getelementptr inbounds %struct.ptrTree* %52, i32 0, i32 1
  %54 = load i64* %53, align 8
  store i64 %54, i64* %count2, align 8
  %55 = load %struct.ptrTree** %1, align 8
  %56 = getelementptr inbounds %struct.ptrTree* %55, i32 0, i32 2
  %57 = load %struct.ptrTree** %56, align 8
  %58 = load i8** %auxp2, align 8
  %59 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %57, i8* %58)
  %60 = load %struct.ptrTree** %1, align 8
  %61 = getelementptr inbounds %struct.ptrTree* %60, i32 0, i32 2
  store %struct.ptrTree* %59, %struct.ptrTree** %61, align 8
  %62 = load %struct.ptrTree** %1, align 8
  %63 = getelementptr inbounds %struct.ptrTree* %62, i32 0, i32 3
  %64 = load %struct.ptrTree** %63, align 8
  %65 = load i8** %auxp1, align 8
  %66 = load i64* %count1, align 8
  %67 = call %struct.ptrTree* @insertNode(%struct.ptrTree* %64, i8* %65, i64 %66)
  %68 = load %struct.ptrTree** %1, align 8
  %69 = getelementptr inbounds %struct.ptrTree* %68, i32 0, i32 3
  store %struct.ptrTree* %67, %struct.ptrTree** %69, align 8
  %70 = load i8** %auxp2, align 8
  %71 = load %struct.ptrTree** %1, align 8
  %72 = getelementptr inbounds %struct.ptrTree* %71, i32 0, i32 0
  store i8* %70, i8** %72, align 8
  %73 = load i64* %count2, align 8
  %74 = load %struct.ptrTree** %1, align 8
  %75 = getelementptr inbounds %struct.ptrTree* %74, i32 0, i32 1
  store i64 %73, i64* %75, align 8
  %76 = load %struct.ptrTree** %1, align 8
  %77 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %76)
  store %struct.ptrTree* %77, %struct.ptrTree** %1, align 8
  br label %133

; <label>:78                                      ; preds = %4
  %79 = load i64* %hr, align 8
  %80 = load i64* %hl, align 8
  %81 = sub nsw i64 %79, %80
  %82 = icmp sgt i64 %81, 1
  br i1 %82, label %83, label %132

; <label>:83                                      ; preds = %78
  %84 = load %struct.ptrTree** %1, align 8
  %85 = getelementptr inbounds %struct.ptrTree* %84, i32 0, i32 3
  %86 = load %struct.ptrTree** %85, align 8
  store %struct.ptrTree* %86, %struct.ptrTree** %p, align 8
  br label %87

; <label>:87                                      ; preds = %92, %83
  %88 = load %struct.ptrTree** %p, align 8
  %89 = getelementptr inbounds %struct.ptrTree* %88, i32 0, i32 2
  %90 = load %struct.ptrTree** %89, align 8
  %91 = icmp ne %struct.ptrTree* %90, null
  br i1 %91, label %92, label %96

; <label>:92                                      ; preds = %87
  %93 = load %struct.ptrTree** %p, align 8
  %94 = getelementptr inbounds %struct.ptrTree* %93, i32 0, i32 2
  %95 = load %struct.ptrTree** %94, align 8
  store %struct.ptrTree* %95, %struct.ptrTree** %p, align 8
  br label %87

; <label>:96                                      ; preds = %87
  %97 = load %struct.ptrTree** %1, align 8
  %98 = getelementptr inbounds %struct.ptrTree* %97, i32 0, i32 0
  %99 = load i8** %98, align 8
  store i8* %99, i8** %auxp1, align 8
  %100 = load %struct.ptrTree** %1, align 8
  %101 = getelementptr inbounds %struct.ptrTree* %100, i32 0, i32 1
  %102 = load i64* %101, align 8
  store i64 %102, i64* %count1, align 8
  %103 = load %struct.ptrTree** %p, align 8
  %104 = getelementptr inbounds %struct.ptrTree* %103, i32 0, i32 0
  %105 = load i8** %104, align 8
  store i8* %105, i8** %auxp2, align 8
  %106 = load %struct.ptrTree** %p, align 8
  %107 = getelementptr inbounds %struct.ptrTree* %106, i32 0, i32 1
  %108 = load i64* %107, align 8
  store i64 %108, i64* %count2, align 8
  %109 = load %struct.ptrTree** %1, align 8
  %110 = getelementptr inbounds %struct.ptrTree* %109, i32 0, i32 3
  %111 = load %struct.ptrTree** %110, align 8
  %112 = load i8** %auxp2, align 8
  %113 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %111, i8* %112)
  %114 = load %struct.ptrTree** %1, align 8
  %115 = getelementptr inbounds %struct.ptrTree* %114, i32 0, i32 3
  store %struct.ptrTree* %113, %struct.ptrTree** %115, align 8
  %116 = load %struct.ptrTree** %1, align 8
  %117 = getelementptr inbounds %struct.ptrTree* %116, i32 0, i32 2
  %118 = load %struct.ptrTree** %117, align 8
  %119 = load i8** %auxp1, align 8
  %120 = load i64* %count1, align 8
  %121 = call %struct.ptrTree* @insertNode(%struct.ptrTree* %118, i8* %119, i64 %120)
  %122 = load %struct.ptrTree** %1, align 8
  %123 = getelementptr inbounds %struct.ptrTree* %122, i32 0, i32 2
  store %struct.ptrTree* %121, %struct.ptrTree** %123, align 8
  %124 = load i8** %auxp2, align 8
  %125 = load %struct.ptrTree** %1, align 8
  %126 = getelementptr inbounds %struct.ptrTree* %125, i32 0, i32 0
  store i8* %124, i8** %126, align 8
  %127 = load i64* %count2, align 8
  %128 = load %struct.ptrTree** %1, align 8
  %129 = getelementptr inbounds %struct.ptrTree* %128, i32 0, i32 1
  store i64 %127, i64* %129, align 8
  %130 = load %struct.ptrTree** %1, align 8
  %131 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %130)
  store %struct.ptrTree* %131, %struct.ptrTree** %1, align 8
  br label %132

; <label>:132                                     ; preds = %96, %78
  br label %133

; <label>:133                                     ; preds = %132, %42
  br label %134

; <label>:134                                     ; preds = %133, %0
  %135 = load %struct.ptrTree** %1, align 8
  ret %struct.ptrTree* %135
}

; Function Attrs: nounwind ssp uwtable
define %struct.ptrTree* @retrievePtrTree(i8* %ID) #0 {
  %1 = alloca i8*, align 8
  %p = alloca %struct.ptrTree*, align 8
  store i8* %ID, i8** %1, align 8
  %2 = load %struct.ptrTree** @ptrsTable, align 8
  store %struct.ptrTree* %2, %struct.ptrTree** %p, align 8
  br label %3

; <label>:3                                       ; preds = %32, %0
  %4 = load %struct.ptrTree** %p, align 8
  %5 = icmp ne %struct.ptrTree* %4, null
  br i1 %5, label %6, label %33

; <label>:6                                       ; preds = %3
  %7 = load i8** %1, align 8
  %8 = ptrtoint i8* %7 to i64
  %9 = load %struct.ptrTree** %p, align 8
  %10 = getelementptr inbounds %struct.ptrTree* %9, i32 0, i32 0
  %11 = load i8** %10, align 8
  %12 = ptrtoint i8* %11 to i64
  %13 = icmp ult i64 %8, %12
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %6
  %15 = load %struct.ptrTree** %p, align 8
  %16 = getelementptr inbounds %struct.ptrTree* %15, i32 0, i32 2
  %17 = load %struct.ptrTree** %16, align 8
  store %struct.ptrTree* %17, %struct.ptrTree** %p, align 8
  br label %32

; <label>:18                                      ; preds = %6
  %19 = load i8** %1, align 8
  %20 = ptrtoint i8* %19 to i64
  %21 = load %struct.ptrTree** %p, align 8
  %22 = getelementptr inbounds %struct.ptrTree* %21, i32 0, i32 0
  %23 = load i8** %22, align 8
  %24 = ptrtoint i8* %23 to i64
  %25 = icmp ugt i64 %20, %24
  br i1 %25, label %26, label %30

; <label>:26                                      ; preds = %18
  %27 = load %struct.ptrTree** %p, align 8
  %28 = getelementptr inbounds %struct.ptrTree* %27, i32 0, i32 3
  %29 = load %struct.ptrTree** %28, align 8
  store %struct.ptrTree* %29, %struct.ptrTree** %p, align 8
  br label %31

; <label>:30                                      ; preds = %18
  br label %33

; <label>:31                                      ; preds = %26
  br label %32

; <label>:32                                      ; preds = %31, %14
  br label %3

; <label>:33                                      ; preds = %30, %3
  %34 = load %struct.ptrTree** %p, align 8
  ret %struct.ptrTree* %34
}

; Function Attrs: nounwind ssp uwtable
define i8* @_malloc(i64 %_size) #0 {
  %1 = alloca i64, align 8
  %temp = alloca i8*, align 8
  store i64 %_size, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call i8* @malloc(i64 %2)
  store i8* %3, i8** %temp, align 8
  %4 = load %struct.ptrTree** @ptrsTable, align 8
  %5 = load i8** %temp, align 8
  %6 = call %struct.ptrTree* @insertNode(%struct.ptrTree* %4, i8* %5, i64 1)
  store %struct.ptrTree* %6, %struct.ptrTree** @ptrsTable, align 8
  %7 = load %struct.ptrTree** @ptrsTable, align 8
  %8 = icmp eq %struct.ptrTree* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 1, i32* @changes, align 4
  br label %13

; <label>:10                                      ; preds = %0
  %11 = load i32* @changes, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* @changes, align 4
  br label %13

; <label>:13                                      ; preds = %10, %9
  %14 = load i32* @changes, align 4
  %15 = urem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %20

; <label>:17                                      ; preds = %13
  %18 = load %struct.ptrTree** @ptrsTable, align 8
  %19 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %18)
  store %struct.ptrTree* %19, %struct.ptrTree** @ptrsTable, align 8
  br label %20

; <label>:20                                      ; preds = %17, %13
  %21 = load i8** %temp, align 8
  ret i8* %21
}

; Function Attrs: nounwind ssp uwtable
define i8* @attrib(i8* %ptrFrom, i8* %ptrDest) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %look = alloca %struct.ptrTree*, align 8
  store i8* %ptrFrom, i8** %1, align 8
  store i8* %ptrDest, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %0
  %6 = load i8** %2, align 8
  %7 = call %struct.ptrTree* @retrievePtrTree(i8* %6)
  store %struct.ptrTree* %7, %struct.ptrTree** %look, align 8
  %8 = load %struct.ptrTree** %look, align 8
  %9 = getelementptr inbounds %struct.ptrTree* %8, i32 0, i32 1
  %10 = load i64* %9, align 8
  %11 = add i64 %10, 1
  store i64 %11, i64* %9, align 8
  br label %12

; <label>:12                                      ; preds = %5, %0
  %13 = load i8** %1, align 8
  %14 = icmp ne i8* %13, null
  br i1 %14, label %15, label %41

; <label>:15                                      ; preds = %12
  %16 = load i8** %1, align 8
  %17 = call %struct.ptrTree* @retrievePtrTree(i8* %16)
  store %struct.ptrTree* %17, %struct.ptrTree** %look, align 8
  %18 = load %struct.ptrTree** %look, align 8
  %19 = getelementptr inbounds %struct.ptrTree* %18, i32 0, i32 1
  %20 = load i64* %19, align 8
  %21 = add i64 %20, -1
  store i64 %21, i64* %19, align 8
  %22 = load %struct.ptrTree** %look, align 8
  %23 = getelementptr inbounds %struct.ptrTree* %22, i32 0, i32 1
  %24 = load i64* %23, align 8
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %15
  %27 = load i8** %1, align 8
  call void @free(i8* %27)
  %28 = load %struct.ptrTree** @ptrsTable, align 8
  %29 = load i8** %1, align 8
  %30 = call %struct.ptrTree* @removeNode(%struct.ptrTree* %28, i8* %29)
  store %struct.ptrTree* %30, %struct.ptrTree** @ptrsTable, align 8
  %31 = load i32* @changes, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* @changes, align 4
  br label %33

; <label>:33                                      ; preds = %26, %15
  %34 = load i32* @changes, align 4
  %35 = urem i32 %34, 2
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %33
  %38 = load %struct.ptrTree** @ptrsTable, align 8
  %39 = call %struct.ptrTree* @balancePtrTree(%struct.ptrTree* %38)
  store %struct.ptrTree* %39, %struct.ptrTree** @ptrsTable, align 8
  br label %40

; <label>:40                                      ; preds = %37, %33
  br label %41

; <label>:41                                      ; preds = %40, %12
  %42 = load i8** %2, align 8
  ret i8* %42
}

; Function Attrs: nounwind ssp uwtable
define void @printT(%struct.ptrTree* %tree) #0 {
  %1 = alloca %struct.ptrTree*, align 8
  store %struct.ptrTree* %tree, %struct.ptrTree** %1, align 8
  %2 = load %struct.ptrTree** %1, align 8
  %3 = icmp ne %struct.ptrTree* %2, null
  br i1 %3, label %4, label %18

; <label>:4                                       ; preds = %0
  %5 = load %struct.ptrTree** %1, align 8
  %6 = getelementptr inbounds %struct.ptrTree* %5, i32 0, i32 2
  %7 = load %struct.ptrTree** %6, align 8
  call void @printT(%struct.ptrTree* %7)
  %8 = load %struct.ptrTree** %1, align 8
  %9 = getelementptr inbounds %struct.ptrTree* %8, i32 0, i32 0
  %10 = load i8** %9, align 8
  %11 = load %struct.ptrTree** %1, align 8
  %12 = getelementptr inbounds %struct.ptrTree* %11, i32 0, i32 1
  %13 = load i64* %12, align 8
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8* %10, i64 %13)
  %15 = load %struct.ptrTree** %1, align 8
  %16 = getelementptr inbounds %struct.ptrTree* %15, i32 0, i32 3
  %17 = load %struct.ptrTree** %16, align 8
  call void @printT(%struct.ptrTree* %17)
  br label %18

; <label>:18                                      ; preds = %4, %0
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define void @dump() #0 {
  %1 = load %struct.ptrTree** @ptrsTable, align 8
  call void @printT(%struct.ptrTree* %1)
  ret void
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.2 (clang-700.1.81)"}
