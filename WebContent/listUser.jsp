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
<title>Show All Users</title>
</head>
<body>
	<div class="container">
	    <table class="table table-striped">
	    	<h3 style="margin-top:1.5em;" class="text-center">LISTADO DE USUARIOS</h3>	
	        <thead>
	            <tr>
	                <th>Id Usuario</th>
	                <th>Nombre</th>
	                <th>Apellidos</th>
	                <th>Fecha Nacimiento</th>
	                <th>Actualizar</th>
	                <th>Eliminar</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${users}" var="user">
	                <tr>
	                    <td><c:out value="${user.id_usuario}" /></td>
	                    <td><c:out value="${user.nombre}" /></td>
	                    <td><c:out value="${user.apellidos}" /></td>
	                    <td><c:out value="${user.fecha_nacimiento}"/></td>
	                    <td><a type="button" class="btn btn-info" href="UserController?action=edit&id_usuario=<c:out value="${user.id_usuario}"/>">Update</a></td>
	                    <td><a type="button" class="btn btn-danger" href="UserController?action=delete&id_usuario=<c:out value="${user.id_usuario}"/>">Delete</a></td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
   	<br>
   	<hr>
    <p>
    	<center>
    		<a href="UserController?action=nuevoUsuario" class="btn btn-success text-center">Nuevo Usuario</a>
    		<a href="index.jsp" type="button" class="btn btn-primary">Cancelar</a>
   	    </center>
   </p>
</body>
</html>