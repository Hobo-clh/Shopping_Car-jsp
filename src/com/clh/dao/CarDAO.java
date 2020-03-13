package com.clh.dao;



import java.sql.*;
import java.util.*;
import com.clh.bean.Car;
import com.clh.util.DataAccess;

public class CarDAO {
	//查询所有汽车
	public List<Car> getAllProductCar() {
		Connection con = DataAccess.getConnection();
		String sql = "SELECT * FROM ascentweb.car";
		List<Car> list = new ArrayList<Car>();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Car pu = new Car();
				pu.setCno(rs.getInt("cno"));
				pu.setCname(rs.getString("cname"));
				pu.setBrands(rs.getString("brands"));
				pu.setInventory(rs.getInt("inventory"));
				pu.setItems(rs.getString("items"));
				pu.setPrice(rs.getDouble("price"));
				pu.setSales(rs.getInt("sales"));
				pu.setImg(rs.getString("image"));
				list.add(pu);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) {
					rs.close();
				}
				if(stmt!=null) {
					stmt.close();
				}
				if(con!=null) {
					con.close();
				}
			}catch (Exception e2) {
					// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
		}
		return list;
	}
	//模糊查询（车名、车品牌、车类型）
	public List<Car> list(String keyword) {
		Connection con = DataAccess.getConnection();
		//String sql = "select * from ascentweb.car where cname=? or brands =? or items=?";
		String sql = "select * from car where concat(brands,items,cname) like '%"+keyword+
				"%' or concat(brands,cname,items) like '%"+keyword+"%' or concat(items,brands,cname) like '%"
				+keyword+"%' or concat(items,cname,brands) like '%"+keyword+
				"%' or concat(cname,brands,items) like '%"+keyword+"%' or concat(cname,items,brands) like '%"+keyword+"%'";
				
				//String sql = "select cname,price from car where concat(cname,brands,items) like %'"+carInf+"'%";
		PreparedStatement st = null;
		ResultSet rs = null ;
		List<Car> list = new ArrayList<Car>();
		Car pu = null ;
		try {
	    st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    while(rs.next()) {
		        pu = new Car();
				pu.setCno(rs.getInt("cno"));
				pu.setCname(rs.getString("cname"));
				pu.setBrands(rs.getString("brands"));
				pu.setInventory(rs.getInt("inventory"));
				pu.setItems(rs.getString("items"));
				pu.setPrice(rs.getDouble("price"));
				pu.setSales(rs.getInt("sales"));
				pu.setImg(rs.getString("image"));
		        list.add(pu);
		    }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();} 
				if (st != null) {
					st.close();} 
				if (con != null) {
					con.close();} 
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return list;
	}
	//按照车编号查询一辆车
	public Car oneCar(String cno) {
		Connection con = DataAccess.getConnection();//获取连接
		String sql = "SELECT * FROM ascentweb.car where cno="+cno;
		PreparedStatement stmt = null;//创建对象
		ResultSet rs = null; //结果集
		Car pu = new Car(); //创建新的对象
		try {
			stmt = con.prepareStatement(sql);  //预处理
			rs=stmt.executeQuery();  //执行sql
			while(rs.next()) {  
				pu.setCno(rs.getInt("cno"));
				pu.setCname(rs.getString("cname"));
				pu.setBrands(rs.getString("brands"));
				pu.setInventory(rs.getInt("inventory"));
				pu.setItems(rs.getString("items"));
				pu.setPrice(rs.getDouble("price"));
				pu.setSales(rs.getInt("sales"));
				pu.setImg(rs.getString("image"));   //将遍历得到的数据赋给pu
			}
		}catch(SQLException e){    //异常处理
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) {
					rs.close();
				}
				if(stmt!=null) {
					stmt.close();
				}
				if(con!=null) {
					con.close();
				}
			}catch (Exception e2) {  //异常处理
					// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
		}
		return pu;
	}


}
