<%@page import="br.com.gamestore.entidades.Usuario"%>
<%@page import="br.com.gamestore.exceptions.CarrinhoException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="br.com.gamestore.persistences.CarrinhoManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 

<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
<script src="css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="css/bootstrap-3.3.7-dist/js/npm.js"></script>

<script src="css/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${CarrinhoManager.getCarrinho().get(user.getCpf()).size()>0}">	
	<h2>Carrinho</h2>
	
		<table class="table">
			<th>Nome do Produdo</th>
			<th>Descricao</th>
			<th>Pre�o</th>
		
		<% double total = 0; %>	
		<c:forEach var="i" begin="0" end="${CarrinhoManager.getCarrinho().get(user.getCpf()).size()-1}">
		
			<form action="venda" method="post">					
				<tr>	
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getCodigo()} </td>
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getNome()} </td>
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getDescricao()} </td>
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getPreco()} </td>
				<td><a class="btn btn-danger" href="removeCarrinho?codigo=${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getCodigo()}&email=${user.getCpf()}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
				</tr>
				<c:set var="total" value="${total + CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getPreco()}"></c:set>				
				</c:forEach>
				
					<td></td>
						<td>
						<b>Valor Total:</b></td><td><c:out value="${total}"></c:out></td>
						<input type="hidden" name="preco_total" value="<%=total%>">
				<tr>
					<td></td>
						<td></td>
						<td></td>
					<td><button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Finalizar Compra</button></td>
				</tr>
			</form>	
		</table>	
	</c:if>
	<c:if test="${CarrinhoManager.getCarrinho().get(user.getCpf())==null || CarrinhoManager.getCarrinho().get(user.getCpf()).size()==0}">
		<c:catch>O carrinho est� vazio!</c:catch>
	
	</c:if>	
</body>
</html>