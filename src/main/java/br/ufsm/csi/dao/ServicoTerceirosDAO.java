package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.ServicoTerceiros;

public class ServicoTerceirosDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(ServicoTerceiros servicoTerceiros, String numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo)"
			  + " VALUES (default, ?,?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);		
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, "1");
		stmt.setString(3, servicoTerceiros.getDescricao());
		stmt.setString(4, servicoTerceiros.getUnidadeMedida());
		stmt.setFloat(5, servicoTerceiros.getValorUnitario());
		stmt.setInt(6, servicoTerceiros.getQuantidade());
		stmt.setString(7, servicoTerceiros.getPeriodo());
			
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

	public ArrayList<ServicoTerceiros> lista (String numeroProjeto){
		
		ArrayList<ServicoTerceiros> servicoTerceiros = new ArrayList<ServicoTerceiros>();
		
		try{
			this.query = " SELECT id, descricao, valorunitario, quantidade, unidademedida,"
				+ " periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 1 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				ServicoTerceiros servicoTerceiro = new ServicoTerceiros();
				
				servicoTerceiro.setId(rs.getInt("id"));
				servicoTerceiro.setDescricao(rs.getString("descricao"));
				servicoTerceiro.setValorUnitario(rs.getFloat("valorunitario"));
				servicoTerceiro.setQuantidade(rs.getInt("quantidade"));
				servicoTerceiro.setUnidadeMedida(rs.getString("unidademedida"));
				servicoTerceiro.setPeriodo(rs.getString("periodo"));
				servicoTerceiro.setJustificativa(rs.getString("justificativa"));
				servicoTerceiro.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				
				servicoTerceiros.add(servicoTerceiro);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return servicoTerceiros;
	}

	public ArrayList<ServicoTerceiros> getServicoTerceiros(int id) {
		
		ArrayList<ServicoTerceiros> servicosTerceiros = new ArrayList<ServicoTerceiros>();
		
		try{
			this.query = " SELECT id, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			String[] meses;
			String periodo;
			
			while(rs.next()){
				ServicoTerceiros servicoTerceiros = new ServicoTerceiros();
				
				servicoTerceiros.setId(rs.getInt("id"));
				servicoTerceiros.setDescricao(rs.getString("descricao"));
				servicoTerceiros.setValorUnitario(rs.getFloat("valorunitario"));
				servicoTerceiros.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				servicoTerceiros.setQuantidade(rs.getInt("quantidade"));
				servicoTerceiros.setJustificativa(rs.getString("justificativa"));
				servicoTerceiros.setUnidadeMedida(rs.getString("unidademedida"));
				
				periodo = rs.getString("periodo");
				meses = periodo.split(",");
				periodo = "";
				for(int i=0; i<meses.length; i++)
					periodo += "'" +meses[i] + "',";			
				servicoTerceiros.setPeriodo(periodo.substring(0, periodo.length()-1));
				
				servicosTerceiros.add(servicoTerceiros);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return servicosTerceiros;
	}

	public boolean remover(int id) throws SQLException {
		this.query = " DELETE FROM itens WHERE id = ?;";
		
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

	public boolean alterar(ServicoTerceiros servicoTerceiros, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, unidademedida = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?"
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);		
		stmt.setString(1, servicoTerceiros.getDescricao());
		stmt.setString(2, servicoTerceiros.getUnidadeMedida());
		stmt.setFloat(3, servicoTerceiros.getValorUnitario());
		stmt.setInt(4, servicoTerceiros.getQuantidade());
		stmt.setString(5, servicoTerceiros.getPeriodo());
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
