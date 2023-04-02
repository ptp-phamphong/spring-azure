package com.aptech.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class UtilDb {

	private Connection connection;

	public UtilDb(Connection conection) {
		this.connection = conection;
	}

	UtilDb() {
	}

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public void connect() {
		if (connection == null) {
            //String dbURL = "jdbc:sqlserver://localhost\\PHAMTHANHPHONG:1433;databaseName=SportShop;user=sa;password=sa";
			String dbURL = "jdbc:mysql://localhost:3306/spring_mvc?user=root&password=123456";
			if (this.connection == null) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					connection = DriverManager.getConnection(dbURL);
					System.out.println("abc456");
				} catch (Exception e) {
					System.out.println("abc123");
					System.out.println(e.getMessage());
				}
			}
		}
	}

	public void disConnect() {
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
