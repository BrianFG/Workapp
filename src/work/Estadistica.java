package work;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.Cone;

public class Estadistica {
	
	public static Connection conn;
	public int id;
	
	public Estadistica(int id){
		Cone cone = new Cone();
		conn = cone.getConnection();
		this.id = id;
	}
	
	public  ResultSet getEstadistica(String procedure){
		
		CallableStatement cs;
		ResultSet rs = null;
		try {
			cs = conn.prepareCall("{call " + procedure + "(?)}");
			cs.setInt(1, id);
			cs.execute();
			rs = cs.getResultSet();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}
	
	public String formatEst1(){
		ResultSet rs = getEstadistica("estadistica1");
		StringBuilder values = new StringBuilder();
		try {
			int i = 0;
			while (rs.next()){
				if (i!=0)values.append(",");
				values.append("['" + rs.getString(1) + "', " + rs.getInt(2) + "]");
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return values.toString();
	}
	
	public String formatEst2(){
		ResultSet rs = getEstadistica("estadistica2");
		StringBuilder values = new StringBuilder();
		try {
			int i = 0;
			while (rs.next()){
				if (i!=0)values.append(",");
				values.append("['" + rs.getString(1)+  "', "+ rs.getDouble(2)  + ", " + rs.getDouble(3)+ "]");
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return values.toString();
	}
}
