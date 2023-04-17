# Django 笔记

安装 Django：`pip install django`

查看 Django 版本：`python -m django --version`

新建项目：`django-admin startproject <project_name>`

设置时区和地区：

```py
LANGUAGE_CODE = 'zh-Hans'
TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True
USE_TZ = True
```

新建app：`python manage.py startapp <app_name>`

运行本地服务器：`python manage.py runserver`

准备数据库建表的脚本：`python manage.py makemigrations`

数据库建表：`python manage.py migrate`

命令行交互：`python manage.py shell`

## 代码

Django 的包都是 `django.contrib` 开头，所以 import 其他模板的时候使用 `import django.db` `import django.http`，但是导入包需要使用 `import django.contrib.admin`。这样导入可以在 VS Code 中看到提示，而且代码也会更加清楚。

## Admin

管理员站点：`python manage.py runserver` -> `http://127.0.0.1:8000/admin/`

创建管理员账户：`python manage.py createsuperuser`

管理界面列表显示：

```py
    @admin.display(description="自定义时间")
    def date_str(self):
        return timezone.localtime(self.publist_date).strftime("%Y/%m/%d %H:%M:%S")
```

## 用户

修改密码：`python manage.py changepassword <username>`
