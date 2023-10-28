/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO implements Serializable{
//    CREATE TABLE [Order] (
//    order_id VARCHAR(20) PRIMARY KEY,
//    username VARCHAR(50) NOT NULL,
//    order_total INT NOT NULL,
//    order_date DATE NOT NULL,
//    order_des VARCHAR(1000) NOT NULL
    private String orderId;
    private String username;
    private int orderTotal;
    private Date orderDate;
    private String orderDes;

    public OrderDTO() {
    }

    public OrderDTO(String orderId, String username, int orderTotal, Date orderDate, String orderDes) {
        this.orderId = orderId;
        this.username = username;
        this.orderTotal = orderTotal;
        this.orderDate = orderDate;
        this.orderDes = orderDes;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(int orderTotal) {
        this.orderTotal = orderTotal;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderDes() {
        return orderDes;
    }

    public void setOrderDes(String orderDes) {
        this.orderDes = orderDes;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", username=" + username + ", orderTotal=" + orderTotal + ", orderDate=" + orderDate + ", orderDes=" + orderDes + '}';
    }

    

}
