package com.clh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clh.bean.User;
import com.clh.dao.LoginDAO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	 */
  //��¼
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
	//	response.setCharacterEncoding("utf-8");
	
		PrintWriter out =response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginDAO dao= new LoginDAO();
		User usr =dao.login(username, password);//�������ݿ����Ƿ���ڸ��û���������login���ظ��û������򷵻�null
		
		StringBuilder json= new StringBuilder();
		if(usr!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			json.append("{\"success\":true}");
		}else {
			/*
			 * out.println("�û�����������󣬵�½ʧ��"); out.print("<a href='./login.html'>������µ�¼</a>");
			 */
			json.append("{\"success\":false}");
		}
		response.getWriter().print(json);
		
		
	}

}
