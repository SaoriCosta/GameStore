<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    <%@page import="br.com.gamestore.persistences.CategoriaManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="../css/bootstrap-3.3.7-dist/css/bootstrap-theme.css">
<script src="../css/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="../css/bootstrap-3.3.7-dist/js/npm.js"></script>

<script src="../css/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

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
						<li class="active"><a style="color: #fff;" href="../index.jsp"><span class="glyphicon glyphicon-home"
									aria-hidden="true"></span> Home<span
								class="sr-only">(current)</span></a></li>
								
					
						<li><a style="color: #000;" href="../produtos.jsp"><span class="glyphicon glyphicon-gift"
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
						<li role="presentation"><a href="../index.jsp#contato_div"><span class="glyphicon glyphicon-envelope"
									aria-hidden="true"></span> Contato</a></li>

						<li><c:if test="${user == null }">
								<li><a href="../login.jsp" style="background: #fff; color: #000;"
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
										<li><a href="../editar-user.jsp">
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

	<div class="jumbotron">
	<div class="container">
		<h2 class="text-center">Cadastrar Produto</h2>
		<form class="form-group" action="../produto" method="post">
			<input class="form-control" type="text" name="codigo" placeholder="Código">
			<input class="form-control"  type="text" name="nome" placeholder="Nome">
			<input class="form-control" type="text" name="descricao" placeholder="Descrição">
			<input class="form-control" type="text" name="preco" placeholder="Preço">
			<select class="form-control" name="promocao">
				<option> Promoção </option>
				<option value="true">Sim</option>
				<option value="false">Não</option>
			</select>
			<br>
			<c:forEach var="i" items="${CategoriaManager.getCategoria().keySet()}">
				<label>${CategoriaManager.getCategoria().get(i).getNome()}</label>
				<input type="checkbox" name="id" value="${CategoriaManager.getCategoria().get(i).getId()}" />
				
			</c:forEach><br>
			<button class="btn btn-success btn-block" type = "submit"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Salvar</button>
		</form>
		
<form action="../file" method="post" enctype="multipart/form-data" target="_blank">		
					<!-- Small modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"> <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>  Enviar Imagem</button>

<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <input type="file" name="file">
		<button type="submit"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> Enviar Foto</button>
    </div>
  </div>
</div>
	</form>	
		
	</div>
</div>	
</body>
</html>