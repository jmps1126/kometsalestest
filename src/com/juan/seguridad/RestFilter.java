package com.juan.seguridad;
import java.sql.Connection;
import java.sql.SQLException;

import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import com.juan.dao.UserDao;
import com.juan.util.DbUtil;


public class RestFilter extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Connection connection;


	public boolean validateUser(HttpServletResponse response, String paramUser, String  paramPass) throws SQLException {
		boolean validate = false;
		try {
			// Obtener la conexión a la base de datos
			connection = DbUtil.getConnection();
			
			UserDao userDao= new UserDao();

			if (paramUser == null || paramPass == null) {
				throw new AuthenticationException();
			}
			
			if (userDao.findUserByAutentication(paramUser, paramPass, connection) != null) {
				validate = true;
			}else{
				((HttpServletResponse) response).setStatus(HttpServletResponse.SC_FORBIDDEN);
			}
			
		} catch (AuthenticationException e) {
			((HttpServletResponse) response).setStatus(HttpServletResponse.SC_FORBIDDEN);
			
		} catch (Exception e) {
			((HttpServletResponse) response).setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

		}
	return validate;
	}
}
