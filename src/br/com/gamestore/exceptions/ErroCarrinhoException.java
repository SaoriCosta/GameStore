package br.com.gamestore.exceptions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlets.WebdavServlet;

/**
 * Servlet implementation class ErroCarrinhoException
 */
@WebServlet("/ErroCarrinhoException")
public class ErroCarrinhoException extends WebdavServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		throw new CarrinhoException();
	}
}