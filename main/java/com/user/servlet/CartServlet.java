package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.CardDaoImp;
import com.Dao.CartDao;
import com.admin.servlet.BookDaoImp;
import com.db.DBConnect;
import com.entity.Book;
import com.entity.Cart;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			BookDaoImp bd = new BookDaoImp(DBConnect.getConnection());
			Book b = bd.getBookById(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBook_name(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getPrice());
			c.setTotalprice(b.getPrice());
			
			CartDao cd=new CardDaoImp(DBConnect.getConnection());
			boolean f=cd.addCart(c);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("addCart","Book Added To Cart");
				resp.sendRedirect("all_newBook.jsp");
				
			}else {
				session.setAttribute("notadd","Something Went Wrong.");
				resp.sendRedirect("all_newBook.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

