package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class PostgreSQLFactory {
	
	public static Connection getConexao() {

		Connection conn = null;
		
		String host = "xxxxx";
		String database = "xxx";
		String user = "xxxxx";
		String password = "xxxxxx";
		
		String url = "jdbc:postgresql://" +host +":5432/" +database;

		try {
			Class.forName("org.postgresql.Driver");
			
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
