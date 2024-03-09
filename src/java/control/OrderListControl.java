/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import entity.Order;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderListControl", urlPatterns = {"/salemanagerOrderListControl"})
public class OrderListControl extends HttpServlet {

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
            String pageString = request.getParameter("page");
            int page = pageString == null ? 1 : Integer.parseInt(pageString);
            List<Order> orderList = new OrderDAO().getOrders(pageSize, page);
            if (orderList.isEmpty() && page != 1) {
                response.sendRedirect("salemanagerOrderListControl");
                return;
            }
            request.setAttribute("orderList", orderList);
            request.setAttribute("page", page);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        }
        if (service.equals("searchOrder")) {
            request.setCharacterEncoding("UTF-8");
            String txt = request.getParameter("txt");
            OrderDAO dao = new OrderDAO();
            List<Order> list = dao.SearchOrders(txt);
            request.setAttribute("txtS", txt);
            request.setAttribute("orderList", list);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        }
        if (service.equals("dateOrder")) {
            request.setCharacterEncoding("UTF-8");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            OrderDAO dao = new OrderDAO();
            List<Order> listByDate = dao.SearchOrdersByDate(startDate, endDate);
            
            request.setAttribute("orderList", listByDate);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
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