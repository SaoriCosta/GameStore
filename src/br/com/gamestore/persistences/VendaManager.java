package br.com.gamestore.persistences;

import java.util.HashMap;
import java.util.TreeMap;

import br.com.gamestore.entidades.Venda;

public class VendaManager {
	
	private static HashMap<Double, Venda> venda = new HashMap<Double, Venda>();
	private static int cod = 0;

	public static HashMap<Double, Venda> getVenda() {
		return venda;
	}

	public static void setVenda(HashMap<Double, Venda> venda) {
		VendaManager.venda = venda;
	}
	
	public static void addVenda(Venda vd){

		venda.put(vd.getCodigo(), vd);
	}
}
