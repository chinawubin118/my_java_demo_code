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

	<p><b>------sql简单查询------</b></p>
	1.查询所有的商品<br>
	select * from products;<br>
	2.查询商品名和商品价格.<br>
	-- 查看指定的字段 <br>
	-- 格式: select 字段名1,字段名2 from 表名<br>
	select pname,price from products;<br>
	3.查询所有商品都有那些价格.<br>
	-- 去重操作 distinct<br>
	-- 格式: select distinct 字段名,字段名2 from 表名<br>
	select price from products;<br>
	select distinct price from products;<br>
	4.将所有商品的价格+10元进行显示.(别名)<br>
	-- 可以在查询的结果之上进行运算,不影响数据库中的值<br>
	-- 给列起别名 格式: 字段名 [as] 别名(as可写可不写)<br>
	select price+10 from products;<br>
	select price+10 新价格 from products;<br>
	select price+10 '新价格' from products;<br>
	select price+10 '新 价 格' from products;<br>
	select price+10 `新 价 格` from products;<br>	
	
	<p><b>------sql基本条件查询------</b></p>
	1.查询商品名称为十三香的商品所有信息：<br>
	select * from products where pname = '十三香';<br>
	2.查询商品价格>60元的所有的商品信息:<br>
	select * from products where price>60;<br><br>
	3.查询商品名称中包含”新”的商品<br>
	select * from products where pname like "%新%";<br>
	-- 模糊匹配 <br>
	-- 格式: 字段名 like "匹配规则";<br>
	-- 匹配内容 %<br>
	"龙"	值为龙<br>
	"%龙".....值以"龙"结尾<br>
	"龙%".....值以"龙"开头<br>
	"%龙%".....值包含"龙"<br>
	-- 匹配个数 "__" 占两个位置<br><br>
			
	4.查询价格为38,68,98的商品.<br>
	select * from products where price = 38 or price = 68 or price=98;<br>
	select * from products where price in(38,68,98);<br><br>
	
	where后的条件写法：<br>
	* > ,<,=,>=,<=,<>,!=<br>
	* like 使用占位符 _ 和 %  _代表一个字符 %代表任意个字符. <br>
	* select * from product where pname like '%新%';<br>
	* in在某个范围中获得值.<br>
	* select * from product where pid in (2,5,8);<br>
	* between 较小值 and 较大值<br>
	select * from products where price between 50 and 70;<br>
	
	<p><b>------sql排序查询------</b></p>
	排序查询:<br>
	1.查询所有的商品，按价格进行排序.(asc-升序,desc-降序).<br>
	select * from products order by price desc;<br>
	2.查询名称有新的商品的信息并且按价格降序排序.<br>
	select * from products where pname like '%新%' order by price desc;<br>
	
	<p><b>------sql聚合函数------</b></p>
	--对一列进行计算 返回值是一个,忽略null值.<br>
	* sum(),avg(),max(),min(),count();<br>
	1.获得所有商品的价格的总和：<br>
	select sum(price) from products;<br>
	2.获得商品表中价格的平均数：<br>
	select avg(price) from products;<br>
	-- round(值,保留小数位)<br>
	select round(avg(price),2) from products;<br>
	3.获得商品表中有多少条记录：<br>
	select count(*) from products;<br>
	
	<p><b>------使用group by分组------</b></p>
	1.根据cno字段分组，分组后统计商品的个数.<br>
	select cno,count(*) from products group by cno;<br>
	2.根据cno分组，分组统计每组商品的总数量，并且总数量> 200;<br>
	select cno,sum(pnum) from products  group by cno;<br>
	select cno,sum(pnum) from products  group by cno having sum(pnum)>200;<br>
	注意:where和having区别:<br>
	1.where 是对分组前的数据进行过滤 ;having 是对分组后的数据进行过滤 .<br>
	2.where 后面不能使用聚合函数,having可以<br>
	
	<p><b>------java和sql中的数据类型对照------</b></p>	
	byte----------tinyint<br>			
	short----------smallint<br>
	int----------int(★)<br>
	long----------bigint<br>
	char/String----------varchar(★)|char<br>
	说明:varchar:可变长度 mysql的方言 ;varchar(20):存放abc,只会占用三个;char:固定长度 char(20):存放abc,占用20个
	boolean----------使用tinyint|int 代替;<br>
	float|double----------float|double;<br>
	注意:double(5,2):该小数长度为5个,小数占2个  最大值:999.99.<br>

	java.sql.Date----------date;日期<br>
	java.sql.Time----------time;时间<br>
	java.sql.Timestamp----------timestamp(★) 时间戳 若给定值为null,数据库会把当前的系统时间存放到数据库中;<br>
	说明:datetime(★);日期+时间,java中无对应;<br>
					
	java.sql.Clob(长文本)	----------mysql的方言(text);<br>
	java.sql.Blob(二进制)	----------blob;<br>
	
	<p><b>------sql约束------</b></p>
	作用:为了保证数据的有效性和完整性;<br>
	MySql中常用的约束:主键约束(primary key);唯一约束(unique);非空约束(not null);外键约束(foreign key);<br>
	
	<p><b>------sql主键约束------</b></p>
	说明:被修饰过的字段唯一非空;<br>
	注意:一张表只能有一个主键,这个主键可以包含多个字段.<br><br>
	
	方式1:建表的同时添加约束格式:<br>
	create table 表名 字段名称 字段类型 primary key;<br><br>
	方式2:建表的同时在"约束区域"添加约束 (所有字段声明完成之后,就是"约束区域"):<br>
	格式: create table primary key(字段1,字段2);<br>
	例如:create table pk01(id int,username varchar(20),primary key (id));<br><br>
			
	方式3:建表之后,通过修改表结构添加约束;<br>
	格式:alter table 表名 add primary key(字段名1,字段名2..);<br>
	create table pk02(id int,username varchar(20));//创建表的时候没有指定主键;<br>
	alter table pk02 add primary key(id,username);//修改表结构,添加字段id和username为主键;<br><br>
	
	<p><b>------sql唯一约束(了解)------</b></p>
	说明:被修饰过的字段唯一,对null不起作用;<br>
	方式1:建表的同时添加约束 ;<br>
	格式:create table 表名 字段名称 字段类型 unique;<br>
	例如:create table un(id int unique,username varchar(20) unique);<br><br>
			
	方式2:建表的同时在约束区域添加约束;<br>
	create table 表名 unique(字段1,字段2...);<br><br>
	方式3:建表之后,通过修改表结构添加约束;<br>
	alter table 表名 add unique(字段1);-- 给字段1添加唯一约束;<br>
	alter table 表名 add unique(字段1,字段2);-- 添加联合唯一约束;<br>
	
	<p><b>------sql非空约束(了解)------</b></p>
	特点:被修饰过的字段非空;<br>
	方式:建表时为字段添加非空约束not null;<br>
	例如:create table nn(id int not null,username varchar(20) not null);<br>
	
	<p><b>------sql补充------</b></p>
	truncate 清空表 ★<br>
	格式:truncate 表名; -- 意思是:干掉表,重新创建一张空表;<br>
	和delete from的区别:<br>
	delete属于DML语句,delete逐条删除;<br>
	truncate属于DDL语句,truncate是先干掉表,重新创建一张空表;<br><br>
		
	auto_increment 自增:<br>
	两点要求:<br>
	1.被修饰的字段类型支持自增. 一般是int;<br>
	2.被修饰的字段必须是一个key. 一般是primary key<br>
	
	<p><b>------sql多表------</b></p>
	表与表之间的关系:<br>
	常见关系:<br>
	一对多.....用户和订单 ;分类和商品<br>
	多对多.....订单和商品;学生和课程<br>
	一对一.....丈夫和妻子;<br><br>
	
	使用ER图描述实体与实体之间的关系:<br>
	实体用矩形表示;<br>
	属性用椭圆表示;<br>
	关系用菱形表示;<br>
	
	<p><b>------sql一对多------</b></p>
	用户和订单:<br>
	create table user(id int primary key auto_increment,username varchar(20));-- 创建用户表<br>
	create table orders(id int primary key auto_increment,totalprice double,user_id int);-- 创建订单表<br><br>
	
	为了保证数据的有效性和完整性,添加约束(外键约束).<br>
	在多表的一方添加外键约束:<br>
	格式:alter table 多表名称 add foreign key(外键名称) references 一表名称(主键);<br>
	例如:alter table orders add foreign key(user_id) references user(id);<br><br>
	
	添加了外键约束之后有如下特点:★<br>
	1.主表中不能删除从表中已引用的数据;<br>
	2.从表中不能添加主表中不存在的数据;<br><br>
	
	开发中处理一对多:★<br>
	在多表中添加一个外键,名称一般为"主表的名称_id",字段类型一般和主表的主键的类型保持一致,为了保证数据的有效性和完整性,在多表的外键上添加外键约束即可.<br><br>
	
	<p><b>------sql多对多------</b></p>
	例子:商品和订单;<br>
	create table product(id int primary key auto_increment,name varchar(20),price double);-- 创建商品表<br>

	create table orderitem(oid int,pid int);-- 创建中间表<br>
		
	-- 添加外键约束
	alter table orderitem add foreign key(oid) references orders(id);<br>
	alter table orderitem add foreign key(pid) references product(id);<br><br>
	
	开发中处理多对多:★<br>
	引入一张中间表,存放两张表的主键,一般会将这两个字段设置为联合主键,这样就可以将多对多的关系拆分成两个一对多了;为了保证数据的有效性和完整性,需要在中间表上添加两个外键约束即可.<br><br>
	
	<p><b>------sql多表查询------</b></p>
	
	<p>
	初始化测试数据<br><br>

	 create table `user` (`id` int auto_increment primary key,`username` varchar(50));-- 用户表(user)<br>
	 create table `orders` (`id` int  auto_increment primary key,`price` double,`user_id` int);-- 订单表(orders)<br>
	 alter table orders add constraint user_fk foreign key (user_id) references user(id); -- 给订单表添加外键约束<br><br>

	向user表中添加数据<br>
	insert into user values(3,'张三');<br>
	insert into user values(4,'李四');<br>
	insert into user values(5,'王五');<br>
	insert into user values(6,'赵六');<br>

	向orders 表中插入数据<br>
	insert into orders values(1,1314,3);<br>
	insert into orders values(2,1314,3);<br>
	insert into orders values(3,15,4);<br>
	insert into orders values(4,315,5);<br>
	insert into orders values(5,1014,null);<br>
	</p>
	
	笛卡尔积:多张表无条件的联合查询.没有任何意义...<br>
	select a.*,b.* from a,b;<br><br>
		
	内连接:★<br>
	格式1:显式的内连接...select a.*,b.* from a [inner] join b on ab的连接条件.<br>
	格式2:隐式的内连接...select a.*,b.* from a,b where ab的连接条件.<br><br>
	
	外连接:★<br>
	左外连接:★select a.*,b.* from a left [outer] join b on 连接条件;<br>
	意思:先展示join左边的(a)表的所有数据,根据条件关联查询 join右边的表(b),符合条件则展示出来,不符合以null值展示.<br>
	右外连接:(略)<br><br>
	
	子查询:★<br>
	一个查询依赖另一个查询.<br><br>
	
	多表查询例子:<br>
	1.查询用户的订单,没有订单的用户不显示:<br>
	隐式内连接:select user.*,orders.* from user ,orders where user.id=orders.user_id;<br>
	显示内连接:select user.*,orders.* from user join orders on user.id=orders.user_id;<br><br>
	
	2.查询所有用户的订单详情:<br>
	左外连接: user在左:select user.*,orders.* from user left join orders on user.id=orders.user_id;<br><br>
			
	3.查看用户为张三的订单详情:<br>
	select * from orders where user_id = (select id from User where username = '张三');<br><br>
	
	4.查询出订单的价格大于300的所有用户信息。<br>
	select * from user where id in(select user_id from orders where price >300);<br><br>
	
	5.查询订单价格大于300的订单信息及相关用户的信息:<br>
	内连接:select orders.*,user.* from orders,user where user.id=orders.user_id  and orders.price>300;<br>
	子查询:是将一个查询的结果作为一张临时表:<br>		
	select user.*,tmp.* from user,(select * from orders where price>300) as tmp where user.id=tmp.user_id;<br><br>
	
	给表起别名:<br>
	格式: 表 [as] 别名<br><br>
	
	<p><b>------数据库备份和还原------</b></p>
	数据库备份:<br>
	1.通过图形化工具备份:<br>
	2.mysql数据库通过命令备份(无需登录数据库):mysqldump -uroot -p1234 test_db>d:\1.sql<br>
	(将test_db数据库备份到d:\1.sql)<br><br>
	
	数据库还原:<br>
	1.无需登录数据库:mysql -uroot -p1234 bak1(小于号)d:\1.sql<br>
	(需要提前手动创建数据库bak1)<br>
	2.需要登录到指定的数据库上,创建一个数据库bak2,use bak2,然后执行sql语句:source d:\1.sql
	
	<p><b>------mysql------</b></p>
	
</body>
</html>
