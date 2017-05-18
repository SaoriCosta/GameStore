<%@page import="br.com.gamestore.persistences.CarrinhoManager"%>
<%@page import="br.com.gamestore.entidades.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
<script src="css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="css/bootstrap-3.3.7-dist/js/npm.js"></script>

<script src="css/bootstrap-3.3.7-dist/js/bootstrap.js"></script>





</head>

<jsp:useBean id="vendas"
	class="br.com.gamestore.persistences.VendaManager"></jsp:useBean>
<body>
	Sua compra foi realizada com sucesso.
	
<div class="jumbotron">
		
	<table class="table table-striped">
	<tr>
		<td>Numero da Compra : ${vendas.getVenda().get(code).getCodigo()}</td>
	</tr>
	
	<c:forEach var="i" begin="0" end="${vendas.getVenda().get(code).getProdutos().size()-1}">
		<tr>
		<td><img src="${vendas.getVenda().get(code).getProdutos().get(i).getImage()}" width="70px" height="40px"></td>
		<td>${vendas.getVenda().get(code).getProdutos().get(i).getNome()}</td>
		<td>${vendas.getVenda().get(code).getProdutos().get(i).getPreco()}</td>
		</tr>
	</c:forEach>
	<tr>
	<td>Data da Compra : ${vendas.getVenda().get(code).getData()}</td>
	<td></td>
	<td>Valor Total da Compra : ${vendas.getVenda().get(code).getPreco_total()}</td>
	</tr>
</table>
</div>
	<% 
		Usuario user =(Usuario) request.getSession().getAttribute("user");
		CarrinhoManager.getCarrinho().get(user.getCpf()).clear(); 
	%>
<a href="index.jsp">Voltar para a Página inicial</a>

</body>
</html>