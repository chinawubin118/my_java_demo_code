package demo1.service;

import java.sql.SQLException;
import java.util.List;

import demo1.dao.ProductDao;
import demo1.domain.Product;

public class ProductService {

	public List<Product> getAllProducts() throws SQLException {
		return new ProductDao().getAllProducts();
	}

}
