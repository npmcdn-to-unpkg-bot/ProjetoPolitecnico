package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.Bolsas;

public class BolsasDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(Bolsas bolsas, long numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (numeroprojeto, codigomaterial, valorunitario, quantidade, periodo, justificativa)"
				+ " VALUES (?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "5");
		stmt.setFloat(3, bolsas.getValorUnitario());
		stmt.setInt(4, bolsas.getQuantidade());
		stmt.setString(5, bolsas.getPeriodo());
		stmt.setString(6, bolsas.getJustificativa());
			
		try{
			stmt.execute();
			stmt.close();
			conn.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public ArrayList<Bolsas> lista (long numeroProjeto){
		
		ArrayList<Bolsas> bolsas = new ArrayList<Bolsas>();
		
		try{
			this.query = " SELECT valorunitario, quantidade, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 5 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Bolsas bolsa = new Bolsas();
				
				bolsa.setValorUnitario(rs.getFloat("valorunitario"));
				bolsa.setQuantidade(rs.getInt("quantidade"));
				bolsa.setPeriodo(rs.getString("periodo"));
				bolsa.setJustificativa(rs.getString("justificativa"));
				
				bolsas.add(bolsa);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return bolsas;
	}

	public ArrayList<Bolsas> getBolsas(long numeroProjeto, float valorTotal) {
		
		ArrayList<Bolsas> bolsas = new ArrayList<Bolsas>();
		
		try{
			this.query = " SELECT valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 5 "
				+ " AND (valorunitario * quantidade) = ?"
				+ " AND numeroprojeto = ? "
				+ " LIMIT 1; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setFloat(1, valorTotal);
			stmt.setLong(2, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Bolsas bolsa = new Bolsas();
				
				bolsa.setValorUnitario(rs.getFloat("valorunitario"));
				bolsa.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				bolsa.setQuantidade(rs.getInt("quantidade"));
				bolsa.setPeriodo(rs.getString("periodo"));
				bolsa.setJustificativa(rs.getString("justificativa"));
				
				bolsas.add(bolsa);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return bolsas;
	}

	public boolean remover(long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " DELETE FROM itens "
				+ " WHERE numeroProjeto = ? "
				+ " AND codigomaterial = ?"
				+ " AND (valorunitario * quantidade) = ?; ";
		
		stmt = conn.prepareStatement(this.query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "5");
		stmt.setFloat(3, valorTotal);

		try{
			stmt.execute();
			stmt.close();
			conn.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}

	public boolean alterar(Bolsas bolsas, long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE numeroProjeto = ? "
			+ " AND codigomaterial = ? "
			+ " AND (valorunitario * quantidade) = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setFloat(1, bolsas.getValorUnitario());
		stmt.setInt(2, bolsas.getQuantidade());
		stmt.setString(3, bolsas.getPeriodo());
		stmt.setString(4, bolsas.getJustificativa());
		stmt.setLong(5, numeroProjeto);
		stmt.setString(6, "5");
		stmt.setFloat(7, valorTotal);

		try{
			stmt.execute();
			stmt.close();
			conn.close();

			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}

		return autenticado;
	}
}
