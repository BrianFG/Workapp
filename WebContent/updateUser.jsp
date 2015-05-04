<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
        <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    double peso  = Double.parseDouble(request.getParameter("peso"));
    double altura = Double.parseDouble(request.getParameter("altura"));
    Cone cone = new Cone();
    Connection conn =cone.getConnection();
    CallableStatement cStmt;
	cStmt = conn.prepareCall("{call actualizarDatos(?,?,?)}");
	cStmt.setInt(1, id);
	cStmt.setDouble(2, peso);
	cStmt.setDouble(3, altura);
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