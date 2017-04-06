package servlet;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//包含生命周期方法
public class Demo1Servlet extends HttpServlet {

	public Demo1Servlet() {
		super();
	}

	// @Override
	// public void init(ServletConfig config) throws ServletException {
	// super.init(config);
	// }

	// @Override
	// protected void service(HttpServletRequest req, HttpServletResponse resp)
	// throws ServletException, IOException {
	// super.service(req, resp);
	// }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 获取ServletContext对象
		ServletContext context = this.getServletContext();
		// 使用ServletContext对象(作为域对象使用)存储数据
		context.setAttribute("attKey1", "valueInAttKey1");
		// 取出ServletContext对象存储的数据并输出
		System.out.println("ServletContext_attKey1存储的值是:"
				+ context.getAttribute("attKey1"));

		// 得到请求转发器
		RequestDispatcher dispatcher = context
				.getRequestDispatcher("/servlet/Demo2Servlet");
		request.setAttribute("requestParam", "This is the request param.....");
		// 转发请求
		// dispatcher.forward(request, response);

		/**
		 * 获取资源文件的三种方法: 1.通过ServletContext对象获取. 2.通过ResourceBundle对象获取.
		 * 3.通过类加载器获取.
		 */
		getResource11(context);
		getResource12(context);
		getResource13(context);
		getResource21();
		getResource22();
		getResource31();
		getResource32();
		getResource33();

		// 解决response对象的中文乱码问题
		String s = "斌哥老弟";
		response.setContentType("text/html;charset=utf-8");// 设定服务器将数据编码时用的码表;通知浏览器解码用的码表.
		response.getOutputStream().write(s.getBytes("UTF-8"));// 字节流输出中文.
		// response.getWriter().write(s);// 字符流输出中文.
	}

	private void getResource11(ServletContext context) {
		// 获取p1.properties文件的路径
		String path = context.getRealPath("/WEB-INF/classes/p1.properties");
		// 创建Properties对象
		Properties pro = new Properties();
		try {
			// 加载文件
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("通过ServletContext获取的p1.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	// 获取p2资源文件的内容
	public void getResource12(ServletContext context) {
		// 获取p1.properties文件的路径
		String path = context
				.getRealPath("/WEB-INF/classes/servlet/p2.properties");// servlet.p2.properties
		// 创建一个Properties对象
		Properties pro = new Properties();
		try {
			// 加载文件
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("通过ServletContext获取的p2.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	// 获取p3资源文件的内容
	public void getResource13(ServletContext context) {
		// 获取p1.properties文件的路径
		String path = context.getRealPath("/p3.properties");
		// 创建Properties对象
		Properties pro = new Properties();
		try {
			// 加载文件
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("通过ServletContext获取的p3.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	// 通过ResourceBunble拿取资源文件：获取p1资源文件的内容 默认路径是src，对用到web环境就是classes目录
	public void getResource21() {
		// 获取ResourceBundle对象(专门用来获取properties文件的信息)
		ResourceBundle rb = ResourceBundle.getBundle("p1");
		// 获取文件中的内容
		System.out.println("通过ResourceBundle获取的p1.properties中的key对应的值是:"
				+ rb.getString("key"));
	}

	// 通过ResourceBunble拿取资源文件：获取p2资源文件的内容
	public void getResource22() {
		// 获取ResourceBundle对象(专门用来获取properties文件的信息)
		ResourceBundle rb = ResourceBundle.getBundle("servlet.p2");
		// 获取文件中的内容
		System.out.println("通过ResourceBundle获取的p2.properties中的key对应的值是:"
				+ rb.getString("key"));
	}

	// 通过类加载器拿取资源文件：获取p1资源文件的内容 : 默认路径是src，对用到web环境就是classes目录
	public void getResource31() {
		// 获取类加载器的方式
		/*
		 * 1. 通过类名 ServletContext7.class.getClassLoader() 2. 通过对象
		 * this.getClass().getClassLoader() 3. Class.forName()
		 * 获取Class.forName("ServletContext7").getClassLoader()
		 */
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("p1.properties");

		// 创建Properties对象
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("通过ClassLoader获取的p1.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	// 通过类加载器拿取资源文件：获取p2资源文件的内容 : 默认路径是src，对用到web环境就是classes目录
	public void getResource32() {
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("servlet/p2.properties");

		// 创建Properties对象
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("通过ClassLoader获取的p2.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	// 通过类加载器拿取资源文件：获取p3资源文件的内容 : 默认路径是src，对用到web环境就是classes目录
	public void getResource33() {
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("../../p3.properties");

		// 创建Properties对象
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("通过ClassLoader获取的p3.properties中的key对应的值是:"
				+ pro.get("key"));
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
		super.destroy();
	}
}