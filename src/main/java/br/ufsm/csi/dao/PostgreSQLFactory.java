package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class PostgreSQLFactory {
	
	public static Connection getConexao() {

		Connection conn = null;
		
		String host = "192.168.90.103";
		String database = "dbadm";
		String user = "postgres";
		String password = "1234";
		
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
