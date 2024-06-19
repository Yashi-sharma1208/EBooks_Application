package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;

@WebServlet("/delete")
public class BooksDelete_Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			BookDao bd=new BookDaoImp(DBConnect.getConnection());
		int i=bd.delete(id);
		
		HttpSession session = req.getSession();
		if (i==1) {
			session.setAttribute("succMsg1", "Done");
			resp.sendRedirect("Admin/allBooks.jsp");

		} else {
			session.setAttribute("failMsg1", "fail");
			resp.sendRedirect("Admin/allBooks.jsp");
		}
		

		}catch(

	Exception e)
	{
		// TODO: handle exception
	}
}}
	
