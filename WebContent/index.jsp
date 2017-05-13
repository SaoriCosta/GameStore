<%@page import="br.com.gamestore.entidades.Produto"%>
<%@page import="br.com.gamestore.persistences.ProdutoManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
 <script src="css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="css/bootstrap-3.3.7-dist/js/npm.js"></script>

<script src="css/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script type="text/javascript">

	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
	
</script>


<title>Inicio</title>
</head>
<body style="background:#000;">
	<c:if test="${user != null }">
	<label style="color:#fff;">Bem vindo : ${user.getNome()}</label>
	<a class="pull-right" href="carrinho.jsp">Carrinho : ${qtd}</a>
	</c:if>
	<button style="background:#fff;color:#000;" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">
	<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> Login / Cadastre-se</button>

<br>
		

	<div class="row">
		<div class="col-md-12">
<nav class="navbar navbar-inverse" style="background:#01579b;color:#fff;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a style="color:#fff;" class="navbar-brand white-text" href="#">GameStore</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a style="color:#fff;" href="#">Home<span class="sr-only">(current)</span></a></li>
        <li><a style="color:#fff;" href="#">Sobre</a></li>
         <li><a style="color:#fff;" href="#">Produtos</a></li>
        <li class="dropdown">
          <a style="color:#fff;" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categorias <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Ação</a></li>
            <li><a  href="#">Aventura</a></li>
            <li><a href="#">Terror</a></li>
             <li><a href="#">Suspense</a></li>
              <li><a  href="#">Drama</a></li>
            <li role="separator" class="divider"></li>
            <li><a  href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a  href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Pesquisa..">
        </div>
        <button type="submit" class="btn btn-default "><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
      </form>
      <ul class="nav navbar-nav navbar-right">
       <li role="presentation"><a href="#">Promoções</a></li>
       <li role="presentation"><a href="#">Contato</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
			</div>
		</div>
	</div>	
	
		
	<!-- Small modal -->


<div id="myModel" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      	<div class="row">
      	<div class="col-md-1"></div>
		<div class="col-md-10">
			<div>
				<label><h2 class="text-center">Login</h2></label>
				<form action="login" method="post">
					<input class="form-control" type="email" name="email"
						placeholder="Email"> <input class="form-control"
						type="password" name="senha" placeholder="Senha">
					<button type="submit" class="btn btn-default">Login</button>
					<a href="cadastro.jsp">Cadastre-se</a>
				</form>

			</div>
		</div>
		<div class="col-md-1"></div>
	</div>	
    </div>
  </div>
</div>
	
	<img src="images/Resident-Evil-7-Art.jpg" style="width:100%;" class="img-responsive">
		<br>


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
						<td><button type="submit">Colocar no Carrinho</button> <br></td>
					</tr>
				</form>
			</c:forEach>


		</table>
		
<div class="row">
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
  
    <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
</div>
		
</body>
</html>