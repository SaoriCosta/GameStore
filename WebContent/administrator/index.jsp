<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="../css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
<script src="../css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="../css/bootstrap-3.3.7-dist/js/npm.js"></script>

<script src="css/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<title>::. Gerenciador de Produtos .::</title>
</head>
<body>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6"><h3 class="text-center">Gerenciador de Produtos</h3></div>
	<div class="col-md-3"></div>
</div>	
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	
<form class="form-group">
	<input type="text" class="form-control" name="search" placeholder="Buscar Produto..">
	<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
</form>
</div>
<div class="col-md-3"></div>
</div>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
<a class="btn btn-default" href="cadastro.jsp">Cadastrar produto</a>


	</div>
	<div class="col-md-3"></div>
</div>

	<jsp:useBean id="bean" class="br.com.gamestore.persistences.ProdutoManager"></jsp:useBean>
		
		<h3 class="text-center">Dados de Todos os Produtos da Loja</h3>
	<table class="table table-striped">
		<th>Nome</th>
		<th>Descrição</th>
			<th>Preço</th>
			<th>Promoção</th>
		<c:forEach var="i" items="${bean.getProduto().keySet()}">
		<tr>
			<td>Nome : ${bean.getProduto().get(i).getNome()}</td>
			<td>Descrição : ${bean.getProduto().get(i).getDescricao()}</td>
			<td>Preço : ${bean.getProduto().get(i).getPreco()}</td>
			<td>Promoção : ${bean.getProduto().get(i).isPromocao()}</td>
			<td><a class="btn btn-danger" href="../removeProduto?id=${bean.getProduto().get(i).getCodigo()}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
			
			<td><a class="btn btn-warning" href="config/editar.jsp?cod=${bean.getProduto().get(i).getCodigo()}&nome=${bean.getProduto().get(i).getNome()}&descricao=${bean.getProduto().get(i).getDescricao()}&&preco=${bean.getProduto().get(i).getPreco()}&promocao=${bean.getProduto().get(i).isPromocao()}"><span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span></a></a></td>
		</tr>
		</c:forEach>
	</table>

<c:url value="/adminLogout" var="adminLogout"></c:url>
<a href="${adminLogout}">Logout</a>

</body>
</html>