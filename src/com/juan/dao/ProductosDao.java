package com.juan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.juan.model.Productos;
import com.juan.util.DbUtil;

public class ProductosDao {
	private Connection connection;

	public ProductosDao() {
		connection = DbUtil.getConnection();
	}

		public void addProducto(Productos productos) {
			try {
				PreparedStatement preparedStatement = connection.prepareStatement( "insert into productos (descproducto,valorproducto,cantidad) values (?,?,?)");
				
				
				preparedStatement.setString(1, productos.getDescProducto());
				preparedStatement.setInt(2, productos.getValor());
				preparedStatement.setInt(3, productos.getCantidad());
	
				preparedStatement.executeUpdate();
	
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	public void deleteProducto(int idProducto) throws SQLException {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from productos where idproducto = ? ");
			
			preparedStatement.setInt(1, idProducto);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateProducto(Productos productos) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("update productos set descproducto = ?, valorproducto = ?, cantidad = ?  where idproducto = ? ");
		
			preparedStatement.setString(1, productos.getDescProducto());
			preparedStatement.setInt(2, productos.getValor());
			preparedStatement.setInt(3, productos.getCantidad());
			preparedStatement.setInt(4, productos.getIdProducto());
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Productos> getAllProductos() {
		List<Productos> productos = new ArrayList<Productos>();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from productos");
			while (resultSet.next()) {
				Productos producto = new Productos();

				producto.setIdProducto(resultSet.getInt("idproducto"));
				producto.setDescProducto(resultSet.getString("descproducto"));
				producto.setValor(resultSet.getInt("valorproducto"));
				producto.setCantidad(resultSet.getInt("cantidad"));

				productos.add(producto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}

	public Productos getProductosByidProducto(int idProducto) {
		Productos productos = new Productos();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from productos where idproducto = ? ");
			preparedStatement.setInt(1, idProducto);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				productos.setIdProducto(rs.getInt("idproducto"));
				productos.setDescProducto(rs.getString("descproducto"));
				productos.setValor(rs.getInt("valorproducto"));
				productos.setCantidad(rs.getInt("cantidad"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}


}
