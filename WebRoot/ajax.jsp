<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'ajax.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <p><b>------原生ajax------</b></p>
	异步JavaScript和XML,AJAX 是一种用于创建快速动态网页的技术。<br>
	通过在后台与服务器进行少量数据交换，AJAX 可以使网页实现异步更新。这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。<br>
	传统的网页（不使用 AJAX）如果需要更新内容，必须重载整个网页页面。<br><br>
	
	ajax使用:<br>
		1.创建一个核心对象 XMLHttpRequest.<br>
		2.编写一个回调函数.<br>
		3.编写请求方式和请求的路径(open操作).<br>
		4.发送请求(send操作).<br><br>
		
	ajax-api详解:<br>
		onreadystatechange:检测readyState状态改变的时候.<br>
		readyState:ajax核心对象的状态.<br>
			0:核心对象创建.<br>
			1:调用了open方法.<br>
			2:调用了send方法.<br>
			3:部分响应已经生成(没有意义).<br>
			4:响应已经完成(主要使用这个状态).<br>
		status:状态码:<br>
			if(xmlhttp.readyState==4 && xmlhttp.status==200);<br>
		responseText:响应回来的文本.<br>
	常用方法:<br>
		open("请求方式","请求路径"[,"是否异步"]):设置请求的方式和请求的路径.<br>
		send(["参数"]):发送请求 参数是请求方式为post的时候的参数.<br>
		setRequestHeader("content-type","form表单enctype属性"):设置post请求的参数的类型 必须放在send方法之前.<br>
		
	<p><b>------jquery中的ajax------</b></p>

		1.jquery对象.load(url,params,function(数据){});<br><br>
		
		2.★: $.get(url,params,function(数据){},type);<br>
			发送get请求的ajax:<br>
				1.url:请求的路径.<br>
				2.params:请求的参数 参数为key\value的形式 key=value  {"":"","":""}.<br>
				3.fn:回调函数 参数就是服务器发送回来的数据.<br>
				4.type:返回内容格式，xml, html, script, json, text, _default。    以后用"json".<br><br>
	 
		3.★: $.post(url,params,function(数据){},type);<br>
			发送post请求的ajax.<br>
			
			若结果为json格式,  打印返回值的时候是一个对象 .<br>
				例如若:json为 {"result":"success","msg":"成功"},<br>
				获取msg 只需要	参数.ms;g<br>
		4.$.ajax([选项]);<br>
				选项的可选值:<br>
					url:请求路径<br>
					type:请求方法<br>
					data:发送到服务器的数据<br>
					success:fn 成功以后的回调<br>
					error:fn 异常之后的回调<br>
					dataType:返回内容格式 经常使用json<br>
					async:设置是否是异步请求<br>
				例如:<br>
					$.ajax({<br>
						url:"/day15/demo1",<br>
						type:"post",<br>
						data:"username=tom",<br>
						success:function(d){<br>
							alert(d.msg);<br>
						},<br>
						error:function(){},<br>
						dataType:"json"<br>
					});<br>
		
	<p><b>------Json------</b></p>
	JSON(JavaScript Object Notation) 是一种轻量级的数据交换格式。它基于ECMAScript的一个子集。<br>
	
		格式1:value可以为任意值:<br>
			{"key":value,"key1":value1}<br>
		格式2:e可以为任意值:<br>
			[e1,e2]<br><br>
			
	jsonlib工具类,可以使对象转换成json数据:<br>
		1.导入jar包<br>
		2.使用api<br>
			JSONArray.fromObject(对象).....数组和list  
			JSONObject.fromObject(对象).....bean和map	
			
	<p><b>------JQurey------</b></p>
	
	获取jquery对象:$("选择器")或者jQuery("选择器");<br><br>
	
	jquery对象转dom对象:<br>
		方式1:jquery对象.get(index);<br>
		方式2:jquery对象[index];<br><br>
		
	dom对象转jquery对象:$(dom对象)<br><br>
	
	页面载入:$(function(){});<br><br>
	
	派发事件:jquery对象.事件(function(){...});<br><br>
	
	选择器:<br>
		#id值  .class值  标签名  [属性]  [属性='值']<br>
		a b:后代    a>b:孩子  a+b:大弟弟  a~b:所有弟弟;<br>
		:first :last :odd :even :eq|gt|lt(index);<br>
		:hidden;<br>
		:checked  :selected;<br><br>
		
	属性和css:<br>
		prop|attr<br>
		css<br>
		
	文本 标签体:<br>
		val();<br>
		html() text()<br><br>
	
	文档处理:<br>
		内部插入:append prepend<br>
		外部插入:"after before<br>
		删除:remove<br><br>
		
	效果:<br>
		隐藏|显示:show() hide()<br>
		淡入淡出:fadeIn() fadeOut()<br>
		滑入滑出:slideDown() slideUp()<br>
	
	遍历:jquery对象.each(function(){});
  </body>
</html>
