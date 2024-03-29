package dao;

import context.DBContext;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    public List<User> getAllPagination(int pageNumber, int pageSize) {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY UserID) AS RowNum, * FROM Users) AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setGender(rs.getBoolean("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setImage(rs.getString("image"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();

                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setGender(rs.getBoolean("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setImage(rs.getString("image"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
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

    public boolean updateUserCheckOut(User user) {
        String query = "UPDATE Users SET FullName=?, email=?, Gender=?, Address=?, Phone=? WHERE UserID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            if (user.isGender()) {
                ps.setInt(3, 1);
            } else {
                ps.setInt(3, 0);
            }
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            ps.setInt(6, user.getUserID());
            ps.executeUpdate();
            return true;
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

                User user = new User();

                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setGender(rs.getBoolean("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setImage(rs.getString("image"));

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getFilteredUsers(String fullName, String email, String role, String gender, int pageNumber, int pageSize) {
        List<User> filteredUserList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY UserID) AS RowNum FROM Users WHERE 1=1";
        // Add filter conditions
        if (fullName != null && !fullName.isEmpty()) {
            query += " AND FullName LIKE '%" + fullName + "%'";
        }
        if (email != null && !email.isEmpty()) {
            query += " AND Email LIKE '%" + email + "%'";
        }
        if (role != null && !role.isEmpty()) {
            query += " AND Role = '" + role + "'";
        }
        if (gender != null && !gender.isEmpty()) {
            query += " AND Gender = " + Boolean.parseBoolean(gender);
        }
        // Add pagination
        query += ") AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setGender(rs.getBoolean("Gender"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setImage(rs.getString("image"));
                user.setUpdatedDate(rs.getString("updatedDate"));
                filteredUserList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredUserList;
    }

}
