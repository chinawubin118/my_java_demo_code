<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'index.jsp' starting page</title>
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
	<a href="CookieAndSessionJsp.jsp">CookieAndSessionJsp</a><br>
	<a href="JdbcJsp.jsp">Jdbc</a><br>
	<a href="JQueryJsp.jsp">JQueryJsp</a><br>
	<a href="JspElJstl.jsp">JspElJstl</a><br>
	<a href="MyDemo1Jsp.jsp">MyDemo1</a><br>
	<a href="MySqlJsp.jsp">MySql</a><br>
	<a href="TransactionReflexSummary.jsp">TransactionReflexSummary</a><br>
	
	<hr>
	
	测试Jsp动作标签:<a href="/demo1/www/action/forward.jsp">forward:转发</a>&nbsp;
	<a href="/demo1/www/action/include.jsp">include:动态包含</a><br>
	<a href="${pageContext.request.contextPath}/www/jstl/for1.jsp">测试jstl:for each基本</a><br>
	<a href="${pageContext.request.contextPath}/www/jstl/for2.jsp">测试jstl:for each高级</a><br>
	<a href="${pageContext.request.contextPath}/servlet/ShowAllProductServlet">小案例:查询数据库中的所有商品并展示出来"</a><br>
</body>
</html>
