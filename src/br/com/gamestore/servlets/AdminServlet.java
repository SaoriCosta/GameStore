package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Administrador;
import br.com.gamestore.persistences.AdminManager;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome, cpf, senha;
		
		nome = request.getParameter("nome");
		cpf = request.getParameter("cpf");
		senha = request.getParameter("senha");
		
		Administrador admin = new Administrador();
		
		admin.setNome(nome);
		admin.setCpf(cpf);
		admin.setSenha(senha);
		
		AdminManager.addAdmin(admin);
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		
		
		//doGet(request, response);
	}

}
