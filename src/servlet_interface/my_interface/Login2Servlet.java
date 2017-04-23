package servlet_interface.my_interface;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import servlet_interface.BaseServlet;
import bean.PageBean;
import bean.User2;

public class Login2Servlet extends BaseServlet {

	public String login2(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println("username:" + username);
		System.out.println("password:" + password);

		User2 user = new User2();
		user.setUsername(username);
		user.setPassword("111222333");

		String s = JSONObject.fromObject(user).toString();

		try {
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public String getUserList(HttpServletRequest request,HttpServletResponse response) {
		
		String currentPage = request.getParameter("currentPage");//当前页数
		int currentPageInt = Integer.parseInt(currentPage);
		
		System.out.println("currentPageInt:" + currentPageInt);
		
		List<User2> userList = new ArrayList<User2>();
		
		//每次加载20条数据
		for (int i = 0; i < 20; i++) {
			int newI = 20 * (currentPageInt - 1) + i;
			userList.add(new User2("user" + newI, newI + "", newI + 18 + "", "男",
					"山东省城市" + newI, "爱好" + newI));
		}
		
		PageBean<User2> pageBean = new PageBean<User2>();
		pageBean.setDataList(userList);
		pageBean.setTotalPage(6);
		
		String s = JSONObject.fromObject(pageBean).toString();
		
		try {
			Thread.sleep(1000);//服务器沉默1s
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
