package vn.cosmetics.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;




public class connectDB {
	public connectDB(){
		super();
	}
	public static Connection getConnect(){
		Connection connection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection=DriverManager.getConnection("jdbc:sqlserver://DESKTOP-0M6SRA1:1433;databaseName=Cosmetics;user=sa;password=pntt.258.1;useUnicode=true;characterEncoding=UTF-8");
			System.out.println("Kết nối thành công!");
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Kết nối thất bại!"+e.getMessage());
		}
		return connection;
	}
	public static void main(String[] args) {
		System.out.println(getConnect());
	}

}