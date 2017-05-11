package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Produto;
import br.com.gamestore.persistences.ProdutoManager;


@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdutoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nome, descricao, categoria;
		double preco;
		boolean promocao;
		
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
	    //categoria = request.getParameter("categoria");
		preco = Double.parseDouble(request.getParameter("preco"));
		promocao = Boolean.parseBoolean(request.getParameter("promocao")) ;
		
		Produto produto = new Produto();
		
		produto.setNome(nome);
		produto.setDescricao(descricao);
		//produto.setCategoria(categoria);
		produto.setPreco(preco);
		produto.setPromocao(promocao);
		
		ProdutoManager.addProduto(produto);
		
		request.getRequestDispatcher("/administrator/index.jsp").forward(request, response);
		
		
		//		doGet(request, response);
	}

}
