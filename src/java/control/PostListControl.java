/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.PostListDAO;
import entity.Post;
import entity.PostCategories;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Hi
 */
@WebServlet(name="PostListControl", urlPatterns={"/mktpostlist"})
public class PostListControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PostListDAO dao = new PostListDAO();
        
        String postcateid = request.getParameter("postcateID");
        if (postcateid != null) {
            List<Post> list = dao.getPostbypostCategoryID(Integer.parseInt(postcateid));
            request.setAttribute("listPL", list);
        } else {
            List<Post> list = dao.getAllPost();
            request.setAttribute("listPL", list);
        }
        String indexPage = request.getParameter("index1");
        if(indexPage == null){
            indexPage = "1";
        }
        int index1 = Integer.parseInt(indexPage);
        int count = dao.getTotalPost();
        int endPage = count/3;
        if(count % 3 != 0){
            endPage++;
        }
        List<Post> lo = dao.pagingPost(index1);
        
        List<PostCategories> listcc = dao.getAllPostCategories();
        
        request.setAttribute("listcc", listcc);
        request.setAttribute("endPo", endPage);
        request.setAttribute("listpo", lo);
        request.getRequestDispatcher("PostList.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
