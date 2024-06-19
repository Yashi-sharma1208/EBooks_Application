package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
import com.entity.book_order;

public class BookOrderImp implements BookOrderDao {
	private Connection conn;

	public BookOrderImp(Connection conn) {
		this.conn = conn;
	}

	public boolean saveOrder(List<book_order> blist) {
		boolean f = false;

		try {
			String sql = "insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for (book_order bd : blist) {
				ps.setString(1, bd.getOrderId());
				ps.setString(2, bd.getUser_name());
				ps.setString(3, bd.getEmail());
				ps.setString(4, bd.getAddress());
				ps.setString(5, bd.getPhone());
				ps.setString(6, bd.getBook_name());
				ps.setString(7, bd.getAuthor());
				ps.setDouble(8, bd.getPrice());
				ps.setString(9, bd.getPayment());

				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public List<book_order> getBook(String email) {
		List<book_order> list = new ArrayList<book_order>();
		book_order bo = null;
		try {
			String query = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bo = new book_order();
				bo.setId(rs.getInt(1));
				bo.setOrderId(rs.getString(2));
				bo.setUser_name(rs.getString(3));
				bo.setEmail(rs.getString(4));
				bo.setAddress(rs.getString(5));
				bo.setPhone(rs.getString(6));
				bo.setBook_name(rs.getString(7));
				bo.setAuthor(rs.getString(8));
				bo.setPrice(rs.getDouble(9));
				bo.setPayment(rs.getString(10));
				list.add(bo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	

}
