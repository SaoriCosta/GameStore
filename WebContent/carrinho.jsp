<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="br.com.gamestore.persistences.CarrinhoManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<title>Insert title here</title>
</head>
<body>
	
	<h2>Carrinho</h2>
	
		<table>
			<th>Nome do Produdo</th>
			<th>Descricao</th>
			<th>Preço</th>
		<c:forEach var="i" begin="0" end="${CarrinhoManager.getCarrinho().get(user.getCpf()).size()-1}">
				<tr>	
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getNome()} </td>
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getDescricao()} </td>
				<td>${CarrinhoManager.getCarrinho().get(user.getCpf()).get(i).getPreco()} </td>
				</tr>
				</c:forEach>
				<tr>
					<td></td>
						<td></td>
					<td><button>Finalizar Compra</button></td>
				</tr>
		</table>	

</body>
</html>