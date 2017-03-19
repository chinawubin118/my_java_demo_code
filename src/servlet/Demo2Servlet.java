package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用来接受Demo1Servlet转发的请求
 * 
 * @author wubin
 * 
 */
public class Demo2Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestParam = (String) request.getAttribute("requestParam");
		if (null != requestParam) {
			System.out.println("这个是Demo2Servlet,收到了转发过来的请求,传递的值是:" + requestParam);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
