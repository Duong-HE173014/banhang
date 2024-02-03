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

/**
 *
 * @author Anh Phuong Le
 */
@WebServlet(name = "NewPasswordControl", urlPatterns = {"/new-password"})
public class NewPasswordControl extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewPasswordControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPasswordControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        
        request.setAttribute("otp", otp);
        request.setAttribute("email", email);
        
        request.getRequestDispatcher("NewPassword.jsp").forward(request, response);
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
        
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retypePassword");
        
        String checkOtp = (String) request.getSession().getAttribute(email + "_reset_otp");
        
        User user = new UserDAO().getUserByEmail(email);
        
        String msg = "";      
        
        if (user==null) {
            msg = "Email not found";
        } else if (otp.equals(checkOtp)) {
            
            if (password.equals(retypePassword)) {
                
                user.setPassword(password);
                new UserDAO().updateUser(user);
                msg = "Reset password success";
                
            } else {
                msg = "2 password not match";
            }
            
        } else {
            msg = "Error! Cant reset password";
        }
        
        request.setAttribute("errorMessage", msg);
        request.setAttribute("otp", otp);
        request.setAttribute("email", email);
        
        request.getRequestDispatcher("NewPassword.jsp").forward(request, response);
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
