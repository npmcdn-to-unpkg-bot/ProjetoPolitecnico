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
	
	public boolean adicionar(Diarias diarias, long numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (numeroprojeto, codigomaterial, descricao, valorunitario, quantidade, periodo, justificativa)"
				+ " VALUES (?,?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "6");
		stmt.setString(3, diarias.getDescricao());
		stmt.setFloat(4, diarias.getValorUnitario());
		stmt.setInt(5, diarias.getQuantidade());
		stmt.setString(6, diarias.getPeriodo());
		stmt.setString(7, diarias.getJustificativa());
			
		try{
			stmt.execute();
			stmt.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public ArrayList<Diarias> lista (long numeroProjeto){
		
		ArrayList<Diarias> diarias = new ArrayList<Diarias>();
		
		try{
			this.query = " SELECT descricao, valorunitario, quantidade"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 6 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Diarias diaria = new Diarias();
				
				diaria.setDescricao(rs.getString("descricao"));
				diaria.setValorUnitario(rs.getFloat("valorunitario"));
				diaria.setQuantidade(rs.getInt("quantidade"));
				
				diarias.add(diaria);
			}
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return diarias;
	}

	public ArrayList<Diarias> getDiarias(long numeroProjeto, float valorTotal) {
		
		ArrayList<Diarias> diarias = new ArrayList<Diarias>();
		
		try{
			this.query = " SELECT descricao, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 6 "
				+ " AND (valorunitario * quantidade) = ?"
				+ " AND numeroprojeto = ? "
				+ " LIMIT 1; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setFloat(1, valorTotal);
			stmt.setLong(2, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Diarias diaria = new Diarias();
				
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

	public boolean remover(long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " DELETE FROM itens "
				+ " WHERE numeroProjeto = ? "
				+ " AND codigomaterial = ?"
				+ " AND (valorunitario * quantidade) = ?; ";
		
		stmt = conn.prepareStatement(this.query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "6");
		stmt.setFloat(3, valorTotal);

		try{
			stmt.execute();
			stmt.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public boolean alterar(Diarias diarias, long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE numeroProjeto = ? "
			+ " AND codigomaterial = ? "
			+ " AND (valorunitario * quantidade) = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, diarias.getDescricao());
		stmt.setFloat(2, diarias.getValorUnitario());
		stmt.setInt(3, diarias.getQuantidade());
		stmt.setString(4, diarias.getPeriodo());
		stmt.setString(5, diarias.getJustificativa());
		stmt.setLong(6, numeroProjeto);
		stmt.setString(7, "6");
		stmt.setFloat(8, valorTotal);

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
