<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注解和反射</title>
    
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
  	<p><b>------注解(jdk5之后提供了一个特性,和类/接口同级)------</b></p>
	格式:@interface 注解名{}<br>
	作用:<br>
		编译检查<br>
		替代配置文件<br>
		定义注解(元注解:注解上的注解)<br>
		分析代码(用到反射)<br><br>

	java中3个注解(理解):<br>
		@Override:声明该方法是从分类上继承过来的,执行编译期的检查.<br>
		@SuppressWarnings:抑制警告,值有好多,只需知道一个 all,抑制所有的警告.<br>
		@Deprecated:声明,该方法不赞成使用,该方法过时或者有bug等.<br><br>

	自定义注解(理解):<br>
		注解属性:<br>
			注解本质就是一个接口,接口中可以有常量和抽象方法,抽象方法在注解中就称之为注解属性.<br>
		注解属性类型:<br>
			1.基本类型;<br>
			2.String;<br>
			3.Class;<br>
			4.Annotation;<br>
			5.Enum:枚举;<br>
			6.以上类型对应的一维数组;<br><br>
			
		注意:
			一旦注解有属性了,使用注解的时候必须赋值,(除非这个注解属性有默认值);<br><br>
		
		赋值的格式:<br>
			@注解名(属性名=属性值)<br>
			若注解类型为数组,且只有一个值的时候,可以有两种写法:<br>
				方式1:<br>
					属性名 = { 值 }<br>
				方式2:<br>
					属性名=属性值<br>
			若属性名为value的时候,且只需要为这个value属性赋值的时候,value可以省略.<br><br>
	
		元注解:(理解):定义在注解上的注解;<br>
				@Retention :规定注解保留到什么阶段 :取值为RetentionPolicy的三个枚举值:<br>
					SOURCE:只在代码中保留,在字节码文件中就删除了.<br>
					CLASS:在代码和字节码文件中保留.<br>
					RUNTIME:所有阶段都保留.<br><br>
				
				@Target :规定注解作用在什么上面:值为ElementType的枚举值;<br>
					TYPE:作用在类/接口 等上面;<br>
					METHOD:作用方法上面;<br>
					FIELD:作用字段上面;<br>
	
	<p><b>------注解替代配置文件------</b></p>
	
	servlet3.0支持注解开发,没有web.xml文件;<br><br>
	
		例如:<br>
		创建servlet:在类上面添加 @WebServlet(urlPatterns={ "/demo1", "/demo2" },loadOnStartup=2)<br>
		创建listener:在类上添加 @WebListener<br>
		创建filter:在类上添加 @WebFilter(urlPatterns="/*")<br><br>
	
	//自定义注解<br>
	@Retention(RetentionPolicy.RUNTIME)<br>
	@Target(ElementType.METHOD)<br>
	public @interface JdbcInfo {<br>
		String driverClass() default "com.mysql.jdbc.Driver";<br>
		String url();<br>
		String user() default "root";<br>
		String password() default "root";<br>
	}<br><br>
	
	//使用注解配置jdbc的四个参数<br>
	@JdbcInfo(url = "jdbc:mysql://localhost:3306/lotte",password="dev123")<br>
	public static Connection getConnection() throws Exception{<br>
		//1.获取字节码文件<br>
		Class clazz=JdbcUtils.class;<br>
		
		//2.获取getConnenction<br>
		Method m = clazz.getMethod("getConnection");<br>
		
		//3.判断该方法上是否有 jdbcinfo注解 若有的话获取<br>
		if(m.isAnnotationPresent(JdbcInfo.class)){<br>
			JdbcInfo info = m.getAnnotation(JdbcInfo.class);<br>
			
			//4.获取注解四个属性<br>
			String driverClass = info.driverClass();<br>
			String url = info.url();<br>
			String user = info.user();<br>
			String password = info.password();<br>
			
			//5.注册驱动<br>
			Class.forName(driverClass);<br>
			
			//6.获取连接<br>
			return DriverManager.getConnection(url, user, password);<br>
		}<br>
	
		return null;<br>
	}
	
	<p><b>------servlet3.0内嵌文件上传功能------</b></p>
	浏览器端的要求:<br>
		1.表单的提交方法必须是post.<br>
		2.必须有一个文件上传组件  <input type="file" name=""/><br>
		3.必须设置表单的enctype=multipart/form-data<br>
	服务器端的要求:<br>
		servlet3.0中,需要在servlet中添加注解:@MultipartConfig<br>
			接收普通上传组件 (除了文件上传组件):request.getParameter(name属性的值)<br>
			接收文件上传组件 request.getPart(name属性的值);<br>
				getName():获取的name的属性值<br>
			获取文件名:<br>
				 part.getHeader("Content-Disposition"):获取到头信息,然后截取;<br><br>

	上传注意的问题:<br>
	1.注意名字重复会出现文件覆盖的问题, 需要使用随机名称;<br>
	在数据库中提供两个字段,一个字段用来存放文件的真实名称  1.jpg,另一个字段用来存放文件存放路径  g:/sdfasdf.jpg<br>
	随机名称参考:
			uuid;<br>
			时间戳;<br><br>
			
	2.文件安全
		重要的文件存放在 web-inf 或者 meta-inf 或者 服务器创建一个路径,不是很重要的文件可以放到项目下;<br><br>
		
	3.文件存放目录
		方式1:日期<br>
		方式2:用户<br>
		方式3:文件个数<br>
		方式4:随机目录<br>
		(创建多级文件目录:mkdirs())
		
	<p><b>------类加载器------</b></p>
	
	类加载:我们编写的.java文件,jvm会将变成.class文件.该文件要想运行,必须加载内存中,然后会生成一个对象.Class对象<br>
	类加载器层次结构:<br>
		引导类加载器.....rt.jar<br>
		扩展类加载器.....ext/*.jar<br>
		应用类加载器.....我们自己编写类<br><br>
		
	全盘负责委托机制:<br>
		当一个类运行的时候,有可能有其他类,应用类加载器询问扩展类加载器:你加载过这些类吗?<br>
		扩展类加载器在向上问(引导类加载器):你加载过这些类吗?<br>
		引导类加载器:我查查,有一个是我负责,我加载.<br>
		扩展类加载器:接下来我来查,有几个是我负责,我加载,还有几个类我已经加载完成了,你可以直接使用.<br>
		应用类加载器:收到了 剩下的我来.<br>
	
	<p><b>------动态代理------</b></p>
	
	在项目运行的时候才创建一个代理对象,对方法进行增强(控制);<br>
	方式1:jdk中Proxy类,前提:实现接口<br>
	方式2:spring中cglib,前提:继承类<br><br>
		
	动态的在内存中创建一个代理对象:<br>
		Object Proxy.newProxyInstance(ClassLoader loader, Class[] interfaces, InvocationHandler h){}<br>
			参数说明:<br>
				ClassLoader:代理对象类加载器 一般我们使用的是被代理对象的类加载器<br>
				Class[]:代理对象需要实现接口 一般我们使用的是被搭理对象所实现的所有接口<br>
				InvocationHandler:执行处理类.在这里面对方法进行加强<br><br>

			invocationHandler中只有一个方法:<br>
				Object invoke(Object proxy, Method method, Object[] args){}<br>
					参数说明:<br>
						proxy:代理对象<br>
						method:当前执行的方法<br>
						args:当前方法执行的时候所需要的参数<br>
						返回值:就是当前method对象执行的返回值<br>
  </body>
</html>
