package br.com.gamestore.exceptions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CarrinhoException")
public class CarrinhoException extends ServletException {
	private static final long serialVersionUID = 1L;
	
	public CarrinhoException(){
		super("Carrinho Vazio!");
	}
}
