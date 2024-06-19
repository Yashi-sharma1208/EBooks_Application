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

@WebServlet("/location")
public class LocationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean f = false;
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String address = req.getParameter("address");
			String landmark = req.getParameter("land");
			String state = req.getParameter("state");
			String city = req.getParameter("city");
			String zip = req.getParameter("zip");

			User u = new User();

			u.setId(id);
			u.setAddress(address);
			u.setLandmark(landmark);
			u.setCity(city);
			u.setState(state);
			u.setZip(zip);
			UserDaoImp ud = new UserDaoImp(DBConnect.getConnection());

			f = ud.updateAddress(u);
			System.out.println(u.toString());
			System.out.println(f);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Address Added Sucessfully");
				resp.sendRedirect("location.jsp");
			} else {
				session.setAttribute("failMsg", "Something Went Wrong");
				resp.sendRedirect("location.jsp");
			}
		} catch (

		Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
