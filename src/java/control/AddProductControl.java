/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;


/**
 *
 * @author pc
 */
@WebServlet(name = "AddProductControl", urlPatterns = {"/mktaddproduct"})
public class AddProductControl extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String cate = request.getParameter("category");
        String title = request.getParameter("title");
        String briefInfo = request.getParameter("briefInfo");
        String image = request.getParameter("image");
        String Attached_Image = request.getParameter("Attached_Image");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String salePrice = request.getParameter("salePrice");
        String featured_raw = request.getParameter("featured");
        String status = request.getParameter("status");
        boolean featured = Boolean.parseBoolean(featured_raw);
       
        Product p = new Product(title,Integer.parseInt(cate),image, briefInfo, description,Attached_Image, Double.parseDouble(price), Double.parseDouble(salePrice), featured, status);
        DAO d = new DAO();
        d.addProduct(p);
        Vector<Category> listC = d.getAllCategory();
        
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("ProductListMKT.jsp").forward(request, response);
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
