package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.servlet.BookDaoImp;
import com.db.DBConnect;
@WebServlet("/deleteOld")
public class DeleteOldBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean flag=false;
		try {
			int id=Integer.parseInt(req.getParameter("book_id"));
			String em=req.getParameter("user_email");
			BookDaoImp bd=new BookDaoImp(DBConnect.getConnection());
			flag=bd.oldBookDelete(id,em,"Old Book");
			
			HttpSession session = req.getSession();
			if (flag) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("oldBookEdit.jsp");
			} else {
				session.setAttribute("failMsg", "Something Went Wrong");
				resp.sendRedirect("oldBookEdit.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
	}}
