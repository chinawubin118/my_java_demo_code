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
	
	<p><b>------jQuery对属性和css操作------</b></p>
	<p>对属性的操作:<br>
		attr():设置或者获取元素的属性<br>
			方式1:获取
				attr("属性名称")
			方式2:设置一个属性
				attr("属性名称","值");
			方式3:设置多个属性  json
				attr({
					"属性1":"值1",
					"属性2":"值2"
				})<br>
		removeAttr("属性名称"):移除指定属性<br>
	//添加class属性的时候 
	//	attr("class","值");<br>
	addClass("指定的样式值"); 相当于 attr("class","指定的样式值");
	removeClass("指定的样式值");
	</p>
	
	<p><b>提示:若jquery版本>1.6 统一使用 prop操作元素的属性</b>></p>
	
	<p>
	对css操作:操作元素的style属性<br>
		css():获取或者设置css样式
			方式1:获取	<br>
				css("属性名")
			方式2:设置一个属性
				css("属性名","值")
			方式3:设置多个
				css({
					"属性1":"值1",
					"属性2":"值2"
				});<br>
	</p>
	<p>
		获取元素的尺寸:<br>
		width()
		height()
	</p>
	
	<p><b>------jQuery遍历数组------</b><br>
		arr.each(function(index,dom){
			$(this).val();//得到每一个对象的值.....index:当前的索引,dom:当前的dom对象
		});<br>
		
		$.each(arr,function(){
		
		});
	</p>
	
	<p>jQuery设置或者获取value属性<br>
		$obj.val().....获取value<br>
		$obj.val("需要设置的值").....设置value的值
	</p>
	
		<p>jQuery设置或者获取标签体的内容<br>
		$obj.html().....获取标签体的内容(html源代码)<br>
		$obj.html("需要设置的内容").....设置标签体的内容(可以写html源代码)<br>
		
		$obj.text().....获取标签体的内容(纯文本)<br>
		$obj.text("需要设置的内容").....设置标签体的内容(纯文本)<br>
	</p>
	
	<p><b>------jQuery文档操作------</b><br>
		内部插入<br>
		a.append(c).....将c插入到a的标签体后面<br>
		a.prepend(c).....将c插入到a的标签体前面<br><br>
		外部插入<br>
		a.after(c).....将c放到a的后面<br>
		a.before(c).....将c放到a的前面<br><br>
		删除<br>
		empty().....清空袁元素<br>
		remove().....删除元素<br><br>
	</p>
	
	<p><b>------补充:表单对象属性选择过滤器------</b><br>
		:enabled......可用的<br>
		:disabled.....不可用的<br>
		:checked.....选中的(针对radio和checkbox)<br>
		:selected.....选中的(针对下拉列表)<br>
	</p>
</body>
</html>
