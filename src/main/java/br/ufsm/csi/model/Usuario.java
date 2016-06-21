package br.ufsm.csi.model;

public class Usuario {
	
	private long siape;
	private String nome;
	private String senha;
	
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
}
