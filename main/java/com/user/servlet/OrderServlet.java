package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.BookOrderImp;
import com.Dao.CardDaoImp;
import com.Dao.CartDao;
import com.db.DBConnect;
import com.entity.Cart;
import com.entity.book_order;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int i = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("mobile");
			String address = req.getParameter("add");
			String landmark = req.getParameter("land");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String zip = req.getParameter("zip");
			String payment = req.getParameter("pay");

			String full_add = address + "," + landmark + "," + city + "," + state + "," + zip;
			HttpSession session = req.getSession();
			CartDao dao1 = new CardDaoImp(DBConnect.getConnection());
			List<Cart> c = dao1.getCartbyId(i);

			if(c.isEmpty()) {
			session.setAttribute("failMsg", "Add Item");
				resp.sendRedirect("cart.jsp");
			}
			else {
				BookOrderImp dao2 = new BookOrderImp(DBConnect.getConnection());
				
				book_order bo =null;
				ArrayList<book_order> orderlist = new ArrayList<book_order>();
				Random r=new Random();
				for (Cart cart : c) {
					bo= new book_order();
					bo.setOrderId("BOOK-ORD-00" +r.nextInt(1000));
					bo.setUser_name(name);
					bo.setEmail(email);
					bo.setPhone(phno);
					bo.setAddress(full_add);
					bo.setBook_name(cart.getBook_name());
					bo.setAuthor(cart.getAuthor());
					bo.setPrice(cart.getPrice());
					
					orderlist.add(bo);
					

				}
			

				if ("noselect".equals(payment)) {
					session.setAttribute("failMsg", "Choose Payment Method");
					resp.sendRedirect("cart.jsp");
				} else {
					boolean fa = dao2.saveOrder(orderlist);
					if (fa) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failMsg","Your Order Failed");
						resp.sendRedirect("cart.jsp");
					}
					

			}
			}} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}}
