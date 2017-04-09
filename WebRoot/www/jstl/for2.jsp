<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'for2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <%
		//往域中放入一个list
		List l=new ArrayList();
		l.add(11);
		l.add(22);
		l.add(33);
		request.setAttribute("list", l);
		
		//往域中放入一个set
		Set s=new HashSet();
		s.add("11");
		s.add("22");
		s.add("33");
		request.setAttribute("set", s);
		
		//往域中放入一个map
		Map m=new HashMap();
		m.put("username","tom");
		m.put("age","18");
		request.setAttribute("map", m);
	%>
	
		<c:forEach items="${list }" var="n">
		${n }
	</c:forEach>
	<hr>
	 
	 <c:forEach items="${set }" var="n" varStatus="vs">
	 	${n }--${vs.count }<br>
	  </c:forEach>
	  <hr>
	  
	  <c:forEach items="${map }" var="en">
	  	${en.key }-- ${en.value }<br/>
	  </c:forEach>
  </body>
</html>
