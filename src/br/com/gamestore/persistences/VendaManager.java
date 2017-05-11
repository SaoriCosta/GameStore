package br.com.gamestore.persistences;

import java.util.HashMap;
import java.util.TreeMap;

import br.com.gamestore.entidades.Venda;

public class VendaManager {
	
	private static TreeMap<Integer, Venda> venda = new TreeMap<Integer, Venda>();
	private static int cod = 0;

	public static TreeMap<Integer, Venda> getVenda() {
		return venda;
	}

	public static void setVenda(TreeMap<Integer, Venda> venda) {
		VendaManager.venda = venda;
	}
	
	public static void addVenda(Venda vd){
		
		vd.setCodigo(cod++);
		venda.put(vd.getCodigo(), vd);
	}
}
