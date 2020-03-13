package com.clh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.clh.bean.User;
import com.clh.util.DataAccess;

public class UserDAO {
	//方法用来调用数据库里的用户数据	
	public User oneuesr(String username) {
		Connection con = DataAccess.getConnection();
		String sql = "select * from ascentweb.user where username='"+username+"'";
		PreparedStatement st = null;
		ResultSet rs = null;
		User usr = new User();
		try {
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			while(rs.next()) {
				usr.setUserno(rs.getInt("userno"));
				usr.setUsername(rs.getString("username"));
				usr.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(st!=null) {
					st.close();
				}
				if (con != null) {
					con.close();
				} 
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return usr;
	}

}
