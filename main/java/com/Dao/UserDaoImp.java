package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImp implements UserDao {

	private Connection conn;

	public UserDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String query = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			int result = ps.executeUpdate();

			if (result == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public User userLogin(String email, String password) {
		User us = null;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setZip(rs.getString(10));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return us;
	}

	public boolean updateUser(User u) {
		boolean flag = false;
		try {
			String query = "update user set name=?,email=?,phno=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhno());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}

			System.out.println(flag);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}

	public boolean updateAddress(User u) {
		boolean flag = false;
		try {
			String query = "update user set address=?,landmark=?,city=?,state=?,zip=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getAddress());
			ps.setString(2, u.getLandmark());
			ps.setString(3, u.getCity());
			ps.setString(4, u.getState());
			ps.setString(5, u.getZip());
			ps.setInt(6, u.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}

			System.out.println(flag);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;

	}

	public boolean checkUser(String email) {
		boolean flag =true;

		try {
			String query = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery(query);

			while(rs.next()) {
				flag=false;
			}

			System.out.println(flag);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
}
