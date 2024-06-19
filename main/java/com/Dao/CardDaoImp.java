package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
import com.entity.Cart;

public class CardDaoImp implements CartDao {
	private Connection conn;

	public CardDaoImp(Connection conn) {
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean flag = false;
		try {
			String query = "insert into Cart (bid,uid,book_name,author,price,totalprice) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBook_name());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalprice());

			int i = ps.executeUpdate();
			if (i == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Cart> getCartbyId(int uid) {
		Cart c = null;
		List<Cart> list = new ArrayList<Cart>();
		double totalprice = 0;
		try {
			String query = "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setOid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBook_name(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalprice = totalprice + rs.getDouble(7);
				c.setTotalprice(totalprice);
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int bid,int uid,int oid) {

		boolean flag = false;
		try {
			String sql = "delete from cart where bid=? && uid=? && oid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, oid);
			int i=ps.executeUpdate();
			if(i==1)
				flag=true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}

}
