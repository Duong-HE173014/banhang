package dao;

import context.DBContext;
import entity.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDetailDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDetailDAO() {
        try {
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create (Insert OrderDetail)
    public boolean insertOrderDetail(OrderDetail orderDetail) {
        String query = "INSERT INTO OrderDetails (OrderID, ProductID, Thumbnail, ProductName, UnitPrice, Quantity, TotalCost) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetail.getOrderId());
            ps.setInt(2, orderDetail.getProductId());
            ps.setString(3, orderDetail.getThumbnail());
            ps.setString(4, orderDetail.getProductName());
            ps.setDouble(5, orderDetail.getUnitPrice());
            ps.setInt(6, orderDetail.getQuantity());
            ps.setDouble(7, orderDetail.getTotalCost());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Read (Get OrderDetails by OrderID)
    public List<OrderDetail> getOrderDetailsByOrderID(int orderID) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM OrderDetails WHERE OrderID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getInt("OrderDetailID"),
                        rs.getInt("OrderID"),
                        rs.getInt("ProductID"),
                        rs.getString("Thumbnail"),
                        rs.getString("ProductName"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("Quantity"),
                        rs.getDouble("TotalCost")
                );
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    // Update (Update OrderDetail)
    public boolean updateOrderDetail(OrderDetail orderDetail) {
        String query = "UPDATE OrderDetails SET ProductID=?, Thumbnail=?, ProductName=?, UnitPrice=?, Quantity=?, TotalCost=? WHERE OrderDetailID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetail.getProductId());
            ps.setString(2, orderDetail.getThumbnail());
            ps.setString(3, orderDetail.getProductName());
            ps.setDouble(4, orderDetail.getUnitPrice());
            ps.setInt(5, orderDetail.getQuantity());
            ps.setDouble(6, orderDetail.getTotalCost());
            ps.setInt(7, orderDetail.getOrderDetailId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete (Delete OrderDetail)
    public boolean deleteOrderDetail(int orderDetailID) {
        String query = "DELETE FROM OrderDetails WHERE OrderDetailID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetailID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
