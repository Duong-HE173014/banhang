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

public class OrderDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create (Place Order)
    public int insertOrder(int userId, double totalCost, String status, String receiverFullName, String receiverEmail, String receiverMobile, String receiverAddress) {
        String query = "INSERT INTO Orders (UserID, OrderDate, TotalCost, Status, ReceiverFullName, ReceiverEmail, ReceiverMobile, ReceiverAddress) VALUES (?, GETDATE(), ?, ?, ?, ?, ?, ?)";

        try {
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.setDouble(2, totalCost);
            ps.setString(3, status);
            ps.setString(4, receiverFullName);
            ps.setString(5, receiverEmail);
            ps.setString(6, receiverMobile);
            ps.setString(7, receiverAddress);

            int result = ps.executeUpdate();

            if (result > 0) {
                // Retrieve the generated keys
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Return the generated Order ID
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if the insertion fails or the generated keys cannot be retrieved
    }

    // Read (Get Order by OrderID)
    public Order getOrderById(int orderId) {
        String query = "SELECT * FROM Orders WHERE OrderID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Order(
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update (Update Order)
    public boolean updateOrder(Order order) {
        String query = "UPDATE Orders SET Status=?, ReceiverFullName=?, ReceiverEmail=?, ReceiverMobile=?, ReceiverAddress=? WHERE OrderID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, order.getStatus());
            ps.setString(2, order.getReceiverFullName());
            ps.setString(3, order.getReceiverEmail());
            ps.setString(4, order.getReceiverMobile());
            ps.setString(5, order.getReceiverAddress());
            ps.setInt(6, order.getOrderId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all orders for a specific user
    public List<Order> getOrdersByUserId(int userId, int pageSize, int pageNumber) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE UserID = ? ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, (pageNumber - 1) * pageSize);
            ps.setInt(3, pageSize);
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
    
    public List<Order> getOrders( int pageSize, int pageNumber) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, (pageNumber - 1) * pageSize);
            ps.setInt(2, pageSize);
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
 
    public List<Order> SearchOrders(String txt) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE [OrderID] like ? or [ReceiverFullName] like ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setString(2, "%" + txt + "%");        
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
    
    public List<Order> SearchOrdersByDate(String txt) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE [OrderID] like ? or [ReceiverFullName] like ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setString(2, "%" + txt + "%");        
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
    


}
