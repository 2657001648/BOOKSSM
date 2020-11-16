package com.kliurat.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {

    //图书编号
    private int bookID;
    //图书名称
    private String bookName;
    //图书总数量
    private int bookCounts;
    //图书详情
    private String detail;
    //图书作者
    private String author;
    //图书当前可借阅数量
    private int num;
    //图书类型编号
    private int tid;
    //图书类型名称
    private String typeName;

    public Books(String bookName, int bookCounts, String detail, String author, int num, int tid, String typeName) {
        this.bookName = bookName;
        this.bookCounts = bookCounts;
        this.detail = detail;
        this.author = author;
        this.num = num;
        this.tid = tid;
        this.typeName = typeName;
    }
}
