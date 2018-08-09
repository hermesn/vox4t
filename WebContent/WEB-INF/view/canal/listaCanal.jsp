<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Listar Canal</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
function del(id) {  
    if (confirm('Deseja realmente excluir o canal X?')) {  
        location.href = 'delete?id=' + id;
    }
}
</script>
</head>

<body>
	<div style="text-align: center; color: red;">${msg}</div>

	<br>

	<table border="1px" width="100px" class="table table-dark">
		<thead>
			<tr class="text-center">
				<th>Canal</th>
				<th>Categoria</th>
				<th>Ações</th>
			</tr>
		</thead>

		<c:forEach var="canal" items="${listaCanal}">
			<tbody>
				<tr class="text-center">
					<td>${canal.nome}</td>
					<td><c:forEach items="${listaCategoria}" var="obj">
							<option value="${obj.id}">
								<c:if test="${obj.id eq canal.categoria.id}"> ${obj.nome} </c:if>
							</option>
						</c:forEach></td>
						
					<td><a title="alterar canal" href="edit?id=${canal.id}">
							<button class="btn btn-info btn-sm" data-toggle="modal"
								data-target="#exampleModal">
								
								Alterar <span class="glyphicon glyphicon-search"></span>
							</button>
					</a> &nbsp; &nbsp; <a title="remover canal"
						href="javascript:del(${canal.id})">
							<button class="btn btn-danger btn-sm">
								Excluir <span class="glyphicon glyphicon-search"></span>
							</button>
					</a></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</body>
</html>