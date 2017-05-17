package br.com.gamestore.persistences;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import br.com.gamestore.entidades.Produto;
import br.com.gamestore.entidades.Usuario;

public class CarrinhoManager {
	
	private static HashMap<String, List<Produto>> carrinho = new HashMap<String, List<Produto>>(4);
	
	public static HashMap<String, List<Produto>> getCarrinho() {
		return carrinho;
	}

	public static void setCarrinho(HashMap<String, List<Produto>> carrinho) {
		CarrinhoManager.carrinho = carrinho;
	}
	public static void addCarrinho(Usuario user, Produto product){
		
		if(carrinho.containsKey(user.getCpf())){
			List<Produto> list = carrinho.get(user.getCpf());
			list.add(product);
		}else{
			List<Produto> pd = new ArrayList<Produto>();
			pd.add(product);
			carrinho.put(user.getCpf(), pd);
		}
	}
}
