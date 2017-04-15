<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bootstrap.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    网站分享:<a href="http://www.runoob.com/">点击访问RUNOOB</a>
    	
    <p><b>------HTML------</b></p>
    	
    	html:展示<br>
	文件 标签:
<!-- 		</html>
			<head>
				<title></title>
				<meta>
				<link>
				<style></style>
			</head>
			<body></body>
		</html> -->
	排版标签:<br>
		p 段落<br>
		hr 分割线<br>
		br 换行<br><br>
	
	字体标签:<br>
		<font>font</font><br>
		h1~h6 标题标签<br>
		
		b strong<br>
		i<br><br>
		
	图片标签:<br>
		img src="图片的路径" alt="替代文字" width="" height=""<br>
	超链接标签
		a href="跳转的路径" target="在那里打开">xx<br>
	列表标签<br>
		ul:<ul></ul><br>
		ol:<ol></ol><br>
		子标签<br>
			li:<li></li><br><br>
			
	表格★<br>
		<table border="1">
			<tr>
				<td></td>
			</tr>
		</table>
		
		td的重要属性:colspan:列合并...rowspan:行合并<br><br>
	
	表单标签:★<br>
		表单作用:收集用户信息<br>
		form:<br>
			常见的属性:1.action:设置提交路径...2.method:提交方式:get和post<br>
			常见的子标签:1.input 2.select 3.textarea<br><br>
		
		input标签:<br>
			属性:<br>
				type取值:(10个)<br>
					text:文本框<br>
					password:密码<br>
					radio:单选框<br>
					checkbox:多选框<br>
					file:文件框<br><br>
					
					submit:提交<br>
					reset:重置<br>
					button:普通按钮<br><br>
					
					hidden:隐藏域<br>
					image:图片提交 <br>
				name属性:<br>
					1.提交到服务器<br>
					2.将单选框或者复选框设置为一组<br><br>
		
		select:下拉选<br>
			格式:<br>
				<select name="">
					<option>-请选择-</option>
					<option value="">展示的信息</option>
				</select><br>
		
		textarea:文本域<br>
			格式:
				<textarea rows="" cols="">默认值</textarea><br>	
		默认值:<br>
			text password:设置value属性<br>
			radio checkbox:设置 checked="checked"属性<br>
			select:在option上设置 selected="selected"属性<br>
		value可以设置按钮的展示文字<br><br>
	
	框架:<br>
		frameset:框架集<br>
			常用属性:<br>
				cols:<br>
				rows:<br>
			常用子标签:<br>
				frame<br>
		frame:<br>
			常用属性:<br>
				src:展示的页面<br>
				name:给当前的frame起个名字 方便a标签使用<br><br>
	
	块标签:div+css布局:div,span
	
	<p><b>-----CSS-----</b></p>
	层叠样式表:渲染<br>
	格式:选择器:{属性:值;属性1:值1}<br><br>
	
	html和css的整合<br>
		方式1:内敛样式表 通过标签的style属性;<br>
		方式2:内部样式表 通过head的style子标签;<br>
		方式3:外部样式表 通过link标签导入;<br><br>
	
	选择器:<br>
		id选择器 #id值<br>
		class选择器 .class值<br>
		元素选择器 标签名<br><br>
		
		属性选择器	标签名[属性="值"]<br>
		后代选择器  <br>
			选择器 后代选择器<br>
		锚伪类<br><br>

	字体 文本 背景 列表(list-style-type:none) 浮动:float <br>
	清除浮动(分类) clear<br>
	显示(分类)	display: none  block inline<br>
	框模型:内边距 边框 外边距
	
	<p><b>------js------</b></p>
	脚本:直接解释就可以.<br>
	js和html整合:<br>
		方式1:在html页面中写在script标签里面;<br>
		方式2:使用外部的js文件:指定script标签的src属性的值,引入外部的js文件;<br><br>
		
	js组成部分:<br>
		ECMAScript:语法<br>
		BOM:浏览器对象模型<br>
		DOM:文档对象模型<br><br>
	
	基础语法:var 变量名=值;<br>
	数据类型:<br>
	1.原始类型<br>
		Undefined Null String Number Boolean<br>
		通过typeof判断属于那种类型<br>
	2.引用类型<br>
		Number Boolean<br>
		★String<br>
			属性:length<br>
			方法:substring<br>
		★Array<br>
			属性:length<br>
			方法:join(分隔符):打印数组<br>
		Math<br>
		Date<br>
		RegExp<br>
			直接量语法:/正则表达式/<br>
			方法:test();<br>
		全局<br>
			decodeURI()<br>
			encodeURI:<br><br>
			
			eval();<br>
 
	函数:<br>
	function 函数名(参数列表){<br>
		函数体<br>
	}<br>
	
	匿名函数:<br>
		function(){....}<br>

	常见事件:<br>
		焦点:<br>
			onfocus<br>
			onblur<br>
		表单:<br>
			onsubmit<br>
			onchange<br>
		页面元素加载:onload<br>
		单击:onclick<br><br>
		
	绑定事件:<br>
	方式1:通过标签的事件属性<br>
		<xxx onxxx="函数(参数)"/> 参数若是:this 将当前的dom对象传递给函数
	方式2:派发事件<br>
		dom对象.onxxx=function(){...}<br><br>
 
	bom<br>
	window:窗口<br>
		常用属性:<br>
			window.location<br>
		常用方法:<br>
			消息框:ale.rt() conf.irm() prom.pt()<br>
			定时器<br>
				setInterval();<br>
				setTimeout();<br>
			打开关闭 open close<br><br>
			
	location:定位<br>
		location.href;获取当前的url<br>
		location.href="..";设置url 相当于a标签<br><br>
		
	history:历史<br>
		go();<br><br>
 
	dom<br>
	节点(Node)<br>
		元素节点<br>
		属性节点<br>
		文本节点<br><br>
		
		文档节点<br><br>
		
	获取其他节点<br>
		document.getElementById("id值"):一个元素<br>
		document.getElementsByTagName("标签名"):多个<br>
		document.getElementsByClassName("class值")<br>
		document.getElementsByName("name值")<br>
	操作属性<br>
		dom对象.属性:<br>
			例如  <br>
				dom对象.value;<br>
				dom对象.value="";<br>
				dom对象.style.css属性="值";<br>
	操作标签体:<br>
		dom对象.innerHTML;获取<br>
		dom对象.innerHTML="";设置<br>
		
	<p><b>------jquery------</b></p>
	js类库:对原生js常见的方法和对象进行封装,方便使用;<br>
	html和jquery整合:通过script标签src属性<br>
	获取jquery对象:$("选择器") jQuery("选择器")<br>
	dom对象和jquery对象转换:<br>
	dom>>>jquery.....$(dom对象)<br>
	jquery>>>dom:
		方式1:jquery对象[index]<br>
		方式2:jquery对象.get(index)<br><br>
		
	页面载入:
	$(document).ready(function(){....})<br>
	$(function(){ ...})<br><br>
	
	事件和js中的事件一样:把on去掉即可<br>
	$("选择器").xxx(function(){...})<br><br>
	
	选择器:<br>
	$("#id") $(".class") $("元素") $("[属性]") $("[属性='值']")<br>
	a b: 后代  a>b:孩子   a+b:大弟弟  a~b:所有弟弟<br>
	:first :last :odd :even  :eq(index)..<br>
	:has('选择器')<br>
	:hidden  :visible<br>
	:input<br>
	:checked :selected<br><br>
	
	属性和css操作:<br>
	attr|prop<br>
		prop("属性"):获取<br>
		prop("属性","值"):设置一个<br>
		prop({<br>
			"":"",<br>
			"":""<br>
		}):设置多个<br><br>
		
	removeAttr|removeProp(属性)<br><br>
	
	addClass("class名称")<br>
	removeClass("class名称")<br><br>
	
	css: 针对style属性<br>
		css("属性"):<br>
		css("属性","值"):<br>
		css({<br>
			"":"",<br>
			"":""<br>
		}):设置多个<br><br>
	
	height() width()<br><br>
		
	对value属性 标签体的操作:<br>
	xxx():获取<br>
	xxx("需要设置的内容"):设置<br><br>
		
		val():<br>
		html():<br>
		text():<br><br>

	对文档操作:<br>
	内部插入<br>
		append<br>
		prepend<br><br>
	 	
	外部插入<br>
		after<br>
		before<br><br>
		
	删除<br>
		empty()清空<br>
		remove()删除<br><br>
 
	效果:<br>
	hide() show() toggle()<br>
	滑入滑出<br>
	slideDown() slideUp()<br>
	淡入淡出<br>
	fadeIn() fadeOut()<br>
 
	遍历<br>
	方式1:jquery对象.each(function(){});<br>
	方式2:$.each(jquery对象,function(){});<br>
	
	<p><b>------js插件--validate:表单校验控件------</b></p>

	validate使用步骤:<br>
	validate是别人封装好的第三方工具:<br>S
	1.导入jquery.js<br>
	2.导入validate.js<br>
	3.在页面加载成功之后 对表单进行校验  $("选择器").validate()<br>
	4.在validate中编写校验规则:<br>
		$("选择器").validate({<br>
			rules:{},<br>
			messages:{}<br>
		});<br><br>
 	
	rules格式:<br>
		格式1:字段的name属性:"校验器"<br>
		格式2:字段的name属性:{校验器:值,校验器:值}<br>
	例如:<br>
		username:"required",<br>
		password:{<br>
			required:true,<br>
			digits:true<br>
		},<br>
		repassword:{<br>
			equalTo:"[name='password']"<br>
		},<br>
		zuixiaozhi:{<br>
			min:5<br>
		},<br>
		shuzhiqujian:{<br>
			range:[5,10]<br>
		}<br><br>
 
	messages的格式:<br>
		格式1:字段的name属性:"提示信息"<br>
		格式2:字段的name属性:{校验器:"提示信息",校验器:提示信息"}<br>
	例如:<br>
		username:"用户名不能为空",<br>
		password:{<br>
			required:"密码不能为空",<br>
			digits:"密码只能是数字"<br>
		},<br>
		repassword:{<br>
			equalTo:"两次输入的内容不一致"<br>
		},<br>
		zuixiaozhi:{<br>
			min:"最小值应该大于{0}"<br>
		},<br>
		shuzhiqujian:{<br>
			range:"输入的范围在{0}~{1}之间"<br>
		}<br>
		
	<p><b>------bootstrap------</b></p>
	
	webcss框架,集合了html/css/jquery为一家,创建响应式的页面,适配不同的上网设备.<br>
	bootstarp的入门:<br>
	1.下载bootstarp,网站:http://www.bootcss.com/,下载:用于生产环境的 Bootstrap<br>
	2.导入bootstarp.css<br>
	3.导入jquery.js<br>
	4.导入bootstrap.js<br>
	5.添加一个meta标签 支持移动设备:meta name="viewport" content="width=device-width, initial-scale=1"<br>
	6.将所有的内容放入到布局容器中.<br>
		Bootstrap 需要为页面内容和栅格系统包裹一个 .container 容器。我们提供了两个作此用处的类<br>
		方式1:class="container"<br>
		方式1:class="container-fluid"<br>
	注意:bootstrap将每一行分成12份<br>
	媒体查询:假如大屏幕,每行显示6个<br><br>

	bootstrap组成部分:<br>
	全局css样式--定义了一套css样式;<br>
	组件--定义了很多可以直接使用的组件; <br>
	js插件--例如:轮播图 选项卡;<br><br>
 
 	栅格系统:<br>
	屏幕分辨率>1200px.....样式:col-lg-x:大屏幕<br>
	分辨率:992--1200px.....样式:col-md-x:中等屏幕<br>
	分辨率:768--992px.....样式:col-sm-x:小屏幕<br>
	分辨率<768px.....样式:col-xs-x:最小屏幕<br>

	隐藏:<br>
	hidden-xs 在最小屏幕时候隐藏<br><br>

	将一个超链接伪装成一个按钮<br>
	class="btn btn-primary"<br><br>

	浮动到右边<br>
	class="pull-right"
  </body>
</html>
