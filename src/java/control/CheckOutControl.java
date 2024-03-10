/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import entity.Cart;
import entity.Category;
import entity.Post;
import entity.Product;
import entity.Slider;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author pc
 */
@WebServlet(name = "CheckOutControl", urlPatterns = {"/checkout"})
public class CheckOutControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
// Lấy đối tượng HttpSession từ request
            HttpSession session = request.getSession();
            // Lấy đối tượng giỏ hàng từ session
            Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart");
            //b1: get data from dao
            DAO dao = new DAO();
            Vector<Product> listP = new Vector<>();
            Vector<Category> listC = dao.getAllCategory();
            Product last = dao.getLast();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                // Lấy thông tin người dùng từ cơ sở dữ liệu
                String fullName = user.getFullName();
                boolean gender = user.isGender();
                String email = user.getEmail();
                String mobile = user.getPhone();
                String address = user.getAddress();
                // Đưa thông tin người dùng vào request để hiển thị trên trang JSP
                request.setAttribute("uid",user.getUserID() );
                request.setAttribute("fullName", fullName);
                request.setAttribute("gender", gender);
                request.setAttribute("email", email);
                request.setAttribute("mobile", mobile);
                request.setAttribute("address", address);
            } else {

            }

            // Thực hiện xử lý dữ liệu của giỏ hàng (nếu cần)
//            if (cart != null) {
//                // Ví dụ: tính tổng tiền của giỏ hàng
//                double totalCost = 0;
//                double totalCostOfProducts = 0; // Tổng thành tiền của các sản phẩm
//                double shipFeeRate = 0.05; // Tỷ lệ phí ship (5%)
//                double shipFee = 0;
//                for (Cart product : cart) {
//                    totalCostOfProducts += product.getProducts().getSalePrice() * product.getQuantity();
//                }
//                // Tính phí ship
//                shipFee = totalCostOfProducts * shipFeeRate;
//
//                // Tổng thành tiền của giỏ hàng
//                totalCost = totalCostOfProducts + shipFee;
//                // Đưa dữ liệu của giỏ hàng vào request để chuyển đến trang JSP
//                request.setAttribute("cart", cart);
//                request.setAttribute("totalCostOfProducts", totalCostOfProducts);
//                request.setAttribute("shipFee", shipFee);
//                request.setAttribute("totalCost", totalCost);
//            }
            request.setAttribute("tag", 0);
            request.setAttribute("listP", listP);
            request.setAttribute("listC", listC);
            request.setAttribute("p", last);
            request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
