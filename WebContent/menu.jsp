<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="https://bootswatch.com/paper/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Menu</title>
</head>
<body>
	<h1 class="text-center" style="margin-top:1.5em;">Seleccione el crud </h1>
	<br> 
	<br> 
	<br>
	<div class="col-md-5 center-block text-center" style="margin-top: 50px; float:none;">

	    <form method="POST" action='UserController' name="frmAddUser">
	    	<a href="UserController?action=crudProductos" class="btn btn-primary text-right">GESTION DE PRODUCTOS</a>
	    </form>
   </div>
</body>
</html>