package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Categoria;
import br.com.gamestore.entidades.Produto;
import br.com.gamestore.entidades.Usuario;
import br.com.gamestore.persistences.CarrinhoManager;


@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CarrinhoServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome, descricao;
		double preco;
		boolean promocao;
		Categoria categoria;
		String codigo;
		
		
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
		preco = Double.parseDouble(request.getParameter("preco"));
		promocao = Boolean.parseBoolean(request.getParameter("promocao"));
		codigo = request.getParameter("codigo");
		
		Produto p = new Produto();
		
		p.setNome(nome);
		p.setDescricao(descricao);
		p.setPreco(preco);
		p.setPromocao(promocao);
		p.setCodigo(codigo);
		
		Usuario user = (Usuario)request.getSession().getAttribute("user");
		if(CarrinhoManager.getCarrinho().get(user)!= null)
			request.setAttribute("qtd", CarrinhoManager.getCarrinho().get(user.getCpf()).size());
		
		CarrinhoManager.addCarrinho(user, p);
		request.setAttribute("qtd", CarrinhoManager.getCarrinho().get(user.getCpf()).size());
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
		//doGet(request, response);
	}

}
