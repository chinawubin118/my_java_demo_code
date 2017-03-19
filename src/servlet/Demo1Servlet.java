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

//�����������ڷ���
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
		
		// ��ȡServletContext����
		ServletContext context = this.getServletContext();
		// ʹ��ServletContext����(��Ϊ�����ʹ��)�洢����
		context.setAttribute("attKey1", "valueInAttKey1");
		// ȡ��ServletContext����洢�����ݲ����
		System.out.println("ServletContext_attKey1�洢��ֵ��:"
				+ context.getAttribute("attKey1"));

		// �õ�����ת����
		RequestDispatcher dispatcher = context
				.getRequestDispatcher("/servlet/Demo2Servlet");
		request.setAttribute("requestParam", "This is the request param.....");
		// ת������
		// dispatcher.forward(request, response);

		/**
		 * ��ȡ��Դ�ļ������ַ���: 1.ͨ��ServletContext�����ȡ. 2.ͨ��ResourceBundle�����ȡ.
		 * 3.ͨ�����������ȡ.
		 */
		getResource11(context);
		getResource12(context);
		getResource13(context);
		getResource21();
		getResource22();
		getResource31();
		getResource32();
		getResource33();

		// ���response�����������������
		String s = "����ϵ�";
		response.setContentType("text/html;charset=utf-8");// �趨�����������ݱ���ʱ�õ����;֪ͨ����������õ����.
		response.getOutputStream().write(s.getBytes("UTF-8"));// �ֽ����������.
		// response.getWriter().write(s);// �ַ����������.
	}

	private void getResource11(ServletContext context) {
		// ��ȡp1.properties�ļ���·��
		String path = context.getRealPath("/WEB-INF/classes/p1.properties");
		// ����Properties����
		Properties pro = new Properties();
		try {
			// �����ļ�
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("ͨ��ServletContext��ȡ��p1.properties�е�key��Ӧ��ֵ��:"
				+ pro.get("key"));
	}

	// ��ȡp2��Դ�ļ�������
	public void getResource12(ServletContext context) {
		// ��ȡp1.properties�ļ���·��
		String path = context
				.getRealPath("/WEB-INF/classes/servlet/p2.properties");// servlet.p2.properties
		// ����һ��Properties����
		Properties pro = new Properties();
		try {
			// �����ļ�
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("ͨ��ServletContext��ȡ��p2.properties�е�key��Ӧ��ֵ��:"
				+ pro.get("key"));
	}

	// ��ȡp3��Դ�ļ�������
	public void getResource13(ServletContext context) {
		// ��ȡp1.properties�ļ���·��
		String path = context.getRealPath("/p3.properties");
		// ����Properties����
		Properties pro = new Properties();
		try {
			// �����ļ�
			pro.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("ͨ��ServletContext��ȡ��p3.properties�е�key��Ӧ��ֵ��:"
				+ pro.get("key"));
	}

	// ͨ��ResourceBunble��ȡ��Դ�ļ�����ȡp1��Դ�ļ������� Ĭ��·����src�����õ�web��������classesĿ¼
	public void getResource21() {
		// ��ȡResourceBundle����(ר��������ȡproperties�ļ�����Ϣ)
		ResourceBundle rb = ResourceBundle.getBundle("p1");
		// ��ȡ�ļ��е�����
		System.out.println("ͨ��ResourceBundle��ȡ��p1.properties�е�key��Ӧ��ֵ��:"
				+ rb.getString("key"));
	}

	// ͨ��ResourceBunble��ȡ��Դ�ļ�����ȡp2��Դ�ļ�������
	public void getResource22() {
		// ��ȡResourceBundle����(ר��������ȡproperties�ļ�����Ϣ)
		ResourceBundle rb = ResourceBundle.getBundle("servlet.p2");
		// ��ȡ�ļ��е�����
		System.out.println("ͨ��ResourceBundle��ȡ��p2.properties�е�key��Ӧ��ֵ��:"
				+ rb.getString("key"));
	}

	// ͨ�����������ȡ��Դ�ļ�����ȡp1��Դ�ļ������� : Ĭ��·����src�����õ�web��������classesĿ¼
	public void getResource31() {
		// ��ȡ��������ķ�ʽ
		/*
		 * 1. ͨ������ ServletContext7.class.getClassLoader() 2. ͨ������
		 * this.getClass().getClassLoader() 3. Class.forName()
		 * ��ȡClass.forName("ServletContext7").getClassLoader()
		 */
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("p1.properties");

		// ����Properties����
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("ͨ��ClassLoader��ȡ��p1.properties�е�key��Ӧ��ֵ��:"
				+ pro.get("key"));
	}

	// ͨ�����������ȡ��Դ�ļ�����ȡp2��Դ�ļ������� : Ĭ��·����src�����õ�web��������classesĿ¼
	public void getResource32() {
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("servlet/p2.properties");

		// ����Properties����
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("ͨ��ClassLoader��ȡ��p2.properties�е�key��Ӧ��ֵ��:"
				+ pro.get("key"));
	}

	// ͨ�����������ȡ��Դ�ļ�����ȡp3��Դ�ļ������� : Ĭ��·����src�����õ�web��������classesĿ¼
	public void getResource33() {
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("../../p3.properties");

		// ����Properties����
		Properties pro = new Properties();
		try {
			pro.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("ͨ��ClassLoader��ȡ��p3.properties�е�key��Ӧ��ֵ��:"
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
