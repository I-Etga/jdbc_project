package com.cydeo.jdbctests.day2;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P02_DBUtilsPractice {

    @Test
    public void task1() {

        //create a connection
        //DB_Util.createConnection("jdbc:oracle:thin:@54.173.124.216:1521:XE", "hr", "hr");
        DB_Util.createConnection();
        // run query
        DB_Util.runQuery("SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES");

        //get result
        System.out.println("#GET ME FIRST ROW FIRST COLUMN");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("#GET ME ALL COLUMN NAMES");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("#GET ME ALL FIRST NAMES");
        System.out.println(DB_Util.getColumnDataAsList(1));

        System.out.println("#GET ME HOW MANY ROW WE HAVE");
        System.out.println(DB_Util.getRowCount());

        System.out.println("#GET ME CERTAIN ROW INFO");
        System.out.println("#GET ME as Map");
        System.out.println(DB_Util.getRowMap(2));

        System.out.println("#GET ME as List");
        DB_Util.getRowDataAsList(2);

        List<Map<String, String>> allRowAsListOfMap = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> rowMap : allRowAsListOfMap) {
            System.out.println(rowMap);
        }


        //close the connection
        DB_Util.destroy();
    }
}
