package com.kliurat.dao;

import com.kliurat.pojo.Books;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;

/*
 * @Title:
 * @Description: 这个类用来对比：继承SqlSessionDaoSupport 与不继承SqlSessionDaoSupport，而在spring-dao.xml中配置dao接口扫描包
 * 这个类是以前的用法，在之前的Spring学习中使用过
 * @param null:
 * @return
 */
public class BookMapperImplTest extends SqlSessionDaoSupport implements BookMapper {

    SqlSessionTemplate sessionTemplate;

    public int addBook(Books books) {
        return getSqlSession().getMapper(BookMapper.class).addBook(books);
    }

    public int deleteBookById(int id) {
        return 0;
    }

    public int updateBook(Books books) {
        return 0;
    }

    public Books queryBookById(int id) {
        return null;
    }

    public List<Books> queryAllBook() {
        return null;
    }

    public List<Books> queryBookByName(String bookName) {
        return null;
    }

    public Books queryBookByAuthorAndName(String author, String bookName) {
        return null;
    }
}
