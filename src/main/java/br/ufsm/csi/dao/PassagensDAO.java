package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.Passagens;

public class PassagensDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(Passagens passagens, String numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, descricao, valorunitario, quantidade, periodo, unidademedida, justificativa)"
			+ " VALUES (default, ?,?,?,?,?,?,?,?);";
		
		stmt = conn.prepareStatement(query);
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, passagens.getCodigoDemanda());
		stmt.setString(3, passagens.getDescricao());
		stmt.setFloat(4, passagens.getValorUnitario());
		stmt.setInt(5, passagens.getQuantidade());
		stmt.setString(6, passagens.getPeriodo());
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
	
	public ArrayList<Passagens> lista (String numeroProjeto){
		
		ArrayList<Passagens> passagens = new ArrayList<Passagens>();
		
		try{
			this.query = " SELECT id, itens.codigomaterial, descricao, valorunitario, quantidade, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 2 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Passagens passagem = new Passagens();
				
				passagem.setId(rs.getInt("id"));
				passagem.setCodigoDemanda(rs.getString("codigomaterial"));
				passagem.setDescricao(rs.getString("descricao"));
				passagem.setValorUnitario(rs.getFloat("valorunitario"));
				passagem.setQuantidade(rs.getInt("quantidade"));
				passagem.setPeriodo(rs.getString("periodo"));
				passagem.setJustificativa(rs.getString("justificativa"));
				
				passagens.add(passagem);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return passagens;
	}

	public boolean remover(int id) throws SQLException {
		this.query = " DELETE FROM itens "
			+ " WHERE id = ?;";
		
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

	public ArrayList<Passagens> getPassagens(int id) {
		
		ArrayList<Passagens> passagens = new ArrayList<Passagens>();
		
		try{
			this.query = " SELECT id, itens.codigomaterial, descricao, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			String[] meses;
			String periodo;
			
			while(rs.next()){
				Passagens passagem = new Passagens();
				
				passagem.setId(rs.getInt("id"));
				passagem.setDescricao(rs.getString("descricao"));
				passagem.setCodigoDemanda(rs.getString("codigomaterial"));
				passagem.setValorUnitario(rs.getFloat("valorunitario"));
				passagem.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				passagem.setQuantidade(rs.getInt("quantidade"));
				passagem.setJustificativa(rs.getString("justificativa"));
				
				periodo = rs.getString("periodo");
				meses = periodo.split(",");
				periodo = "";
				for(int i=0; i<meses.length; i++)
					periodo += "'" +meses[i] + "',";			
				passagem.setPeriodo(periodo.substring(0, periodo.length()-1));
				
				passagens.add(passagem);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return passagens;
	}

	public boolean alterar(Passagens passagens, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, valorunitario = ?, codigomaterial = ?, "
			+ " quantidade = ?, periodo = ?"
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, passagens.getDescricao());
		stmt.setFloat(2, passagens.getValorUnitario());
		stmt.setString(3, passagens.getCodigoDemanda());
		stmt.setInt(4, passagens.getQuantidade());
		stmt.setString(5, passagens.getPeriodo());
		stmt.setInt(6, id);

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
