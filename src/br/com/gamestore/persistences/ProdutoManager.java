package br.com.gamestore.persistences;

import java.util.HashMap;

import br.com.gamestore.entidades.Produto;

public class ProdutoManager {
	
	private static HashMap<String, Produto> produto = new HashMap<String, Produto>(4);
	private static int idCount = 0;

	public static HashMap<String, Produto> getProduto() {
		return produto;
	}

	public static void setProduto(HashMap<String, Produto> produto) {
		ProdutoManager.produto = produto;
	}
	

	public static void addProduto(Produto product){
		
		if(produto.containsKey(product.getCodigo())){
			product.setId(produto.get(product.getCodigo()).getId());
			produto.put(product.getCodigo(), product);
		}else{
			idCount++;
			product.setId(idCount);
			produto.put(product.getCodigo(), product);
		}
	}
}
