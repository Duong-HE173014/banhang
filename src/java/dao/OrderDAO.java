package dao;

import context.DBContext;
import entity.Order;
import entity.OrderDetail;

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

    public boolean deleteOrder(Order order) {
        try {
            // Xóa chi tiết đơn hàng
            String queryDetails = "DELETE FROM OrderDetails WHERE OrderID = ?";
            PreparedStatement psDetails = conn.prepareStatement(queryDetails);
            psDetails.setInt(1, order.getOrderId());
            int resultDetails = psDetails.executeUpdate();

            // Xóa đơn hàng
            String queryOrder = "DELETE FROM Orders WHERE OrderID = ?";
            PreparedStatement psOrder = conn.prepareStatement(queryOrder);
            psOrder.setInt(1, order.getOrderId());
            int resultOrder = psOrder.executeUpdate();

            // Trả về true nếu cả hai lệnh xóa đều thành công
            return resultDetails > 0 && resultOrder > 0;
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

    public List<Order> getOrders(int pageSize, int pageNumber) {
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersStaff(int pageSize, int pageNumber) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Status = 'Confirm' ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    public List<Order> getOrdersStaffConfirm(int pageSize, int pageNumber) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Status = 'Delivering' ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getOrdersBySalerNull(int pageSize, int pageNumber, int IDUpdater) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE Status = 'Pending' AND [IDUpdater] = ? ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, IDUpdater);
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

    public List<Order> getOrdersBySaler(int pageSize, int pageNumber, int IDUpdater) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE [IDUpdater] = ? AND Status != 'Pending' ORDER BY OrderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            int offset = (pageNumber - 1) * pageSize;
            ps = conn.prepareStatement(query);
            ps.setInt(1, IDUpdater);
            ps.setInt(2, offset);
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> SearchOrdersByStaff(String txt) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE ([OrderID] like ? or [ReceiverFullName] like ?) AND Status = 'Confirm'";
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    
     public List<Order> SearchOrdersByStaffSuc(String txt) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE ([OrderID] like ? or [ReceiverFullName] like ?) AND Status = 'Delivering'";
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> SearchOrdersBySaler(String txt, int IDUpdater) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE [OrderID] like ? or [ReceiverFullName] like ? AND [IDUpdater] = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setString(2, "%" + txt + "%");
            ps.setInt(3, IDUpdater);
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

    public List<Order> SearchOrdersByDate(String startDate, String endDate) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE OrderDate >= ? AND OrderDate <= ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> SearchOrdersByDateStaff(String startDate, String endDate) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE (OrderDate >= ? AND OrderDate <= ?) AND Status = 'Confirm'";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    
    public List<Order> SearchOrdersByDateStaffSuc(String startDate, String endDate) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE (OrderDate >= ? AND OrderDate <= ?) AND Status = 'Delivering'";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
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
                        rs.getString("ReceiverAddress"),
                        rs.getInt("IDUpdater")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    
    
    
    public List<Order> SearchOrdersByDateAndSaler(String startDate, String endDate,int IDUpdater) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM [Orders] "
                + "WHERE OrderDate >= ? AND OrderDate <= ? AND [IDUpdater] = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ps.setInt(3, IDUpdater);
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

public Order createOrder(Order o) throws SQLException {
        String query = "INSERT INTO [dbo].[Orders]\n"
                + "           ([UserID],[OrderDate],[TotalCost],[Status]\n"
                + "           ,[ReceiverFullName],[ReceiverEmail],[ReceiverMobile]\n"
                + "           ,[ReceiverAddress],[ReceiverGender],[Notes],[PaymentMethods],[IDUpdater])\n"
                + "     VALUES (?,GETDATE(),?,'Pending',?,?,?,?,?,?,?,?)";

        try {
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, o.getUserId());
            ps.setDouble(2, o.getTotalCost());
            ps.setString(3, o.getReceiverFullName());
            ps.setString(4, o.getReceiverEmail());
            ps.setString(5, o.getReceiverMobile());
            ps.setString(6, o.getReceiverAddress());
            ps.setInt(7, o.getReceiverGender());
            ps.setString(8, o.getNotes());
            ps.setInt(9, o.getPaymentMethods());
            ps.setInt(10, o.getIdUpdater());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int orderId = rs.getInt(1);
                    o.setOrderId(orderId); // Assuming there's a setter for OrderID in Order class
                    return o;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean createOrderDetails(OrderDetail o) {
        String query = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([OrderID],[ProductID],[Thumbnail]\n"
                + "           ,[ProductName],[UnitPrice]\n"
                + "           ,[Quantity],[TotalCost])\n"
                + "     VALUES (?,?,?,?,?,?,?)";

        try {
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, o.getOrderId());
            ps.setInt(2, o.getProductId());
            ps.setString(3, o.getThumbnail());
            ps.setString(4, o.getProductName());
            ps.setDouble(5, o.getUnitPrice());
            ps.setInt(6, o.getQuantity());
            ps.setDouble(7, o.getTotalCost());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateOrderStatus(int orderId, String newStatus, int salerID) throws Exception {
        boolean success = false;
        String updateOrderQuery = "UPDATE Orders SET Status = ?, IDUpdater = ? WHERE OrderID = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement updateOrderPs = conn.prepareStatement(updateOrderQuery)) {

            // Cập nhật trạng thái mới của đơn hàng
            updateOrderPs.setString(1, newStatus);
            updateOrderPs.setInt(2, salerID);
            updateOrderPs.setInt(3, orderId);

            int rowsUpdated = updateOrderPs.executeUpdate();

            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public int getNumberOrderByStatus(String type) {
        String query = "";
        switch (type) {
            case "Pending":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Pending'";
                break;
            case "Delivering":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Delivering'";
                break;
            case "Confirm":
                query = "SELECT COUNT(* )AS Total FROM Orders WHERE Status = 'Confirm'";
                break;
            case "Successfully":
                query = "SELECT COUNT(* )AS Total FROM Orders WHERE Status = 'Successfully'";
                break;
        }
        int total = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (Exception e) {
        }
        return total;
    }

    public int getNumberOrderByStatusAndidSale(String type, int IDUpdater) {
        String query = "";
        switch (type) {
            case "Pending":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Pending' AND IDUpdater = ?";
                break;
            case "Delivering":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Delivering' AND IDUpdater = ?";
                break;
            case "Confirm":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Confirm' AND IDUpdater = ?";
                break;
            case "Successfully":
                query = "SELECT COUNT(*) AS Total FROM Orders WHERE Status = 'Successfully' AND IDUpdater = ?";
                break;
        }
        int total = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query); // Sử dụng prepareStatement thay vì prepareCall
            
                ps.setInt(1, IDUpdater);
            
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    
    public int getSalerIdWithMinOrders(){
         String query = "SELECT TOP 1 u.UserID " +
                           "FROM Users u " +
                           "LEFT JOIN Orders o ON u.UserID = o.IDUpdater " +
                           "WHERE u.Role = 'Saler' " +
                           "GROUP BY u.UserID " +
                           "ORDER BY COUNT(o.OrderID)";
         int SalerId = 0;
         try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                SalerId = rs.getInt("UserID");
            }
        } catch (Exception e) {
        }
         return SalerId;
     }
    
    
    
    
    
//    public static void main(String[] args) {
//        // Tạo một đối tượng OrderDAO
//        OrderDAO orderDAO = new OrderDAO();
//
//        // Tìm kiếm các đơn hàng theo người bán và in kết quả ra màn hình
//        String searchText = "Jo";
//        List<Order> searchResults = orderDAO.SearchOrdersBySaler(searchText);
//
//        // In kết quả tìm kiếm ra console
//        for (Order order : searchResults) {
//            System.out.println("Order ID: " + order.getOrderId() + ", Receiver: " + order.getReceiverFullName());
//        }
//    }

}
