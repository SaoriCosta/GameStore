<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
		<form action="../../produto" method="post" >
			<input type="hidden" name="codigo" placeholder="Nome" value="${param.cod}"><br>
			<input type="text" name="nome" placeholder="Nome" value="${param.nome}"><br>
			<input type="text" name="descricao" placeholder="Descri��o" value="${param.descricao}"><br>
			<input type="text" name="preco" placeholder="Pre�o" value="${param.preco}"><br>
			<select name="promocao">
				<option> Promo��o </option>
				<option value="true">Sim</option>
				<option value="false">N�o</option>
			</select>
			<button type = "submit">Salvar</button>
		</form>
	</div>

</body>
</html>