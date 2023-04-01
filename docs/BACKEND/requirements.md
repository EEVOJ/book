# 需求整理

注：后端包含两部分，均部署到 28000 端口

- 管理员在 Django 的管理界面（前端）可以查看/添加/修改/删除所有数据（`/admin` 为前端网页）
- 后端暴露出 API 供公网调用（除 `/admin` 之外的链接，如 `/problem` `/submission`，均为 API，通过 Json 返回）

## 用户

### 公开

- 查看所有公告（GET /notice）
    - 查看一个公告的详情（GET /notice/pk）
- 查看所有题目（GET /problem）
    - 查看一道题目的详情（GET /problem/pk）

### 账户管理

- POST /account/signup
    - username
    - password
- POST /account/login
    - username
    - password
- GET /account/logout
- /account/reset_password
    - new_password

### 登录后才能进行的操作

- 提交一道题目的答案（POST /submission/submit）
    - problem_pk
    - code
    - -> pk
- 查看自己的所有提交（GET /submission）
    - 查看自己某次提交的详情（GET /submission/pk）
- 查看自己的题目完成情况（GET / submission/my）

## 数据结构

### Django

- User（用户）Django 默认生成
    - 关联多个 Submission
- Group（组）Django 默认生成

### 公开

- Notice（公告）
    - pk
    - title（标题）
    - publish_date（发布时间）
    - content_url（公告内容的 Markdown 链接）
- Problem（题目）
    - pk
    - no（题目编号）
    - title（题目名称）
    - publish_date（发布时间）
    - description_url（题目描述的 Markdown 链接）
    - top_module（code 中顶层模块的名称）
    - code_reference_url（题目标准答案的文件链接）
        - 不公开
    - code_template_url（题目模板的文件链接）
    - 关联多个 Testbench
    - 关联多个 Submission
        - 不公开
- Testbench（测试样例）
    - pk
    - 关联唯一 Problem
    - testbench_url（testbench 的文件链接）
        - 模块名称必须为 testbench
        - 必须只包含一个 endmodule
    - // score（测试样例的分数）如果没有这项的话  相当于每个 testbench 都 1 分
    - 关联多个 Signal
    - 关联多个 Judge
        - 不公开
- Signal
    - pk
    - 关联唯一 Testbench
    - name（信号名称）

### 非公开

- Submission（一名用户针对一道题目的一次提交）不公开，只有提交者可以查看自己之前的所有提交
    - pk
    - 关联唯一 User
    - 关联唯一 Problem
    - submit_date（提交时间）
    - code_url（学生提交的 Verilog 代码文件链接）
    - // 每个 Submission 有一个 code  对应有一个电路图  不过也可以让学生自己去生成  不需要存在数据库中
    - 关联多个 Judge
- Judge（针对一个题目中一个 testbench 的判题结果）不公开，只有提交者可以看到自己之前的所有提交的所有判题过程
    - pk
    - 关联唯一 Submission
    - 关联唯一 Testbench
    - is_correct（判题是否通过）
    - log_url（判题过程中命令行输出日志的链接）
    - error（使用文字简单说明出错的地方  默认为空）
    - wavejson_reference_url（标准答案的波形图链接）
    - wavejson_student_url（学生提交的代码的波形图链接）
