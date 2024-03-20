/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.FeedBack;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class FeedBackDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public List<FeedBack> getAllFeedBack() {
        List<FeedBack> list = new ArrayList<>();
        String query = "SELECT f.*, p.Title FROM Feedbacks f JOIN Products p ON f.productID = p.productID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FeedBack(rs.getInt("FeedbackID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("RatedStar"),
                        rs.getString("Feedback"),
                        rs.getString("Images"),
                        rs.getDate("UpdatedDate"),
                        rs.getString("Title")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteFeedback(String fFeedbackID) {
        String query = "Delete From Feedbacks\n"
                + "Where FeedbackID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fFeedbackID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertFeedback(FeedBack feedback) {
        String query = "INSERT INTO Feedbacks (UserID, ProductID, RatedStar, Feedback, Images, UpdatedDate) "
                + "VALUES (?, ?, ?, ?, ?, GETDATE())";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, feedback.getfUserID());
            ps.setInt(2, feedback.getfProductID());
            ps.setInt(3, feedback.getfRatedStar());
            ps.setString(4, feedback.getfFeedback());
            ps.setString(5, feedback.getfImages());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            closeResources();
        }
    }
    
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        FeedBackDAO dao = new FeedBackDAO();
        List<FeedBack> list = dao.getAllFeedBack();
        for (FeedBack o : list) {
            System.out.println(o);
        }
    }
}
