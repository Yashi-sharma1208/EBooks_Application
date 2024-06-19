package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.entity.Book;

@WebServlet("/editBooks")
public class EditBooks_servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bname = req.getParameter("bname");
			String author = req.getParameter("aname");
			Double price = Double.parseDouble(req.getParameter("price"));
			String categorie = req.getParameter("btype");
			String status = req.getParameter("bstatus");

			BookDao bd = new BookDaoImp(DBConnect.getConnection());
			Book book = new Book();
			book.setBookId(id);
			book.setBookName(bname);
			book.setAuthor(author);
			book.setPrice(price);
			book.setStatus(status);
			boolean flag = bd.updateBookDetails(book);
			HttpSession session = req.getSession();
			if (flag) {
				session.setAttribute("succMsg", "Done");
				resp.sendRedirect("Admin/allBooks.jsp");

			} else {
				session.setAttribute("failMsg", "fail");
				resp.sendRedirect("Admin/allBooks.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
