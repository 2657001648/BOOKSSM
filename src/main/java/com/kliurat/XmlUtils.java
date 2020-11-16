package com.kliurat;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class XmlUtils {

    private String PATH = "G:\\Project\\ssmbuild\\";

    //2003班excel
    @Test
    public void test() throws Exception {
        //1. 创建一个工作薄
        Workbook workbook = new HSSFWorkbook();

        //2. 创建一个工作表
        Sheet sheet = workbook.createSheet("books表");

        //3. 创建一行
        Row row0 = sheet.createRow(0);

        //4. 创建一个单元格
        Cell cell00 = row0.createCell(0);

        //5. 给该单元格设置数据
        cell00.setCellValue("1");

        Cell cell01 = row0.createCell(1);
        cell01.setCellValue("Java");

        //6. 生成文件
        FileOutputStream fileOutputStream = new FileOutputStream(PATH  + "ssmbuild03.xls");
        workbook.write(fileOutputStream);

        //7. 关闭流
        fileOutputStream.close();

        System.out.println("生成完毕");

    }

    @Test
    public void test2() throws Exception {
        //1. 创建一个工作薄
        Workbook workbook2 = new XSSFWorkbook();

        //2. 创建一个工作表
        Sheet sheet = workbook2.createSheet("books表");

        //3. 创建一行
        Row row0 = sheet.createRow(0);

        //4. 创建一个单元格
        Cell cell00 = row0.createCell(0);

        //5. 给该单元格设置数据
        cell00.setCellValue(2);

        Cell cell01 = row0.createCell(1);
        cell01.setCellValue("C++");

        //6. 生成文件
        FileOutputStream fileOutputStream = new FileOutputStream(PATH  + "ssmbuild07.xlsx");
        workbook2.write(fileOutputStream);

        //7. 关闭流
        fileOutputStream.close();

        System.out.println("生成完毕");

    }

    @Test
    public void test03Time() throws Exception{

        long begin = System.currentTimeMillis();

        //1. 创建一个工作薄
        Workbook workbook = new HSSFWorkbook();

        //2. 创建一个工作表
        Sheet sheet = workbook.createSheet("1表");

        for(int rowNum = 0; rowNum < 65535;rowNum++){
            Row row = sheet.createRow(rowNum);
            for (int cellNum = 0;cellNum < 10; cellNum++){
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("运行完毕");

        //6. 生成文件
        FileOutputStream fileOutputStream = new FileOutputStream(PATH  + "测试时间03.xls");
        workbook.write(fileOutputStream);
        fileOutputStream.close();

        long end = System.currentTimeMillis();

        System.out.println((double)(end-begin)/1000);

    }

    @Test
    public void test07Time() throws Exception{

        long begin = System.currentTimeMillis();

        //1. 创建一个工作薄
        Workbook workbook = new XSSFWorkbook();

        //2. 创建一个工作表
        Sheet sheet = workbook.createSheet("1表");

        for(int rowNum = 0; rowNum < 100000;rowNum++){
            Row row = sheet.createRow(rowNum);
            for (int cellNum = 0;cellNum < 10; cellNum++){
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("运行完毕");

        //6. 生成文件
        FileOutputStream fileOutputStream = new FileOutputStream(PATH  + "测试时间07.xlsx");
        workbook.write(fileOutputStream);
        fileOutputStream.close();

        long end = System.currentTimeMillis();

        System.out.println((double)(end-begin)/1000);

    }

    @Test
    public void test07TimePlus() throws Exception{

        long begin = System.currentTimeMillis();

        //1. 创建一个工作薄
        Workbook workbook = new SXSSFWorkbook();

        //2. 创建一个工作表
        Sheet sheet = workbook.createSheet("1表");

        for(int rowNum = 0; rowNum < 100000;rowNum++){
            Row row = sheet.createRow(rowNum);
            for (int cellNum = 0;cellNum < 10; cellNum++){
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("运行完毕");

        //6. 生成文件
        FileOutputStream fileOutputStream = new FileOutputStream(PATH  + "测试时间07Plus.xlsx");
        workbook.write(fileOutputStream);
        fileOutputStream.close();

        //清除临时文件
        ((SXSSFWorkbook)workbook).dispose();

        long end = System.currentTimeMillis();

        System.out.println((double)(end-begin)/1000);

    }

}
