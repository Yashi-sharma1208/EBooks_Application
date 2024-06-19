package com.admin.servlet;

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

import com.db.DBConnect;
import com.entity.Book;

@WebServlet("/addBooks")
@MultipartConfig
public class Books_Servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bname = req.getParameter("bname");
			String author = req.getParameter("aname");
			Double price = Double.parseDouble(req.getParameter("price"));
			String categorie = req.getParameter("btype");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			Book book = new Book(bname, author, price, categorie, status, fileName, "admin@gmail.com");
			BookDao bd = new BookDaoImp(DBConnect.getConnection());

			boolean flag = bd.addBook(book);
			HttpSession session = req.getSession();
			if (flag) {
				String path = getServletContext().getRealPath("") + "books";
				File file = new File(path);
				System.out.println(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Book Addded Successfully...");
				resp.sendRedirect("Admin/addBooks.jsp");
			} else {
				session.setAttribute("failMsg", "Something Went Wrong..");
				resp.sendRedirect("Admin/addBooks.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}