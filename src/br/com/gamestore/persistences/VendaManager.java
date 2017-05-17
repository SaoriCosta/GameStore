package br.com.gamestore.persistences;

import java.util.HashMap;
import java.util.TreeMap;

import br.com.gamestore.entidades.Venda;

public class VendaManager {
	
	private static TreeMap<Double, Venda> venda = new TreeMap<Double, Venda>();
	private static int cod = 0;

	public static TreeMap<Double, Venda> getVenda() {
		return venda;
	}

	public static void setVenda(TreeMap<Double, Venda> venda) {
		VendaManager.venda = venda;
	}
	
	public static void addVenda(Venda vd){
		
		vd.setCodigo(cod++);
		venda.put(vd.getCodigo(), vd);
	}
}
