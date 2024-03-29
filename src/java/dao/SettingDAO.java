package dao;

import context.DBContext;
import entity.Setting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SettingDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public SettingDAO() {
        try {
            // Initialize the connection in the constructor
            conn = new DBContext().getConnection();
        } catch (Exception ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Create
    public boolean addSetting(String type, String value, int order) {
        String query = "INSERT INTO Settings (Type, Value, [Order]) VALUES (?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, type);
            ps.setString(2, value);
            ps.setInt(3, order);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Read
    public Setting getSettingByID(int settingID) {
        String query = "SELECT * FROM Settings WHERE SettingID = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, settingID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Setting(
                        rs.getInt("SettingID"),
                        rs.getString("Type"),
                        rs.getString("Value"),
                        rs.getInt("Order")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update
    public boolean updateSetting(Setting setting) {
        String query = "UPDATE Settings SET Type=?, Value=?, [Order]=? WHERE SettingID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, setting.getType());
            ps.setString(2, setting.getValue());
            ps.setInt(3, setting.getOrder());
            ps.setInt(4, setting.getSettingID());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete
    public boolean deleteSetting(int settingID) {
        String query = "DELETE FROM Settings WHERE SettingID=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, settingID);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all settings
    public List<Setting> getAllSettings() {
        List<Setting> settingsList = new ArrayList<>();
        String query = "SELECT * FROM Settings";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSettingID(rs.getInt("SettingID"));
                setting.setType(rs.getString("Type"));
                setting.setValue(rs.getString("Value"));
                setting.setOrder(rs.getInt("Order"));
                settingsList.add(setting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settingsList;
    }

    // Get all settings with pagination
    public List<Setting> getAllSettings(int pageNumber, int pageSize) {
        List<Setting> settingsList = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY SettingID) AS RowNum, * FROM Settings) AS SubQuery WHERE RowNum BETWEEN ? AND ?";
        int startIndex = (pageNumber - 1) * pageSize + 1;
        int endIndex = pageNumber * pageSize;
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, startIndex);
            ps.setInt(2, endIndex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSettingID(rs.getInt("SettingID"));
                setting.setType(rs.getString("Type"));
                setting.setValue(rs.getString("Value"));
                setting.setOrder(rs.getInt("Order"));
                settingsList.add(setting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settingsList;
    }

}
