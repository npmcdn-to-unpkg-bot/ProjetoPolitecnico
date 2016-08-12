package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.MaterialPermanente;

public class MaterialPermanenteDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(MaterialPermanente materialPermanente, String numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (id, numeroprojeto, codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa)"
			+ " VALUES (default, ?,?,?,?,?,?,?,?);";
		
		stmt = conn.prepareStatement(query);
		
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, materialPermanente.getSubItem());
		stmt.setString(3, materialPermanente.getDescricao());
		stmt.setString(4, materialPermanente.getUnidadeMedida());
		stmt.setFloat(5, materialPermanente.getValorUnitario());
		stmt.setInt(6, materialPermanente.getQuantidade());
		stmt.setString(7, materialPermanente.getPeriodo());
		stmt.setString(8, materialPermanente.getJustificativa());
		
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

	public ArrayList<MaterialPermanente> lista(String numeroProjeto) {
		
		ArrayList<MaterialPermanente> materiaisPermanente = new ArrayList<MaterialPermanente>();
		
		try{
			this.query = " SELECT id, itens.codigomaterial, descricao, subitem, valorunitario, quantidade, "
				+ "valorunitario * quantidade as valortotal, unidademedida, periodo, justificativa"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 4 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				MaterialPermanente materialPermanente = new MaterialPermanente();
				
				materialPermanente.setId(rs.getInt("id"));
				materialPermanente.setDescricao(rs.getString("descricao"));
				materialPermanente.setCodigoDemanda(rs.getString("codigomaterial"));
				materialPermanente.setSubItem(rs.getString("subitem"));
				materialPermanente.setValorTotal(rs.getFloat("valortotal"));
				materialPermanente.setValorUnitario(rs.getFloat("valorunitario"));
				materialPermanente.setQuantidade(rs.getInt("quantidade"));
				materialPermanente.setUnidadeMedida(rs.getString("unidademedida"));
				materialPermanente.setPeriodo(rs.getString("periodo"));
				materialPermanente.setJustificativa(rs.getString("justificativa"));
							
				materiaisPermanente.add(materialPermanente);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisPermanente;
	}

	public ArrayList<MaterialPermanente> getMaterialPermanente(int id) {
		
		ArrayList<MaterialPermanente> materiaisPermanente = new ArrayList<MaterialPermanente>();
		
		try{
			this.query = " SELECT id, subitem, itens.codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND id = ?; ";

			
			stmt = conn.prepareStatement(this.query);
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			String[] meses;
			String periodo;
			
			while(rs.next()){
				MaterialPermanente materialPermanente = new MaterialPermanente();
				
				materialPermanente.setId(rs.getInt("id"));
				materialPermanente.setDescricao(rs.getString("descricao"));
				materialPermanente.setCodigoDemanda(rs.getString("codigomaterial"));
				materialPermanente.setValorUnitario(rs.getFloat("valorunitario"));
				materialPermanente.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				materialPermanente.setQuantidade(rs.getInt("quantidade"));
				materialPermanente.setSubItem(rs.getString("subitem"));
				materialPermanente.setJustificativa(rs.getString("justificativa"));
				materialPermanente.setUnidadeMedida(rs.getString("unidademedida"));
				
				periodo = rs.getString("periodo");
				meses = periodo.split(",");
				periodo = "";
				for(int i=0; i<meses.length; i++)
					periodo += "'" +meses[i] + "',";			
				materialPermanente.setPeriodo(periodo.substring(0, periodo.length()-1));
				
				materiaisPermanente.add(materialPermanente);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisPermanente;
	}

	public boolean remover(int id) throws SQLException{
		this.query = " DELETE FROM itens "
			+ " WHERE id = ?; ";
		
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

	public boolean alterar(MaterialPermanente materialPermanente, int id) throws SQLException {
		this.query = " UPDATE itens "
			+ " SET descricao = ?, unidademedida = ?, valorunitario = ?, "
			+ " quantidade = ?, periodo = ?, justificativa = ? "
			+ " WHERE id = ?; ";

		stmt = conn.prepareStatement(this.query);	
		stmt.setString(1, materialPermanente.getDescricao());
		stmt.setString(2, materialPermanente.getUnidadeMedida());
		stmt.setFloat(3, materialPermanente.getValorUnitario());
		stmt.setInt(4, materialPermanente.getQuantidade());
		stmt.setString(5, materialPermanente.getPeriodo());
		stmt.setString(6, materialPermanente.getJustificativa());
		stmt.setLong(7, id);

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
