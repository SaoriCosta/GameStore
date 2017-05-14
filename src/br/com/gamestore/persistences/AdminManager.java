package br.com.gamestore.persistences;

import java.util.HashMap;

import br.com.gamestore.entidades.Administrador;

public class AdminManager {

	private static HashMap<String,Administrador> admin = new HashMap<>(4);

	public static HashMap<String, Administrador> getAdmin() {
		return admin;
	}

	public static void setAdmin(HashMap<String, Administrador> admin) {
		AdminManager.admin = admin;
	}
	
	public static void addAdmin(Administrador administrador){
			if(admin.containsKey(administrador.getEmail())){
				administrador.setEmail(admin.get(administrador.getEmail()).getEmail());
				admin.put(administrador.getEmail(), administrador);
			}else{
				admin.put(administrador.getEmail(), administrador);
			}
	}
}
