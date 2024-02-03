/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class MKTDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getNumberByType(String type) {
        String query = "";
        switch (type) {
            case "post":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Posts];";
                break;
            case "product":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Products];";
                break;
            case "user":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Users];";
                break;
            case "feedback":
                query = "SELECT COUNT(*) AS Total\n"
                        + "FROM [dbo].[Feedbacks];";
                break;
        }
        int total = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               total = rs.getInt("Total");
            }
        } catch (Exception e) {
        }
        return total;
    }
}
