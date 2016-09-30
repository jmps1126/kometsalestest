<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="https://bootswatch.com/paper/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<title>Lista Ventas</title>
</head>
<body>
	<div class="container">	
		<h3 style="margin-top:1.5em;" class="text-center">LISTADO DE PRODUCTOS</h3>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Valor</th>					
					<th>Cantidad</th>					
					<th>Editar</th>
					<th>Eliminar</th>
				</tr>
			</thead>
			<tbody>
				    <c:forEach items="${productos}" var="producto">
	                <tr>
	                    <td><c:out value="${producto.idProducto}" /></td>
	                    <td><c:out value="${producto.descProducto}" /></td>
	                    <td><c:out value="${producto.valor}" /></td>
	                    <td><c:out value="${producto.cantidad}" /></td>
	                    <td><a type="button" class="btn btn-primary" href="UserController?action=editProducto&idProducto=<c:out value="${producto.idProducto}"/>">Actualizar</a></td>
	                    <td><a type="button" class="btn btn-danger" href="UserController?action=deleteProducto&idProducto=<c:out value="${producto.idProducto}"/>">Eliminar</a></td>
	                </tr>
	            </c:forEach>
			</tbody>
			
		</table>
	</div>
   	<br>
   	<hr>
   	<br>
   	<form method="POST" action='UserController'>
    	<center>
    		<a href="UserController?action=nuevoProducto" class="btn btn-success text-center">Adicionar Producto</a>
    		<a href="menu.jsp" type="button" class="btn btn-primary">Cancelar</a>
		</center>    
    </form>
</body>
</html>