<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>展示数据库中的所有商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<table border="1" align="center">
  	
  	  	<tr>
  			<td>商品ID</td>
  			<td>商品名称</td>
  			<td>商品价格</td>
  			<td>入库时间</td>
  		</tr>
  	
  		<c:forEach items="${productList}" var="pro">
  	
    		<tr>
  				<td>${pro.pid }</td>
  				<td>${pro.pname }</td>
  				<td>${pro.price }</td>
  				<td>${pro.pdate }</td>
  			</tr>	
  	
  		</c:forEach>
  	
  	</table>
  
  </body>
</html>
