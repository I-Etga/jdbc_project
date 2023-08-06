package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {
    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@54.173.124.216:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS");

        //DatabaseMetaData
        DatabaseMetaData dbmetaData = conn.getMetaData();

        System.out.println(dbmetaData.getUserName());
        System.out.println(dbmetaData.getDatabaseProductName());
        System.out.println(dbmetaData.getDatabaseProductVersion());
        System.out.println(dbmetaData.getDriverName());


        //ResultSetMetaData
        ResultSetMetaData rsmd = rs.getMetaData();

        //how many columns we have ?
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        //get me column name for index 2
        System.out.println(rsmd.getColumnName(2));

        //print all column names dynamically

        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }

         /*
                #ResultSet --> it holds TABLE DATA
                    rs.next() --> it iterate each row dynamically  (with while loop)
                       rs.getString(columnIndex) --> to retrieve data itself
                       rs.getString(columnName)
                #ResultSetMetaData --> it holds TABLE INFO ( ColumnNames - Column Count)
                        rsmd.getColumnCount() --> how many columns we have
                        rsmd.getColumnName(index) --> it will give specific column name

         */


        // write a code, that prints whole table information for every query
        //Column name - Column value
        //EMPLOYEE_ID - 100
        //FIRST_NAME - Steven

        System.out.println("------ PRINT ALL DATA DYNAMICALLY ------");

        while (rs.next()) {
            //whatever we do, we will do for each row
            //REGION_ID - 1 REGION_NAME - Europe
            //REGION_ID - 2 REGION_NAME - Americas
            //System.out.println(rsmd.getColumnName(1)+"-"+rs.getString(1));
            //iterate each column
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                System.out.print(" " + rsmd.getColumnName(i) + "-" + rs.getString(i));
            }
            System.out.println();
        }


        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}
