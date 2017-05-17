package br.com.gamestore.persistences;

import java.util.HashMap;
import java.util.TreeMap;

import br.com.gamestore.entidades.Categoria;

public class CategoriaManager {
	
	private static HashMap<Integer, Categoria>  categoria =  new HashMap<Integer, Categoria>(4);
	private static int idCount = categoria.size();

	public static HashMap<Integer, Categoria> getCategoria() {
		return categoria;
	}

	public static void setCategoria(HashMap<Integer, Categoria> categoria) {
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
