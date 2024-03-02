package dao;

import context.DBContext;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create (Register)
    public boolean registerUser(String fullName, String email, String password, String role, boolean gender, String address, String phone) {
        String query = "INSERT INTO Users (FullName, Email, Password, Role, Gender, Address, Phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);
            ps.setBoolean(5, gender);
            ps.setString(6, address);
            ps.setString(7, phone);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Read (Get User by Email)
    public User getUserByEmail(String email) {
        String query = "SELECT * FROM Users WHERE Email = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getBoolean("Gender"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("image"),
                        rs.getString("updatedDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserByFullname(String fullname) {
        String query = "SELECT * FROM Users WHERE FullName = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getBoolean("Gender"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("image"),
                        rs.getString("updatedDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean updateUserImage(String email, String imagePath) {
        String query = "UPDATE Users SET Image=? WHERE Email=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, imagePath);
            ps.setString(2, email);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            
        } 
        return false;
    }

    // Update (Update User)
    public boolean updateUser(User user) {
        String query = "UPDATE Users SET FullName=?, Password=?, Role=?, Gender=?, Address=?, Phone=? WHERE UserID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            ps.setBoolean(4, user.isGender());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhone());
            ps.setInt(7, user.getUserID());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete (Delete User)
    public boolean deleteUser(int userID) {
        String query = "DELETE FROM Users WHERE UserID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Login
    public User loginUser(String email, String password) {
        String query = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getBoolean("Gender"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("image"),
                        rs.getString("updatedDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    Vector<User> getListUserRole() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
