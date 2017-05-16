<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    <%@page import="br.com.gamestore.persistences.CategoriaManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="../produto" method="get" >
			<input type="text" name="codigo" placeholder="Código"><br>
			<input type="text" name="nome" placeholder="Nome"><br>
			<input type="text" name="descricao" placeholder="Descrição"><br>
			<input type="text" name="preco" placeholder="Preço"><br>
			<c:forEach var="i" items="${CategoriaManager.getCategoria().keySet()}">
				<label>${CategoriaManager.getCategoria().get(i).getNome()}</label>
				<input type="checkbox" name="id" value="${CategoriaManager.getCategoria().get(i).getId()}" />
			</c:forEach>
			<br>
			<select name="promocao">
				<option> Promoção </option>
				<option value="true">Sim</option>
				<option value="false">Não</option>
			</select>
			<button type = "submit">Salvar</button>
		</form>
	</div>
</body>
</html>