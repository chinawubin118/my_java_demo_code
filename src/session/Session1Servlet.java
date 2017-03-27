package session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Session1Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * getsession()�������������£� 1. ���ͻ����Ƿ�Я����JSESSIONIDCookie 2.
		 * ���û��Я��������һ���µ�session���󣬲�����һ��Ψһ��id,���͵��ͻ��ˣ��洢�ڿͻ��˵Ļ�����
		 * ���Я���ˣ�������cookie��ֵ(id)������˵��ڴ���Ѱ��session������ҵ����򷵻ش�sessionΪ�ͻ��˷���
		 */
		HttpSession session = request.getSession();
		String id = session.getId();
		System.out.println("Session1Servle�õ���JSESSIONID:" + id);
		session.setAttribute("name", "Lotte��");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
