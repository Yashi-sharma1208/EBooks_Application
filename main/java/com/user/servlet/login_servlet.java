package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Dao.UserDaoImp;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			UserDao ud = new UserDaoImp(DBConnect.getConnection());

			HttpSession session = req.getSession();

			String uemail = req.getParameter("email");
			String upass = req.getParameter("password");

			System.out.println(uemail);

			if ("admin@gmail.com".equals(uemail) && "admin".equals(upass)) {
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us);
				resp.sendRedirect("Admin/home.jsp");
			} else {
				User user = ud.userLogin(uemail, upass);
				if (user != null) {
					session.setAttribute("userobj",user);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Email & Password Invalid...");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
