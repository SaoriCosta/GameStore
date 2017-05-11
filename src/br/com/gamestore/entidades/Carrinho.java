package br.com.gamestore.entidades;

import java.util.List;

public class Carrinho {
	
	private Produto produto;
	private double preco_acumulado;
	
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public double getPreco_acumulado() {
		return preco_acumulado;
	}
	public void setPreco_acumulado(double preco_acumulado) {
		this.preco_acumulado = preco_acumulado;
	}
	
	

}
