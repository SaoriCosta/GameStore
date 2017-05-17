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
	<div>
		<form action="../produto" method="post">
			<input type="text" name="codigo" placeholder="Código"><br>
			<input type="text" name="nome" placeholder="Nome"><br>
			<input type="text" name="descricao" placeholder="Descrição"><br>
			<input type="text" name="preco" placeholder="Preço"><br>
			<select name="promocao">
				<option> Promoção </option>
				<option value="true">Sim</option>
				<option value="false">Não</option>
			</select>
			
			<c:forEach var="i" items="${CategoriaManager.getCategoria().keySet()}">
				<label>${CategoriaManager.getCategoria().get(i).getNome()}</label>
				<input type="checkbox" name="id" value="${CategoriaManager.getCategoria().get(i).getId()}" />
				
			</c:forEach>
			<button type = "submit">Salvar</button>
		</form>
		
<form action="../file" method="post" enctype="multipart/form-data" target="_blank">		
					<!-- Small modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Enviar Imagem</button>

<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <input type="file" name="file">
		<button type="submit">Enviar Foto</button>
    </div>
  </div>
</div>
	</form>	
		
	</div>
</body>
</html>