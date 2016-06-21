package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.MaterialConsumo;
import br.ufsm.csi.model.ServicoTerceiros;

public class ServicoTerceirosDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(ServicoTerceiros servicoTerceiros, long numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (numeroprojeto, codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa)"
				+ " VALUES (?,?,?,?,?,?,?,?);";
			
		stmt = conn.prepareStatement(query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "1");
		stmt.setString(3, servicoTerceiros.getDescricao());
		stmt.setString(4, servicoTerceiros.getUnidadeMedida());
		stmt.setFloat(5, servicoTerceiros.getValorUnitario());
		stmt.setInt(6, servicoTerceiros.getQuantidade());
		stmt.setString(7, servicoTerceiros.getPeriodo());
		stmt.setString(8, servicoTerceiros.getJustificativa());
			
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

	public ArrayList<ServicoTerceiros> lista (long numeroProjeto){
		
		ArrayList<ServicoTerceiros> servicoTerceiros = new ArrayList<ServicoTerceiros>();
		
		try{
			this.query = " SELECT descricao, valorunitario, quantidade"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 1 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				ServicoTerceiros servicoTerceiro = new ServicoTerceiros();
				
				servicoTerceiro.setDescricao(rs.getString("descricao"));
				servicoTerceiro.setValorUnitario(rs.getFloat("valorunitario"));
				servicoTerceiro.setQuantidade(rs.getInt("quantidade"));
				
				servicoTerceiros.add(servicoTerceiro);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return servicoTerceiros;
	}

	public ArrayList<ServicoTerceiros> getServicoTerceiros(long numeroProjeto, float valorTotal) {
		
		ArrayList<ServicoTerceiros> servicosTerceiros = new ArrayList<ServicoTerceiros>();
		
		try{
			this.query = " SELECT descricao, unidademedida, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 1 "
				+ " AND (valorunitario * quantidade) = ?"
				+ " AND numeroprojeto = ? "
				+ " LIMIT 1; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setFloat(1, valorTotal);
			stmt.setLong(2, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				ServicoTerceiros servicoTerceiros = new ServicoTerceiros();
				
				servicoTerceiros.setDescricao(rs.getString("descricao"));
				servicoTerceiros.setValorUnitario(rs.getFloat("valorunitario"));
				servicoTerceiros.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				servicoTerceiros.setQuantidade(rs.getInt("quantidade"));
				servicoTerceiros.setPeriodo(rs.getString("periodo"));
				servicoTerceiros.setJustificativa(rs.getString("justificativa"));
				servicoTerceiros.setUnidadeMedida(rs.getString("unidademedida"));
				
				servicosTerceiros.add(servicoTerceiros);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return servicosTerceiros;
	}

	public boolean remover(long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " DELETE FROM itens "
				+ " WHERE numeroProjeto = ? "
				+ " AND codigomaterial = ?"
				+ " AND (valorunitario * quantidade) = ?; ";
		
		stmt = conn.prepareStatement(this.query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, "1");
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

	public boolean alterar(ServicoTerceiros servicoTerceiros, long numeroProjeto, float valorTotal) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, unidademedida = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE numeroProjeto = ? "
			+ " AND codigomaterial = ? "
			+ " AND (valorunitario * quantidade) = ?; ";

		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, servicoTerceiros.getDescricao());
		stmt.setString(2, servicoTerceiros.getUnidadeMedida());
		stmt.setFloat(3, servicoTerceiros.getValorUnitario());
		stmt.setInt(4, servicoTerceiros.getQuantidade());
		stmt.setString(5, servicoTerceiros.getPeriodo());
		stmt.setString(6, servicoTerceiros.getJustificativa());
		stmt.setLong(7, numeroProjeto);
		stmt.setString(8, "1");
		stmt.setFloat(9, valorTotal);

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
