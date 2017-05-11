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
	Bem vindo : ${user.getNome()}
	
	<div>

		<form action="login" method="post">
			<input type="email" name="email" placeholder="Email"> <input
				type="password" name="senha" placeholder="Senha">
			<button type="submit">Login</button>
			<a href="cadastro.jsp">Cadastre-se</a>
		</form>

	</div>
	<a href="carrinho.jsp">Carrinho : ${qtd}</a>
	<hr>

	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Sobre</a></li>
		<li><a href="#">Produtos</a></li>
		<li><a href="#">Categorias</a></li>
		<li><a href="#">Contato</a></li>
	</ul>
	<table style="width: 100%;">
			<c:forEach var="i" items="${ProdutoManager.getProduto().keySet()}">
				<form action="carrinho" method="Post">
					<input type="hidden" name="nome"
						value="${ProdutoManager.getProduto().get(i).getNome()}"> <input
						type="hidden" name="descricao"
						value="${ProdutoManager.getProduto().get(i).getDescricao()}">
					<input type="hidden" name="preco"
						value="${ProdutoManager.getProduto().get(i).getPreco()}">
					<input type="hidden" name="promocao"
						value="${ProdutoManager.getProduto().get(i).isPromocao()}">

					<tr>
						<td>${ProdutoManager.getProduto().get(i).getNome()}</td>
						<td>${ProdutoManager.getProduto().get(i).getDescricao()}</td>
						<td>${ProdutoManager.getProduto().get(i).getPreco()}</td>
						<td><button type="submit">Colocar no Carrinho</button>
							<br></td>
					</tr>
				</form>
			</c:forEach>
		
	
	</table>
</body>
</html>