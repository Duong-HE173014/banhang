/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import entity.Order;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StaffCanAndSucControl", urlPatterns = {"/staffCanAndSucControl"})
public class StaffCanAndSucControl extends HttpServlet {

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
            List<Order> orderList = new OrderDAO().getOrdersStaffConfirm(pageSize, page);
            if (orderList.isEmpty() && page != 1) {
                response.sendRedirect("staffCanAndSucControl");
                return;
            }
            request.setAttribute("orderList", orderList);
            request.setAttribute("page", page);
            request.getRequestDispatcher("StaffCanAndSuc.jsp").forward(request, response);
        }
        if (service.equals("searchOrder")) {
            request.setCharacterEncoding("UTF-8");
            String txt = request.getParameter("txt");
            OrderDAO dao = new OrderDAO();
            List<Order> list = dao.SearchOrdersByStaffSuc(txt);
            request.setAttribute("txtS", txt);
            request.setAttribute("orderList", list);
            request.getRequestDispatcher("StaffCanAndSuc.jsp").forward(request, response);
        }
        if (service.equals("dateOrder")) {
            request.setCharacterEncoding("UTF-8");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            OrderDAO dao = new OrderDAO();
            List<Order> listByDate = dao.SearchOrdersByDateStaffSuc(startDate, endDate);

            request.setAttribute("orderList", listByDate);
            request.getRequestDispatcher("StaffCanAndSuc.jsp").forward(request, response);
        }

        if (service.equals("edit")) {
            String action = request.getParameter("action");

            int orderID = Integer.parseInt(request.getParameter("id"));
            String productID = request.getParameter("productID"); // Lấy productID từ request
            String quantity = request.getParameter("quantity"); // Lấy quantity từ request

            action = action == null ? "" : action;
            switch (action) {
                case "cancel":
                    
                    Order order = new OrderDAO().getOrderById(orderID);
                    order.setStatus("Canceled");

                    List<OrderDetail> orderDetails = order.getOrderDetailList();
                    // Cập nhật số lượng sản phẩm trở lại kho hàng
                    updateProductQuantityForCanceledOrder(orderDetails);

                    // Xóa đơn hàng
                    new OrderDAO().deleteOrder(order);
                    response.sendRedirect("staffCanAndSucControl");
                    break;
                default:
                    request.setCharacterEncoding("UTF-8");
                    OrderDAO dao = new OrderDAO();

                    String status = request.getParameter("status");
                    String salerID = request.getParameter("salerID");

                    int SalerID = Integer.parseInt(salerID);
                    try {
                        boolean success = dao.updateOrderStatus(orderID, status, SalerID);
                    } catch (Exception ex) {
                        Logger.getLogger(StaffDashBoardControl.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    response.sendRedirect("staffCanAndSucControl");
                    break;
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

    private void updateProductQuantityForCanceledOrder(List<OrderDetail> canceledOrderDetails) {
        for (OrderDetail orderDetail : canceledOrderDetails) {
            int quantity = orderDetail.getQuantity();
            String productID = orderDetail.getProduct().getProductID();
            
            DAO productDAO = new DAO();
            productDAO.editProductQuantity(productID, quantity);
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

