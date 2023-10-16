package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    private static Connection con;

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
 /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public Connection getConnection() throws Exception {
        try {
            if (con == null) {
                //driver class load
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                //create a connection..
                String url = "jdbc:sqlserver://"+serverName+":"+portNumber+";databaseName="+dbName+";user="+userID+";password="+password+"; encrypt=false";
                con = DriverManager.getConnection(url);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    /*Insert your other code right after this comment*/
 /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "DESKTOP-VGDP77D";
    private final String dbName = "LOGIN_TEST_DB";
    private final String portNumber = "1433";
    private final String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final String userID = "sa";
    private final String password = "123";
}
