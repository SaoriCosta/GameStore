package br.com.gamestore.entidades;

import java.util.Date;
import java.util.List;

public class Venda {
	
	private Date data;
	private List<Produto> produtos;
	private int codigo;
	private double preco_total;
	
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	
	public List<Produto> getProdutos() {
		return produtos;
	}
	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public double getPreco_total() {
		return preco_total;
	}
	public void setPreco_total(double preco_total) {
		this.preco_total = preco_total;
	}
	

}
