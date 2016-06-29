package br.ufsm.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.ufsm.csi.model.Demanda;
import br.ufsm.csi.model.Projeto;
import br.ufsm.csi.model.Usuario;

public class ProjetoDAO {
	private Connection conn = (Connection) PostgreSQLFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String query;
	
	public Usuario altenticarUsuario (Usuario usuario) throws Exception{
		this.query = " SELECT nome FROM usuario WHERE siape = ? AND senha = ? ; ";
		
		try{
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, usuario.getSiape());
			stmt.setString(2, usuario.getSenha());
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				usuario.setNome(rs.getString("nome"));
				
				return usuario;
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean adicionar (Projeto projeto) throws Exception{		
		query = "INSERT INTO projeto VALUES (?,?,?,?, CURRENT_DATE, false);";
		
		stmt = conn.prepareStatement(query);		
		stmt.setLong(1, projeto.getSiape());
		stmt.setString(2, projeto.getProponente());
		stmt.setString(3, projeto.getNomeProjeto());
		stmt.setLong(4, projeto.getNumeroProjeto());

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
	
	public boolean modificar (Projeto projeto) throws Exception{
		
		this.query = " UPDATE projeto SET nomeProjeto = ? WHERE numeroProjeto = ? ;";
			
		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, projeto.getNomeProjeto());
		stmt.setLong(2, projeto.getNumeroProjeto());

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
	
	public boolean remover (long numeroProjeto) throws Exception{
		
		this.query = " BEGIN; "
			+ " DELETE FROM itens WHERE numeroProjeto = ?; "
			+ " DELETE FROM projeto WHERE numeroProjeto = ?; "
			+ " COMMIT; ";
			
		stmt = conn.prepareStatement(this.query);		
		stmt.setLong(1, numeroProjeto);
		stmt.setLong(2, numeroProjeto);

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
	
	public Projeto listaProjeto (long numeroProjeto){
		
		Projeto projeto = new Projeto();
		
		try{
			this.query = " SELECT * FROM projeto "
				+ " WHERE numeroProjeto = ? "
				+ " AND finalizado = false; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				projeto.setProponente(rs.getString("proponente"));
				projeto.setNomeProjeto(rs.getString("nomeProjeto"));
				projeto.setNumeroProjeto(rs.getLong("numeroProjeto"));
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return projeto;
	}
	
	public ArrayList<Projeto> getProjetos (long siape){
		
		ArrayList<Projeto> projetos = new ArrayList<Projeto>();
		
		try{
			this.query = " SELECT projeto.numeroprojeto, nomeprojeto, datacriacao, finalizado"
				+ " FROM projeto"
				+ " WHERE siape = ? "
				+ " ORDER BY dataCriacao, finalizado; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, siape);

			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Projeto projeto = new Projeto();
				
				projeto.setNumeroProjeto(rs.getLong("numeroProjeto"));
				projeto.setNomeProjeto(rs.getString("nomeProjeto"));
				projeto.setDataCriacao(rs.getDate("dataCriacao"));
				projeto.setFinalizado(rs.getBoolean("finalizado"));
				
				projetos.add(projeto);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return projetos;
	}
	
public ArrayList<Demanda> getDemandas (long numeroProjeto){
		
		ArrayList<Demanda> demandas = new ArrayList<Demanda>();

		try{
			this.query = " SELECT demanda.codigodemanda, natureza, sum(valorunitario * quantidade), count(itens.codigomaterial) "
				+ " FROM material INNER JOIN itens "
				+ " ON material.codigomaterial = itens.codigomaterial "
				+ " RIGHT JOIN demanda "
				+ " ON demanda.codigodemanda = material.codigodemanda "
				+ " AND numeroprojeto = ? "
				+ " GROUP BY demanda.codigodemanda, natureza "
				+ " ORDER BY demanda.codigodemanda; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setLong(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Demanda demanda = new Demanda();
				
				demanda.setCodigoDemanda(rs.getInt("codigodemanda"));
				demanda.setDemanda(rs.getString("natureza"));
				demanda.setValorTotal(rs.getFloat("sum"));
				demanda.setQuantidade(rs.getInt("count"));
				
				demandas.add(demanda);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return demandas;
	}

	public boolean finalizar (long numeroProjeto) throws Exception{
	
		this.query = " UPDATE projeto SET finalizado = true WHERE numeroProjeto = ? ;";
	
		stmt = conn.prepareStatement(this.query);	
		stmt.setLong(1, numeroProjeto);

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
