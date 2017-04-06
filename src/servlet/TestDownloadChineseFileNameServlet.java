package servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestDownloadChineseFileNameServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取文件的路径
		String path = getServletContext().getRealPath(
				"/WEB-INF/classes/中文名称文件.txt"); // 默认从工程路径开始

		// 创建输入流
		InputStream is = new FileInputStream(path);
		byte[] bs = new byte[1024];
		int b = 0;

		// 创建输出流对象
		ServletOutputStream os = response.getOutputStream();

		// 对中文进行编码
		// 拿到中文的文件名
		String name = path.substring(path.lastIndexOf("\\") + 1, path.length());
		System.out.println(name);

		// 对中文文件名进行编码
		name = URLEncoder.encode(name, "utf-8");
		System.out.println("编码后： " + name);

		// 通知浏览器以下载的方式打开文件
		// response.setHeader("Content-Disposition","attachment;filename=中文名称文件.txt");
		response.setHeader("Content-Disposition", "attachment;filename=" + name);

		while ((b = is.read(bs)) != -1) {
			os.write(bs, 0, b);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}