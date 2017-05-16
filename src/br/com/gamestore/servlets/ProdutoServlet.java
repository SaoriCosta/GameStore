package br.com.gamestore.servlets;

import java.awt.Image;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Categoria;
import br.com.gamestore.entidades.Produto;
import br.com.gamestore.exceptions.CadastroException;
import br.com.gamestore.persistences.CategoriaManager;
import br.com.gamestore.persistences.ProdutoManager;



@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdutoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nome, descricao,codigo;
		double preco;
		boolean promocao;
		
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
		preco = Double.parseDouble(request.getParameter("preco"));
		promocao = Boolean.parseBoolean(request.getParameter("promocao")) ;
		codigo = request.getParameter("codigo");
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		if(nome == null || descricao == null || preco == 0.0  || codigo == null){
			throw new CadastroException();
		}
		
		Produto produto = new Produto();
		
		Categoria cat = new Categoria();
		cat.setId(id);
		cat.setNome(CategoriaManager.getCategoria().get(id).getNome());
		
		produto.setNome(nome);
		produto.setDescricao(descricao);
		produto.setCategoria(cat);
		
		produto.setPreco(preco);
		produto.setPromocao(promocao);
		produto.setCodigo(codigo);
		
		
		ProdutoManager.addProduto(produto);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
		
		//		doGet(request, response);
	}

}
