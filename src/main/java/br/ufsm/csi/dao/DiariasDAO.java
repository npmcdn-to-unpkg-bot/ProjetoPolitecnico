package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.Diarias;

public class DiariasDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(Diarias diarias, String numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, descricao, valorunitario, quantidade, periodo)"
			  + " VALUES (default, ?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);			
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, "5");
		stmt.setString(3, diarias.getDescricao());
		stmt.setFloat(4, diarias.getValorUnitario());
		stmt.setInt(5, diarias.getQuantidade());
		stmt.setString(6, diarias.getPeriodo());
			
		try{
			stmt.execute();
			stmt.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public ArrayList<Diarias> lista (String numeroProjeto){
		
		ArrayList<Diarias> diarias = new ArrayList<Diarias>();
		
		try{
			this.query = " SELECT id, descricao, valorunitario, quantidade, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 5 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Diarias diaria = new Diarias();
				
				diaria.setId(rs.getInt("id"));
				diaria.setDescricao(rs.getString("descricao"));
				diaria.setValorUnitario(rs.getFloat("valorunitario"));
				diaria.setQuantidade(rs.getInt("quantidade"));
				diaria.setPeriodo(rs.getString("periodo"));
				diaria.setJustificativa(rs.getString("justificativa"));
				
				diarias.add(diaria);
			}
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return diarias;
	}

	public ArrayList<Diarias> getDiarias(int id) {
		
		ArrayList<Diarias> diarias = new ArrayList<Diarias>();
		
		try{
			this.query = " SELECT id, descricao, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Diarias diaria = new Diarias();
				
				diaria.setId(rs.getInt("id"));
				diaria.setDescricao(rs.getString("descricao"));
				diaria.setValorUnitario(rs.getFloat("valorunitario"));
				diaria.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				diaria.setQuantidade(rs.getInt("quantidade"));
				diaria.setPeriodo(rs.getString("periodo"));
				diaria.setJustificativa(rs.getString("justificativa"));
				
				diarias.add(diaria);
			}
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return diarias;
	}

	public boolean remover(int id) throws SQLException {
		this.query = " DELETE FROM itens WHERE id = ?; ";
		
		stmt = conn.prepareStatement(this.query);			
		stmt.setInt(1, id);

		try{
			stmt.execute();
			stmt.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public boolean alterar(Diarias diarias, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?"
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, diarias.getDescricao());
		stmt.setFloat(2, diarias.getValorUnitario());
		stmt.setInt(3, diarias.getQuantidade());
		stmt.setString(4, diarias.getPeriodo());
		stmt.setInt(5, id);

		try{
			stmt.execute();
			stmt.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}
}
