package br.com.gamestore.entidades;

import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class Produto {
	
	private String codigo;
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	private String nome;
	private String descricao;
	private int id;
	private Categoria categoria;
	private double preco;
	private boolean promocao;
	private ImageView image;
	
	
	public ImageView getImage() {
		return image;
	}
	public void setImage(ImageView imageView) {
		this.image = imageView;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public boolean isPromocao() {
		return promocao;
	}
	public void setPromocao(boolean promocao) {
		this.promocao = promocao;
	}

}
