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

    public boolean deleteOrder(String Id) {
        boolean rerult = false;
        String query = "DELETE FROM [Order] WHERE order_id = ?";

        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);

            int effectRow = ps.executeUpdate();

            if (effectRow > 0) {
                rerult = true;
            }
        } catch (Exception e) {
        }
        return rerult;

    }

    public boolean updateOrder(String Id, String username, int total, String date, String des) {
        boolean rerult = false;
        String query = "UPDATE [Order]\n"
                + "SET username = ?, \n"
                + "order_total = ?,\n"
                + "order_date = CAST(? AS DATE),\n"
                + "order_des = ?\n"
                + "WHERE order_id = ?";

        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, total);
            ps.setString(3, date);
            ps.setString(4, des);
            ps.setString(5, Id);
            int effectRow = ps.executeUpdate();

            if (effectRow > 0) {
                rerult = true;
            }
        } catch (Exception e) {
        }
        return rerult;

    }

    public boolean createOrder(String Id, String username, int total, String date, String des) {
        boolean rerult = false;
        String query = "INSERT INTO [Order] (order_id, username, order_total, order_date, order_des)\n"
                + "VALUES\n"
                + "    (?, ?, ?, CAST(? AS DATE), ?)";

        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            ps.setString(2, username);
            ps.setInt(3, total);
            ps.setString(4, date);
            ps.setString(5, des);

            int effectRow = ps.executeUpdate();

            if (effectRow > 0) {
                rerult = true;
            }
        } catch (Exception e) {
        }
        return rerult;

    }

    public List<OrderDTO> searchOrders(String search) {
        List<OrderDTO> result = new ArrayList<>();
        String query = "SELECT * FROM [Order]\n"
                + "WHERE order_des like ?";

        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new OrderDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }

        return result;
    }
    public boolean checkId(String id) {
        OrderDAO dao = new OrderDAO();
        List<OrderDTO> orders = dao.getAllOrders();
        String newID = id;
        boolean isDuplicate = false;
        for (OrderDTO o : orders) {
            if (o.getOrderId().equals(newID)) {
                isDuplicate = true;
                break;
            }
        }
        return isDuplicate;
    }
}
