<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String fecha = request.getParameter("fecha");
    double peso= Double.parseDouble(request.getParameter("peso"));
    double altura = Double.parseDouble(request.getParameter("altura"));
    String sexo = request.getParameter("sexo");
    Cone cone = new Cone();
    Connection conn =cone.getConnection();
    CallableStatement cStmt;
	cStmt = conn.prepareCall("{call datosUsuario(?,?,?,?,?)}");
	cStmt.setInt(1, id);
	cStmt.setString(2, nombre);
	cStmt.setDouble(3, peso);
	cStmt.setString(4, fecha);
	cStmt.setDouble(5, altura);
	cStmt.execute();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>