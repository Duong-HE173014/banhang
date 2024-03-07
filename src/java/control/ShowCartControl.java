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
import jakarta.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Vector;

/**
 *
 * @author pc
 */
@WebServlet(name = "ShowCartControl", urlPatterns = {"/showCart"})
public class ShowCartControl extends HttpServlet {

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
            String service = request.getParameter("go");
            int totalQuantity = (int) session.getAttribute("totalQuantity");
            DAO dao = new DAO();
            Vector<Product> listP = new Vector<>();
            Vector<Category> listC = dao.getAllCategory();
            Vector<Product> list5New = dao.get5New();
            request.setAttribute("5new", list5New);
            request.setAttribute("listC", listC);
            request.setAttribute("tag", 0);
            Product last = dao.getLast();
            request.setAttribute("p", last);
            String value = "";
            
            if (service == null) {
                request.getRequestDispatcher("/CartDetail.jsp").forward(request, response);
            } else {
                if ("addInMain".equals(service) || "add".equals(service) || "addInDetail".equals(service)) {
                    String id = request.getParameter("id");
                    Vector<Product> cart = (Vector<Product>) session.getAttribute("cart");
                    boolean isExist = false;

                    // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
                    for (Product product : cart) {
                        if (product.getProductID().equals(id)) {
                            product.setQuantity(product.getQuantity() + 1);
                            isExist = true;
                            break;
                        }
                    }

                    // Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
                    if (!isExist) {
                        cart.add(dao.getProductByID(id));
                    }
                        totalQuantity = 0;
                    for (Product product : cart) {
                        totalQuantity += product.getQuantity();
                    }
                    session.setAttribute("totalQuantity", totalQuantity);
                    session.setAttribute("cart", cart);
                    // Redirect tới trang tương ứng với mỗi service
                    if ("addInMain".equals(service)) {
                        response.sendRedirect("home");
                    } else if ("add".equals(service)) {
                        response.sendRedirect("products");
                    } else if ("addInDetail".equals(service)) {
                        response.sendRedirect("detail?pid=" + id);
                    }
                }
                if ("remove".equals(service)) {
                    String id = request.getParameter("id");
                    Vector<Product> cart = (Vector<Product>) session.getAttribute("cart");
                    Iterator<Product> iterator = cart.iterator();
                    while (iterator.hasNext()) {
                        Product item = iterator.next();
                        if (item.getProductID().equals(id)) {
                            if (item.getQuantity() > 0) {
                                item.setQuantity(item.getQuantity() - 1);
                            if(item.getQuantity() ==0){
                                iterator.remove();
                            }
                            } 
                            break;
                        }
                    }
                        totalQuantity = 0;
                    for (Product product : cart) {
                        totalQuantity += product.getQuantity();
                    }
                    session.setAttribute("totalQuantity", totalQuantity);                    
                    session.setAttribute("cart", cart);
                    response.sendRedirect("showCart");
                }
                if ("removeAll".equals(service)) {
                    Vector<Product> cart = (Vector<Product>) session.getAttribute("cart");
                    cart.clear();
                    totalQuantity = 0;
                    session.setAttribute("totalQuantity", totalQuantity);
                    session.setAttribute("cart", cart);
                    response.sendRedirect("showCart");
                }

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
