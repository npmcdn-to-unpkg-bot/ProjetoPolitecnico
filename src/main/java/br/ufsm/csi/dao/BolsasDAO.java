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
	
	public boolean adicionar(Bolsas bolsas, String numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, valorunitario, quantidade, periodo, justificativa, descricao, unidademedida)"
			  + " VALUES (default, ?,?,?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);			
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, "6");
		stmt.setFloat(3, bolsas.getValorUnitario());
		stmt.setInt(4, bolsas.getQuantidade());
		stmt.setString(5, bolsas.getPeriodo());
		stmt.setString(6, bolsas.getJustificativa());
		stmt.setString(7, "-");
		stmt.setString(8, "-");
			
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

	public ArrayList<Bolsas> lista (String numeroProjeto){
		
		ArrayList<Bolsas> bolsas = new ArrayList<Bolsas>();
		
		try{
			this.query = " SELECT id, valorunitario, quantidade, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 6 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			String[] meses;
			String periodo;
			
			while(rs.next()){
				Bolsas bolsa = new Bolsas();
				
				bolsa.setId(rs.getInt("id"));
				bolsa.setValorUnitario(rs.getFloat("valorunitario"));
				bolsa.setQuantidade(rs.getInt("quantidade"));
				bolsa.setPeriodo(rs.getString("periodo"));
				bolsa.setJustificativa(rs.getString("justificativa"));
				bolsa.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				
				periodo = rs.getString("periodo");
				meses = periodo.split(",");
				bolsa.setMeses(meses.length);

				bolsas.add(bolsa);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return bolsas;
	}

	public ArrayList<Bolsas> getBolsas(int id) {
		
		ArrayList<Bolsas> bolsas = new ArrayList<Bolsas>();
		
		try{
			this.query = " SELECT id, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?;";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setFloat(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			String[] meses;
			String periodo;
			
			while(rs.next()){
				Bolsas bolsa = new Bolsas();
				
				bolsa.setId(rs.getInt("id"));
				bolsa.setValorUnitario(rs.getFloat("valorunitario"));
				bolsa.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				bolsa.setQuantidade(rs.getInt("quantidade"));
				bolsa.setJustificativa(rs.getString("justificativa"));
				
				periodo = rs.getString("periodo");
				meses = periodo.split(",");
				periodo = "";
				for(int i=0; i<meses.length; i++)
					periodo += "'" +meses[i] + "',";			
				bolsa.setPeriodo(periodo.substring(0, periodo.length()-1));
				
				bolsas.add(bolsa);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return bolsas;
	}

	public boolean remover(int id) throws SQLException {
		this.query = " DELETE FROM itens WHERE id = ?; ";
		
		stmt = conn.prepareStatement(this.query);			
		stmt.setInt(1, id);

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

	public boolean alterar(Bolsas bolsas, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setFloat(1, bolsas.getValorUnitario());
		stmt.setInt(2, bolsas.getQuantidade());
		stmt.setString(3, bolsas.getPeriodo());
		stmt.setString(4, bolsas.getJustificativa());
		stmt.setLong(5, id);

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
