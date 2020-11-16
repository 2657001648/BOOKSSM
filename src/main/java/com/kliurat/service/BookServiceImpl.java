package com.kliurat.service;

import com.kliurat.dao.BookMapper;
import com.kliurat.pojo.Books;
import org.springframework.stereotype.Service;

import java.util.List;


public class BookServiceImpl implements BookService {

    //service层调用dao层，所以要组合Dao
    private BookMapper bookMapper;

    //利用set方法，方便Spring直接注入
    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    public List<Books> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    public List<Books> queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }

    public Books queryBookByAuthorAndName(String author,String bookName){
        return bookMapper.queryBookByAuthorAndName(author,bookName);
    }
}
