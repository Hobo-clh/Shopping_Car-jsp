package com.clh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.clh.bean.Cart;
import com.clh.util.DataAccess;

public class CartDAO {
	public List<Cart> findCarts(String username) {
		Connection con = DataAccess.getConnection();
		String sql = "select * from cart where username='"+username+"'";
		PreparedStatement st = null;
		ResultSet rs = null ;
		List<Cart> list = new ArrayList<Cart>();
		Cart pu = null ;
		try {
	    st = con.prepareStatement(sql);
//		    st.setString(1, keyword);
//		    st.setString(2, keyword);
//		    st.setString(3, keyword);
		    rs = st.executeQuery();
		    while(rs.next()) {
		        pu = new Cart();
		        pu.setCno(rs.getInt("cno"));
		        pu.setUsername(rs.getString("username"));
		        pu.setNum(rs.getInt("num"));
		        list.add(pu);
		    }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				} 
				if (st != null) {
					st.close();
				} 
				if (con != null) {
					con.close();
				} 
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	public Cart findOneCarts(String username,String cno) {
		Connection con = DataAccess.getConnection();
		String sql = "select * from cart where username='"+username+"'"+"and cno='"+cno+"'";
		PreparedStatement st = null;
		ResultSet rs = null ;;
		Cart pu = null ;
		try {
	    st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    while(rs.next()) {
		        pu = new Cart();
		        pu.setCno(rs.getInt("cno"));
		        pu.setUsername(rs.getString("username"));
		        pu.setNum(rs.getInt("num"));
		    }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				} 
				if (st != null) {
					st.close();
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
	
	public Cart insertCart(String username,String cno) {
	       //boolean flag=false;
		   Connection con = null;
	       Context context=null;
	       DataSource ds=null;
	       PreparedStatement pst=null;
	       
	       CartDAO dao=new CartDAO();
    	   Cart cc1 = dao.findOneCarts(username, cno);
    	   if(cc1!=null) {
		       try{  
	    		   context=new InitialContext();
		    	   ds=(DataSource)context.lookup("java:/comp/env/jdbc/mysql");
		    	   con=ds.getConnection();
		    	   con.setAutoCommit(false);
		    	   String sql="update cart set num = num+1 where username='"+username+"'"+"and cno='"+cno+"'";
		    	   pst=con.prepareStatement(sql);
		    	   pst.executeUpdate();
		    	   con.commit();
		    	  // flag=true;
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
		       return cc1;
		       
    	   }else{
    		   try{
    			   context=new InitialContext();
		    	   ds=(DataSource)context.lookup("java:/comp/env/jdbc/mysql");
		    	   con=ds.getConnection();
		    	   con.setAutoCommit(false);
		    	   String sql="insert into cart(username,cno) values (?,?)";
		    	   pst=con.prepareStatement(sql);
		    	   pst.setString(1, username);
		    	   pst.setString(2, cno);
		    	   pst.executeUpdate();
		    	   con.commit();
		    	 //  flag=true;
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
    		   return null;
	    	   
	    	   
    	   } 	
	}
	
	public void delCarts(String username,String cno) {
		Connection con = DataAccess.getConnection();
		String sql = "delete from cart where username=? and cno=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, cno);
			stmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				} 
				if (stmt != null) {
					stmt.close();
				} 
				if (con != null) {
					con.close();
				} 
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	
}
