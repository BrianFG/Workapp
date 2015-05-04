<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
    <%String username = request.getParameter("user");
    String password = request.getParameter("pass");
    Cone cone = new Cone();
    String query = "SELECT idUsuarios, nombre, peso,  altura, fechaNacimiento FROM usuarios where userName= '" + username + "' and password = '" + password + "'";
    ResultSet users = cone.executeQuery(query);
    String json = "[{";
    String  id = "0" ;
    String nombre = "0";
    String peso = "0";
    String altura = "0";
    String fecha = "0";
    while (users.next()){
    	id = users.getInt(1) + "";
    	nombre = users.getString(2);
    	peso= users.getString(3);
    	altura = users.getString(4);
    	fecha = users.getString(5);
    }
    json += "\"id\":" + "\"" + id + "\" , \"nombre\":" + "\"" + nombre + "\" \"peso\":" + "\"" + peso + "\" , \"altura\":" + "\"" + altura + "\" , \"fecha\":" + "\"" + fecha + "\"}]";
    
    
    %>
<%=json%>