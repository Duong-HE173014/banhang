/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.UserProfileDAO;
import entity.User;
import jakarta.servlet.RequestDispatcher;
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
 * @author Hi
 */
@WebServlet(name = "UpdateProfileControl", urlPatterns = {"/updateprofile"})
public class UpdateProfileControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
            String fullName = request.getParameter("fullname");
            String password = request.getParameter("password");
            String image = request.getParameter("image");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            if (!user.getEmail().equals(request.getParameter("email"))) {
                request.setAttribute("error", "You cannot change the email address.");
                doGet(request, response);
            }

            user.setFullName(fullName);
            user.setPassword(password);
            user.setPhone(phone);
            user.setAddress(address);

            UserProfileDAO userProfileDAO = new UserProfileDAO();
            boolean updateImageResult = userProfileDAO.updateUserImage(user.getEmail(), image);
            boolean result = userProfileDAO.updateUser(user);
            if (result && updateImageResult) {
                // Cập nhật thông tin trong phiên làm việc
                session.setAttribute("user", user);

                // Chuyển hướng đến trang UserProfile.jsp để hiển thị thông tin mới
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            } else {
                // Xử lý trường hợp lỗi khi cập nhật
                request.setAttribute("error", "Error occurred while updating user profile. Please try again later.");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
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
