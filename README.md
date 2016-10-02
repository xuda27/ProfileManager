#简单的人员管理系统
主要技术：
- Spring+SpringMVC+MyBatis
- EasyUI
- Oracle
- Maven


##测试整合结构

### 1.需求
根据id查询人员信息

### 2.sql语句
select * from profile where id=1

### 3.dao层
可以使用逆向工程生成的mapper文件。

### 4.service层
接收id调用dao查询人员信息，返回人员pojo对象

### 5.controller层
接收页面请求人员id，调用service查询人员信息，直接返回json数据。


