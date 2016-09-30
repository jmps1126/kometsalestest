package com.juan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.juan.model.UserSistem;
import com.juan.util.DbUtil;

public class UserDao {

	private Connection connection;

	public UserDao() {
		connection = DbUtil.getConnection();
	}

	public void addUser(UserSistem user) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into usuario_sistema(nombre,apellidos,fecha_nacimiento,usuario_acceso,clave_acceso) values (?, ?, ?, ?, ? )");
			// Parameters start with 1
			preparedStatement.setString(1, user.getNombre());
			preparedStatement.setString(2, user.getApellidos());
			preparedStatement.setString(3, user.getFecha_nacimiento());
			preparedStatement.setString(4, user.getUsuario_acceso());
			preparedStatement.setString(5, user.getClave_acceso());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteUser(int userId, Connection connection) throws SQLException {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from usuario_sistema where id_usuario = ? ");
			// Parameters start with 1
			preparedStatement.setInt(1, userId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateUser(UserSistem user) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"update usuario_sistema set nombre = ?, apellidos = ?, fecha_nacimiento = ?, usuario_acceso = ?, clave_acceso = ?  where id_usuario = ? ");
			// Parameters start with 1
			preparedStatement.setString(1, user.getNombre());
			preparedStatement.setString(2, user.getApellidos());
			preparedStatement.setString(3, user.getFecha_nacimiento());
			preparedStatement.setString(4, user.getUsuario_acceso());
			preparedStatement.setString(5, user.getClave_acceso());
			preparedStatement.setInt(6, user.getId_usuario());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<UserSistem> getAllUsers() {
		List<UserSistem> users = new ArrayList<UserSistem>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from usuario_sistema");
			while (rs.next()) {
				UserSistem user = new UserSistem();

				user.setId_usuario(rs.getInt("id_usuario"));
				user.setNombre(rs.getString("nombre"));
				user.setApellidos(rs.getString("apellidos"));
				user.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
				user.setUsuario_acceso(rs.getString("usuario_acceso"));
				user.setClave_acceso(rs.getString("clave_acceso"));

				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}

	public UserSistem getUserById(int userId) {
		UserSistem user = new UserSistem();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from usuario_sistema where id_usuario = ? ");
			preparedStatement.setInt(1, userId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				user.setId_usuario(rs.getInt("id_usuario"));
				user.setNombre(rs.getString("nombre"));
				user.setApellidos(rs.getString("apellidos"));
				user.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
				user.setUsuario_acceso(rs.getString("usuario_acceso"));
				user.setClave_acceso(rs.getString("clave_acceso"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public UserSistem findUserByAutentication(String paramUser, String paramPass, Connection connection) throws SQLException {
		UserSistem usuarioSistema = null;
		ResultSet resultado = null;
		PreparedStatement instruccion = null;
		
		try {

			instruccion = connection.prepareStatement("SELECT ID_USUARIO, NOMBRE, APELLIDOS, FECHA_NACIMIENTO, USUARIO_ACCESO, "
					+ "CLAVE_ACCESO  FROM USUARIO_SISTEMA WHERE USUARIO_ACCESO = ? AND CLAVE_ACCESO = ? ");

			instruccion.setString(1, paramUser);
			instruccion.setString(2, paramPass);
			resultado = instruccion.executeQuery();

			if (resultado.next()) {
				usuarioSistema = new UserSistem();
				usuarioSistema.setId_usuario(resultado.getInt("ID_USUARIO"));
				usuarioSistema.setNombre(resultado.getString("NOMBRE"));
				usuarioSistema.setApellidos(resultado.getString("APELLIDOS"));
				usuarioSistema.setFecha_nacimiento(resultado.getString("FECHA_NACIMIENTO"));
				usuarioSistema.setUsuario_acceso(resultado.getString("USUARIO_ACCESO"));
				usuarioSistema.setClave_acceso(resultado.getString("CLAVE_ACCESO"));

			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return usuarioSistema;
	}

}
