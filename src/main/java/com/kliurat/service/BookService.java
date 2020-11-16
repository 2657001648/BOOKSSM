package com.kliurat.service;

import com.kliurat.pojo.Books;

import java.util.List;

public interface BookService {

    //增加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(int id);

    //查询全部的书
    List<Books> queryAllBook();

    //根据书籍名称查询书籍
    List<Books> queryBookByName(String bookName);

    //根据作者名称和书名查找书籍
    Books queryBookByAuthorAndName(String author,String bookName);

}
