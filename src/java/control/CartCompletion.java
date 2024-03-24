/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.OrderDAO;
import dao.UserDAO;
import entity.Cart;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pc
 */
@WebServlet(name = "CartCompletion", urlPatterns = {"/cartcompletion"})
public class CartCompletion extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//
//        }
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

            // Lấy thông tin từ request
            String uidS = request.getParameter("uid");
            Integer uid = Integer.parseInt(uidS);
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String genderS = request.getParameter("gender");
            Integer gender = Integer.parseInt(genderS);
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String totalS = request.getParameter("total");
            Double total = Double.parseDouble(totalS);
            String notes = request.getParameter("notes");
            String paymentS = request.getParameter("httt_ma");
            Integer payment = Integer.parseInt(paymentS);

            // Chuyển đổi giới tính từ số sang chuỗi
            String genderString;
            if (gender == 0) {
                genderString = "Female";
            } else if (gender == 1) {
                genderString = "Male";
            } else {
                genderString = "Unknown";
            }

            // Chuyển đổi phương thức thanh toán từ số sang chuỗi
            String paymentString = null;
            if (payment == 2) {
                paymentString = "COD";
            } else {
                paymentString = "Electronic Funds Transfer" + "\\nBạn đã thanh toán thành công!";
            }

            // Nếu notes rỗng, gán giá trị là "Không có"
            if (notes == null || notes.isEmpty()) {
                notes = "Không có";
            }

            // Gửi email
            sendEmail(email, "The Completion of your order", "Your Full Name: " + fullName
                    + "\\nYour gender: " + genderString + "\\nYour email: " + email + "\\nYour phonenumber: " + mobile
                    + "\\nYour address: " + address + "\\nYour note: " + notes + "\\nPayment method: " + paymentString
                    + "\\n" + "--------------------" + "\\nTotal of your bill: " + totalS + "VND");

            // Tạo đơn hàng
            OrderDAO odao = new OrderDAO();
            int salerId = odao.getSalerIdWithMinOrders();
            Order order = odao.createOrder(new Order(uid, total, fullName, email, mobile, address, gender, notes, payment, salerId));
            // Lưu chi tiết đơn hàng
            HttpSession session = request.getSession();
            Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart");
            boolean test = false;
            for (Cart items : cart) {
                OrderDetail od = new OrderDetail(order.getOrderId(),
                        Integer.parseInt(items.getProducts().getProductID()),
                        email, items.getProducts().getTitle(),
                        items.getProducts().getPrice(),
                        items.getQuantity(), total);
                test = odao.createOrderDetails(od);
            }

            // Kiểm tra số lượng sản phẩm trong kho
            boolean productsAvailableInStock = checkProductsAvailabilityInStock(request);
            // Trừ số lượng sản phẩm trong kho khi đặt hàng
            updateProductQuantityForOrder(cart);

            if (!productsAvailableInStock) {
                response.sendRedirect(request.getContextPath() + "/cart_out_of_stock.html");
            } else {
                boolean methodpayment = checkForPaymentMethod(payment);
                if (methodpayment) {
                    // Kiểm tra xem giá trị "completed" có được gửi từ trang "Electronic Funds Transfer.jsp" không
                    String completed = request.getParameter("completed");
                    if (completed != null && completed.equals("true")) {
                        // Nếu giá trị "completed" là "true", chuyển hướng đến trang "CartCompletion.jsp"
                        // Lấy danh sách sản phẩm và danh mục
                        DAO dao = new DAO();
                        Vector<Product> listP = new Vector<>();
                        Vector<Category> listC = dao.getAllCategory();
                        Product last = dao.getLast();

                        // Đặt các thuộc tính vào request
                        request.setAttribute("categoryList", new DAO().getAllCategory());
                        request.setAttribute("product", new DAO().getLast());

                        request.setAttribute("order", order);
                        request.setAttribute("orderDetails", order.getOrderDetailList());

                        request.getRequestDispatcher("CartCompletion.jsp").forward(request, response);
                    } else {

                        User user = (User) session.getAttribute("user");
                        request.setAttribute("uid", uid);
                        request.setAttribute("fullName", fullName);
                        request.setAttribute("email", email);
                        request.setAttribute("gender", gender);
                        request.setAttribute("mobile", mobile);
                        request.setAttribute("address", address);
                        request.setAttribute("total", total);
                        request.setAttribute("notes", notes);
                        request.setAttribute("payment", payment);

                        request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);

//                        request.getRequestDispatcher("ElectronicFundsTransfer.jsp").forward(request, response);
                    }
                } else {
                    if (test) {
                        // Lấy danh sách sản phẩm và danh mục
                        DAO dao = new DAO();
                        Vector<Product> listP = new Vector<>();
                        Vector<Category> listC = dao.getAllCategory();
                        Product last = dao.getLast();

                        // Đặt các thuộc tính vào request
                        request.setAttribute("categoryList", new DAO().getAllCategory());
                        request.setAttribute("product", new DAO().getLast());

                        request.setAttribute("order", order);
                        request.setAttribute("orderDetails", order.getOrderDetailList());
                        // Trừ số lượng sản phẩm trong kho khi đặt hàng
                        
                        // Chuyển hướng đến trang CartCompletion.jsp
                        request.getRequestDispatcher("CartCompletion.jsp").forward(request, response);
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartCompletion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // Kiểm tra số lượng sản phẩm trong giỏ hàng có vượt quá số lượng sản phẩm có sẵn trong kho không

    private boolean checkProductsAvailabilityInStock(HttpServletRequest request) {
        // Lấy danh sách sản phẩm trong giỏ hàng từ session
        HttpSession session = request.getSession();
        Vector<Cart> cart = (Vector<Cart>) session.getAttribute("cart");

        // Lặp qua các sản phẩm trong giỏ hàng để kiểm tra số lượng
        for (Cart cartItem : cart) {
            // Lấy sản phẩm và số lượng từ giỏ hàng
            Product product = cartItem.getProducts();
            int quantityInCart = cartItem.getQuantity();

            // Kiểm tra số lượng sản phẩm trong kho
            int quantityInStock = product.getQuantity();

            // Nếu số lượng trong giỏ hàng vượt quá số lượng trong kho
            if (quantityInCart > quantityInStock) {
                // Trả về false, tức là sản phẩm trong giỏ hàng không có sẵn đủ
                return false;
            }
        }
        // Nếu không có sản phẩm nào vượt quá số lượng trong kho, trả về true
        return true;
    }

    private boolean checkForPaymentMethod(int payment) {
        return payment == 1;
    }

    public boolean sendEmail(String to, String subject, String text) {
        // URL to which the request will be sent
        String url = "https://mail-sender-service.vercel.app/send-email";

        try {
            // Create a URL object
            URL apiUrl = new URL(url);

            // Open a connection to the URL
            HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

            // Set the request method
            connection.setRequestMethod("POST");

            // Enable input/output streams
            connection.setDoOutput(true);

            // Set the content type
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

            // Prepare the request payload
            String payload = "{\"to\":\"" + to + "\",\"subject\":\"" + subject + "\",\"text\":\"" + text + "\"}";

            // Write the payload to the output stream
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = payload.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // Get the response code
            int responseCode = connection.getResponseCode();

            // Close the connection
            connection.disconnect();

            return responseCode == 200;

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hàm cập nhật số lượng sản phẩm trong kho khi đặt hàng
    private void updateProductQuantityForOrder(Vector<Cart> cart) throws SQLException {
        for (Cart cartItem : cart) {
            int quantity = cartItem.getQuantity();
            Product product = cartItem.getProducts();
            int currentStock = product.getQuantity();

            // Tính toán số lượng còn lại sau khi đã trừ đi số lượng sản phẩm trong giỏ hàng
            int updatedStock = currentStock - quantity;

            // Cập nhật số lượng sản phẩm trong kho
            product.setQuantity(updatedStock);

            // Cập nhật vào cơ sở dữ liệu
            DAO productDAO = new DAO();
            productDAO.editProduct(product);
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
