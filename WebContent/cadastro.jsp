<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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



</head>
<body>
	
	<div style="background: #000;">
		<c:if test="${user != null }">
			<label style="color: #fff;">Bem vindo , ${user.getNome()}</label>
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
	</div>
	
	
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-inverse navbar-fixed-top"
				style="background:#fff;color:#fff;"
				onmouseout="$('#p').css('color','#000');">
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
						<li><a style="color: #000;" href="produtos.jsp">Produtos</a></li>
						
						<li class="dropdown"><a id="p" style="color: #000;"
							onclick="$('#p').css('color','#fff');" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Categorias <span class="caret"></span></a>
							<ul class="dropdown-menu"
								onmouseover="$('#p').css('color','#fff');">
								<c:forEach var="i" items="${CategoriaManager.getCategoria().keySet()}">
									<li><a href="">${CategoriaManager.getCategoria().get(i).getNome()}</a></li>
								</c:forEach>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left" action="search" method="get">
						<div class="form-group">
							<input type="text" name="search" class="form-control" placeholder="Pesquisa..">
						</div>
						<button type="submit" class="btn btn-default ">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</form>

					<ul class="nav navbar-nav navbar-right">
						<li role="presentation"><a href="#">Promoções</a></li>
						<li role="presentation"><a href="#contato_div">Contato</a></li>

						<li><c:if test="${user == null }">
								<li><a style="background: #fff; color: #000;"
										type="button" class="btn btn-primary pull-right"
										data-toggle="modal" data-target=".bs-example-modal-sm">
										<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
										Login / Cadastre-se
									</a></li>
							</c:if> <c:if test="${user != null }">


								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"> Configurações<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="editar-user.jsp">Alterar dados</a></li>
										<li role="separator" class="divider"></li>
										<li>
											<c:url value="/usuarioLogout" var="usuarioLogout"></c:url>
											<a href="${usuarioLogout}">Logout</a>
										</li>
									</ul></li>
								
								<li><a style="color: #616161;" class="btn btn-default pull-right"
									href="carrinho.jsp">Carrinho : <span class="badge">${qtd}</span>
									<span class="glyphicon glyphicon-shopping-cart"
									aria-hidden="true"></span>
								</a>

							</c:if></li>

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> </nav>
		</div>
	</div>
	</div>


	<!-- ################################### Small modal -LOGIN @################################################3 -->


	<div id="myModel" class="modal fade bs-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">

						<form action="login" method="post">
							<label><h2 class="text-center">Login</h2></label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input id="email"
									type="text" class="form-control" name="email"
									placeholder="Email">
							</div>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input id="password"
									type="password" class="form-control" name="senha"
									placeholder="Password">
							</div>

							<button type="submit" class="btn btn-default">Login</button>
							<a href="cadastro.jsp">Cadastre-se</a>

						</form>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="jumbotron">
	<div class="container">
		<h2 class="text-center">Editar Informações da Conta</h2>
		<form class="form-group" action="usuario" method="post">
			<input class="form-control" type="text" name="nome" placeholder="Nome"><br>
			<input class="form-control"  type="email" name="email" placeholder="Email"><br>
			<input class="form-control"  type="text" name="cpf" placeholder="Cpf"><br>
			<input class="form-control"  type="password" name="senha" placeholder="Senha"><br>
			<button class="btn btn-success btn-block" type = "submit">Salvar</button>
		</form>
	</div>
</div>	
</body>
</html>