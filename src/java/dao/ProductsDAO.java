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

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
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
                        rs.getString(13)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getallCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Categories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
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

    public void deleteProducts(String productID) {
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

    public int getTotalProducts() {
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

    public List<Product> pagingProdct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products\n"
                + "ORDER BY UpdatedDate\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
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
                        rs.getString(13)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();
        List<Product> list = dao.pagingProdct(20);
        for (Product o : list){
            System.out.println(o);
        }
    }
}
