# 需求

## 管理员

在后端管理界面可以添加/修改/删除所有数据

## 用户

### 公开

- 查看所有公告
    - 查看一个公告的详情
- 查看所有题目
    - 查看一道题目的详情

### 登录后才能进行的操作

（signup / login / logout）

- 提交一道题目的答案
- 查看自己的所有提交
    - 查看自己某次提交的详情
- 查看自己的题目完成情况

## 数据结构

- User（用户）Django 默认生成
    - 关联多个 Submission
- Group（组）Django 默认生成
- Notice（公告）
    - id
    - title（标题）
    - publish_date（发布时间）
    - content_url（公告内容的 Markdown 链接）
- Problem（题目）
    - id
    - no（对外呈现的编号）
    - title（题目名称）
    - publish_date（发布时间）
    - description_url（题目描述的 Markdown 链接）
    - top_module（code_reference 中顶层模块的名称）
    - code_reference_url（题目标准答案的文件链接）（不公开）
    - code_template_url（题目模板的文件链接）
    - 关联多个 Testbench
    - 关联多个 Submission
- Testbench（测试样例）
    - id
    - 关联唯一 Problem
    - testbench_url（testbench 的文件链接）
        - 模块名称必须为 testbench
        - 必须只包含一个 endmodule
    - // score（测试样例的分数）如果没有这项的话  相当于每个 testbench 都 1 分
    - 关联多个 Signal
    - 关联多个 Judge
- Signal
    - id
    - 关联唯一 Testbench
    - name（信号名称）
- Submission（一名用户针对一道题目的一次提交）
    - id
    - 关联唯一 User
    - 关联唯一 Problem
    - submit_date（提交时间）
    - code_url（学生提交的 Verilog 代码文件）
    - // 每个 Submission 有一个 code  对应有一个电路图  不过也可以让学生自己去生成  不需要存在数据库中
    - 关联多个 Judge
- Judge（针对一个题目中一个 testbench 的判题结果）
    - id
    - 关联唯一 Submission
    - 关联唯一 Testbench
    - is_correct（判题是否通过）
    - log_url（判题过程中命令行输出日志的链接）
    - error（使用文字简单说明出错的地方  默认为空）
    - wavejson_reference（标准答案的波形图）
    - wavejson_student（学生提交的代码的波形图）
