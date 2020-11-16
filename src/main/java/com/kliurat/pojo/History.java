package com.kliurat.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class History {
    private int hid;
    private int userID;
    private int bookID;
    private String beginTime;
    private String endTime;
    private int status;
}
