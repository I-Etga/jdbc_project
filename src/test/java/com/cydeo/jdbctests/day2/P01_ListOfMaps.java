package com.cydeo.jdbctests.day2;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMaps {

    @Test
    public void task1() {

        //Practice maps and list without connection
        Map<String, Object> rowMap1 = new HashMap<>();

        System.out.println("-----ROW MAP1-----");
        rowMap1.put("FIRST_NAME", "Steven");
        rowMap1.put("LAST_NAME", "King");
        rowMap1.put("Salary", 24000);

        System.out.println(rowMap1);

        Map<String, Object> rowMap2 = new HashMap<>();
        System.out.println("-----ROW MAP1-----");
        rowMap2.put("FIRST_NAME", "Neena");
        rowMap2.put("LAST_NAME", "Kochhar");
        rowMap2.put("Salary", 17000);

        System.out.println(rowMap2);

        List<Map<String, Object>> dataList = new ArrayList<>();
        //We will put each of the eow map to the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);

        System.out.println(dataList);
        System.out.println(dataList.get(0).get("LAST_NAME")); // It returns "King"
    }

    //With Connection

    String dbUrl = "jdbc:oracle:thin:@54.173.124.216:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task2() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES");

        //create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();
        rs.next();// we need to move to first row fo till rowMap1C

        Map<String, Object> rowMap1C = new HashMap<>();

        System.out.println("-----ROW MAP1C-----");
        rowMap1C.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1C.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap1C.put(rsmd.getColumnName(3), rs.getString(3));

        System.out.println(rowMap1C);

        Map<String, Object> rowMap2C = new HashMap<>();
        System.out.println("-----ROW MAP2C-----");
        rowMap2C.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap2C.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap2C.put(rsmd.getColumnName(3), rs.getString(3));


        System.out.println(rowMap2C);

        Map<String, Object> rowMap3C = new HashMap<>();
        System.out.println("-----ROW MAP3-----");
        rowMap3C.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap3C.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap3C.put(rsmd.getColumnName(3), rs.getString(3));


        System.out.println(rowMap3C);

        List<Map<String, Object>> dataListC = new ArrayList<>();
        //We will put each of the eow map to the list
        dataListC.add(rowMap1C);
        dataListC.add(rowMap2C);
        dataListC.add(rowMap3C);

        //close connection
        rs.close();
        statement.close();
        conn.close();
    }


    @Test
    void task3() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES ");

        //create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();

        //Create your list of maps to keep information
        List<Map<String, Object>> dataListC = new ArrayList<>();

        //How many columns we have ?
        int columnCount = rsmd.getColumnCount();

        //iterate through each row
        while (rs.next()) {
            Map<String, Object> rowMap = new HashMap<>();

            for (int i = 1; i <= columnCount; i++) {
                rowMap.put(rsmd.getColumnName(i), rs.getString(i));
            }
            //add the one row information to the list
            dataListC.add(rowMap);
        }

        //System.out.println(dataListC.get(0).get("LAST_NAME")); // It returns "King"

        for (Map<String, Object> row : dataListC) {
            System.out.println(row);
            //close connection
            rs.close();
            statement.close();
            conn.close();
        }

    }
}