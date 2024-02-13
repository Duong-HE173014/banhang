/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import entity.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author lvhn1
 */
@WebServlet(name = "OrderDetailControl", urlPatterns = {"/order-details"})
public class OrderDetailControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        action = action == null ? "" : action;
        int orderid = Integer.parseInt(request.getParameter("id"));

        Order order = new OrderDAO().getOrderById(orderid);

        switch (action) {
            case "cancel" -> {

                order.setStatus("Canceled");
                new OrderDAO().updateOrder(order);
                response.sendRedirect("order-details?id=" + orderid);

            }
            default -> {
                request.setAttribute("categoryList", new DAO().getAllCategory());
                request.setAttribute("product", new DAO().getLast());
                
                request.setAttribute("order", order);
                request.setAttribute("orderDetails", order.getOrderDetailList());

                request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
