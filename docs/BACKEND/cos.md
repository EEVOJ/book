# 腾讯云对象存储相关

## Django 中的使用方式

在 Django 的 models.py 中使用 `models.URLField` 来存储文件在腾讯云对象存储中的链接。

## 新建存储桶

打开 <https://console.cloud.tencent.com/cos/bucket> 点击「创建存储桶」：

![](images-cos/create-bucket.png)

第一页基本信息注意选择公有读私有写，这样资源可以直接在互联网中读访问。第二页高级可选配置不需要动。第三页确认配置点击「创建」：

![](images-cos/create-bucket-1.png)

![](images-cos/create-bucket-3.png)

之后就可以使用这个存储桶了。

## 新建访问账号

账号（SecretId 和 SecretKey）有两个作用，一个是可以开发者调用腾讯云对象存储 API 来上传文件，另一个是助教可以通过 COSBrowser 来修改文件内容，助教也可以在 COSBrowser 中创建新的文件在 Django 后端修改文件链接。

### 新建策略

查阅 <https://cloud.tencent.com/document/product/436/31923>，我们需要先创建一个策略。在 <https://console.cloud.tencent.com/cam/policy> 中点击「新建自定义策略」，「按策略生成器创建」。做下面的配置，确保这个策略仅能够访问到这一个存储桶：

![](images-cos/create-policy-0.png)

![](images-cos/create-policy-1.png)

![](images-cos/create-policy-2.png)

命名为 `policy-cos-access-<bucket-name>` 表示这个策略可以访问到这个存储桶。点击「完成」。

![](images-cos/create-policy-done.png)

### 新建账号

在 <https://console.cloud.tencent.com/cam> 的「用户列表」中，点击「新建用户」，「快速创建」，按照如下选择：

![](images-cos/create-user.png)
![](images-cos/create-user-quick.png)

接着添加两个账户，注意开启编程访问。这里创建了两个账户，dev 结尾为开发者使用，ta 结尾为助教使用：

![](images-cos/create-user-config.png)

策略选择我们刚刚创建的策略，记得移除管理权限：

![](images-cos/create-user-select-policy.png)

点击创建用户。拿到 SecretId 和 SecretKey，与用户名一起给到开发者与助教即可：

![](images-cos/create-user-done.png)

### 助教使用 COSBrowser

为了让助教可以在线修改文件，直接使用腾讯云对象存储做好的 [COSBrowser](https://cloud.tencent.com/document/product/436/11366)，使用网页版就可以了，登录链接是 <https://cosbrowser.cloud.tencent.com/login>。

打开是一个登录界面，账号密码需要管理员提供（上面的 SecretId 和 SecretKey）：

![](images-cos/cosbrowser-login.png)

有两种界面，我们切换到编辑模式：

![](images-cos/cosbrowser-standard.png)

在编辑模式可以直接对文件内容进行修改，或者创建新文件：

![](images-cos/cosbrowser-edit.png)
![](images-cos/cosbrowser-create-file.png)

新创建的文件可以右键点击分享，拿到文件链接：

![](images-cos/cosbrowser-link-0.png)
![](images-cos/cosbrowser-link-1.png)

### 开发者调用 API

TODO
