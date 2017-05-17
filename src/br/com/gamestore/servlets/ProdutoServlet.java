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
		String filePath = null;
		req = request;
		
		String nome, descricao,codigo;
		String preco;
		boolean promocao;
		String id;
		List<String> list =  new ArrayList();
	
		
		
	
		
		Produto produto = new Produto();
		nome = list.get(0);
		descricao = list.get(1);
		preco = list.get(2);
		promocao = Boolean.parseBoolean(list.get(3));
		codigo = list.get(4);
		id = list.get(5);
		
	/*	nome = req.getParameter("nome");
		descricao = req.getParameter("descricao");
		preco = req.getParameter("preco");
		promocao = Boolean.parseBoolean(req.getParameter("promocao")) ;
		codigo = req.getParameter("codigo");
		String id = req.getParameter("id");
		*/
		
		if(nome == null) System.out.println("nome nulo");
		if(descricao == null) System.out.println("desc nulo");
		if(preco == null) System.out.println("prec nulo");
		if(codigo == null) System.out.println("codigo nulo");
		
		if(nome == null || descricao == null || preco == null  || codigo == null){
			throw new CadastroException();
		}
		
		Categoria cat = new Categoria();
		cat.setId(Integer.parseInt(id));
		cat.setNome(CategoriaManager.getCategoria().get(Integer.parseInt(id)).getNome());
		
		produto.setNome(nome);
		produto.setDescricao(descricao);
		produto.setCategoria(cat);
		
		produto.setPreco(Double.parseDouble(preco));
		produto.setPromocao(promocao);
		produto.setCodigo(codigo);
        
        produto.setImage(filePath);
        
    	ProdutoManager.addProduto(produto);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	
	
		
		
		//		doGet(request, response);
	}

}
