package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.MaterialConsumo;
import br.ufsm.csi.model.Projeto;

public class MaterialConsumoDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(MaterialConsumo materialConsumo, long numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa)"
			+ " VALUES (default, ?,?,?,?,?,?,?,?);";
		
		stmt = conn.prepareStatement(query);
		
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, materialConsumo.getSubItem());
		stmt.setString(3, materialConsumo.getDescricao());
		stmt.setString(4, materialConsumo.getUnidadeMedida());
		stmt.setFloat(5, materialConsumo.getValorUnitario());
		stmt.setInt(6, materialConsumo.getQuantidade());
		stmt.setString(7, materialConsumo.getPeriodo());
		stmt.setString(8, materialConsumo.getJustificativa());
		
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
	
	public ArrayList<MaterialConsumo> lista (long numeroProjeto){
		
		ArrayList<MaterialConsumo> materiaisConsumo = new ArrayList<MaterialConsumo>();
		
		try{
			this.query = " SELECT id, itens.codigomaterial, descricao, subitem, valorunitario, quantidade, "
				+ "valorunitario * quantidade as valortotal, unidademedida, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 3 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				MaterialConsumo materialConsumo = new MaterialConsumo();
				
				materialConsumo.setId(rs.getInt("id"));
				materialConsumo.setDescricao(rs.getString("descricao"));
				materialConsumo.setCodigoDemanda(rs.getString("codigomaterial"));
				materialConsumo.setSubItem(rs.getString("subitem"));
				materialConsumo.setValorTotal(rs.getFloat("valortotal"));
				materialConsumo.setValorUnitario(rs.getFloat("valorunitario"));
				materialConsumo.setQuantidade(rs.getInt("quantidade"));
				materialConsumo.setUnidadeMedida(rs.getString("unidademedida"));
				materialConsumo.setPeriodo(rs.getString("periodo"));
				materialConsumo.setJustificativa(rs.getString("justificativa"));
				
				materiaisConsumo.add(materialConsumo);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisConsumo;
	}

	public boolean remover(int id) throws SQLException {
		this.query = " DELETE FROM itens "
			+ " WHERE id = ? ;";
		
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

	public ArrayList<MaterialConsumo> getMaterialConsumo(int id) {
		ArrayList<MaterialConsumo> materiaisConsumo = new ArrayList<MaterialConsumo>();
		
		try{
			this.query = " SELECT id, subitem, itens.codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				MaterialConsumo materialConsumo = new MaterialConsumo();
				
				materialConsumo.setId(rs.getInt("id"));
				materialConsumo.setDescricao(rs.getString("descricao"));
				materialConsumo.setCodigoDemanda(rs.getString("codigomaterial"));
				materialConsumo.setValorUnitario(rs.getFloat("valorunitario"));
				materialConsumo.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				materialConsumo.setQuantidade(rs.getInt("quantidade"));
				materialConsumo.setSubItem(rs.getString("subitem"));
				materialConsumo.setPeriodo(rs.getString("periodo"));
				materialConsumo.setJustificativa(rs.getString("justificativa"));
				materialConsumo.setUnidadeMedida(rs.getString("unidademedida"));
				
				materiaisConsumo.add(materialConsumo);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisConsumo;
	}

	public boolean alterar(MaterialConsumo materialConsumo, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, unidademedida = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);
		stmt.setString(1, materialConsumo.getDescricao());
		stmt.setString(2, materialConsumo.getUnidadeMedida());
		stmt.setFloat(3, materialConsumo.getValorUnitario());
		stmt.setInt(4, materialConsumo.getQuantidade());
		stmt.setString(5, materialConsumo.getPeriodo());
		stmt.setString(6, materialConsumo.getJustificativa());
		stmt.setInt(7, id);

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
