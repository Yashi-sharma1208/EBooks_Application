package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDaoImp;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/editProfile")
public class editProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean f = false;
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("bname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phone = req.getParameter("number");

			User u = new User();
			u.setName(name);
			u.setEmail(email);
			u.setPassword(password);
			u.setPhno(phone);
			u.setId(id);
			UserDaoImp ud = new UserDaoImp(DBConnect.getConnection());
			System.out.println(u.toString());
			f = ud.updateUser(u);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Profile Updated Successfully");
				resp.sendRedirect("editProfile.jsp");
			} else {
				session.setAttribute("failMsg", "Something Went Wrong");
				resp.sendRedirect("editProfile.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
