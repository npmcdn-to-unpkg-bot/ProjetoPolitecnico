package br.ufsm.csi.model;

import java.sql.Date;
import java.util.Calendar;

public class Projeto {
	
	private String proponente;
	private String nomeProjeto;
	private long numeroProjeto;
	private long siape;
	private Date dataCriacao;
	private boolean finalizado;
	private float valorTotal;
	
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
	
	public long getNumeroProjeto() {
		return numeroProjeto;
	}
	public void setNumeroProjeto(long numeroProjeto) {
		this.numeroProjeto = numeroProjeto;
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
	
	public boolean isFinalizado() {
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
}
