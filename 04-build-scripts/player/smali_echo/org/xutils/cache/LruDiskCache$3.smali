.class Lorg/xutils/cache/LruDiskCache$3;
.super Ljava/lang/Object;
.source "LruDiskCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/xutils/cache/LruDiskCache;->deleteNoIndexFiles()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/xutils/cache/LruDiskCache;


# direct methods
.method constructor <init>(Lorg/xutils/cache/LruDiskCache;)V
    .registers 2
    .param p1, "this$0"    # Lorg/xutils/cache/LruDiskCache;

    .prologue
    .line 347
    iput-object p1, p0, Lorg/xutils/cache/LruDiskCache$3;->this$0:Lorg/xutils/cache/LruDiskCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    .line 350
    iget-object v5, p0, Lorg/xutils/cache/LruDiskCache$3;->this$0:Lorg/xutils/cache/LruDiskCache;

    # getter for: Lorg/xutils/cache/LruDiskCache;->available:Z
    invoke-static {v5}, Lorg/xutils/cache/LruDiskCache;->access$100(Lorg/xutils/cache/LruDiskCache;)Z

    move-result v5

    if-eqz v5, :cond_53

    .line 352
    :try_start_8
    iget-object v5, p0, Lorg/xutils/cache/LruDiskCache$3;->this$0:Lorg/xutils/cache/LruDiskCache;

    # getter for: Lorg/xutils/cache/LruDiskCache;->cacheDir:Ljava/io/File;
    invoke-static {v5}, Lorg/xutils/cache/LruDiskCache;->access$500(Lorg/xutils/cache/LruDiskCache;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 353
    .local v4, "fileList":[Ljava/io/File;
    if-eqz v4, :cond_53

    .line 354
    array-length v6, v4

    const/4 v5, 0x0

    :goto_16
    if-ge v5, v6, :cond_53

    aget-object v3, v4, v5
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_1a} :catch_4b

    .line 356
    .local v3, "file":Ljava/io/File;
    :try_start_1a
    iget-object v7, p0, Lorg/xutils/cache/LruDiskCache$3;->this$0:Lorg/xutils/cache/LruDiskCache;

    # getter for: Lorg/xutils/cache/LruDiskCache;->cacheDb:Lorg/xutils/DbManager;
    invoke-static {v7}, Lorg/xutils/cache/LruDiskCache;->access$000(Lorg/xutils/cache/LruDiskCache;)Lorg/xutils/DbManager;

    move-result-object v7

    const-class v8, Lorg/xutils/cache/DiskCacheEntity;

    invoke-interface {v7, v8}, Lorg/xutils/DbManager;->selector(Ljava/lang/Class;)Lorg/xutils/db/Selector;

    move-result-object v7

    const-string v8, "path"

    const-string v9, "="

    .line 357
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Lorg/xutils/db/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lorg/xutils/db/Selector;

    move-result-object v7

    invoke-virtual {v7}, Lorg/xutils/db/Selector;->count()J

    move-result-wide v0

    .line 358
    .local v0, "count":J
    const-wide/16 v8, 0x1

    cmp-long v7, v0, v8

    if-gez v7, :cond_3f

    .line 359
    invoke-static {v3}, Lorg/xutils/common/util/IOUtil;->deleteFileOrDir(Ljava/io/File;)Z
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_3f} :catch_42

    .line 354
    .end local v0    # "count":J
    :cond_3f
    :goto_3f
    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    .line 361
    :catch_42
    move-exception v2

    .line 362
    .local v2, "ex":Ljava/lang/Throwable;
    :try_start_43
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v2}, Lorg/xutils/common/util/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_4a} :catch_4b

    goto :goto_3f

    .line 366
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileList":[Ljava/io/File;
    :catch_4b
    move-exception v2

    .line 367
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lorg/xutils/common/util/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 370
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_53
    return-void
.end method
