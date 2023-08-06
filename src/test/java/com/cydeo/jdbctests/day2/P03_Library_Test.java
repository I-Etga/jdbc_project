package com.cydeo.jdbctests.day2;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class P03_Library_Test {

    // Create connection to MySQL Database
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username = "library2_client";
    String password = "6s2LQQTjBcGFfDhY";

    @Test
    public void task1() {
        //create connection
        DB_Util.createConnection("jdbc:mysql://34.230.35.214:3306/library2",
                "library2_client",
                "6s2LQQTjBcGFfDhY");

        //run query
        DB_Util.runQuery("select count(*) from books");

        String expectedBookCounts = DB_Util.getFirstRowFirstColumn();

        /*
        Actual comes from UI with selenium,cucumber etc.
         */

        String actualBookCounts = "11619";

        Assertions.assertEquals(expectedBookCounts, actualBookCounts);

        System.out.println(expectedBookCounts);

        //close connection
        DB_Util.destroy();
    }
}
