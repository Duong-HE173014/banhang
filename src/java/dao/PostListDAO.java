/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Post;
import entity.PostCategories;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class PostListDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        String query = "Select * from Posts\n"
                + "order by PostID desc ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt("PostID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getDate("UpdatedDate"),
                        rs.getInt("CategoryID"),
                        rs.getString("Thumbnail"),
                        rs.getString("BriefInfo"),
                        rs.getString("Details")));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<PostCategories> getAllPostCategories() {
        List<PostCategories> list = new ArrayList<>();
        String query = "Select * from PostCategories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PostCategories(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Post getPostBypostID(String postID) {
        String query = "Select * from Posts\n"
                + "where PostID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Post(rs.getInt("PostID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getDate("UpdatedDate"),
                        rs.getInt("CategoryID"),
                        rs.getString("Thumbnail"),
                        rs.getString("BriefInfo"),
                        rs.getString("Details"));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public List<Post> getPostbypostCategoryID(int postCategoryID) {
        List<Post> list = new ArrayList<>();
        String query = "Select * from Posts\n"
                + "Where CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, postCategoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt("PostID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getDate("UpdatedDate"),
                        rs.getInt("CategoryID"),
                        rs.getString("Thumbnail"),
                        rs.getString("BriefInfo"),
                        rs.getString("Details")));
            }
        } catch (Exception e) {
        }

        return list;
    }
    

    public void insentPost(String pTitle, String postAuthor, String postUpdatedDate,
            String categoryID, String postThumbnail, String postBriefInfo, String postDetails) {
        String query = "INSERT INTO [dbo].[Posts] ([Title], [Author], [UpdatedDate], [CategoryID], [Thumbnail], [BriefInfo], [Details])\n"
                + "VALUES\n"
                + "(?,?,GETDATE(),?,?,?,?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pTitle);
            ps.setString(2, postAuthor);
            ps.setString(3, categoryID);
            ps.setString(4, postThumbnail);
            ps.setString(5, postBriefInfo);
            ps.setString(6, postDetails);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void deletePost(String postID) {
        String query = "Delete From Posts\n"
                + "where PostID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editPost(String postID, String pTitle, String postAuthor, String categoryID,
            String postThumbnail, String postBriefInfo, String postDetails) {
        String query = "Update Posts\n"
                + "set Title = ?,\n"
                + "Author = ?,\n"
                + "CategoryID = ?,\n"
                + "Thumbnail = ?,\n"
                + "BriefInfo = ?,\n"
                + "Details = ?\n"
                + "Where PostID = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pTitle);
            ps.setString(2, postAuthor);
            ps.setString(3, categoryID);
            ps.setString(4, postThumbnail);
            ps.setString(5, postBriefInfo);
            ps.setString(6, postDetails);
            ps.setString(7, postID);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }

    }

    public int getTotalPost() {
        String query = "select count(*) from Posts";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Post> pagingPost(int index1) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Posts\n"
                + "ORDER BY UpdatedDate\n"
                + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index1 - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt("PostID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getDate("UpdatedDate"),
                        rs.getInt("CategoryID"),
                        rs.getString("Thumbnail"),
                        rs.getString("BriefInfo"),
                        rs.getString("Details")));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) {
        PostListDAO dao = new PostListDAO();
        List<Post> list = dao.getPostbypostCategoryID(2);
        for (Post o : list) {
            System.out.println(o);
        }
    }
}
