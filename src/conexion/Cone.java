package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;





public class Cone {

	public Connection cn = null;
	private PreparedStatement pst=null;
	private Statement stmt = null;
	
	public Cone (){
		/*
		String url = "jdbc:mysql://127.0.0.1:3306/workapp";
		String driver = "com.mysql.jdbc.Driver";
		String user = "admin";
		String password = "admin";
		*/
		
	/*
		String url = "jdbc:mysql://mysql121953-workapp.jelastic.dogado.eu/workapp";
		String driver = "com.mysql.jdbc.Driver";
		String user = "mashter";
		String password = "alabado";*/
		
		
		/*
		String url = "jdbc:mysql://mysql162126-workapp2.jelastic.servint.net/workapp";
		String driver = "com.mysql.jdbc.Driver";
		String user = "admin";
		String password = "admin";*/
		
		String url = "jdbc:mysql://mysql6469-workapp2.jl.serv.net.mx/workapp";
		String driver = "com.mysql.jdbc.Driver";
		String user = "admin";
		String password = "admin";
		
		try {
			Class.forName(driver).newInstance();
			cn = DriverManager.getConnection(url, user, password); 
		} catch ( Exception e) {
			e.printStackTrace();
		}
	}
	
	public  ResultSet executeQuery (String query){
		ResultSet rs=null;
		try{
			pst= cn.prepareStatement(query);
			rs=pst.executeQuery();
				
		}
		catch(Exception e){
			System.out.print(e.getMessage());
		}
		return rs;
	}
	
	public  boolean executeUpdate(String query){
		
		try {
			stmt = cn.createStatement();
			stmt.executeUpdate(query);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return false;
	}
	
	public void close(){
		try {
			pst.close();
			stmt.close();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet callProcedure(){
		return null;
	}
	
	
	
	public Connection getConnection(){
		return cn;
	}
	

	

}
