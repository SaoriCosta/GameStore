package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.persistences.AdminManager;
import br.com.gamestore.persistences.UsuarioManager;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		
		if(email != null || senha!=null){
			if(UsuarioManager.getUsuario().containsKey(email)){
				if(UsuarioManager.getUsuario().get(email).getSenha().equals(senha)){
					request.getSession().setAttribute("user", UsuarioManager.getUsuario().get(email));
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}else{
					request.setAttribute("erro", "Senha Inv�lida");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			}else if(AdminManager.getAdmin().containsKey(email)){
				if(AdminManager.getAdmin().get(email).getSenha().equals(senha)){
					request.getSession().setAttribute("admin", AdminManager.getAdmin().get(email));
					request.getRequestDispatcher("/administrator").forward(request, response);
				}else{
					request.setAttribute("erro", "Senha Inv�lida");
					request.getRequestDispatcher("../login.jsp").forward(request, response);
				}
			}else{
				request.setAttribute("erro", "Usu�rio Inexistente");
				request.getRequestDispatcher("../login.jsp").forward(request, response);
			}
		
		}else{
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
			
		
	}

}
