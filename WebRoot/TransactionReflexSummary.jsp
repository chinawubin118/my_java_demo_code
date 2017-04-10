<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'TransactionReflexSummary.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  	<p><b>------Java反射------</b></p>
	1.获取class对象:<br>
		方式1:Class clazz=Class.forName("全限定名");<br>
		方式2:Class clazz=类名.class;<br>
		方式3:Class clazz=对象.getClass;<br><br>
		
	2.可以获取对应类的构造方法(了解):<br>
		Constructor con = clazz.getConstructor(Class .. paramClass);<br>
		Person p = (Person) con.newInstance(参数);<br><br>
		
	3.可以通过clazz创建一个对象(了解):<br>
		clazz.newInstance();//相当于调用的无参构造器<br><br>
		
	4.可以通过clazz获取所有的字段 getFiled()(了解中的了解)<br><br>
	
	5.可以通过clazz获取所有的方法<br>
		Method m = clazz.getMethod("sleep");//获取公共的方法<br>
		Method m = clazz.getDeclaredMethod("sleep");//获取任意的方法<br><br>
		
		注意:若是私有的方法 必须让该方法可以访问m.setAccessible(true);<br><br>
		
	6.Method对象的invoke是有返回值,他的返回值就是目标方法执行的返回值.<br><br>
	
	总结:有了class对象之后,无所不能.
	
	<p><b>------分层:JavaEE三层架构------</b></p>
	
	1.web
		作用:展示数据 ----jsp<br><br>
			
			
			-----servlet-------<br>
			接受请求<br>
			找到对应的service,调用方法 完成逻辑操作<br>
			信息生成或者页面跳转<br><br>
			
	2.service 业务层:
		作用:1.完成业务操作;2.调用dao;<br><br>
		
	3.dao(data access object 数据访问对象)<br>
		作用:对数据库的curd操作.
		
	<p><b>------事务------</b></p>
	就是一件完整的事情,包含多个操作单元,这些操作要么全部成功,要么全部失败.<br><br>
	
	mysql中的事务:mysql中事务默认是自动提交,一条sql语句就是一个事务.<br><br>
	
		开启手动事务方式:<br>
			方式1:关闭自动事务.(了解)<br>
				set autocommit = off;<br>
			方式2:手动开启一个事务.(理解)<br>
				start transaction;-- 开启一个事务<br>
				commit;-- 事务提交<br>
				rollback;-- 事务回滚<br><br>
				
		扩展:oracle中事务默认是手动的,必须手动提交才可以.<br><br>

	java中的事务:<br>
		Connection接口的api:★<br>
			connection.setAutoCommit(false);//手动开启事务<br>
			connection.commit():事务提交<br>
			connection.rollback():事务回滚<br><br>
		
		扩展:了解 Savepoint还原点:<br>
			void rollback(Savepoint savepoint) :还原到那个还原点<br>
			Savepoint setSavepoint() :设置还原点<br>
			
	<p><b>------事务总结------</b></p>
	事务的特性:★★★<br>
		ACIDL:<br>
		原子性:事务里面的操作单元不可切割,要么全部成功,要么全部失败<br>
		一致性:事务执行前后,业务状态和其他业务状态保持一致.<br>
		隔离性:一个事务执行的时候最好不要受到其他事务的影响<br>
		持久性:一旦事务提交或者回滚.这个状态都要持久化到数据库中.<br><br>
		
	不考虑隔离性会出现的读问题★★<br>
		脏读:在一个事务中读取到另一个事务没有提交的数据.<br>
		不可重复读:在一个事务中,两次查询的结果不一致(针对的update操作).<br>
		虚读(幻读):在一个事务中,两次查询的结果不一致(针对的insert操作).<br><br>
		
	通过设置数据库的隔离级别来避免上面的问题(理解):<br>
		read uncommitted------读未提交------上面的三个问题都会出现<br>
		read committed------读已提交------可以避免脏读的发生<br>
		repeatable read------可重复读	可以避免脏读和不可重复读的发生<br>
		serializable------串行化------可以避免所有的问题<br><br>
	
		将数据库的隔离级别设置成 读未提交:<br>
				set session transaction isolation level read uncommitted;<br>
			查看数据库的隔离级别:<br>
				select @@tx_isolation;<br><br>
				
		避免脏读的发生,将隔离级别设置成  读已提交:<br>
			set session transaction isolation level read committed;<br>
			不可避免不可重复读的发生.<br><br>
		
		避免不可重复读的发生 经隔离级别设置成 可重复读:<br>
			set session transaction isolation level  repeatable read;<br><br>
			
		演示串行化 可以避免所有的问题:<br>
			set session transaction isolation level  serializable;<br>
			锁表的操作.<br><br>
		
	四种隔离级别的效率(从大到小):<br>
		read uncommitted>read committed>repeatable read>serializable<br>
	四种隔离级别的安全性:<br>
		和上面的相反.<br><br>
		
	开发中绝对不允许脏读发生.<br>
		mysql中默认级别:repeatable read<br>
		oracle中默认级别:read committed<br><br>

	java中控制隔离级别:(几乎用不到):<br><br>
		Connection的api:<br>
			void setTransactionIsolation(int level);<br>
			
	<p><b>------JavaWeb基础------</b></p>
	1.servlet<br><br>
	创建一个servlet.<br>
	更改web.xml.<br>
	servletContext,全局管理者,上下文:<br>
			资源共享(域对象).<br>
			获取资源文件.<br>
				getRealPath();<br>
				getResourceAsStream();<br>
			获取mimetype;<br>
				getMimeType();<br>
	面试题:<br>
		serlvet的生命周期;<br><br>
		
r_r:<br>
	response:往浏览器写东西:<br>
		重定向:response.sendRedirect(绝对路径);<br>
		定时刷新:refresh:<br>
			setHeader("refresh","秒数;url=跳转路径");<br>
			meta:<br>
		getWriter():字符流<br>
		getOutputStream():字节流<br>
		文件下载:<br>
			setContentType(mime类型);<br>
			setHeader("content-disposition","attachment;filename="+文件名);<br><br>
			
	request:获取浏览器发送过来的数据<br>
		获取参数:3个<br>
		中文乱码:<br>
			通用的方式:<br>
				new String(名字.getBytes("iso-8859-1"),"utf-8");<br>
			针对post请求:<br>
				request.setCharacterEncoding("utf-8");<br>
		请求转发(域对象):<br>
			request.getRequestDispatcher(内部路径).forward(..);<br><br>
			
cookie和session:<br>
	cookie:浏览器端会话技术:<br>
		常用方法:<br>
			new Cookie(String key,String value);<br>
			写回浏览器:response.addCookie(Cookie c);<br>
			获取cookie:request.getCookies();<br>
			cookie的api:<br>
				getName();<br>
				getValue();<br><br>
				
				setMaxAge(int 秒);<br>
				setPath(String path);<br><br>
				
	session:服务器端的会话技术:<br>
		常用方法:
			获取session:request.getSession();<br>
		域对象:私有的数据<br>
			创建:<br>
			销毁:<br>
				1.服务器非正常关闭.<br>
				2.session超时.<br>
				3.手动删除:session.invalidate();<br><br>
		
jsp_el_jstl:<br>
	jsp的指令 include taglib;<br>
	jsp的内置对象(面试题).<br>
	jsp:forward<br>
	jsp:include<br><br>
	
	el:全部:<br>
		获取数据;<br>
		执行运算;<br><br>
		
	jstl:<br>
		if<br>
		foreach
	
  </body>
</html>
