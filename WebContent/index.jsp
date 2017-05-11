<%@page import="br.com.gamestore.entidades.Produto"%>
<%@page import="br.com.gamestore.persistences.ProdutoManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<title>Inicio</title>
</head>
<body>

	<div>

		<form action="login" method="post">
			<input type="email" name="email" placeholder="Email"> <input
				type="password" name="senha" placeholder="Senha">
			<button type="submit">Login</button>
			<a href="cadastro.jsp">Cadastre-se</a>
		</form>
	
	</div>
	<hr>

	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Sobre</a></li>
		<li><a href="#">Produtos</a></li>
		<li><a href="#">Categorias</a></li>
		<li><a href="#">Contato</a></li>
	</ul>
	<table style="width:100%;">
	
	<% for(Integer p : ProdutoManager.getProduto().keySet()){%>
		<tr>
			<td><%=ProdutoManager.getProduto().get(p).getNome()%></td>
		
			<td><%=ProdutoManager.getProduto().get(p).getDescricao()%></td>
		
			<td><%=ProdutoManager.getProduto().get(p).getPreco()%></td>
			<td><button >Colocar no Carrinho</button><br></td>
		</tr>	
	<% } %>
</body>
</html>