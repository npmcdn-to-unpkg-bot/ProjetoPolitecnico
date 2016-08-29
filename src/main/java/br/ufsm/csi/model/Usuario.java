package br.ufsm.csi.model;

public class Usuario {
	
	private long siape;
	private String nomeCompleto;
	private String email;
	private String nome;
	private String senha;
	private boolean cadastro;
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public long getSiape() {
		return siape;
	}
	public void setSiape(long siape) {
		this.siape = siape;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	
	public boolean getCadastro() {
		return cadastro;
	}
	public void setCadastro(boolean cadastro) {
		this.cadastro = cadastro;
	}
}
