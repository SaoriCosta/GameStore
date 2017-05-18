<%@page import="br.com.gamestore.persistences.CategoriaManager"%>
<%@page import="br.com.gamestore.entidades.Administrador"%>
<%@page import="br.com.gamestore.entidades.Produto"%>
<%@page import="br.com.gamestore.persistences.ProdutoManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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


<title>Bem vindo : ${user.getNome()}</title>
</head>
<body style="background: url('images/dark.jpg');">
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
						<li class="active"><a style="color: #fff;" href="#"><span class="glyphicon glyphicon-home"
									aria-hidden="true"></span> Home<span
								class="sr-only">(current)</span></a></li>
								
					
						<li><a style="color: #000;" href="produtos.jsp"><span class="glyphicon glyphicon-gift"
									aria-hidden="true"></span> Produtos</a></li>
						
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
						<li role="presentation"><a href="#contato_div"><span class="glyphicon glyphicon-envelope"
									aria-hidden="true"></span> Contato</a></li>

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
									aria-expanded="false"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> Configurações<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="editar-user.jsp">
										<span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> Alterar dados</a></li>
										<li role="separator" class="divider"></li>
										<li>
											<c:url value="/usuarioLogout" var="usuarioLogout"></c:url>
											<a href="${usuarioLogout}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Logout</a>
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

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
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
			<div class="item">
				<img src="images/Devil-May-Cry-Special-Edition-PS4.jpg" style="width: 100%;"
					class="img-responsive">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="images/Callofduty.png" style="width: 100%;"
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

		<h3 style="color: #000;">Jogos Adicionados recentemente</h3>
		<div class="row">

			<jsp:useBean id="bean"
				class="br.com.gamestore.persistences.ProdutoManager"></jsp:useBean>

			<c:forEach var="i" items="${bean.getProduto().keySet()}">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="${bean.getProduto().get(i).getImage()}" alt="...">
						<div class="caption">

							<form action="carrinho" method="Post">
							<input type="hidden" name="image"
									value="${bean.getProduto().get(i).getImage()}">
								<input type="hidden" name="codigo"
									value="${bean.getProduto().get(i).getCodigo()}"> <input
									type="hidden" name="nome"
									value="${bean.getProduto().get(i).getNome()}"> <input
									type="hidden" name="descricao"
									value="${bean.getProduto().get(i).getDescricao()}"> <input
									type="hidden" name="preco"
									value="${bean.getProduto().get(i).getPreco()}"> <input
									type="hidden" name="promocao"
									value="${bean.getProduto().get(i).isPromocao()}">


								<h3>${bean.getProduto().get(i).getNome()}</h3>
								<h5>${bean.getProduto().get(i).getDescricao()}</h5>
								<h5>R$ ${bean.getProduto().get(i).getPreco()}</h5>
								<h5>Categoria:${bean.getProduto().get(i).getCategoria().getNome()}</h5>
								<p>


									<button type="submit" class="btn btn-success" role="button">
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



	<div id="contato_div"
		style="background: #fff; width: 100%; padding: 4%;" class="form-group">


		<div class="container">
			<h2>Contato</h2>
			<div id="contact" class="circle">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">@</span> <input
						type="text" class="form-control" placeholder="Username"
						aria-describedby="basic-addon1">
				</div>
				<br>

				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Recipient's username" aria-describedby="basic-addon2">
					<span class="input-group-addon" id="basic-addon2">@example.com</span>
				</div>
				<br>


				<textarea class="form-control" rows="5" id="comment"
					placeholder="Digite sua pergunta aqui.."></textarea>

				<a href="#" class="btn btn-success btn-block "> Entrar em
					Contato! </a>
			</div>


		</div>

<br><br>
<hr>
<h2 class="text-center">Principais Títulos</h2>
<div class="row">
	<div class="col-md-3">
		<img src="images/Devil-May-Cry-Special-Edition-PS4.jpg" class="img-responsive img-circle">
		<h3 class="text-center">Devil May Cry 4</h3>
		<h5 class="text-center"><a  class="btn btn-danger" href="https://www.youtube.com/watch?v=Uz58uS7FZ28" target="_blank" ><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> Ver trailer</a></h5>
	</div>
	<div class="col-md-3">
		<img src="images/Resident-Evil-7-Art.jpg" class="img-responsive img-circle">
		<h3 class="text-center">Resident Evil 7</h3>
		<h5 class="text-center"><a  class="btn btn-danger" href="https://www.youtube.com/watch?v=viyqPAziAaw" target="_blank"><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> Ver trailer</a></h5>
	</div>
	
	<div class="col-md-3">
		<img src="images/3080752-9k=.jpg" class="img-responsive img-circle">
		<h3 class="text-center">God of War PS4</h3>
		<h5 class="text-center"><a  class="btn btn-danger" href="https://www.youtube.com/watch?v=CJ_GCPaKywg" target="_blank"><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> Ver trailer</a></h5>
	</div>
	
	<div class="col-md-3">
		<img src="images/maxresdefault.jpg" class="img-responsive img-circle">
		<h3 class="text-center">Horizon - Zero Dawn</h3>
		<h5 class="text-center"><a  class="btn btn-danger" href="https://www.youtube.com/watch?v=RRQDqurZJNk"><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span> Ver trailer</a></h5>
	</div>
	
</div>

</body>
</html>