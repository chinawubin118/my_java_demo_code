<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CookieAndSessionJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <p><b>------cookie:浏览器端会话技术------</b></p>
	由服务器产生,生成key=value形式,通过响应头(set-cookie)返回给浏览器,保存在浏览器端,下次访问的时候根据一定的规则携带cookie,通过请求头(cookie)携带给服务器.<br>
	<br>
	常用方法:<br>
		构造:new Cookie(String key,String value);<br>
		写回:response.addCookie(Cookie c);<br>
		获取:Cookie[] request.getCookies();<br>
		cookie的api:<br>
		getName():获取cookie的名称;<br>
		getValue():获取cookie的值;<br>
		setMaxAge(int 秒数);持久化,若int为0;删除此cookie(前提必须路径一致);<br>
		setPath(String path):设置cookie的路径,若访问的链接的路径中包含cookie的path,则携带;
	注意:<br>
		cookie不能跨浏览器.<br>
		cookie不支持中文.<br>

	<p><b>------session:服务器端的会话技术------</b></p>

	浏览器访问服务器的时候,服务器会获取jsessionid,<br>
		若获取不到:<br>
			服务器创建一个session,保存用户数据,将该session的jsessionid通过响应返回给浏览器;<br>
		若获取到:<br>
			服务器拿着这个jessionid去session池中查找有无此session;<br>
				若查找不到:<br>
					服务器创建一个session,保存用户数据,将该session的jsessionid通过响应返回给浏览器;<br>
				若查找到:
					拿过来直接使用,将该session的jsessionid通过响应返回给浏览器;<br><br>
					
	常用方法:
		获取一个session:request.getSession();<br><br>
		
	session作为域对象:<br>
		xxxAttribute();<br>
		生命周期:
			创建:java程序中第一次使用request.getsession方法的时候.<br><br>
			
			销毁:<br>
				1.服务器非正常关闭.<br>
				2.session超时.<br>
				3.默认时间.<br>
				4.手动设置时间.<br>
				手动删除session★<br>
					session.invalidate();<br><br>
					
	<p><b>------域对象------</b></p>
		ServletContext:共享的数据.<br>
		HttpServletRequest:一次请求的数据.<br>
		HttpSession:私有的数据.<br>
  </body>
</html>
