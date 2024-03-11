/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
@WebServlet(name = "CartCompletion", urlPatterns = {"/cartcompletion"})
public class CartCompletion extends HttpServlet {

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
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String address = request.getParameter("address");
        String phone = request.getParameter("mobile");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setFullName(fullName);
        user.setGender(gender);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        UserDAO udao = new UserDAO();
        udao.updateUserCheckOut(user);
        // Kiểm tra xem số lượng sản phẩm trong giỏ hàng có vượt quá số lượng sản phẩm có sẵn trong kho không
        boolean productsAvailableInStock = checkProductsAvailabilityInStock(request); // Phương thức này trả về true nếu tất cả sản phẩm trong giỏ hàng có sẵn trong kho

        if (!productsAvailableInStock) {
            // Nếu có sản phẩm trong giỏ hàng không có sẵn trong kho, chuyển hướng đến trang thông báo hết hàng
            response.sendRedirect(request.getContextPath() + "/cart_out_of_stock.html");
        } else {
            // Nếu tất cả sản phẩm đều có sẵn trong kho, tiếp tục xử lý hoàn thành đơn hàng
            // Kiểm tra xem có lỗi kỹ thuật nào xảy ra không (đây là một ví dụ, bạn có thể thay thế bằng kiểm tra thực tế)
            boolean technicalError = checkForTechnicalError(); // Phương thức này trả về true nếu có lỗi kỹ thuật

            if (technicalError) {
                // Nếu có lỗi kỹ thuật, chuyển hướng đến trang lỗi
                response.sendRedirect(request.getContextPath() + "/cart_completion_error.html");
            } else {
                // Nếu không có lỗi kỹ thuật, hiển thị trang hoàn thành đơn hàng
                request.getRequestDispatcher("/CartCompletion.jsp").forward(request, response);
            }
        }
    }
    // Kiểm tra số lượng sản phẩm trong giỏ hàng có vượt quá số lượng sản phẩm có sẵn trong kho không
    private boolean checkProductsAvailabilityInStock(HttpServletRequest request) {
        // Viết mã kiểm tra số lượng sản phẩm trong giỏ hàng so với số lượng sản phẩm có sẵn trong kho ở đây
        // Ví dụ: giả định không có sản phẩm nào trong giỏ hàng vượt quá số lượng có sẵn trong kho
        return true;
    }

        // Giả định phương thức này kiểm tra các lỗi kỹ thuật trong quá trình hoàn thành đơn hàng
    private boolean checkForTechnicalError() {
        // Viết mã kiểm tra lỗi kỹ thuật ở đây (ví dụ: kiểm tra cơ sở dữ liệu, kiểm tra kết nối, ...)
        // Ví dụ: giả định lỗi kỹ thuật xảy ra ngẫu nhiên
        return Math.random() < 0.5; // 50% cơ hội để có lỗi kỹ thuật
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
