<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>MySql</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>

<body>

	<p><b>------启动MySql服务------</b></p>
	<p>net start mysql</p>

	<p><b>------登录数据库------</b></p>
	<p>mysql -uroot  -p密码</p>
	
	<p><b>------DDL数据定义语言(操作数据库和表)------</b></p>
	<p>创建数据库:create database 数据库名称;</p>
	<p>删除数据库:drop database 数据库名称;</p>
	<p>查看所有数据库:show databases;</p>
	
	<p>创建表:create table 表名(字段描述,字段描述);</p>
	字段描述:字段名称 字段类型 [约束可有可无]<br>
	例如,创建user表,包含id和username属性:create table user(id int primary key auto_increment,username varchar(20));<br>
	
	<p>修改表:alter table 表名 ....;</p>
	修改表名:alter table 旧表名 rename to 新表名;<br>
	例如:alter table user1 rename to user10;<br><br>
	添加字段:alter table 表名 add [column] 字段描述;<br>
	例如:alter table user add password varchar(20);<br><br>
	修改字段名:alter table 表名 change 字段名称 新字段描述;<br>
	例如:alter table user change password pwd varchar(20);<br><br>
	修改字段描述:alter table 表名 modify 字段名称 字段类型 [约束];<br>
	例如:alter table user modify pwd int;<br><br>
	删除字段:alter table 表名 drop 字段名;<br>
	例如:alter table user drop pwd;<br>
	
	<p>删除表:drop table 表名;</p>
	
	<b>常用命令:</b><br>
	创建表之前需要使用命令选择数据库:use 数据库名称;<br>
	查看当前数据库下所有表: show tables;<br>
	查看表结构:desc 表名;<br>
	查看建表语句:show create table 表名;<br>
	
	<p><b>------DDL数据操作语言(操作记录(行))------</b></p>
	关键词:insert update delete<br><br>
	插入数据格式一:<br>
	insert into 表名 values(字段值1,字段值2...,字段值n);<br>
	注意:<br>
	默认插入全部字段,必须保证values后面的内容的类型和顺序和表结构中的一致若字段类型为数字,可以省略引号.<br>
	例如:<br>
	insert into user values(1,'tom');<br>
	insert into user values('2','tom');<br>
	insert into user values('3');-- 错误的 <br><br>
	
	插入数据格式二:<br>
	insert into 表名(字段名,字段名1...) values(字段值,字段值1...);<br>
	注意:插入指定的字段,必须保证values后面的内容的类型和顺序和表名后面的字段的类型和顺序保持一致.<br>
	例如:<br>
	insert into user (username,id) values('jack',4);<br>
	insert into user (username) values('jack',5);-- 错误的<br><br>
	
	修改数据格式:update 表名 set 字段名=字段值,字段名1=字段值1... [where 条件];<br>
	例如:<br>
	update user set username='jerry' where username='jack';<br><br>
	
	删除数据格式:delete from 表名 [where 条件];<br>
	例如:<br>
	delete from user where id = '2';<br><br>
	
	<p><b>------DDL数据查询语言(关键词:select)------</b></p>
	格式:select ... from 表名 where 条件 group by 分组字段 having 条件 order by 排序字段 ase|desc;<br><br>
	创建分类表:create table category(cid varchar(20) primary key,cname varchar(20));<br><br>
	
	创建商品表并插入几条数据:<br>
	create table products(pid int primary key auto_increment,pname varchar(20),price double,pnum int,cno int,pdate timestamp);<br>
	插入几条数据:<br>
	insert into products values (null,'泰国大榴莲',98,12,1,null);<br>
	insert into products values (null,'新疆大枣',38,123,1,null);<br>
	insert into products values (null,'新疆切糕',68,50,2,null);<br>
	insert into products values (null,'十三香',10,200,3,null);<br>
	insert into products values (null,'老干妈',20,180,3,null);<br>
	insert into products values (null,'豌豆黄',20,120,2,null);<br><br>
	说明:pdate,此类型传null的时候,默认会将系统时间存入数据库.<br>
	
	
	<p>
	 
	</p>
	
	<p><b>------mysql------</b></p>
	
	<p><b>------mysql------</b></p>
	
</body>
</html>
