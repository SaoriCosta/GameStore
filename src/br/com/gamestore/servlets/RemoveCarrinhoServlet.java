package br.com.gamestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import br.com.gamestore.persistences.CarrinhoManager;


@WebServlet("/removeCarrinho")
public class RemoveCarrinhoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RemoveCarrinhoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String codigo, cpf;
		
		codigo = request.getParameter("codigo");
		cpf = request.getParameter("cpf");
		
		JOptionPane.showMessageDialog(null, "EMAIL: "+cpf);
		
		for(int i = 0; i < CarrinhoManager.getCarrinho().get(cpf).size(); i++){
			if(CarrinhoManager.getCarrinho().get(cpf).get(i).getCodigo().equals(codigo)){
				CarrinhoManager.getCarrinho().get(cpf).remove(i);
					break;
			}
		}
		
		request.getRequestDispatcher("/carrinho.jsp").forward(request, response);
	
		
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
