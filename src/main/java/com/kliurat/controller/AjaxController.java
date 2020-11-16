package com.kliurat.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kliurat.pojo.Books;
import com.kliurat.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ajax")
public class AjaxController {

    //controller层调用service层的方法
    @Autowired
    @Qualifier("BookServiceImpl")   //@Qualifier("BookServiceImpl")说明这个bookService的值是id为BookServiceImpl这个bean的
    private BookService bookService;

//    //根据名称查询书籍
//    @RequestMapping("/queryBookByName")
//    public String queryBook(@RequestParam(value="pageNo",defaultValue="1")int pageNo,@RequestParam(value="bookName",defaultValue="") String bookName,Model model) throws JsonProcessingException {
//
//        ObjectMapper objectMapper = new ObjectMapper();
//
//        PageHelper.startPage(pageNo,2);
//
//        List<Books> list = bookService.queryBookByName(bookName);
//
//        PageInfo pageInfo = new PageInfo(list,5);
//
//        System.out.println("bookName===="+bookName);
//        for (Books books : list) {
//            System.out.println(books);
//        }
//        String str= objectMapper.writeValueAsString(pageInfo);
//        return str;
//    }



}
