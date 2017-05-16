<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>
<c:forEach var="i" begin="0" end="${resultList.size()-1}">
	<tr>
		<td>${resultList.get(i).getCodigo()}</td>
		<td>${resultList.get(i).getNome()}</td>
		<td>${resultList.get(i).getPreco()}</td>
		<td>${resultList.get(i).getDescricao()}</td>
		<td>${resultList.get(i).getCategoria().getNome()}</td>
		<td><button type="submit" >Adicionar ao Carrinho</button></td>
	</tr>
</c:forEach>
</table>
</body>
</html>