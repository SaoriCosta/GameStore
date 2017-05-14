<%@page import="br.com.gamestore.entidades.Administrador"%>
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
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').focus()
	})

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		e.target // newly activated tab
		e.relatedTarget // previous active tab
	})
</script>


<title>Inicio</title>
</head>
<body style="background: #000;">

	<c:if test="${user != null }">
		<label style="color: #fff;">Bem vindo : ${user.getNome()}</label>
		<a style="color: #616161;" class="btn btn-default pull-right"
			href="carrinho.jsp">Carrinho : <span class="badge">${qtd}</span>
			<span class="glyphicon glyphicon-shopping-cart white"
			aria-hidden="true"></span>
		</a>
	</c:if>
	<c:if test="${user == null }">
		<button style="background: #fff; color: #000;" type="button"
			class="btn btn-primary pull-right" data-toggle="modal"
			data-target=".bs-example-modal-sm">
			<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
			Login / Cadastre-se
		</button>
	</c:if>

	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-inverse"
				style="background:#fff;color:#fff;">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a style="color: #000;" class="navbar-brand white-text" href="#">GameStore</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a style="color: #fff;" href="#">Home<span
								class="sr-only">(current)</span></a></li>
						<li><a style="color: #000;" href="#">Sobre</a></li>
						<li><a style="color: #000;" href="#">Produtos</a></li>
						<li class="dropdown"><a style="color: #000;" href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Categorias <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">A��o</a></li>
								<li><a href="#">Aventura</a></li>
								<li><a href="#">Terror</a></li>
								<li><a href="#">Suspense</a></li> <<<<<<< HEAD
								<li><a href="#">Drama</a></li> =======
								<li><a href="#">Drama</a></li> >>>>>>>
								fc11b3b134e29d96cb5f72b5a0bd1d3a670ed984
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Pesquisa..">
						</div>
						<button type="submit" class="btn btn-default ">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li role="presentation"><a href="#">Promo��es</a></li>
						<li role="presentation"><a href="#">Contato</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> </nav>
		</div>
	</div>
	</div>


	<!-- Small modal -->


	<div id="myModel" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
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

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/Resident-Evil-7-Art.jpg" style="width: 100%;"
					class="img-responsive">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="images/maxresdefault.jpg" style="width: 100%;"
					class="img-responsive">
				<div class="carousel-caption">...</div>
			</div>
			...
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="jumbotron">
		<div class="container">
		<h3 style="color: #000;">Jogos Mais Comprados</h3>
		<div class="row">

			<jsp:useBean id="bean"
				class="br.com.gamestore.persistences.ProdutoManager"></jsp:useBean>

			<c:forEach var="i" items="${bean.getProduto().keySet()}">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="..." alt="...">
						<div class="caption">

							<form action="carrinho" method="Post">
								<input type="hidden" name="nome"
									value="${bean.getProduto().get(i).getNome()}"> <input
									type="hidden" name="descricao"
									value="${bean.getProduto().get(i).getDescricao()}"> <input
									type="hidden" name="preco"
									value="${bean.getProduto().get(i).getPreco()}"> <input
									type="hidden" name="promocao"
									value="${bean.getProduto().get(i).isPromocao()}">


								<h3>${bean.getProduto().get(i).getNome()}</h3>
								<p>Descri�ao:${bean.getProduto().get(i).getDescricao()}</p>
								<p>Pre�o:${bean.getProduto().get(i).getPreco()}</p>
								<p>


									<button type="submit" class="btn btn-warning" role="button">
										Adicionar ao Carrinho <span
											class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
									</button>
							</form>
							</p>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
</div>	

</body>
</html>