package cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");//返回html
//		response.setContentType("application/json;charset=UTF-8");//返回json
		PrintWriter out = response.getWriter();

		String name = (String) request.getAttribute("name");

		// out.write(name + "，欢迎你");

		String json = "{\"succeed\":\"111\",\"sucInfo\":\"用户名和密码一致,登录成功\",\"interface_name\":\"getSchoolList\"}";

		out.write(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
