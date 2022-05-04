package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private static String jdbcUsername = "lethai";
    private static String jdbcPassword = "12345";
    public static Connection getConnection(){
        Connection connection = null;
        try

        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,
                    jdbcUsername, jdbcPassword);
        } catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }

    public static void main(String[] args) {
        Connection connection = getConnection();
        if (connection != null){
            System.out.println("hello");
        }
    }
}
