package com.kliurat.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kliurat.pojo.BookType;
import com.kliurat.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/bookType")
public class BookTypeController {

    @Autowired
    @Qualifier("BookTypeServiceImpl")
    private BookTypeService bookTypeService;

    @RequestMapping("/getTypeName")
    @ResponseBody
    public String getTypeName() throws JsonProcessingException {

        List<BookType> typesList = bookTypeService.queryAllType();
        ObjectMapper objectMapper = new ObjectMapper();
        String str = objectMapper.writeValueAsString(typesList);

        return str;
    }

}
