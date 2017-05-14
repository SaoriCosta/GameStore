<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faça seu login</title>
</head>
<body>
	<form action="../login" method="post">
		<input class="form-control" type="email" name="email"
			placeholder="Email"> <input class="form-control"
			type="password" name="senha" placeholder="Senha">
		<button type="submit" class="btn btn-default">Login</button>
		<a href="cadastro.jsp">Cadastre-se</a>
	</form>
</body>
</html>