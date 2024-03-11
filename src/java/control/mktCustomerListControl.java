/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.MKTDAO;
import entity.User;
import jakarta.servlet.RequestDispatcher;
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
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "mktCustomerListControl", urlPatterns = {"/mktCustomerList"})
public class mktCustomerListControl extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("go");
            if (service == null) {
                service = "showManager";
            }
            if (service.equals("showManager")) {
                DAO dao = new DAO();
                ResultSet listCustomer = dao.getResultSet("SELECT u.UserID, u.FullName, u.Gender, u.Email, u.Address, u.Phone, s.StatusName "
                        + "FROM Users u "
                        + "JOIN Status s ON u.StatusID = s.StatusID "
                        + "WHERE u.Role = 'User'");
                request.setAttribute("listCustomer", listCustomer);

                request.getRequestDispatcher("MKTCustomerList.jsp").forward(request, response);
            }

            if (service.equals("searchUser")) {
                request.setCharacterEncoding("UTF-8");
                String txt = request.getParameter("txt");               
                DAO dao = new DAO();
                ResultSet list = dao.getResultSet("SELECT u.UserID, u.FullName, u.Gender, u.Email, u.Address, u.Phone, s.StatusName "
                        + "FROM Users u "
                        + "JOIN Status s ON u.StatusID = s.StatusID "
                        + "WHERE u.Role = 'User' "
                        + "and (u.FullName like'%" + txt + "%' or Email like'%" + txt + "%' or Phone like'%" + txt + "%')");

                request.setAttribute("txtS", txt);
                request.setAttribute("listCustomer", list);
                request.getRequestDispatcher("MKTCustomerList.jsp").forward(request, response);
            }
            if (service.equals("edit")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    request.setCharacterEncoding("UTF-8");
                    String cus_id = request.getParameter("cusId");
                    DAO dao = new DAO();
                    ResultSet rscus = dao.getResultSet("select* from  Users where UserID=" + cus_id + "");
                    ResultSet rsdetail = dao.getResultSet("SELECT  UserID,"
                            + " FullName, \n "                           
                            + "       Gender, \n"
                            + "       Email, \n"
                            + "       Address, \n"
                            + "       Phone,\n"
                            + "       Note,\n"
                            + "       StatusID\n"
                            + "FROM Users\n"
                            + "WHERE Role = 'User' \n"
                            + "      AND UserID = " + cus_id + "");

                    request.setAttribute("cus", rscus);
                    request.setAttribute("detail", rsdetail);
                    request.getRequestDispatcher("EditCustomer.jsp").forward(request, response);
                } else {
                    MKTDAO dao = new MKTDAO();       
                    String oldStatus = request.getParameter("oldStatus");
                    String cusId = request.getParameter("id");
                    String status = request.getParameter("status");
                    int Id = Integer.parseInt(cusId);
                    int Status = Integer.parseInt(status);   
                    int OldStatus = Integer.parseInt(oldStatus);   
                    boolean success = dao.updateStatusAndSaveHistory(Id, OldStatus, Status);
                    response.sendRedirect("mktCustomerList");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(mktCustomerListControl.class.getName()).log(Level.SEVERE, null, ex);
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
