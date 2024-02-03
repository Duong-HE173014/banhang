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
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)));
            }
        } catch (Exception e) {
        }
        return vector;
    }
    public Vector<Product> getAllProductbyCategory( int categoryId) {
        Vector<Product> vector = new Vector<Product>();
        String query = "Select * from Products\n"
                + "Where CategoryID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)));
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
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)
                );
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
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)
                ));
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
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)
                ));
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
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9));
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
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Vector<Product> getProductbySearch( String txtSearch) {
        Vector<Product> vector = new Vector<Product>();
        String query = "Select * from Products\n"
                + "where [Title] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%"+ txtSearch+"%");//Câu lệnh like của sql có phần % bao quanh gọi là chứa
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)));
            }
        } catch (Exception e) {
        }
        return vector;
    }
    
    //dem so luong sp trong database:
    public int getTotalProducts(){
        String query = "select COUNT(*) from Products";
        try{
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){
            
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
            ps.setInt(1, (index-1)*12);
            rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getDouble(9)));
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
    
//        public static void main(String[] args) {
//                DAO dao = new DAO();
//                Vector<Slider> list = dao.getSlider();
//                for(Slider pd : list){
//                    System.out.println(pd);
//                }
//            }
//public static void main(String[] args) {
//    DAO dao = new DAO(); // Tạo một đối tượng DAO
//
//    // Gọi phương thức getProductByID() từ DAO với một id cụ thể
//    String productId = "6"; // Thay "yourProductId" bằng một id cụ thể
//    Product product = dao.getProductByID(productId);
//
//    // In ra thông tin của sản phẩm có id tương ứng
//    if (product != null) {
//        System.out.println("Thông tin sản phẩm có ID " + productId + ":");
//        System.out.println(product.toString());
//    } else {
//        System.out.println("Không có sản phẩm nào có ID " + productId + ".");
//    }
//}
    }

