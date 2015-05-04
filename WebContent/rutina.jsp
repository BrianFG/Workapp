<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@page import="work.*" %>
    <%@page import="conexion.*" %>
  <%

int idUsuario = Integer.parseInt(request.getParameter("id"));
Rutina rutina = new Rutina(1);
String json = rutina.getJson(); 
  %>  
<%=json %>
