/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDateTime;
import java.sql.Timestamp;
import java.time.LocalTime;

/**
 *
 * @author lvhn1
 */
public class AdminDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AdminDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Read (Get Orders by Status)
    public List<Order> getOrdersByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Status = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getTimestamp("OrderDate"),
                        rs.getDouble("TotalCost"),
                        rs.getString("Status"),
                        rs.getString("ReceiverFullName"),
                        rs.getString("ReceiverEmail"),
                        rs.getString("ReceiverMobile"),
                        rs.getString("ReceiverAddress")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public int countFeedback() {
        int count = 0;
        String query = "SELECT * FROM Feedbacks";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // Get total cost of orders from the previous n years
    public double getTotalCostOfPreviousNYears(int n) {
        double totalCost = 0.0;
        LocalDateTime currentDate = LocalDateTime.now();
        LocalDateTime previousStartDate = currentDate.minusYears(n).withDayOfYear(1).with(LocalTime.MIN); // Start of year n years ago
        LocalDateTime previousEndDate = currentDate.minusYears(n - 1).withDayOfYear(1).with(LocalTime.MIN).minusSeconds(1); // End of year n-1 years ago

        String query = "SELECT SUM(TotalCost) AS TotalCost FROM Orders WHERE OrderDate >= ? AND OrderDate <= ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setTimestamp(1, Timestamp.valueOf(previousStartDate));
            ps.setTimestamp(2, Timestamp.valueOf(previousEndDate));
            rs = ps.executeQuery();
            if (rs.next()) {
                totalCost = rs.getDouble("TotalCost");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCost;
    }

    // Read (Get Orders by Status and Date Range)
    public List<Order> getOrdersByStatusAndDateRange(String status, LocalDateTime startDate, LocalDateTime endDate) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Status = ? AND OrderDate >= ? AND OrderDate <= ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setTimestamp(2, Timestamp.valueOf(startDate));
            ps.setTimestamp(3, Timestamp.valueOf(endDate));
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getTimestamp("OrderDate"),
                        rs.getDouble("TotalCost"),
                        rs.getString("Status"),
                        rs.getString("ReceiverFullName"),
                        rs.getString("ReceiverEmail"),
                        rs.getString("ReceiverMobile"),
                        rs.getString("ReceiverAddress")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) {
        System.out.println(new AdminDAO().getTotalCostOfPreviousNYears(0));
    }

}
