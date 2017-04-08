package jdbc.demos;

import java.sql.SQLException;
import java.util.List;

import jdbc.DataSourceUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import bean.Category;

/**
 * Apache DbUtils Demo App...
 * 
 * @author wubin
 * 
 */
public class DbUtilsDemo {

	@Test
	public void select() {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

		String sql = "select * from category";

		List<Category> list;
		try {
			list = qr.query(sql, new BeanListHandler<>(Category.class));
			
			for (Category bean : list) {
				System.out.println(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 插入数据
	@Test
	public void insert() {
		// 1.创建queryrunner类
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

		// 2.编写sql
		String sql = "insert into category values(?,?)";

		// 3.执行sql
		int line;
		try {
			line = qr.update(sql, "c201", "厨房电器");
			System.out.println("插入数据,影响的行数:" + line);
		} catch (SQLException e) {
			System.out.println("插入数据出现异常...");
		}
	}

	// 修改数据
	@Test
	public void update() {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

		String sql = "update category set cname = ? where cid = ?";

		try {
			int line = qr.update(sql, "更新的c201", "c201");
			System.out.println("数据更新成功:" + line);
		} catch (SQLException e) {
			System.out.println("数据更新异常...");
		}
	}

	// 删除数据
	@Test
	public void delete() {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

		String sql = "delete from category where cid = ?";
		try {
			int line = qr.update(sql, "c201");
			System.out.println("删除了" + line + "行数据...");
		} catch (SQLException e) {
			System.out.println("删除数据出现异常...");
		}
	}
}
