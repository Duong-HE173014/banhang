/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Post;
import entity.Product;
import entity.Slider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ResultSet getResultSet(String sql) {
        ResultSet rs = null;
        Statement state;
        try {
            conn = new DBContext().getConnection();
            state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (Exception e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs;
    }

    public Vector<Product> getAllProduct() {
        Vector<Product> vector = new Vector<Product>();
        String query = "SELECT *\n"
                + "FROM [dbo].[Products]\n"
                + "ORDER BY [UpdatedDate] DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Product> getAllProductbyCategory(int categoryId) {
        Vector<Product> vector = new Vector<Product>();
        String query = "Select * from Products\n"
                + "Where CategoryID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Product> get4ProductbyCategory(int categoryId) {
        Vector<Product> vector = new Vector<Product>();
        String query = "SELECT TOP 4 * FROM Products "
                + "WHERE CategoryID = ? "
                + "ORDER BY ProductID DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Product> get5Product() {
        Vector<Product> vector = new Vector<Product>();
        String query = "SELECT TOP 5 * FROM Products ORDER BY NEWID();";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Category> getAllCategory() {
        Vector<Category> vector = new Vector<Category>();
        String query = "select * from Categories";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1),
                        rs.getString(2));
                vector.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Product getLast() {
        String query = "select top 1 * from Products\n"
                + " order by ProductID desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1),
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
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Vector<Product> get5New() {
        Vector<Product> vector = new Vector<Product>();
        String query = "select top 4 * from Products\n"
                + " order by ProductID desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Product> get5Last() {
        Vector<Product> vector = new Vector<Product>();
        String query = "select top 4 * from Products";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Product getProductByID(String id) {
        String query = "select * from Products\n"
                + "where ProductID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1),
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
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Vector<Slider> getSlider() {
        Vector<Slider> vector = new Vector<Slider>();
        String query = "select * from Sliders";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return vector;
    }

    public Post getLastPost() {
        String query = "select top 1 * from Posts\n"
                + "order by PostID desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Vector<Product> getProductbySearch(String txtSearch) {
        Vector<Product> vector = new Vector<Product>();
        String query = "Select * from Products\n"
                + "where [Title] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");//Câu lệnh like của sql có phần % bao quanh gọi là chứa
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    //dem so luong sp trong database:
    public int getTotalProducts() {
        String query = "select COUNT(*) from Products";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public Vector<Product> pagingProduct(int index) {
        Vector<Product> vector = new Vector<Product>();
        String query = "Select * from Products\n"
                + "ORDER BY UpdatedDate \n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getString(1),
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
        return vector;
    }

    public Vector<Product> getListByPage(Vector<Product> list, int start, int end) {
        Vector<Product> vector = new Vector<>();
        for (int i = start; i < end; i++) {
            vector.add(list.get(i));
        }
        return vector;
    }

    public void addProduct(Product product) {
        String query = "INSERT INTO Products (Title, CategoryID, "
                + "UpdatedDate, Image, BriefInfo, "
                + "Description, AttachedImages, Price, "
                + "SalePrice, Quantity, Featured, Status) "
                + "VALUES (?, ?, Current_timestamp, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();

            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, product.getTitle());
                ps.setInt(2, product.getCategoryID());
                ps.setString(3, product.getImage());
                ps.setString(4, product.getBriefInfo());
                ps.setString(5, product.getDescription());
                ps.setString(6, product.getAttachedImages());
                ps.setDouble(7, product.getPrice());
                ps.setDouble(8, product.getSalePrice());
                ps.setInt(9, product.getQuantity());
                ps.setBoolean(10, product.getFeatured());
                ps.setString(11, product.getStatus());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editProduct(Product product) {
        String query = "Update Products \n"
                + "set CategoryID =?, [Title] =?,\n"
                + "[BriefInfo]=?, [Image]=?, [AttachedImages]=?,\n"
                + "[Description]=?, [Quantity]=?,\n"
                + "[Price]=?,[SalePrice]=?,[Featured]=?,\n"
                + "[Status]=? where ProductID = ?";
        try {
            conn = new DBContext().getConnection();

            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, product.getTitle());
                ps.setInt(2, product.getCategoryID());
                ps.setString(3, product.getImage());
                ps.setString(4, product.getBriefInfo());
                ps.setString(5, product.getDescription());
                ps.setString(6, product.getAttachedImages());
                ps.setDouble(7, product.getPrice());
                ps.setDouble(8, product.getSalePrice());
                ps.setInt(9, product.getQuantity());
                ps.setBoolean(10, product.getFeatured());
                ps.setString(11, product.getStatus());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    public static void main(String[] args) {
        DAO dao = new DAO();

        // Gọi hàm getAllProduct() để lấy danh sách sản phẩm
        Vector<Product> products = dao.getAllProduct();

        // In ra thông tin của từng sản phẩm trong danh sách
        for (Product product : products) {
            System.out.println("Product ID: " + product.getProductID());
            System.out.println("Title: " + product.getTitle());
            System.out.println("Category ID: " + product.getCategoryID());
            System.out.println("Updated Date: " + product.getUpdatedDate());
            System.out.println("Image: " + product.getImage());
            System.out.println("Brief Info: " + product.getBriefInfo());
            System.out.println("Description: " + product.getDescription());
            System.out.println("Attached Images: " + product.getAttachedImages());
            System.out.println("Price: " + product.getPrice());
            System.out.println("Sale Price: " + product.getSalePrice());
            System.out.println("Quantity: " + product.getQuantity());
            System.out.println("Featured: " + product.getFeatured());
            System.out.println("Status: " + product.getStatus());
            System.out.println("---------------------------------------------");
        }
    }
}
