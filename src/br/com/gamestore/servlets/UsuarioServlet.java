package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Usuario;
import br.com.gamestore.exceptions.CadastroException;
import br.com.gamestore.persistences.UsuarioManager;
import sun.rmi.server.Dispatcher;


@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UsuarioServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome, email, senha, cpf;
		
		nome = request.getParameter("nome");
		email = request.getParameter("email");
		senha = request.getParameter("senha");
		cpf = request.getParameter("cpf");
		
		
		if(nome == null || email == null || senha == null || cpf == null){
			
			throw new CadastroException();
		}else{
			Usuario user = new Usuario();
			
			user.setCpf(cpf);
			user.setEmail(email);
			user.setSenha(senha);
			user.setNome(nome);
			
			
			UsuarioManager.addUsuario(user);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	
	
		
		//doGet(request, response);
	}

}
