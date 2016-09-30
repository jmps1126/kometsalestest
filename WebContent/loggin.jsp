<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Add new user</title>
</head>
<body>
	<div class="col-md-4 center-block text-center" style="margin-top: 50px; float:none;">

		<div class="well">
			<h3 class="text-center">INICIAR SESIÓN</h3>
			<hr>	
		    <form method="POST" action='UserController' name="frmAddUser">
			    
			     <div class=" form-group ">
			        <label>Usuario Acesso</label><input type="text" name="usuario_acceso" class="form-group tex-center form-control"  value="<c:out value="${user.usuario_acceso}" />" />
			      </div>
			      	
			      <div class=" form-group ">
			        <label>Clave Acesso</label><input type="password" name="clave_acceso" class="form-group tex-center form-control"  value="<c:out value="${user.clave_acceso}" />" />
			      </div>
			       <br>
			       <hr>
			       <br>
			       <div class="form-group">		       
				       	<div class="btn-group">
				            <input type="submit" value="Acceder" class="btn btn-info txt-center"/>
				        </div>
				        <div class="btn-group">
				        	<a href="UserController?action=nuevoUsuario" class="btn btn-warning text-right">Nuevo Usuario</a>
				        </div>
			       </div>
	   
		    </form>
		</div>
   </div>  
</body>
</html>