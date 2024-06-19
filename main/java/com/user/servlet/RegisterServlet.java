package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
// to get the data entered by the student 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String uname = req.getParameter("name");
			String uemail = req.getParameter("email");
			String upass = req.getParameter("password");
			String uphone = req.getParameter("phone");
			String ucheck = req.getParameter("check");

			// create user object
			User user = new User();
			user.setName(uname);
			user.setEmail(uemail);
			user.setPassword(upass);
			user.setPhno(uphone);

			HttpSession session = req.getSession();

			// sending data to database
			if (ucheck != null) {
				// succesfull
				UserDao ud = new UserDaoImp(DBConnect.getConnection());
//				boolean flag = ud.userRegister(user);
				boolean f2 = ud.checkUser(uemail);
				if (f2) {
					boolean f = ud.userRegister(user);
					if (f) {
						session.setAttribute("sucMsg", "Registration Successfull.....");
						resp.sendRedirect("Register.jsp");
					} else {
						session.setAttribute("failMsg", "Registration Unsuccessfull...");
						resp.sendRedirect("Register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User Already Exist Try Another EmailId");
					resp.sendRedirect("Register.jsp");
				}

			} else {
				// unsuccessfull
				session.setAttribute("failedMsg", "Please Agree Terms and Conditions");
				resp.sendRedirect("Register.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
