package com.clh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.clh.util.DataAccess;
import com.clh.bean.User;

public class LoginDAO {
	
	public User login(String username, String password) {
		Connection con = DataAccess.getConnection();
		String sql = "select * from user where username=? and password =?";
		PreparedStatement pst = null;
		ResultSet rs = null ;
		User pu = null ;
		try {
		    pst = con.prepareStatement(sql);
		    pst.setString(1, username);
		    pst.setString(2, password);
		    rs = pst.executeQuery();
		    if (rs.next()) {
		        pu = new User();
		        pu.setUserno(rs.getInt("userno"));
		        pu.setUsername(rs.getString("username"));
		        pu.setPassword(rs.getString("password"));
		    }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				} 
				if (pst != null) {
					pst.close();
				} 
				if (con != null) {
					con.close();
				} 
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return pu;
	}
	
	public boolean register(User user) {
	       boolean flag=false;
		   Connection con = null;
	       Context context=null;
	       DataSource ds=null;
	       PreparedStatement pst=null;
	       try{
	    	   context=new InitialContext();
	    	   ds=(DataSource)context.lookup("java:/comp/env/jdbc/mysql");
	    	   con=ds.getConnection();
	    	   con.setAutoCommit(false);
	    	   String sql="insert into user(username,password) values (?,?)";
	    	   pst=con.prepareStatement(sql);
	    	   pst.setString(1, user.getUsername());
	    	   pst.setString(2, user.getPassword());
	    	   pst.executeUpdate();
	    	   con.commit();
	    	   flag=true;
	    	   pst.close();
	    	   con.close();
	       }catch (NamingException e){
	    	   e.printStackTrace();
	       }catch(SQLException e){
	    	   e.printStackTrace();
	    	   try{
	    		   con.rollback();
	    	   }catch(SQLException sqlexp){
	    		   e.printStackTrace();
	    	   }
	       }
		return flag;
	}
}
