package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {

    //Don't forget add dependency in pom.xml file !! 'jdbc'

    public static void main(String[] args) throws SQLException {
        //CONNECTION STRING
        String dbUrl = "jdbc:oracle:thin:@52.23.200.192:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";
        //Create the connection
        //DriverManager class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution. It stores only data(there is no table info)
        ResultSet rs = statement.executeQuery("SELECT * FROM DEPARTMENTS");


/*        //Getting Data
        resultSet.next();
        System.out.println("---------FIRST ROW---------");
        //right now pointer is in the first row

        //how to get data from first row?

        //resultSet.getInt(index or ColumnName) --> overloaded method
        // This method returns integer. Index stars from 1 in SQL. It refers column position
        resultSet.getInt(1);
        System.out.println(resultSet.getInt(1));

        // get Europe -region name
        System.out.println(resultSet.getString(2));

        //same info we can get with columnLabel not column index

        System.out.println(resultSet.getInt("REGION_ID"));
        System.out.println(resultSet.getString("REGION_NAME"));

        System.out.println("---------2ND ROW---------");
        //Get me second row result in following format: 2 - Americas
        resultSet.next();  //First, we need to move pointer to second row
        System.out.println(resultSet.getInt("REGION_ID") + "-" + resultSet.getString("REGION_NAME"));

        System.out.println("---------3RD ROW---------");
        resultSet.next();  //First, we need to move pointer to third row
        System.out.println(resultSet.getInt("REGION_ID") + "-" + resultSet.getString(2));

        System.out.println("---------4TH ROW---------");
        resultSet.next();  //First, we need to move pointer to fourth row
        System.out.println(resultSet.getInt("REGION_ID") + "-" + resultSet.getString(2));*/

        // what if we have 100 rows, we want to print first and second column


        //rs.next() returns boolean. So if there is no next row, it returns false and while loop stops !!
        while (rs.next()) {
            System.out.println(rs.getInt(1) +
                    "-" + rs.getString(2) +
                    "-" + rs.getString(3));
        }


        //close connection
        rs.close();
        statement.close();
        conn.close();


    }
}
