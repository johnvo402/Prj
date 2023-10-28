/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orders = new ArrayList<>();
        String query = "SELECT * FROM [Order]";
        
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new OrderDTO(rs.getString(1),
                        rs.getString(2), 
                        rs.getInt(3), 
                        rs.getDate(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        
        return orders;
    }
}
