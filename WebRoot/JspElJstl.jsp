<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'JspElJstl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  
  <p><b>------jsp/el/jstl------</b></p>
  
  <p><b>------jsp:java服务器页面------</b></p>
  
	作用:将内容的生成和信息的展示相分离,运行在服务器端,本质上就是一个serlvet,产生的java文件和class保留在tomcat的work目录下.<br>
	jsp脚本:<br>
	<% int i = 0; %> java代码片段.<br>
	<%=i %> 输出表达式 相当于out.print();<br>
	<%!int j;%> 声明成员.<br><br>
	
	jsp的指令:<br>
	作用:声明jsp页面的一些属性和动作.<br><br>

	jsp指令的分类:<br>
		page:主要声明jsp页面的一些属性.<br>
		include:静态包含.<br>
		taglib:导入标签库.<br>
	注意:<br>
		一个页面中可以出现多个指令,指令可以放在任意位置,一般都放在jsp页面最上面.<br><br>
		
	page指令:<br>
		重要属性:3个:<br>
			contentType:设置响应流的编码,及通知浏览器用什么编码打开.设置文件的mimetype.<br>
			pageEncoding:设置页面的编码.<br>
			import:导入所需要的包.<br>
			contentType和pageEncoding联系:<br>
				若两者都出现的时候,各自使用各自的编码;<br>
				若只出现一者,两个都使用出现的这个编码;<br>
				若两者都不出现,使用服务器默认的编码 tomcat7使用的iso-8859-1;<br>
		了解属性:<br>
			language:当前jsp页面里面可以嵌套的语言.<br>
			buffer:设置jsp页面的流的缓冲区的大小.<br>
			autoFlush:是否自动刷新.<br>
			extends:声明当前jsp的页面继承于那个类.必须继承的是httpservlet 及其子类.<br>
			session:设置jsp页面是否可以使用session内置对象.<br>
			isELIgnored:是否忽略el表达式.<br>
			errorPage:当前jsp页面出现异常的时候要跳转到的jsp页面.<br>
			isErrorPage:当前jsp页面是否是一个错误页面.<br>
				若值为true,可以使用jsp页面的一个内置对象 exception.<br><br>
				
	include指令:<br>
		静态包含,就是将其他页面或者servlet的内容包含进来,一起进行编译运行.生成一个java文件.<br>
		include指令测试代码:<%@include file="/www/include/include1.jsp" %><br><br>
			
		路径:<br>
			1.相对路径:<br>
				./或者什么都不写 当前路径;<br>
				上一级路径  ../<br>
			2.绝对路径:<br><br>
				带协议和主机的绝对路径<br>
				不带协议和主机的绝对路径<br>
					/项目名/资源<br><br>
					
			3.内部路径:<br>
				不带协议和主机的绝对路径去掉项目名<br>
					请求转发 静态包含 动态包含<br><br>
			
	taglib指令:导入标签库<br>
  
  </body>
</html>
