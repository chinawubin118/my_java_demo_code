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
	<p><b>------jQuery:------</b></p>
	<p>jquery和html的整合
		<ol>
			<li>
				jquery是单独的js文件:通过script标签的src属性导入即可获取一个jquery对象:$("选择器")  或者 jQuery("选择器")
			</li>
			<li>
				dom对象和jquery对象之间的转换
					dom对象===>jquery对象	
					$(dom对象)
					jquery对象===>dom对象
				方式1:
					jquery对象[index]
				方式2:
					jquery对象.get(index)
			</li>
		</ol>
	</p>
	<p>
		页面加载:
		js:
			window.onload=function(){}//在一个页面中只能使用一次
		jquery 在一个页面中可以使用多次
			方式1:
				$(function(){...})
			方式2:
				$(document).ready(function(){});
	</p>
	<p>
		派发事件:
		$("选择器").click(function(){...});
		等价于 原生js中
		dom对象.onclick=function(){....}
		掌握事件:
		focus
		blur
		submit
		change
		click
	</p>
	<p>
		jquery中效果:
			隐藏或展示
				show(毫秒数) hide(毫秒数)<br>
			滑入或滑出
				slideDown(毫秒数):向下滑入
				slideUp(毫秒数):向上滑出<br>
			淡入或淡出
				fadeIn(int):淡入
				fadeOut(int):淡出
	</p>
	<p>
	选择器总结:<br>
	基本选择器★
		$("#id值")  $(".class值")  $("标签名")  
		
		了解:$("*")
		理解:获取多个选择器 用逗号隔开
			$("#id值,.class值")<br>
	层次选择器 ★
		a b:a的所有b后代
		a>b:a的所有b孩子
		a+b:a的下一个兄弟(大弟弟)
		a~b:a的所有弟弟<br>
	基本过滤选择器:★
		:frist 第一个
		:last 最后一个
		:odd  索引奇数
		:even 索引偶数
		:eq(index) 指定索引
		:gt(index) >
		:lt(index) <<br>
	内容过滤:
		:has("选择器"):包含指定选择器的元素<br>
	可见过滤:
		:hidden   在页面不展示元素 一般指 input type="hidden" 和 样式中display:none
		:visible <br>
	属性过滤器:★
		[属性名]
		[属性名="值"]<br>
	表单过滤:
		:input  所有的表单子标签  input select textarea button
	</p>
</body>
</html>
