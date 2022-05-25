package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Db {

    static private final String URL = "jdbc:mysql://localhost:3306/cloth_shop";
    static private final String UN = "root";
    static private final String PW = "1234";
    static private final String DRIVER = "com.mysql.jdbc.Driver";

    public static Connection conn;

    public static synchronized Connection getConnection() {

        try {
            if (conn == null) {
                Class.forName(DRIVER);
                conn = DriverManager.getConnection(URL, UN, PW);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }

    public static int iud(String q) {
        int r = 0;
        try {
            r = getConnection().createStatement().executeUpdate(q);
        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }
    
    public static ResultSet search(String q){
        ResultSet rs =null;
        try {
            rs = getConnection().createStatement().executeQuery(q);
        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }

}
