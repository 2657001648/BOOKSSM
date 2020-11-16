package com.kliurat.service;

import com.kliurat.dao.BookTypeMapper;
import com.kliurat.pojo.BookType;

import java.util.List;

public class BookTypeServiceImpl implements BookTypeService {

    private BookTypeMapper bookTypeMapper;

    public void setBookTypeMapper(BookTypeMapper bookTypeMapper) {
        this.bookTypeMapper = bookTypeMapper;
    }

    public List<BookType> queryAllType() {
        return bookTypeMapper.queryAllType();
    }
}
