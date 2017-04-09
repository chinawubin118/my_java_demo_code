package demo1.dao;

import java.sql.SQLException;
import java.util.List;

import javax.enterprise.inject.New;

import jdbc.DataSourceUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import demo1.domain.Product;

public class ProductDao {

	public List<Product> getAllProducts() throws SQLException {
		QueryRunner qRunner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from products;";
		return qRunner.query(sql, new BeanListHandler(Product.class));
	}
}
