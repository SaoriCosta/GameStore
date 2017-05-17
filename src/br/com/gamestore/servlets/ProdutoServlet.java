package br.com.gamestore.servlets;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
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
		
		Produto produto = new Produto();
		nome = request.getParameter("nome");
		descricao = request.getParameter("descricao");
		preco = Double.parseDouble(request.getParameter("preco"));
		promocao = Boolean.parseBoolean(request.getParameter("promocao")) ;
		codigo = request.getParameter("codigo");
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		if(nome == null || descricao == null || preco == 0.0  || codigo == null){
			throw new CadastroException();
		}
		
		Categoria cat = new Categoria();
		cat.setId(id);
		cat.setNome(CategoriaManager.getCategoria().get(id).getNome());
		
		produto.setNome(nome);
		produto.setDescricao(descricao);
		produto.setCategoria(cat);
		
		produto.setPreco(preco);
		produto.setPromocao(promocao);
		produto.setCodigo(codigo);
		
		
		/*Identifica se o formulario é do tipo multipart/form-data*/
        if (ServletFileUpload.isMultipartContent(request)) {
        	
            try {
            	  JOptionPane.showMessageDialog(null, "vigah");
                /*Faz o parse do request*/
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
 
                /*Escreve a o arquivo na pasta img*/
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        item.write(new File(request.getServletContext().getRealPath("images")+ File.separator + request.getParameter("file")));
                    }
                }
           	
                request.setAttribute("message", "Arquivo carregado com sucesso");
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a "+ ex);
            }
 
        } else {
            request.setAttribute("message","Desculpe este Servlet lida apenas com pedido de upload de arquivos");
            JOptionPane.showMessageDialog(null,"eitaa");
        }
        
        produto.setImage("images/"+ request.getParameter("file"));
        
    	ProdutoManager.addProduto(produto);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	
	
		
		
		//		doGet(request, response);
	}

}
