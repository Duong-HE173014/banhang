package control;

import dao.SettingDAO;
import entity.Setting;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "AdminSettingControl", urlPatterns = {"/admin/setting"})
public class AdminSettingControl extends HttpServlet {

    private SettingDAO settingDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        settingDAO = new SettingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageString = request.getParameter("page");

        int pageNumber = pageString == null ? 1 : Integer.parseInt(pageString);
        int pageSize = 5;

        // List settings with pagination
        List<Setting> settingList = settingDAO.getAllSettings(pageNumber, pageSize);

        // Get total number of settings
        int totalSettings = settingDAO.getAllSettings().size();

        // Calculate total number of pages
        int totalPages = (int) Math.ceil((double) totalSettings / pageSize);

        // Forward setting list and pagination parameters to JSP
        request.setAttribute("settingList", settingList);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("../setting-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Determine action (add or update)
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addSetting(request, response);
                    break;
                case "update":
                    updateSetting(request, response);
                    break;
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve setting data from request parameters
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int order = Integer.parseInt(request.getParameter("order"));

        // Add the setting
        boolean success = settingDAO.addSetting(type, value, order);
        if (success) {
            // Redirect to setting list page after successful addition
            response.sendRedirect("setting?success");
        } else {
            response.sendRedirect("setting?fail");
        }
    }

    private void updateSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve setting data from request parameters
        int settingId = Integer.parseInt(request.getParameter("settingId"));
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int order = Integer.parseInt(request.getParameter("order"));

        // Create a Setting object with the updated data
        Setting setting = new Setting(settingId, type, value, order);

        // Update the setting
        boolean success = settingDAO.updateSetting(setting);
        if (success) {
            // Redirect to setting list page after successful update
            response.sendRedirect("setting?success");
        } else {
            // Handle update failure
            response.sendRedirect("setting?fail");
        }
    }
}
