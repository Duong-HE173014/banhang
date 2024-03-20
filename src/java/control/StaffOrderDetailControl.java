/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StaffOrderDetailControl", urlPatterns = {"/staffOrderDetailControl"})
public class StaffOrderDetailControl extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            request.setCharacterEncoding("UTF-8");
            String orderID = request.getParameter("orderId");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            DAO dao = new DAO();

            ResultSet rsInfoSaler = dao.getResultSet("SELECT u.UserID, u.FullName, COUNT(o.OrderID) AS NumOrdersWithUserID\n"
                    + "FROM Users u\n"
                    + "LEFT JOIN Orders o ON u.UserID = o.IDUpdater\n"
                    + "WHERE u.Role = 'Saler'\n"
                    + "GROUP BY u.UserID, u.FullName");

            ResultSet rsdetail = dao.getResultSet("SELECT \n"
                    + "    o.OrderID,\n"
                    + "    o.OrderDate,\n"
                    + "    o.TotalCost,\n"
                    + "    o.Status,\n"
                    + "    o.ReceiverFullName,\n"
                    + "    o.ReceiverEmail,\n"
                    + "    o.ReceiverMobile,\n"
                    + "    o.ReceiverAddress,\n"
                    + "    o.IDUpdater,\n"
                    + "    o.Notes,\n"
                    + "    od.ProductName,\n"
                    + "    od.Quantity\n"
                    + "FROM \n"
                    + "    Orders o\n"
                    + "INNER JOIN \n"
                    + "    OrderDetails od ON o.OrderID = od.OrderID\n"
                    + "INNER JOIN \n"
                    + "    Products p ON od.ProductID = p.ProductID\n"
                    + "WHERE \n"
                    + "    o.OrderID = " + orderID + "");

            System.out.println(" rsdetail" + rsdetail);
            request.setAttribute("rsInfoSaler", rsInfoSaler);
            request.setAttribute("detail", rsdetail);
            request.getRequestDispatcher("StaffOrderDetail.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SaleManageEditOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SaleManageEditOrder.class.getName()).log(Level.SEVERE, null, ex);
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
