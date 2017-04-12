package br.com.livraria.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

public class ConnectionFactory {
	
	private DataSource dataSource;
	
	public ConnectionFactory(){
		MysqlConnectionPoolDataSource pool = new MysqlConnectionPoolDataSource();
		pool.setUrl("jdbc:mysql://localhost/mydb");
		pool.setUser("root");
		pool.setPassword("root123");
		this.dataSource = pool;
	}
	
	public Connection getConnection(){
		Connection col = null;
		try{
			col = dataSource.getConnection();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return col;
	}

}
