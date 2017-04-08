package jdbc.demos;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jdbc.JdbcUtils;

import org.junit.Test;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Demo {
	
	// 硬编码
	@Test
	public void f1() throws Exception {
		ComboPooledDataSource ds = new ComboPooledDataSource();

		// 设置基本参数
		ds.setDriverClass("com.mysql.jdbc.Driver");
		ds.setJdbcUrl("jdbc:mysql:///lotte");
		ds.setUser("root");
		ds.setPassword("develop123");

		Connection conn = ds.getConnection();
		String sql = "insert into category values(?,?);";
		PreparedStatement st = conn.prepareStatement(sql);

		// 设置参数
		st.setString(1, "c013");
		st.setString(2, "毒药");

		int i = st.executeUpdate();
		System.out.println(i);
		JdbcUtils.closeResource(conn, st, null);//关闭资源,归还连接池
	}

	//使用配置文件
	@Test
	public void f2() throws Exception {
		 ComboPooledDataSource ds = new ComboPooledDataSource();
//		ComboPooledDataSource ds = new ComboPooledDataSource("lotte111");// 若查找不到命名的配置,使用默认的配置
																	
		Connection conn = ds.getConnection();
		String sql = "insert into category values(?,?);";
		PreparedStatement st = conn.prepareStatement(sql);

		// 设置参数
		st.setString(1, "c124");
		st.setString(2, "解药");

		int i = st.executeUpdate();
		System.out.println(i);
		JdbcUtils.closeResource(conn, st, null);//关闭资源,归还连接池
	}
}
