<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
<script src="css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="css/bootstrap-3.3.7-dist/js/npm.js"></script>


</head>
<body>
	<div>
		<form action="usuario" method="post">
			<input type="text" name="nome" placeholder="Nome" value="${user.getNome()}"><br>
			<input type="hidden" name="email" placeholder="Email" value="${user.getEmail()}">
			<input type="email" name="email" placeholder="Email" value="${user.getEmail()}" disabled title="Este Campo não pode ser alterado"><br>
			<input type="text" name="cpf" placeholder="Cpf" value="${user.getCpf()}"><br>
			<input type="password" name="senha" placeholder="Senha" value="${user.getSenha()}"><br>
			<button type = "submit">Salvar Edição</button>
		</form>
	</div>

</body>
</html>