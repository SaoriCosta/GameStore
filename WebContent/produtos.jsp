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

<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="row">

			<jsp:useBean id="bean"
				class="br.com.gamestore.persistences.ProdutoManager"></jsp:useBean>

			<c:forEach var="i" items="${bean.getProduto().keySet()}">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="..." alt="...">
						<div class="caption">

							<form action="carrinho" method="Post">
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
								<p>Descriçao:${bean.getProduto().get(i).getDescricao()}</p>
								<p>Preço:${bean.getProduto().get(i).getPreco()}</p>
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

</body>
</html>