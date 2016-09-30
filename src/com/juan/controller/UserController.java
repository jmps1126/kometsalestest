package com.juan.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.juan.dao.ProductosDao;
import com.juan.dao.UserDao;
import com.juan.model.Productos;
import com.juan.model.UserSistem;
import com.juan.seguridad.RestFilter;
import com.juan.util.Crypter;

public class UserController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/user.jsp";
	private static String LIST_USER = "/listUser.jsp";
	private static String MENU = "/menu.jsp";
	private static String LOGGIN = "/loggin.jsp";
	private static String CRUD_PRODUCTOS = "/productos.jsp";
	private static String LIST_PRODUCTOS = "/listProductos.jsp";

	private UserDao dao;
	private ProductosDao productosDao;
	private Crypter crypter = new Crypter();
	private RestFilter restFilter = new RestFilter();

	public UserController() {
		super();
		dao = new UserDao();
		productosDao = new ProductosDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String forward = "";
		String action = request.getParameter("action");
		UserSistem user = new UserSistem();
		Productos productos = new Productos();

		if (action.equalsIgnoreCase("loggin")) {

			forward = LOGGIN;
			request.setAttribute("user", user);

		} else if (action.equalsIgnoreCase("nuevoUsuario")) {

			forward = INSERT_OR_EDIT;
			request.setAttribute("user", user);

		} else if (action != null && action.equalsIgnoreCase("crudProductos")) {

			forward = LIST_PRODUCTOS;
			request.setAttribute("productos", productosDao.getAllProductos());

		} else if (action != null && action.equalsIgnoreCase("nuevoProducto")) {
			forward = CRUD_PRODUCTOS;
			request.setAttribute("producto", productos);

		} else if (action != null && action.equalsIgnoreCase("deleteProducto")) {
			forward = LIST_PRODUCTOS;

			try {
				productosDao.deleteProducto(Integer.parseInt(request.getParameter("idProducto")));
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("productos", productosDao.getAllProductos());

		} else if (action != null && action.equalsIgnoreCase("editProducto")) {
			forward = CRUD_PRODUCTOS;
			Productos producto = productosDao
					.getProductosByidProducto(Integer.parseInt(request.getParameter("idProducto")));
			request.setAttribute("producto", producto);

		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserSistem user = new UserSistem();
		Productos producto = new Productos();

		String action = request.getParameter("action");

		try {

			if (action != null && action.equalsIgnoreCase("nuevoUsuario")) {

				user.setNombre(request.getParameter("nombre"));
				user.setApellidos(request.getParameter("apellidos"));
				user.setFecha_nacimiento(request.getParameter("fecha_nacimiento"));
				user.setUsuario_acceso(request.getParameter("usuario_acceso"));
				user.setClave_acceso(crypter.crypto(request.getParameter("clave_acceso")));

				dao.addUser(user);

				RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
				request.setAttribute("users", dao.getAllUsers());
				view.forward(request, response);

			} else if (action != null && action.equalsIgnoreCase("modificarProducto")) {

				producto.setIdProducto(Integer.parseInt(request.getParameter("idproducto")));
				producto.setDescProducto(request.getParameter("descproducto"));
				producto.setValor(Integer.parseInt(request.getParameter("valor")));
				producto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

				if (request.getParameter("idproducto") != null
						&& Integer.parseInt(request.getParameter("idproducto")) != 0) {

					producto.setIdProducto(Integer.parseInt(request.getParameter("idproducto")));

					productosDao.updateProducto(producto);

				} else {
					productosDao.addProducto(producto);
				}

				RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUCTOS);
				request.setAttribute("productos", productosDao.getAllProductos());
				view.forward(request, response);

			} else if (action != null && action.equalsIgnoreCase("deletePoducto")) {

				productosDao.deleteProducto(Integer.parseInt(request.getParameter("idproducto")));

				RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUCTOS);
				request.setAttribute("productos", productosDao.getAllProductos());
				view.forward(request, response);

			} else if (restFilter.validateUser(response, request.getParameter("usuario_acceso"),
					crypter.crypto(request.getParameter("clave_acceso")))) {

				RequestDispatcher view = request.getRequestDispatcher(MENU);
				view.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
