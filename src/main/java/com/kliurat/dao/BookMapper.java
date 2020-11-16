package com.kliurat.dao;

import com.kliurat.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    //增加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(@Param("bookId") int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Books> queryAllBook();

    //根据书籍名称查询书籍
    List<Books> queryBookByName(@Param("bookName") String bookName);

    //根据书名和作者名称查找书籍，一个作者不能拥有重名的书籍
    Books queryBookByAuthorAndName(@Param("author") String author,@Param("bookName")String bookName);

}
