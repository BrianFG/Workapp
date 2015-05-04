<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    
    <%
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    Cone cone = new Cone();
    String  status = "1" ;
    ResultSet rs = cone.executeQuery("Select * from usuarios where userName = '" + username +"'");
    if (rs.next()){
    	status = "0";
    }else{
    Connection conn =cone.getConnection();
    CallableStatement cStmt;
	cStmt = conn.prepareCall("{call crearUsuario(?,?)}");
	cStmt.setString(1, username);
	cStmt.setString(2, password);
	cStmt.execute();
	}
    %>
    <%="[{\"status\":" + "\"" + status + "\"}]" %>
