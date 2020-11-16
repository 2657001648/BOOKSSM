package com.kliurat.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kliurat.pojo.Books;
import com.kliurat.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {

    //controller层调用service层的方法
    @Autowired
    @Qualifier("BookServiceImpl")   //@Qualifier("BookServiceImpl")说明这个bookService的值是id为BookServiceImpl这个bean的
    private BookService bookService;

    //查询全部的书籍，并且返回到一个书籍展示页面
    @RequestMapping("/allBook")
    public String list(@RequestParam(value="pageNo",defaultValue="1")int pageNo ,Model model){

        //查询前传入页码，分页大小
        PageHelper.startPage(pageNo,5);

        //startPage后面跟着的查询就是分页查询
        List<Books> list = bookService.queryAllBook();

        //使用pageInfo包装查询后的数据，封装了详细的分页信息，连续显示的页数是5
        PageInfo pageInfo = new PageInfo(list,5);
        //只需要将pageInfo传给页面就行了

        model.addAttribute("pageInfo",pageInfo);

        return "allBook";
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPager(){
        return "addBook";
    }

    //添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        //要确保传过来的时候的表单里面的name要和Books对象的属性名一致
        System.out.println("addBooks==>"+books);
        bookService.addBook(books);
        //重定向到我们的 @RequestMapping("/allBook")请求
        return "redirect:/book/allBook";
    }

    //跳转到修改书籍页面
    @RequestMapping("/toUpdateBook")
    public String toUpdatePager(int id,Model model){
        Books result = bookService.queryBookById(id);
        model.addAttribute("result",result);
        return "updateBook";
    }

    //修改书籍的请求
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        //要确保传过来的时候的表单里面的name要和Books对象的属性名一致
        System.out.println("updateBooks==>"+books);
        bookService.updateBook(books);
        //重定向到我们的 @RequestMapping("/allBook")请求
        return "redirect:/book/allBook";
    }

    //删除书籍的请求，使用RestFul风格传参数
    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){
        //要确保传过来的时候的表单里面的name要和Books对象的属性名一致
        bookService.deleteBookById(id);
        //重定向到我们的 @RequestMapping("/allBook")请求
        return "redirect:/book/allBook";
    }

    //根据名称查询书籍
    @RequestMapping("/queryBookByName")
    @ResponseBody
    public String queryBook(@RequestParam(value="pageNo",defaultValue="1")int pageNo,@RequestParam(value="bookName",defaultValue="") String bookName,Model model) throws JsonProcessingException {

        ObjectMapper objectMapper = new ObjectMapper();

        PageHelper.startPage(pageNo,5);

        List<Books> list = bookService.queryBookByName(bookName);

        PageInfo pageInfo = new PageInfo(list,5);

        System.out.println("bookName===="+bookName);
        for (Books books : list) {
            System.out.println(books);
        }
        String str= objectMapper.writeValueAsString(pageInfo);
        return str;
    }

    //判断一个作者是否拥有同名书籍
    @RequestMapping("/authorHasBook")
    @ResponseBody
    public String authorHasBook(String author, String bookName, int bookCounts, String detail, int tid, String typeName){

        Books books = bookService.queryBookByAuthorAndName(author,bookName);
        if (books==null){
            //该作者未拥有同名书籍
            Books books1 = new Books(bookName,bookCounts,detail,author,bookCounts,tid,typeName);
            System.out.println("新增的books为："+books1);
            bookService.addBook(books1);
            return "101";

        }else{
            //该作者已拥有同名书籍
            return "102";
        }
    }

}
