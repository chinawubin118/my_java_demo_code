package demo1.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo1.domain.Product;
import demo1.service.ProductService;

public class ShowAllProductServlet extends HttpServlet {
	
	private List<Product> productList;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			productList =new ProductService().getAllProducts();
		} catch (SQLException e) {
			System.out.println("查询商品出现了异常...");
		}
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("/www/demo1/show_all_products.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
