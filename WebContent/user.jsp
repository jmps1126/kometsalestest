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
<title>New User</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=fecha_nacimiento]').datepicker();
        });
    </script>
	<div class="col-md-5 center-block text-center" style="margin-top: 50px; float:none;">

	    <form method="POST"  action='UserController?action=nuevoUsuario' name="frmAddUser">

		    <div class=" form-group ">
		        <label>Nombre</label>
		        <input type="text" class="form-group tex-center form-control"  name="nombre" value="<c:out value="${user.nombre}" />" />
		    </div> 
		      
		    <div class=" form-group "> 
		        <label>Apellidos</label>  
		        <input type="text" class="form-group tex-center form-control" name="apellidos" class="form-group tex-center"value="<c:out value="${user.apellidos}" />" />
		    </div> 
		      
		     <div class=" form-group ">
		        <label>Fecha Nacimiento</label>
		        <input type="date" class="form-group tex-center form-control" name="fecha_nacimiento" class="form-group tex-center" value="${user.fecha_nacimiento}" />
		     </div>
		       
		     <div class=" form-group ">
		        <label>Usuario Acesso</label>
		        <input type="text" class="form-group tex-center form-control" name="usuario_acceso" class="form-group tex-center"  value="<c:out value="${user.usuario_acceso}" />" />
		      </div>
		      	
		      <div class=" form-group ">
		        <label>Clave Acesso</label>
		        <input type="password" class="form-group tex-center form-control" name="clave_acceso" class="form-group tex-center"  value="<c:out value="${user.clave_acceso}" />" />
		      </div>
		       	
		       	<div class=" form-group">
		            <input type="submit" value="guardar" class="btn btn-info txt-center"/>
		            <a href="loggin.jsp" type="button" class="btn btn-danger">Cancelar</a>
		        </div>
   
	    </form>
   </div>
</body>
</html>