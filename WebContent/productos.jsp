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
<title>Paises</title>
</head>
<body>
 
	<div class="col-md-5 center-block text-center" style="margin-top: 50px; float:none;">

	    <form method="POST" action='UserController?action=modificarProducto' name="frmAddUser">
	    			
<!-- 		    <div class=" form-group "> -->
<!-- 		        <label>IdProducto</label> -->
		        <input type="hidden" readonly="readonly"  name="idproducto" value="<c:out value="${producto.idProducto}" />" />
<!-- 		    </div>  -->

		    <div class=" form-group "> 
		        <label>Nombre Producto</label>  
		        <input type="text" class="form-group tex-center form-control" name="descproducto" class="form-group tex-center"value="<c:out value="${producto.descProducto}" />" />
		    </div>
		    <div class=" form-group "> 
		        <label>Valor Producto</label>  
		        <input type="text" class="form-group tex-center form-control" name="valor" class="form-group tex-center"value="<c:out value="${producto.valor}" />" />
		    </div> 
		    <div class=" form-group "> 
		        <label>Cantidad</label>  
		        <input type="text" class="form-group tex-center form-control" name="cantidad" class="form-group tex-center"value="<c:out value="${producto.cantidad}" />" />
		    </div> 
		       	
		       	<div class=" form-group">
		            <input type="submit" value="guardar" class="btn btn-info txt-center"/>
		            <a href="UserController?action=crudProductos" type="button" class="btn btn-danger">Cancelar</a>
		        </div>
   
	    </form>
   </div>
</body>
</html>