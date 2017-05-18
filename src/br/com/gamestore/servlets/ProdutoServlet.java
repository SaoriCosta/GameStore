package br.com.gamestore.servlets;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.naming.Context;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.swing.text.html.ImageView;

import br.com.gamestore.entidades.Categoria;
import br.com.gamestore.entidades.Produto;
import br.com.gamestore.exceptions.CadastroException;
import br.com.gamestore.persistences.CategoriaManager;
import br.com.gamestore.persistences.ProdutoManager;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




@javax.servlet.annotation.MultipartConfig


@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private static HttpServletRequest req; 
    public ProdutoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome, descricao,codigo;
		String preco;
		boolean promocao;
		
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
		preco = request.getParameter("preco");
		promocao = Boolean.parseBoolean(request.getParameter("promocao")) ;
		codigo = request.getParameter("codigo");
		String id = request.getParameter("id");
		
		if(nome == null || descricao == null || preco == null || codigo == null || codigo == null){
			throw new CadastroException();
		}
		
		if(id != null){
			Categoria cat = new Categoria();
			cat.setId(Integer.parseInt(id));
			cat.setNome(CategoriaManager.getCategoria().get(Integer.parseInt(id)).getNome());
			
			Produto produto = new Produto();
			produto.setNome(nome);
			produto.setDescricao(descricao);
			produto.setCategoria(cat);
			
			produto.setPreco(Double.parseDouble(preco));
			produto.setPromocao(promocao);
			produto.setCodigo(codigo);
	        
	     
	    	ProdutoManager.addProduto(produto);
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		}
	}

}
