<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>listener and filter page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<p><b>------listener------</b></p>
  	
	  	listener(了解):<br>
		作用:监听web中中的域对象 ServletContext ServletRequest HttpSession<br>
		监听内容:<br>
			1.监听三个对象的创建和销毁.<br>
			2.监听三个对象属性的变化.<br>
			3.监听session中javabean的状态.<br><br>
			
	监听三个对象的创建和销毁:<br>
		ServletContextListener<br>
		ServletRequestListener<br>
		HttpSessionListener<br><br>
		
	监听三个对象属性的变化:<br>
		ServletContextAttributeListener<br>
		ServletRequestAttributeListener<br>
		HttpSessionAttributeListener<br><br>
		
	监听session中javabean的状态<br>
		HttpSessionActivationListener(钝化和活化)<br>
		HttpSessionBindingListener(绑定和解绑)<br><br>
	
	使用步骤:<br>
		1.编写一个类 实现接口.<br>
		2.重写方法.<br>
		3.编写配置文件(大部分都是).<br>
		
	<p><b>------Listener------</b></p>
	作用:过滤请求和响应.
			1.自动登录.<br>
			2.统一编码.<br>
			3.过滤关键字.<br>
			....<br><br>
			
	编写filter步骤:<br>
		1.编写一个类:实现filter接口,重写方法.<br>
		2.编写配置文件:注册filter,绑定路径.<br>
		3.测试.<br><br>
	
	Filter接口的方法:<br>
		init(FilterConfig config):初始化操作<br>
		doFilter(ServletRequest request, ServletResponse response, FilterChain chain):处理业务逻辑.<br>
		destroy() :销毁操作<br><br>
		
	filter的生命周期(了解):<br>
		filter单实例多线程.<br>
		filter在服务器启动的时候 服务器创建filter,调用init方法 实现初始化操作.<br>
		请求来的时候,创建一个线程 根据路径调用dofilter()执行业务逻辑.<br>
		当filter被移除的时候或者服务器正常关闭的时候 调用destory方法 执行销毁操作.<br><br>

	FilterChain:过滤链.<br>
		通过chain的dofilter方法,可以将请求放行到下一个过滤器,直到最后一个过滤器放行才可以访问到servlet|jsp<br>
		doFilter()放行方法.<br><br>
		
	★url-pattern配置:<br>
		完全匹配	必须以"/" 开始  例如: /a/b<br>
		目录匹配	必须以"/" 开始 以"*"结束  例如:/a/b/*<br>
		后缀名匹配	以"*."开始 以字符结束   例如 :  *.jsp  *.do  *.action<br><br>
 
	★一个资源有可能被多个过滤器匹配成功,多个过滤器的执行顺序是按照web.xml中filter-mapping的顺序执行的.<br>
	
	<p><b>------filter总结------</b></p>
	filterConfig:(了解):过滤器的配置对象
		作用:<br>
			1.获取全局管理者.<br>
			2.获取当前filter的名称.<br>
			3.获取当前filter的初始化参数.<br><br>
	
	filter-mapping的子标签(理解):<br>
	servlet-name:匹配那个servlet,值写的是serlvet标签中servlet-name的值.<br>
			建议:不要在一个filter中重复的匹配servlet.<br><br>
				
		dispatcher:<br>
			匹配哪种请求(REQUEST,FORWARD,ERROR,INCLUDE):<br>
			默认的是REQUEST,一旦显式的写出来哪种请求,默认就不起作用了:<br><br>
			
				理解:<br>
					REQUEST:从浏览器发送过来的请求(默认).<br>
					FORWARD:转发过来的请求.<br><br>
				
				了解:<br>
					ERROR:因服务器错误而发送过来的请求.<br>
					INCLUDE:包含过来的请求.<br>
  </body>
</html>
