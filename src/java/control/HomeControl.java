/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Cart;
import entity.Category;
import entity.Post;
import entity.Product;
import entity.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

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
            HttpSession session = request.getSession();
            List<Integer> categoryIds = new ArrayList<>();
            categoryIds.add(1);
            categoryIds.add(2);
            categoryIds.add(3);
            categoryIds.add(4);
            categoryIds.add(5);
            categoryIds.add(6);
       

            DAO dao = new DAO();
            Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new Vector<>();
                session.setAttribute("cart", cart);
                int totalQuantity = 0;
                session.setAttribute("totalQuantity", totalQuantity);
            }

            Map<Integer, List<Product>> productMap = new HashMap<>();
            for (Integer categoryId : categoryIds) {
                List<Product> productList = dao.get4ProductbyCategory(categoryId);
                productMap.put(categoryId, productList);
            }

            Vector<Category> listC = dao.getAllCategory();
            Vector<Slider> listS = dao.getSlider();
            Vector<Product> list5New = dao.get5New();
            Vector<Product> list5Last = dao.get5Last();
            Post lastPost = dao.getLastPost();

            
            request.setAttribute("productMap", productMap);
            request.setAttribute("tag", 0);
            request.setAttribute("listC", listC);
            request.setAttribute("listS", listS);
            request.setAttribute("5new", list5New);
            request.setAttribute("5last", list5Last);
            request.setAttribute("lPost", lastPost);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
