<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    
    <%
    String idUser = request.getParameter("idUser");
    String idWork = request.getParameter("idWork");
    Cone cone = new Cone();
    Connection conn =cone.getConnection();
    CallableStatement cStmt;
	cStmt = conn.prepareCall("{call agregarEjercicio(?,?)}");
	cStmt.setString(1, idUser);
	cStmt.setString(2, idWork);
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