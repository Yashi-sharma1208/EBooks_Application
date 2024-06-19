package com.Dao;

import java.util.List;

import com.entity.Book;
import com.entity.Cart;

public interface CartDao {
public boolean addCart(Cart c);
public List<Cart> getCartbyId(int uid);
public boolean deleteBook(int bid,int uid,int oid);

}
