package br.com.gamestore.persistences;

import java.util.HashMap;

import br.com.gamestore.entidades.Produto;

public class ProdutoManager {
	
	private static HashMap<Integer, Produto> produto = new HashMap<Integer, Produto>(4);
	private static int idCount = 0;

	public static HashMap<Integer, Produto> getProduto() {
		return produto;
	}

	public static void setProduto(HashMap<Integer, Produto> produto) {
		ProdutoManager.produto = produto;
	}
	

	public static void addProduto(Produto product){
		
		if(produto.containsKey(product.getId())){
			product.setId(produto.get(product.getId()).getId());
			produto.put(product.getId(), product);
		}else{
			idCount++;
			product.setId(idCount);
			produto.put(product.getId(), product);
		}
	}
}
