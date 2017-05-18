package br.com.gamestore.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import br.com.gamestore.entidades.Administrador;
import br.com.gamestore.entidades.Categoria;
import br.com.gamestore.entidades.Produto;
import br.com.gamestore.persistences.AdminManager;
import br.com.gamestore.persistences.CategoriaManager;
import br.com.gamestore.persistences.ProdutoManager;
import javafx.scene.image.ImageView;

@WebListener
public class TesteListener implements ServletContextListener {

    public TesteListener() {
        // TODO Auto-generated constructor stub
    }
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }
    public void contextInitialized(ServletContextEvent arg0)  { 
    	Administrador padrao = new Administrador();
    	
    	padrao.setEmail("root@e");
    	padrao.setSenha("123");
    	
    	AdminManager.addAdmin(padrao);
    	
    	
    	Categoria cat = new Categoria();
    	cat.setNome("A��o");
    	cat.setId(1);
    	
    	CategoriaManager.addCategoria(cat);
    	
    	Categoria cat1 = new Categoria();
    	cat1.setNome("Aventura");
    	cat1.setId(2);
    	CategoriaManager.addCategoria(cat1);
    	
    	Categoria cat2 = new Categoria();
    	cat2.setId(3);
    	cat2.setNome("Drama");
    	
    	CategoriaManager.addCategoria(cat2);
    	
    	Produto p1 = new Produto();
    	p1.setNome("Grand Theft Auto V");
    	p1.setCodigo("001");
    	p1.setDescricao("Oh loko");
    	p1.setPreco(123);
    	p1.setCategoria(cat);
    	p1.setImage("images/gta.jpg");
    	
    	ProdutoManager.addProduto(p1);
    	
    	Produto p2 = new Produto();
    	p2.setNome("Resident Evil 7");
    	p2.setCodigo("002");
    	p2.setDescricao("Oh loko");
    	p2.setPreco(123);
        p2.setCategoria(cat1);
        p2.setImage("images/Resident-Evil-7-Art.jpg");
    	
    	ProdutoManager.addProduto(p2);
    	
    	Produto p3 = new Produto();
    	p3.setNome("Horizon Zero Dawn");
    	p3.setCodigo("003");
    	p3.setDescricao("Oh loko");
    	p3.setPreco(123);
        p3.setCategoria(cat1);
    	p3.setImage("images/maxresdefault.jpg");
        
        
    	ProdutoManager.addProduto(p3);
    	
    	
    	
    	
    	Produto p4 = new Produto();
    	p4.setNome("Silent hill");
    	p4.setCodigo("004");
    	p4.setDescricao("Oh loko");
    	p4.setPreco(123);
        p4.setCategoria(cat2);
    	p4.setImage("images/silent-hills-5.jpg");
        
        
    	ProdutoManager.addProduto(p4);
    	
    
    	
    	
    	
    }
    
    
	
}
