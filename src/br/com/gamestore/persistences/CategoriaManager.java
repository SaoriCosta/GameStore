package br.com.gamestore.persistences;

import java.util.TreeMap;

import br.com.gamestore.entidades.Categoria;

public class CategoriaManager {
	
	private static TreeMap<Integer, Categoria>  categoria =  new TreeMap<Integer, Categoria>();
	private static int idCount = 0;

	public static TreeMap<Integer, Categoria> getCategoria() {
		return categoria;
	}

	public static void setCategoria(TreeMap<Integer, Categoria> categoria) {
		CategoriaManager.categoria = categoria;
	}

	public static void addCategoria(Categoria cat){
		
		if(categoria.containsKey(cat.getId())){
			cat.setId(categoria.get(cat.getId()).getId());
			categoria.put(cat.getId(), cat);
		}else{
			cat.setId(idCount++);
			categoria.put(cat.getId(), cat);
		}
	}
	
}
