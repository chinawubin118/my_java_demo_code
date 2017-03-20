package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import bean.User;

//��ȡ���е�����(ҳ��:register.html)
public class GetFormDataServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8") ;
		
		User user = new User() ;
		System.out.println("��װǰ�� " + user);
		//�������ݷ�װ��user������
		try {
			BeanUtils.populate(user, request.getParameterMap()) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("��װ�� " + user);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
