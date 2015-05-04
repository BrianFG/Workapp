package work;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.Cone;

public class Rutina {
	
	public static ResultSet rutinas = null;
	
	public Rutina(int idUsuario){
		Cone cone = new Cone();
		Connection conn = cone.getConnection();

	    CallableStatement cStmt;
		try {
			cStmt = conn.prepareCall("{call obtenerRutinas(?)}");
			cStmt.setInt(1, idUsuario);
			cStmt.execute();
			rutinas = cStmt.getResultSet();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	    


	}
	
	public String getJson(){
		StringBuilder json = new StringBuilder();
		json.append("[");
		try {
			int i = 0;
			while(rutinas.next()){
				if(i!=0)json.append(",");
				json.append("{");
				json.append(" \"idEjercicioD\": ");
				json.append(format(rutinas.getString(1))+" ,");
				json.append(" \"musculo\": ");
				json.append(format(rutinas.getString(2))+" ,");
				json.append(" \"idEjercicio\": ");
				json.append(format(rutinas.getString(3))+" ,");
				json.append(" \"descripcion\": ");
				json.append(format(rutinas.getString(4))+" ,");
				json.append(" \"titulo\": ");
				json.append(format(rutinas.getString(5))+" ,");
				json.append(" \"imagen\": ");
				json.append(format(rutinas.getString(6))+" ,");
				json.append(" \"idMusculo\": ");
				json.append(format(rutinas.getString(7))+" ,");
				json.append(" \"repeticiones\": ");
				json.append(format(rutinas.getString(8))+" ,");
				json.append(" \"series\": ");
				json.append(format(rutinas.getString(9)));
				json.append("}");
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		json.append("]");
		return json.toString();
	}
	
	public String format(String str){
		return "\"" + str + "\"";
	}

}
