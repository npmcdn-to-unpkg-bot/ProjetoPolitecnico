package br.ufsm.csi.model;

import java.sql.Date;

public class Projeto {
	
	private String proponente;
	private String nomeProjeto;
	private String numeroProjeto;
	private long siape;
	private Date dataCriacao;
	private boolean finalizado;
	private float valorTotal;
	private String justificativa;
	private Date dataFinalizacao;
	private String modalidade;
	
	public String getProponente() {
		return proponente;
	}
	public void setProponente(String proponente) {
		this.proponente = proponente;
	}
	
	public String getNomeProjeto() {
		return nomeProjeto;
	}
	public void setNomeProjeto(String nomeProjeto) {
		this.nomeProjeto = nomeProjeto;
	}
	
	public long getSiape() {
		return siape;
	}
	public void setSiape(long siape) {
		this.siape = siape;
	}
	
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	
	public boolean getFinalizado() {
		return finalizado;
	}
	public void setFinalizado(boolean finalizado) {
		this.finalizado = finalizado;
	}
	
	public float getValorTotal() {
		return valorTotal;
	}
	public void setValorTotal(float valorTotal) {
		this.valorTotal = valorTotal;
	}
	
	public String getJustificativa() {
		return justificativa;
	}
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	
	public Date getDataFinalizacao() {
		return dataFinalizacao;
	}
	public void setDataFinalizacao(Date dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}
	
	public String getModalidade() {
		return modalidade;
	}
	public void setModalidade(String modalidade) {
		this.modalidade = modalidade;
	}
	
	public String getNumeroProjeto() {
		return numeroProjeto;
	}
	public void setNumeroProjeto(String numeroProjeto) {
		this.numeroProjeto = numeroProjeto;
	}
}
