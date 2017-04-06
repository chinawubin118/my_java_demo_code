package cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 拿取浏览器器传递的数据
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		String remeber = request.getParameter("remeber");

		System.out.println("�û��� = " + name + ",���� = " + pass);

		// 判断用户是否是合法用户 : 假定name和pass的逆序一样就是合法用户
		// 拿到密码的逆序
		String pass1 = new StringBuffer(pass).reverse().toString();

		// 判断
		if (name.equals(pass1)) {
			// 是合法用户
			// 判断用户是否选择了记住用户名和密码
			// 说明用户选择了记录
			Cookie c = new Cookie("name", name);
			Cookie c1 = new Cookie("pass", pass);
			if ("on".equals(remeber)) {
				// 设定存储到客户端的硬盘上
				c.setMaxAge(Integer.MAX_VALUE);
				c1.setMaxAge(Integer.MAX_VALUE);

			} else {
				// 设定客户端存储的用户名和密码立刻失效
				c.setMaxAge(0);
				c1.setMaxAge(0);
			}
			// 设定访问路径
			c.setPath(request.getContextPath());
			c1.setPath(request.getContextPath());

			// 向客户端发送Cookie
			response.addCookie(c);
			response.addCookie(c1);

			request.setAttribute("name", name);
			request.getRequestDispatcher("MainServlet").forward(request,
					response);
		} else {
			// 非法用户
			request.setAttribute("error", "�û�������������");
			request.getRequestDispatcher("UIServlet")
					.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
