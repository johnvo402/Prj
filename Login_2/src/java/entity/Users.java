/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import context.DBContext;

/**
 *
 * @author ADMIN
 */
public class Users {

    private String user;
    private String password;

    public Users(String user, String password) {
        this.user = user;
        this.password = password;
    }

    private String md5(String passwordToHash) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(passwordToHash.getBytes());

            // Convert the byte array to a hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            // Handle the exception
            return null;
        }

    }

    public boolean isValid() {
        Connection conn = null;
        CallableStatement callableStatement = null;
        Boolean loginState = false;

        try {
            DBContext db = new DBContext();
            conn = db.getConnection();
            callableStatement = conn.prepareCall("{call CheckLogin(?, ?)}");
            callableStatement.setString(1, this.user);
            callableStatement.setString(2, md5(this.password));
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                loginState = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            if (callableStatement != null) {
                try {
                    callableStatement.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return loginState;
    }
}
