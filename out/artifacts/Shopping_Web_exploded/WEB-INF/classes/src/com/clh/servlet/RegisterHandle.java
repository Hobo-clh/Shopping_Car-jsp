package com.clh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.clh.bean.User;

import javax.servlet.http.HttpSession;

import com.clh.dao.LoginDAO;
import com.clh.dao.UserDAO;

/**
 * Servlet implementation class RegisterHandle
 */
@WebServlet("/RegisterHandle")
public class RegisterHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterHandle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//ע��
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=UTF-8");
		 LoginDAO ud = new LoginDAO();
		 String username=request.getParameter("username");
		 String password=request.getParameter("password");
		 PrintWriter out=response.getWriter();
		 UserDAO dao = new UserDAO();
		 User us=dao.oneuesr(username);
		 if(us.getUsername()==null) {
			 User user = new User(username,password);
			 boolean flag = ud.register(user);	//�����ݿ������Ϣ �������ɹ��򷵻�true ���򷵻�false
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitonal//EN\">");
			out.println("<HTML>");
			out.println("<HEAD><TITLE>ע����Ϣ</TITLE></HEAD>");
			out.println("<BODY><center>��");
			out.println("<br><br><br><br><br>");
			 if(flag){ 
				 out.println("<span style='font-size:40px'>�û�ע��ɹ�---");
				 
				 out.println("�û���:"+username+"</span>");
				 out.print("<a href='login.html'>���ص�¼ҳ��</a>");
			 }else{
				 out.print("�û�ע��ʧ��,������ע��!/");
			 }
		 }else {
			 out.println("�û��Ѵ��ڣ�������ע��");
			 out.print("<a href='login.html'>���ص�¼ҳ��</a>");
		 }
	}

}
