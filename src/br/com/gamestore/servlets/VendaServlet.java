package br.com.gamestore.servlets;


import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gamestore.entidades.Produto;
import br.com.gamestore.entidades.Venda;
import br.com.gamestore.persistences.CarrinhoManager;
import br.com.gamestore.persistences.VendaManager;


@WebServlet("/venda")
public class VendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VendaServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		double codigo; // codigo aleatorio
		double preco_total;
		String s;
		
		// Atributo de html <input hidden name="s" value="${usuario.getEmail()}">
		s = request.getParameter("s");
		
		List<Produto> produto;
		produto = CarrinhoManager.getCarrinho().get(s);
		
		Date data = Date.valueOf(LocalDate.now());
		System.out.println(data);
		codigo = Math.random();
		preco_total = Double.parseDouble(request.getParameter("preco_total"));
		
		Venda venda = new Venda();
		venda.setData(data);
		venda.setPreco_total(preco_total);
		venda.setProdutos(produto);
		venda.setCodigo(codigo);
		VendaManager.addVenda(venda);
		
		request.getRequestDispatcher("/final-compra.jsp").forward(request, response);
		
		
		
		
		//doGet(request, response);
	}

}
