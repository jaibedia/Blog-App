package com.factory;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionFactory {
	private static Connection con = null;
	 
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","jaibedia");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	
	public void clearCon() throws SQLException {
		con.close();
	}
	public static Connection getConnection() {
		return con;
	}

}
