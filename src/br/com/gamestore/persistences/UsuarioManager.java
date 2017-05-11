package br.com.gamestore.persistences;

import java.util.HashMap;

import br.com.gamestore.entidades.Usuario;

public class UsuarioManager {

	private static HashMap<String, Usuario> usuario = new HashMap<String, Usuario>(4);
	private static int idCount = 0;

	public static HashMap<String, Usuario> getUsuario() {
		return usuario;
	}

	public static void setUsuario(HashMap<String, Usuario> usuario) {
		UsuarioManager.usuario = usuario;
	}

	public static void addUsuario(Usuario user){
		
		if(usuario.containsKey(user.getEmail())){
			user.setId(usuario.get(user.getEmail()).getId());
			usuario.put(user.getEmail(), user);
		}else{
			idCount++;
			user.setId(idCount);
			usuario.put(user.getEmail(), user);
			
		}
		
	}
	
}
