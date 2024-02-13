/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Post;
import entity.PostCategories;
import entity.Slider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Hi
 */
public class BlogDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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

    public List<Post> getPostbypostCategoryID(String postCategoryID) {
        List<Post> list = new ArrayList<>();
        String query = "Select * from Posts\n"
                + "Where CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, postCategoryID);
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

    public List<Post> getPostByTitle(String txtSearch) {
        List<Post> list = new ArrayList<>();
        String query = "Select * from Posts\n"
                + "Where Title like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
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

    public Post getlast() {
        String query = "Select top 1 * from Posts\n"
                + "order by PostID desc;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
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
    
    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        List<Post> list = dao.getAllPost();
        List<PostCategories> listC = dao.getAllPostCategories();
        for (PostCategories o : listC) {
            System.out.println(o);
        }
    }
}
