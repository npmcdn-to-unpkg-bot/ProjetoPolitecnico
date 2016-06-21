package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.ufsm.csi.model.MaterialConsumo;
import br.ufsm.csi.model.MaterialPermanente;

public class MaterialPermanenteDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public boolean adicionar(MaterialPermanente materialPermanente, long numeroProjeto) throws SQLException {
		query = "INSERT INTO itens (numeroprojeto, codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa)"
			+ " VALUES (?,?,?,?,?,?,?,?);";
		
		stmt = conn.prepareStatement(query);
		
		stmt.setLong(1, numeroProjeto);
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

	public ArrayList<MaterialPermanente> lista(long numeroProjeto) {
		
		ArrayList<MaterialPermanente> materiaisPermanente = new ArrayList<MaterialPermanente>();
		
		try{
			this.query = " SELECT itens.codigomaterial, subitem, valorunitario * quantidade as valortotal"
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND material.codigodemanda = 4 "
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				MaterialPermanente materialPermanente = new MaterialPermanente();
				
				materialPermanente.setCodigoDemanda(rs.getString("codigomaterial"));
				materialPermanente.setSubItem(rs.getString("subitem"));
				materialPermanente.setValorTotal(rs.getFloat("valortotal"));
				
				materiaisPermanente.add(materialPermanente);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisPermanente;
	}

	public ArrayList<MaterialPermanente> getMaterialPermanente(long numeroProjeto, String codigoMaterial, float valorTotal) {
		
		ArrayList<MaterialPermanente> materiaisPermanente = new ArrayList<MaterialPermanente>();
		
		try{
			this.query = " SELECT subitem, itens.codigomaterial, descricao, unidademedida, valorunitario, quantidade, periodo, justificativa "
				+ " FROM itens, material "
				+ " WHERE itens.codigomaterial = material.codigomaterial "
				+ " AND itens.codigomaterial = ? "
				+ " AND (valorunitario * quantidade) = ?"
				+ " AND numeroprojeto = ?; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, codigoMaterial);
			stmt.setFloat(2, valorTotal);
			stmt.setLong(3, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				MaterialPermanente materialPermanente = new MaterialPermanente();
				
				materialPermanente.setDescricao(rs.getString("descricao"));
				materialPermanente.setCodigoDemanda(rs.getString("codigomaterial"));
				materialPermanente.setValorUnitario(rs.getFloat("valorunitario"));
				materialPermanente.setValorTotal(rs.getFloat("valorunitario") * rs.getInt("quantidade"));
				materialPermanente.setQuantidade(rs.getInt("quantidade"));
				materialPermanente.setSubItem(rs.getString("subitem"));
				materialPermanente.setPeriodo(rs.getString("periodo"));
				materialPermanente.setJustificativa(rs.getString("justificativa"));
				materialPermanente.setUnidadeMedida(rs.getString("unidademedida"));
				
				materiaisPermanente.add(materialPermanente);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return materiaisPermanente;
	}

	public boolean remover(long numeroProjeto, String codigoMaterial, float valorTotal) throws SQLException{
		this.query = " DELETE FROM itens "
			+ " WHERE numeroProjeto = ? "
			+ " AND codigomaterial = ?"
			+ " AND (valorunitario * quantidade) = ?; ";
		
		stmt = conn.prepareStatement(this.query);
			
		stmt.setLong(1, numeroProjeto);
		stmt.setString(2, codigoMaterial);
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

	public boolean alterar(MaterialPermanente materialPermanente, long numeroProjeto, String codigoMaterial, float valorTotal) throws SQLException {
		this.query = " UPDATE itens "
				+ " SET descricao = ?, unidademedida = ?, valorunitario = ?, "
				+ " quantidade = ?, periodo = ?, justificativa = ? "
				+ " WHERE numeroProjeto = ? "
				+ " AND codigomaterial = ? "
				+ " AND (valorunitario * quantidade) = ?; ";

			stmt = conn.prepareStatement(this.query);
				
			stmt.setString(1, materialPermanente.getDescricao());
			stmt.setString(2, materialPermanente.getUnidadeMedida());
			stmt.setFloat(3, materialPermanente.getValorUnitario());
			stmt.setInt(4, materialPermanente.getQuantidade());
			stmt.setString(5, materialPermanente.getPeriodo());
			stmt.setString(6, materialPermanente.getJustificativa());
			stmt.setLong(7, numeroProjeto);
			stmt.setString(8, codigoMaterial);
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
