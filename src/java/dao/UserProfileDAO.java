/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Hi
 */
public class UserProfileDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User getUser(String Fullname) {
        String query = """
                       Select * from Users
                       Where FullName = ?""";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Fullname);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getBoolean(6), 
                        rs.getString(7), 
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateUser(User user) {
        String query = "UPDATE Users SET FullName=?, Password=? WHERE Email=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
        }
        return false;
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

}
