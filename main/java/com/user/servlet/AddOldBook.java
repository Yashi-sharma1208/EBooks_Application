package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.admin.servlet.BookDao;
import com.admin.servlet.BookDaoImp;
import com.db.DBConnect;
import com.entity.Book;
@WebServlet("/oldbooks")
@MultipartConfig
public class AddOldBook extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bname = req.getParameter("bname");
			String author = req.getParameter("aname");
			double price = Double.parseDouble(req.getParameter("price"));
			String categorie ="Old Book";
			String status = "Active";
			Part part = req.getPart("bimg");
			String email=req.getParameter("user_email");
			String fileName = part.getSubmittedFileName();

			Book book = new Book(bname, author, price, categorie, status, fileName,email);
			BookDao bd = new BookDaoImp(DBConnect.getConnection());

			boolean flag = bd.addBook(book);
			HttpSession session = req.getSession();
			if (flag) {
				String path = getServletContext().getRealPath("") + "books";
				File file = new File(path);
				System.out.println(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Book Addded Successfully...");
				resp.sendRedirect("sellBook.jsp");
			} else {
				session.setAttribute("failMsg", "Something Went Wrong..");
				resp.sendRedirect("sellBook.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
