package br.ufsm.csi.model;

public class MaterialPermanente {
	
	private int id;
	private String demanda;
	private String codigoDemanda;
	private String descricao;
	private String unidadeMedida;
	private String subItem;
	private float valorUnitario;
	private int quantidade;
	private float valorTotal;
	private String periodo;
	private String justificativa;
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getUnidadeMedida() {
		return unidadeMedida;
	}
	public void setUnidadeMedida(String unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}
	
	public String getSubItem() {
		return subItem;
	}
	public void setSubItem(String subItem) {
		this.subItem = subItem;
	}
	
	public float getValorUnitario() {
		return valorUnitario;
	}
	public void setValorUnitario(float valorUnitario) {
		this.valorUnitario = valorUnitario;
	}
	
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	
	public String getJustificativa() {
		return justificativa;
	}
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	public String getCodigoDemanda() {
		return codigoDemanda;
	}
	public void setCodigoDemanda(String codigoDemanda) {
		this.codigoDemanda = codigoDemanda;
	}
	public float getValorTotal() {
		return valorTotal;
	}
	public void setValorTotal(float valorTotal) {
		this.valorTotal = valorTotal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDemanda() {
		return demanda;
	}
	public void setDemanda(String demanda) {
		this.demanda = demanda;
	}
}
