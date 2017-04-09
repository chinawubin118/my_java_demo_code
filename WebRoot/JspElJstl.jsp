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
	
	<p><b>------jsp的9大内置对象:★★★------</b></p>
		out......JspWriter<br>
		request......HttpServletRequest<br>
		responst......HttpServletResponse<br>
		session......HttpSession<br>
		exception......Throwable9<br>
		page......Servlet(this)<br>
		config......ServletConfig<br>
		application......<br>ServletContext<br>
		pageContext......PageContext<br><br>
		
	jsp的域对象:理解<br>
		application......整个项目<br>
		session......一次会话<br>
		request......一次请求<br>
		pageContext......一个页面<br><br>
		
		pagecontext作用:理解<br>
		1.域对象:xxxAttribute();get/set/removeAttribute();<br>
		2.操作其他域对象:
				xxxAttribute(...,int scope);//后面加一个scope参数<br>
					scope取值:APPLICATION_SCOPE/SESSION_SCOPE/REQUEST_SCOPE/PAGE_SCOPE <br>
		3.获取其他的内置对象:<br>
			getXxx();<br>
			例如:getRequest():获取request内置对象<br>
		4.便捷查找:findAttribute(String key):<br>
			依次从pagecontext,request,session,application四个域中,查找相应的属性,若找到了返回值,且结束该次查找若查找不到,返回null;<br><br>
	
	  jsp的动作标签:<br>
		forward:请求转发 ;相当于java中  request.getRequestDispatcher(..).forward(..);<br>
		include:动态包含;就是将被包含页面或者servlet的运行结果包含到当前页面中.<br>
	
	<p><b>------el------</b></p>	
	jsp的内置表达式语言,从jsp2.0开始.<br>
	用来替代输出表达式:<%=111%><br>
	作用:<br>
		1.获取域中数据 ★<br>
		2.执行运算 ★<br>
		3.获取常见的web对象.<br>
		4.调用java的方法.<br>
	格式:<br>
		\$\{\e\l\表\达\式\}<br>
		
	<p><b>------使用el获取域中数据:★------</b></p>
	
	注意:★若属性名中出现了"."|"+"|"-"等特殊符号,需要使用scope获取.例如:\$\{requestScope["arr.age"]}(没有"\")<br><br>
	获取简单数据:<br>
		$\{pageScope|requestScope|sessionScope|applicationScope.属性名}(没有"\")<br>
		以后经常使用:<br>
			$\{属性名}(没有"\"):依次从pageContext,request,session,application查找指定属性,若查找到返回值,结束该次查找,若查找不到,返回"";<br><br>
	获取复杂数据:<br>
		获取数组中的数据:$\{域中的名称[index]}(没有"\")<br>
		获取list中的数据:$\{域中的名称[index]}(没有"\")<br>
		获取map中的数据:$\{域中的名称.键名}(没有"\")<br><br>
		
	<p><b>------javabean导航------</b></p>
		javabean:java语言编写的一个可重用的组件,狭义上来说就是我们编写的一个普通的java类 例如:User Person等;<br>
			javabean规范:<br>
				1.必须是一个公共的具体的类  public class.<br>
				2.提供私有的字段  private String id;//id称之为字段<br>
				3.提供公共访问字段的方法 get|set|is方法<br>
					public String getId(){..}<br>
					一旦有公共的方法之后,get|set|is之后的内容,将首字母小写,将这个东西称之为bean属性,id就是一个bean属性.<br>
				4.提供一个无参的构造器.<br>
				5.一般实现序列化接口  serializable.<br><br>
		
		使用el导航格式:$\{域中javabean名称.bean属性}(没有"\")<br><br>
	
	<p><b>------el执行运算------</b></p>	
	四则运算...关系(>..)...逻辑(&& ||);<br>
	注意:<br>
		+:只能进行加法运算,字符串形式数字可以进行加法运算.<br>
		empty:判断一个容器的长度是否为0(array set list map),还可以判断一个对象是否为空.<br>
			${empty 域中的对象名称}.<br>
		三元运算符...: ?<br>
		
	<p><b>------el的11个内置对象(了解)------</b></p>
		pageScope,requestScope,sessionScope,applicationScope,param,paramValues,header,haederValues,initParam,cookie★,pageContext★;<br><br>
		
		注意:除了pagecontext其余对象获取的全是map集合.<br><br>
	
		了解:和参数相关的el内置对象:param,paramValues.<br><br>
		
		了解:和请求头相关的el内置对象.header,haederValues.<br><br>
	
		了解:和全局初始化参数相关的el内置对象.initParam.<br><br>
		
	cookie内置对象:<br>
		$\{cookie} 获取map\{key=Cookie}<br>
			例如:创建cookie:<br>
				Cookie c=new Cookie("username","tom");<br>
			通过${cookie}获取相当于	:<br>
				\{username=new Cookie("username","tom")}<br>
			相当于map的key是cookie的键,map的value是当前cookie.<br>
			
		若项获取名称username的cookie的value值(获取tom):<br>
			$\{cookie.username.value}--javabean导航<br>
		注意:<br>
			java中Cookie的api:<br>
				getName():获取cookie的名称<br>
				getValue():获取cookie的value值<br>
			我们称name和value是cookie的bean属性<br><br>
	
		使用cookie内置对象:$\{cookie.给cookie起名字.value}<br><br>
			
		例如:获取jsession的值:<br>
			$\{cookie.JSESSIONID.value}<br><br>
			
		pageContext:获取不是map集合,相当于jsp的pageContext内置对象.<br>
			在jsp页面中获取项目名:$\{pageContext.request.contextPath}<br>
			
		<p><b>------注释------</b></p>
			html注释 :<!--  -->:注释的内容只在页面上看不到 ,java代码和html源代码都有<br>
			java注释:只在java代码中存在.<br>
			jsp注释: <%--  --%>:只在jsp页面中存在,翻译成java文件之后就没有了.<br>
		
	<p><b>------jstl,jsp标准的标签库语言(apache)------</b></p>	
	用来替代java脚本.<br>
	使用步骤:<br>
		1.导入jar包 (jstl.jar和standard.jar).<br>
		2.在页面上导入标签库.<br>
			例如:<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><br><br>
			
	jstl的分类:<br>
		core:核心类库 ★<br>
		fmt:格式化|国际化<br>
		xml:过时了<br>
		sql:过时了<br>
		函数库:很少使用<br><br>
		
	core:掌握<br>
		★c:if<br>
		★c:forEach<br><br>
		
		c:set 往域中设置值<br>
		c:choose c:when c:otherwise 分支<br>
		
	★c:if 判断<br>
		例如(下面是一段jstl测试代码,输出结果为:3不大于4):<br>
			<c:if test="${3>4 }">
				3大于4
			</c:if>
			<c:if test="${3<=4 }">
				3不大于4
			</c:if>
			
		★c:forEach 循环
		格式1:
			c:forEach begin="从那里开始" end="到那里结束" step="步长" var="给变量起个名字" varStatus="循环状态变量"<br><br>
			 
			varStatus:用来记录循环的状态.<br>
				常用的属性:<br>
					count:记录次数<br>
					current:当前遍历的内容<br>
		
		格式2:<br>
			c:forEach items="${el获取域中的容器}" var="n"
			
  </body>
</html>
