package br.com.gamestore.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Produto;
import br.com.gamestore.persistences.ProdutoManager;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query = request.getParameter("search");
		List<Produto> produtos = new ArrayList();
		
		for(String key : ProdutoManager.getProduto().keySet()){
			
			String nome = ProdutoManager.getProduto().get(key).getNome().toLowerCase();
			String desc = ProdutoManager.getProduto().get(key).getDescricao().toLowerCase();
			String cat_nome = ProdutoManager.getProduto().get(key).getCategoria().getNome().toLowerCase();
				if(cat_nome.equals("ação"))cat_nome = "acao";
				
			query = query.toLowerCase();
			
			if(nome.contains(query) || desc.contains(query) || cat_nome.contains(query)){
				produtos.add(ProdutoManager.getProduto().get(key));
			}else{
				
			}
		}
		
		request.setAttribute("resultList", produtos);
		request.getRequestDispatcher("/search.jsp").forward(request, response);
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
