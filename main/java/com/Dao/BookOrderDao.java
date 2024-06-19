package com.Dao;

import java.util.List;

import com.entity.Book;
import com.entity.book_order;

public interface BookOrderDao {

public boolean saveOrder(List<book_order> bd);

public List<book_order> getBook(String email);

}
