<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Java_Jdbc</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  
  <p><b>------jdbc-api详解------</b></p>
  	所有的包 都是 java.sql 或者 javax.sql<br><br>
	
	DriverManager(类):管理了一组jdbc的操作<br><br>
	常用方法:<br>
	了解:注册驱动.<br>
	static void registerDriver(Driver driver):<br>
	驱动注册了两次.我们只需要将静态代码块执行一次,类被加载到内存中会执行静态代码块,并且只执行一次.<br>
	现在只需要将类加载到内存中即可:<br>
	方式1:★Class.forName("全限定名");//包名+类名   com.mysql.jdbc.Driver<br>
	方式2:类名.class;<br>
	方式3:对象.getClass();<br><br>
 
	掌握:获取连接.<br>
	static Connection getConnection(String url, String user, String password);<br>
	参数1:告诉我们连接什么类型的数据库及连接那个数据库<br>
	协议:数据库类型:子协议 参数<br>
	mysql:	jdbc:mysql://localhost:3306/数据库名称<br>
	oracle:	jdbc:oracle:thin@localhost:1521@实例<br>
	参数2:账户名 root.....参数3:密码<br><br>
	
	(了解)java.sql.Driver;...是一个接口...驱动<br><br>
	
	Connection(接口):连接 <br><br>
	
	常用方法:<br>
	获取语句执行者:<br>
	(了解)Statement createStatement() :获取普通的语句执行者 ,会出现sql注入问题<br>
	★PreparedStatement prepareStatement(String sql) :获取预编译语句执行者.<br>
	(了解)CallableStatement prepareCall(String sql):获取调用存储过程的语句执行者.<br><br>

	了解:<br>
	setAutoCommit(false) :手动开启事务.<br>
	commit():提交事务.<br>
	rollback():事务回滚.<br><br>
	
	Statement(接口,基本不用):语句执行者.<br>
	PreparedStatement(接口):预编译语句执行者.<br>
	常用方法:
	设置参数:setXxx(int 第几个问号,Object 实际参数);<br>
						 setInt();<br>
						 setString();<br>
						 setObject();<br><br>
			
	执行sql:
	ResultSet executeQuery():执行 r语句(查询),返回值:结果集;<br>
	int executeUpdate():执行cud语句,返回值:影响的行数;<br><br>
 
	ResultSet(结果):查询出来的结果集(执行查询语句之后返回的结果);<br>
	常用方法:
	boolean next():判断是否有下一条记录,若有返回true且将光标移到下一行,若没有,则返回false,光标一开始处于第一条记录的上面;<br><br>
				
	获取具体内容:<br>
	getXxx(int|string):若参数为int:是指第几列;若参数为string:是指列名(字段名);<br>

	常用方法:<br>
						getInt();<br>
						getString();也可以获取int值;<br>
						getObject();可以获取任意;<br>
						
	<p><b>------常见的配置文件格式------</b></p>
	
	1.Properties:里面内容的格式 key=value;<br>
	2.xml;<br><br>
	
	在src目录下创建properties文件,可以通过 ResourceBundle工具快速获取里面的配置信息;<br>
	使用步骤:<br>
	1.获取ResourceBundle对象:<br>
	static ResourceBundle getBundle("文件名称不带后缀名");<br>
	2.通过ResourceBundle 对象获取配置信息;<br>
	String getString(String key):通过执行key获取指定的value;<br>
	
	<p><b>------连接池:管理数据库的连接------</b></p>

	作用:提高项目的性能.<br>
	就是在连接池初始化的时候存入一定数量的连接,用的时候通过方法获取,不用的时候归还连接即可;所有的连接池必须实现 javax.sql.DataSource接口;<br>
	
	获取连接方法:Connection getConnection();<br>
	归还连接的方法:connection.close();<br><br>
	
	装饰者模式:★★★<br>
	使用步骤:<br>
	1.装饰者和被装饰者实现同一个接口或者继承同一个类;<br>
	2.装饰者中要有被装饰者的引用;<br>
	3.对需要增强的方法进行加强;<br>
	4.对不需要加强的方法调用原来方法;<br>
	
  </body>
</html>
