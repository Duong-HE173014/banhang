/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import dao.UserDAO;
import entity.Order;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "salerOrderListContro", urlPatterns = {"/salerOrderListControl"})
public class SalerOrderListControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final int pageSize = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("go");

        if (service == null) {
            service = "showManagerOrder";
        }

        if (service.equals("showManagerOrder")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            String pageString = request.getParameter("page");
            int page = pageString == null ? 1 : Integer.parseInt(pageString);

            // Lấy danh sách đơn hàng từ hai nguồn khác nhau
            List<Order> orderList2 = new OrderDAO().getOrdersBySaler(pageSize, page, user.getUserID());
            List<Order> orderList1 = new OrderDAO().getOrdersBySalerNull(pageSize, page);

            if ((orderList1.isEmpty() && page != 1) || (orderList2.isEmpty() && page != 1)) {
                response.sendRedirect("salerOrderListControl");
                return;
            }

            // Đặt danh sách đơn hàng vào request attribute
            request.setAttribute("orderList1", orderList1);
            request.setAttribute("orderList2", orderList2);
            request.setAttribute("page", page);
            request.getRequestDispatcher("SalerOrderList.jsp").forward(request, response);
        }
        
        
        if (service.equals("searchOrder")) {
            request.setCharacterEncoding("UTF-8");
            String txt = request.getParameter("txt");
            OrderDAO dao = new OrderDAO();
            List<Order> list = dao.SearchOrdersBySaler(txt);
            request.setAttribute("txtS", txt);
            request.setAttribute("orderList1", list);
            request.getRequestDispatcher("SalerOrderList.jsp").forward(request, response);
        }
        
        
        if (service.equals("dateOrder")) {
            request.setCharacterEncoding("UTF-8");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            OrderDAO dao = new OrderDAO();
            List<Order> listByDate = dao.SearchOrdersByDateAndSaler(startDate, endDate);

            request.setAttribute("orderList1", listByDate);
            request.getRequestDispatcher("SalerOrderList.jsp").forward(request, response);
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
