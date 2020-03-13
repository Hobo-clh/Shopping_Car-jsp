package com.clh.util;
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataAccess {
   public static Connection getConnection() {
	   Connection con = null;
       try {
		Context ctx = new InitialContext();
		
		
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		con = ds.getConnection();
		} catch (Exception e) {
		e.printStackTrace();
		}

       	return con;
   }
}
