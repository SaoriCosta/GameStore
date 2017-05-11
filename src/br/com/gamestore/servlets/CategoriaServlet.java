package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Categoria;
import br.com.gamestore.persistences.CategoriaManager;


@WebServlet("/categoria")
public class CategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome ,descricao;
		
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
		
		Categoria categoria = new Categoria();
		categoria.setNome(nome);
		categoria.setDescricao(descricao);

		CategoriaManager.addCategoria(categoria);
		
		request.getRequestDispatcher("/categorias.jsp").forward(request, response);
	}

}
