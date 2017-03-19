package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ��������Demo1Servletת��������
 * 
 * @author wubin
 * 
 */
public class Demo2Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestParam = (String) request.getAttribute("requestParam");
		if (null != requestParam) {
			System.out.println("�����Demo2Servlet,�յ���ת������������,���ݵ�ֵ��:" + requestParam);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
