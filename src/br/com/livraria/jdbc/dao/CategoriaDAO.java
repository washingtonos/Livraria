package br.com.livraria.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashSet;
import java.util.Set;

import br.com.livraria.bo.Categoria;
import br.com.livraria.jdbc.ConnectionFactory;

public class CategoriaDAO {

	private Connection con;

	public static final String ID = "ID";
	public static final String NOME = "NOME";

	public CategoriaDAO() {
		ConnectionFactory conFactory = new ConnectionFactory();
		this.con = conFactory.getConnection(); 
	}

	public Set<Integer> setCategoria(Categoria... categorias){
		Set<Integer> ids = new HashSet<Integer>(); 
		String sql = "INSERT INTO CATEGORIA (" + NOME + ") VALUES (?)";
		PreparedStatement prepStmt = null;
		try {
			prepStmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Categoria c : categorias){
			try{
				if(c.getNome() != null)
					prepStmt.setString(1, c.getNome());
				else
					prepStmt.setNull(1, Types.NVARCHAR);
				prepStmt.executeUpdate();
				ResultSet generatedKeys = prepStmt.getGeneratedKeys();
				while(generatedKeys.next())
					ids.add(generatedKeys.getInt(generatedKeys.getMetaData().getColumnLabel(1)));
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		try {
			prepStmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ids;
	}

	public Set<Categoria> getAllCategoria(){
		Set<Categoria> conjunto = new HashSet<Categoria>();
		Categoria elemento = null;
		String sql = "SELECT * FROM CATEGORIA";
		PreparedStatement prepStmt = null;
		try{
			prepStmt = con.prepareStatement(sql);
			ResultSet resultSet = prepStmt.executeQuery();
			while(resultSet.next()){
				Integer id = resultSet.getInt(ID);
				String nome = resultSet.getString(NOME);
				elemento = new Categoria(id, nome);
				conjunto.add(elemento);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				prepStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conjunto;
	}

	public Set<Categoria> getCategoriaWhere(String[][] campoRelacionalValor, String operadorLogico){
		Set<Categoria> conjunto = new HashSet<Categoria>();
		Categoria elemento = null;
		String sql = "SELECT * FROM CATEGORIA WHERE ";

		//montar String
		for(int i = 0; i < campoRelacionalValor.length; i++){
			sql = sql.concat(campoRelacionalValor[i][0] + " " + campoRelacionalValor[i][1]);
			if(i + 1 == campoRelacionalValor.length)
				sql = sql.concat(" ? ");
			else
				sql = sql.concat(" ? " + operadorLogico + " ");
		}

		PreparedStatement prepStmt = null;
		try{
			prepStmt = con.prepareStatement(sql);
			for(int i = 0; i < campoRelacionalValor.length; i++){
				if(campoRelacionalValor[i][0].equalsIgnoreCase(ID))
					prepStmt.setInt(i + 1, Integer.valueOf(campoRelacionalValor[i][2]));

				if(campoRelacionalValor[i][0].equalsIgnoreCase(NOME))
					prepStmt.setString(i + 1, campoRelacionalValor[i][2]);
			}
			ResultSet resultSet = prepStmt.executeQuery();
			while(resultSet.next()){
				Integer id = resultSet.getInt(ID);
				String nome = resultSet.getString(NOME);
				elemento = new Categoria(id, nome);
				conjunto.add(elemento);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				prepStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conjunto;
	}

	public Integer updateCategoria(Categoria... categorias){
		Integer linhas = 0;
		String sql = "UPDATE CATEGORIA SET " + NOME + " = ? WHERE " + ID + " = ?";
		PreparedStatement prepStmt = null;
		try {
			prepStmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Categoria c : categorias){
			try {
				if(c.getNome() != null)
					prepStmt.setString(1, c.getNome());
				else
					prepStmt.setNull(1, Types.NVARCHAR);
				if(c.getId() != null)
					prepStmt.setInt(2, c.getId());
				else
					prepStmt.setNull(2, Types.INTEGER);
				linhas += prepStmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			prepStmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return linhas;
	}

	public Integer deleteCategoria(Categoria... categorias){
		Integer linhas = 0;
		String sql = "DELETE FROM CATEGORIA WHERE "+ ID + " = ?";
		PreparedStatement prepStmt = null;
		try {
			prepStmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Categoria c : categorias){
			try {
				prepStmt.setInt(1, c.getId());
				linhas += prepStmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			prepStmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return linhas;
	}
	
	public Integer updateCategoria(Set<Categoria> categorias){
		Integer linhas = updateCategoria(categorias.toArray(new Categoria[0]));
		return linhas;
	}
	
	public Integer deleteCategoria(Set<Categoria> categorias){
		Integer linhas = deleteCategoria(categorias.toArray(new Categoria[0]));
		return linhas;
	}
	
	public void close(){
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
