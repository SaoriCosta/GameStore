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
			<input type="hidden" name="nome" placeholder="Nome" value="${param.cod}"><br>
			<input type="text" name="nome" placeholder="Nome" value="${param.nome}"><br>
			<input type="text" name="descricao" placeholder="Descrição" value="${param.descricao}"><br>
			<input type="text" name="preco" placeholder="Preço" value="${param.preco}"><br>
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