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
import java.util.HashSet;
import java.util.Vector;

/**
 *
 * @author pc
 */
@WebServlet(name = "EditProductDetailControl", urlPatterns = {"/mkteditproduct"})
public class EditProductDetailControl extends HttpServlet {

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
            String pid = request.getParameter("productID");
            DAO d = new DAO();
            Product p = d.getProductByID(pid);
            Vector<Category> listC = d.getAllCategory();
            if (p != null) {
                request.setAttribute("details", p);
                request.setAttribute("listC", listC);
                request.getRequestDispatcher("ProductDetailsEdit.jsp").forward(request, response);
            } else {
                out.println("Không tìm thấy thông tin sản phẩm");
            }
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
        try {
            PrintWriter out = response.getWriter();
            String pid = request.getParameter("productID");
            String cid = request.getParameter("category");
            String ptitle = request.getParameter("title");
            String pbrief = request.getParameter("briefInfo");
            String pthumb = request.getParameter("thumbnail");
            String pimage = request.getParameter("image");
            String pdesc = request.getParameter("description");
            String pquantity = request.getParameter("quantity");
            String pprice = request.getParameter("listPrice");
            String psprice = request.getParameter("salePrice");
            String pfea = request.getParameter("featured");
            String pstatus = request.getParameter("status");
            
            Product p = new Product();
            p.setProductID(pid);
            p.setCategoryID(Integer.parseInt(cid));
            p.setTitle(ptitle);
            p.setBriefInfo(pbrief);
            p.setImage(pthumb);
            p.setAttachedImages(pimage);
            p.setDescription(pdesc);
            p.setQuantity(Integer.parseInt(pquantity));
            p.setPrice(Double.parseDouble(pprice));
            p.setSalePrice(Double.parseDouble(psprice));
            p.setFeatured(Boolean.valueOf(pfea));
            p.setStatus(pstatus);
            DAO d = new DAO();
            d.editProduct(p);
            response.sendRedirect("mktproductlist?productID="+pid);
        } catch (Exception e) {
            e.printStackTrace();
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
