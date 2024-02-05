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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="MyOrderControl", urlPatterns={"/my-order"})
public class MyOrderControl extends HttpServlet {
   
    private static final int pageSize = 5;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        // lấy thông tin người dùng
        User user = (User) request.getSession().getAttribute("user");
        
        String pageString = request.getParameter("page");
        int page = pageString==null ? 1 : Integer.parseInt(pageString);
        
        List<Order> orderList = new OrderDAO().getOrdersByUserId(user.getUserID(), pageSize, page);
        
        if (orderList.isEmpty()) {
            response.sendRedirect("my-order");
            return;
        }
        
        request.setAttribute("orderList", orderList);
        request.setAttribute("page", page);
        request.setAttribute("categoryList", new DAO().getAllCategory());
        request.setAttribute("product", new DAO().getLast());
        
        request.getRequestDispatcher("MyOrder.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
