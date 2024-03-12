/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class ProductsDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productID"),
                        rs.getString("title"),
                        rs.getInt("categoryID"),
                        rs.getDate("updatedDate"),
                        rs.getString("image"),
                        rs.getString("briefInfo"),
                        rs.getString("description"),
                        rs.getString("attachedImages"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantity"),
                        rs.getBoolean("featured"),
                        rs.getString("status")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Categories";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("categoryId"), rs.getString("categoryName")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByProductID(String productID) {
        String query = "select * from Products\n"
                + "where ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString("productID"),
                        rs.getString("title"),
                        rs.getInt("categoryID"),
                        rs.getDate("updatedDate"),
                        rs.getString("image"),
                        rs.getString("briefInfo"),
                        rs.getString("description"),
                        rs.getString("attachedImages"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantity"),
                        rs.getBoolean("featured"),
                        rs.getString("status"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCategoryID(int categoryId) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products\n"
                + "where CategoryID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productID"),
                        rs.getString("title"),
                        rs.getInt("categoryID"),
                        rs.getDate("updatedDate"),
                        rs.getString("image"),
                        rs.getString("briefInfo"),
                        rs.getString("description"),
                        rs.getString("attachedImages"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantity"),
                        rs.getBoolean("featured"),
                        rs.getString("status")));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertProduct(String title, String categoryID, String updatedDate, String image,
            String briefInfo, String description, String price, String salePrice) {
        String query = "INSERT INTO [dbo].[Products] \n"
                + "([Title],[CategoryID],[UpdatedDate], [Image], [BriefInfo], [Description], [Price], [SalePrice]) \n"
                + "VALUES(?,?,GETDATE(),?,?,?,?,?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, categoryID);
            ps.setString(3, image);
            ps.setString(4, briefInfo);
            ps.setString(5, description);
            ps.setString(6, price);
            ps.setString(7, salePrice);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }

    }
    
    public void deleteProductsFromOrther(String productID) {
        String query = "Delete From Cart\n"
                + "where ProductID = ?\n"
                + "Delete From Feedbacks\n"
                + "where ProductID = ?\n"
                + "Delete From OrderDetails\n"
                + "where ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.setString(2, productID);
            ps.setString(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(String productID) {
        this.deleteProductsFromOrther(productID);
        String query = "Delete From Products\n"
                + "where ProductID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void editProduct(String productID, String title, String categoryID, String image,
            String briefInfo, String description, String price, String salePrice) {
        String query = "Update Products\n"
                + "set Title = ?,\n"
                + "Image = ?,\n"
                + "BriefInfo = ?,\n"
                + "Description = ?,\n"
                + "Piece = ?,\n"
                + "SalePiece = ?\n"
                + "Where ProductID = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, categoryID);
            ps.setString(3, image);
            ps.setString(4, briefInfo);
            ps.setString(5, description);
            ps.setString(6, price);
            ps.setString(7, salePrice);
            ps.setString(8, productID);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public int getTotalProduct() {
        String query = "select count(*) from Products";
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

    public List<Product> pacgingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products\n"
                + "ORDER BY UpdatedDate\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 10);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("productID"),
                        rs.getString("title"),
                        rs.getInt("categoryID"),
                        rs.getDate("updatedDate"),
                        rs.getString("image"),
                        rs.getString("briefInfo"),
                        rs.getString("description"),
                        rs.getString("attachedImages"),
                        rs.getDouble("price"),
                        rs.getDouble("salePrice"),
                        rs.getInt("quantity"),
                        rs.getBoolean("featured"),
                        rs.getString("status")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();
        String productIDToDelete = "";
        dao.deleteProduct(productIDToDelete);
        
    }

}
