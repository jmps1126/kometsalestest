package com.juan.model;

import java.util.Date;

public class UserSistem {

	private int id_usuario;
	private String nombre;
	private String apellidos;
	private String fecha_nacimiento;
	private String usuario_acceso;
	private String clave_acceso;
	
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(String fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public String getUsuario_acceso() {
		return usuario_acceso;
	}
	public void setUsuario_acceso(String usuario_acceso) {
		this.usuario_acceso = usuario_acceso;
	}
	public String getClave_acceso() {
		return clave_acceso;
	}
	public void setClave_acceso(String clave_acceso) {
		this.clave_acceso = clave_acceso;
	}
	
}
