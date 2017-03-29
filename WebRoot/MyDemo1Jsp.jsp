<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyDemo1Jsp.jsp' starting page</title>

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
	This is my JSP page.
	<br>
	<p><b>------JSP九大隐式对象------</b></p>
	<p>1.request.2.respons3.config.4.application.5.exception</p>
	<p>6.session.7.page.8.out.9.pageContext</p>

	<%
		//pageContext对象作为域对象使用--设置键值
		pageContext.setAttribute("name", "Lotte斌");
		//存储到session中
		//pageContext.setAttribute("name", "Lotte斌",pageContext.SESSION_SCOPE);
		//移除对应属性的值
		//pageContext.removeAttribute("name");
	%>

	<%
		//pageContext对象作为域对象使用--取出值
		String name = (String) pageContext.getAttribute("name");
		if (null != name) {
			out.write("pageContext中存储的值是:" + name);
		}
	%>

	<%
		//使用pageContext依次从页面/请求/会话/应用范围查找指定的key值,知道找到为止,找不到的话,结果是null.
		String name1 = (String) pageContext.findAttribute("name");
	%>

	<p>使用pageContext可以获得其他八个域对象:通过getRequest(),getRespons()....等方法</p>
	<p>使用pageContext可以实现请求转和包含</p>

	<%
		//pageContext.forward("/demo.jsp");
		//pageContext.include("/demo.jsp");
	%>
	
	<p><b>------EL表达式支持对象数据导航------</b></p>
	<p><b>------EL表达式支持各种运算符------</b></p>
	<p><b>------EL中的11个隐式对象------</b></p>
	<ol>
		<li>pageContext,和JSP内置的pageContext完全一样.</li>
		<li>requestScope</li>
		<li>pageScope</li>
		<li>sessionScope</li>
		<li>applicationScope</li>
		<li>param</li>
		<li>paramValues</li>
		<li>header</li>
		<li>headerValues</li>
		<li>initParam</li>
		<li>cookie</li>
	</ol>
	<p><b>------EL表达式支持自定义函数------</b></p>
	调用sun公司定义的函数:${fn:contains("aaabbb","aaa") }
</body>
</html>
