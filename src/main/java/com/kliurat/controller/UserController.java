package com.kliurat.controller;

import com.alibaba.fastjson.JSONObject;
import com.kliurat.pojo.Books;
import com.kliurat.pojo.User;
import com.kliurat.service.BookService;
import com.kliurat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

//    @Autowired
//    @Qualifier("BookServiceImpl")
//    private BookService bookService;

    //跳转到登录界面
    @RequestMapping("goLogin")
    public String goLogin(){
        return "login";
    }

    //跳转到注册界面
    @RequestMapping("goRegister")
    public String goRegister(){
        return "register";
    }

    @RequestMapping("/isEsist")
    public void isEsist(String username, String password,HttpServletRequest request,HttpServletResponse response) throws Exception {
        User user = userService.isExist(username, password);
        String[] remembers = request.getParameterValues("remember");
        if(remembers!=null){
            System.out.println("remembers有数值");
        }
        else {
            System.out.println("remembers没有数值");
        }
        if(user!=null)
        {

            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60*60*24*7);
            response.addCookie(cookie);
            Cookie cookie1 = new Cookie("password", password);
            cookie1.setMaxAge(60*60*24*7);
            response.addCookie(cookie1);

            response.sendRedirect(request.getContextPath()+"/book/allBook");
//            response.sendRedirect(request.getContextPath()+"/user/goMain");
        }
        else
        {
            request.setAttribute("msg","Password Error");
            response.sendRedirect(request.getContextPath()+"/user/goLogin");
//            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);

        }
    }

    @RequestMapping("/registerUser")
//    @ResponseBody
    public String registerUser(String username, String password, String email, String phone,Model model){

        User user = new User(0, username, password, email, phone, 1, 0, 1, null);
        System.out.println("接收到的user："+user);

        //判断用户名是否已存在
        User exist = userService.isExist(user.getUsername(),null);

        String msg="";
        //该用户名可用
        if(exist==null){
            model.addAttribute("msg","1");
//            msg="1";
//            modelAndView.addObject("msg","1");
        }else {
            model.addAttribute("msg","2");
//            msg="0";
//            modelAndView.addObject("msg","2");
        }
//        return msg;
//        modelAndView.setViewName("register");
        return "register";
    }

    @RequestMapping("/registerUser2")
    @ResponseBody
    public String registerUser2(User user){

//        User user = new User(0, username, password, email, phone, 1, 0, 1, null);
        System.out.println("接收到的user："+user);

        //判断用户名是否已存在
        User exist = userService.isExist(user.getUsername(),null);

        //该用户名可用
        if(exist==null){
            return "101";
        }else {
            return "100";
        }
    }

    //跳转到主界面
    @RequestMapping("goMain")
    public String goMain(){
        return "main";
    }



}
