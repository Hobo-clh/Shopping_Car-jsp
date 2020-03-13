package com.clh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clh.bean.User;
import com.clh.dao.UserDAO;

/**
 * Servlet implementation class SelServlet
 */
//@WebServlet("/SelServlet")
public class CheckUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html,charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username= request.getParameter("username");
		UserDAO dao = new UserDAO();
		User usr = dao.oneuesr(username);
		//out.print(usr.getUsername()+","+usr.getPassword());
		if(usr.getUsername()!=null) {
			out.print("<font color='red'>�û����Ѿ���ע��</font>");
		}else {
			out.print("<font color='green'>�û�����ʹ��</font>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
