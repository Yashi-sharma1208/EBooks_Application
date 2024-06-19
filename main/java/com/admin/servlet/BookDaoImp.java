package com.admin.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;

public class BookDaoImp implements BookDao {

	private Connection conn;

	public BookDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBook(Book b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String query = "insert into book_dtls(book_name,author,price,book_categ,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getUser_email());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			} else {
				f = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	public List<Book> getAllBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			String query = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public Book getBookById(int id) {
		Book b = null;
		try {
			String query = "select * from book_dtls where book_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateBookDetails(Book b) {
		boolean f = false;
		try {
			String query = "update book_dtls set book_name=?,author=?,price=?,status=? where book_id=? ";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			} else {
				f = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public int delete(int id) {
		int i = 0;
		try {
			String query = "delete from book_dtls  where book_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}

	public List<Book> getNewBook() {
		// TODO Auto-generated method stub
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where book_categ=? and status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;
	}

	public List<Book> getRecentBook() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where  status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;

	}

	public List<Book> getOldBook() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where  book_categ=? and status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;
	}

	public List<Book> getAllRecentBook() {

		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where  status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;

	}

	public List<Book> getAllOldBook() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where  book_categ=? and status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "oldBook");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;

	}

	public List<Book> getAllNewBook() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {

			String query = "select * from book_dtls  where book_categ=? and status=? order by book_id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "newBook");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handlee exception
			e.printStackTrace();
		}
		return list;

	}

	public List<Book> getAllOldBookById(String email, String categ) {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			String query = "select * from book_dtls where user_email=? and book_categ=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, categ);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public boolean oldBookDelete(int id, String email, String categ) {
		int i = 0;
		boolean flag = false;
		try {
			String query = "delete from book_dtls  where user_email=? and book_categ=? and book_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, categ);
			ps.setInt(3, id);
			i = ps.executeUpdate();
			if (i == 1)
				flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	public List<Book> getBookbySearch(String ch) {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			String sql = "select * from book_dtls where book_name like ? or author like ? or book_categ like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setUser_email(rs.getString(7));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
