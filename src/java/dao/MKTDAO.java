/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.FeedBack;
import entity.Post;
import entity.Product;
import entity.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Hi
 */
public class MKTDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getNumberByType(String type) {
        String query = "";
        switch (type) {
            case "post":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Posts];";
                break;
            case "product":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Products];";
                break;
            case "user":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Users];";
                break;
            case "feedback":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Feedbacks];";
                break;
        }
        int total = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (Exception e) {
        }
        return total;
    }

    public List<Post> getListPostsByDate(Date start, Date end) {
        List<Post> list = new ArrayList<>();

        String sql = "SELECT *\n"
                + "FROM posts\n"
                + "WHERE UpdatedDate >= DATEADD(DAY, -14, GETDATE()) \n"
                + "and UpdatedDate between ? and ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post(rs.getInt("PostID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getDate("UpdatedDate"),
                        rs.getInt("CategoryID"),
                        rs.getString("Thumbnail"),
                        rs.getString("BriefInfo"),
                        rs.getString("Details")
                );
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListProductsByDate(Date start, Date end) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT *\n"
                + "FROM Products\n"
                + "WHERE UpdatedDate >= DATEADD(DAY, -14, GETDATE()) \n"
                + "and UpdatedDate between ? and ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getDouble(10),
                        rs.getInt(11),
                        rs.getBoolean(12),
                        rs.getString(13));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getListUserByDate(Date start, Date end) {
        List<User> list = new ArrayList<>();

        String sql = "SELECT *\n"
                + "FROM Users\n"
                + "WHERE UpdatedDate >= DATEADD(DAY, -14, GETDATE()) \n"
                + "and UpdatedDate between ? and ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                User p = new User(rs.getInt("userID"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getBoolean("gender"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("image"),
                        rs.getString("updatedDate"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<FeedBack> getListFeedBackByDate(Date start, Date end) {
        List<FeedBack> list = new ArrayList<>();

        String sql = "SELECT *\n"
                + "FROM FeedBacks\n"
                + "WHERE UpdatedDate >= DATEADD(DAY, -14, GETDATE()) \n"
                + "and UpdatedDate between ? and ?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                FeedBack p = new FeedBack(rs.getInt("FeedbackID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("RatedStar"),
                        rs.getString("UpdatedDate"),
                        rs.getString("Feedback"),
                        rs.getString("Images"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateStatusAndSaveHistory(int userId, int Status, int newStatus) throws Exception {
        boolean success = false;
        String updateQuery = "UPDATE Users SET StatusID = ? WHERE UserID = ?";
        String insertHistoryQuery = "INSERT INTO CustomerStatusHistory (UserID, OldStatusID, NewStatusID, ChangedDate) VALUES (?, ?, ?, GETDATE());";

        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false);

            // Cập nhật status mới cho user
            ps = conn.prepareStatement(updateQuery);
            ps.setInt(1, newStatus);
            ps.setInt(2, userId);
            int rowsUpdated = ps.executeUpdate();

            // Thêm lịch sử vào bảng History
            ps = conn.prepareStatement(insertHistoryQuery);
            ps.setInt(1, userId);
            ps.setInt(2, Status);
            ps.setInt(3, newStatus);
            int rowsInserted = ps.executeUpdate();

            // Nếu cả hai thao tác đều thành công, đánh dấu là thành công và commit transaction
            if (rowsUpdated > 0 && rowsInserted > 0) {
                success = true;
                conn.commit();
            } else {
                conn.rollback(); // Rollback transaction nếu có lỗi
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public Vector<User> searchByUser(String txt) {
        Vector<User> vector = new Vector<>();
        String query = "select * from Users\n"
                + "WHERE Role = 'User' \n"
                + "AND ([FullName] like ? or [Email] like ? or [Phone] like ?) ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setString(2, "%" + txt + "%");
            ps.setString(3, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                User acc = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12));
                vector.add(acc);
            }
        } catch (Exception e) {
        }
        return vector;
    }

//    public static void main(String[] args) {
//        MKTDAO mkdao = new MKTDAO();
//        LocalDate localDate = LocalDate.of(2024, 1, 10);
//        LocalDate localDate1 = LocalDate.of(2024, 1, 26);
//
//        // Chuyển đổi từ LocalDate sang Date
//        Date start = java.sql.Date.valueOf(localDate);
//        Date end = java.sql.Date.valueOf(localDate1);
//
//        List<Post> list = mkdao.getListPostsByDate(start, end);
//
//        if (list.isEmpty()) {
//            System.out.println("null");
//        } else {
//            System.out.println(list.get(0).getPostID());
//        }
//    }
}
