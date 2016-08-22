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
		query = "INSERT INTO projeto VALUES (?,?,?, CURRENT_DATE, false, ?,?);";
		
		stmt = conn.prepareStatement(query);		
		stmt.setLong(1, projeto.getSiape());
		stmt.setString(2, projeto.getNomeProjeto());
		stmt.setString(3, projeto.getNumeroProjeto());
		stmt.setString(4, projeto.getJustificativa());
		stmt.setString(5, projeto.getModalidade());

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
		
		this.query = " UPDATE projeto SET nomeProjeto = ?, "
			+ " modalidade = ?, justificativa = ? "
			+ " WHERE numeroProjeto = ? ; ";
			
		stmt = conn.prepareStatement(this.query);
			
		stmt.setString(1, projeto.getNomeProjeto());
		stmt.setString(2, projeto.getModalidade());
		stmt.setString(3, projeto.getJustificativa());
		stmt.setString(4, projeto.getNumeroProjeto());

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
	
	public boolean remover (String numeroProjeto) throws Exception{
		
		this.query = " BEGIN; "
			+ " DELETE FROM itens WHERE numeroProjeto = ?; "
			+ " DELETE FROM projeto WHERE numeroProjeto = ?; "
			+ " COMMIT; ";
			
		stmt = conn.prepareStatement(this.query);		
		stmt.setString(1, numeroProjeto);
		stmt.setString(2, numeroProjeto);

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
	
	public Projeto listaProjeto (String numeroProjeto){
		
		Projeto projeto = new Projeto();
		
		try{
			this.query = " SELECT nomeprojeto, numeroprojeto, "
				+ " justificativa, modalidade, nome AS proponente "
				+ " FROM projeto, usuario "
				+ " WHERE numeroProjeto = ? "
				+ " AND projeto.siape = usuario.siape "
				+ " AND finalizado = false; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				projeto.setProponente(rs.getString("proponente"));
				projeto.setNomeProjeto(rs.getString("nomeProjeto"));
				projeto.setNumeroProjeto(rs.getString("numeroProjeto"));
				projeto.setJustificativa(rs.getString("justificativa"));
				projeto.setModalidade(rs.getString("modalidade"));
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
				
				projeto.setNumeroProjeto(rs.getString("numeroProjeto"));
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
	
	public ArrayList<Demanda> getDemandas (String numeroProjeto){
		
		ArrayList<Demanda> demandas = new ArrayList<Demanda>();

		try{
			this.query = " SELECT demanda.codigodemanda, natureza, sum(valorunitario * quantidade), count(itens.codigomaterial) "
				+ " FROM material INNER JOIN itens "
				+ " ON material.codigomaterial = itens.codigomaterial "
				+ " RIGHT JOIN demanda "
				+ " ON demanda.codigodemanda = material.codigodemanda "
				+ " AND numeroprojeto = ? "
				+ " WHERE demanda.codigodemanda != 6 "
				+ " GROUP BY demanda.codigodemanda, natureza "
				+ " ORDER BY demanda.codigodemanda; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Demanda demanda = new Demanda();
				
				demanda.setCodigoDemanda(rs.getString("codigodemanda"));
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
	
	public Projeto projetoFinalizado (String numeroProjeto) throws Exception{
		
		Projeto projeto = new Projeto();

		try{
			this.query = " SELECT projeto.siape, nome, modalidade, numeroprojeto, nomeprojeto "
				+ " FROM usuario, projeto "
				+ " WHERE usuario.siape = projeto.siape "
				+ " AND numeroprojeto = ? ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);

			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				projeto.setSiape(rs.getLong("siape"));
				projeto.setProponente(rs.getString("nome"));
				projeto.setModalidade(rs.getString("modalidade"));
				projeto.setNumeroProjeto(rs.getString("numeroprojeto"));
				projeto.setNomeProjeto(rs.getString("nomeprojeto"));
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return projeto;
	}

	public ArrayList<Demanda> Itens (String numeroProjeto) throws Exception{

		ArrayList<Demanda> itens = new ArrayList<Demanda>();

		try{
			this.query = " SELECT natureza, material.codigomaterial, descricao, unidademedida, valorunitario, quantidade, "
				+ " valorunitario * quantidade AS total, periodo, justificativa "
				+ " FROM demanda, material, itens "
				+ " WHERE demanda.codigodemanda = material.codigodemanda "
				+ " AND material.codigomaterial = itens.codigomaterial "
				+ " AND numeroprojeto = ? "
				+ " ORDER BY natureza; ";
			
			stmt = conn.prepareStatement(this.query);
			stmt.setString(1, numeroProjeto);

			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Demanda item = new Demanda();
				
				if(rs.getString("codigomaterial").length() > 1){
					if(rs.getString("codigomaterial").equals("2.1")){
						item.setCodigoDemanda("Passagem/Terrestre");
					}else if(rs.getString("codigomaterial").equals("2.2")){
						item.setCodigoDemanda("Passagem/Aéria");
					}else
						item.setCodigoDemanda(rs.getString("codigomaterial"));
				}else
					item.setCodigoDemanda("-");
				
				item.setDemanda(rs.getString("natureza"));
				item.setDescricao(rs.getString("descricao"));
				item.setUnidadeMedida(rs.getString("unidademedida"));
				item.setValorUnitario(rs.getFloat("valorunitario"));				
				item.setQuantidade(rs.getInt("quantidade"));
				item.setPeriodo(rs.getString("periodo"));
				item.setJustificativa(rs.getString("justificativa"));

				if(item.getDemanda().equals("Bolsas")){
					String[] meses = rs.getString("periodo").split(",");
					item.setValorTotal(
						(rs.getFloat("valorunitario") * meses.length) * rs.getInt("quantidade")
					);
				}else
					item.setValorTotal(rs.getFloat("total"));
				
				itens.add(item);
			}
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return itens;	
	}
	
	public boolean finalizar (String numeroProjeto) throws Exception{
	
		this.query = " UPDATE projeto SET finalizado = true WHERE numeroProjeto = ? ;";
	
		stmt = conn.prepareStatement(this.query);	
		stmt.setString(1, numeroProjeto);

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
