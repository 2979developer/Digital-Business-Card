package DashBoradLogic.org;


import com.org.*;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import utils.DBConnection;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);

        // ✅ Check if user is logged in
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try (Connection con = DBConnection.getConnection()) {
            
            // ✅ Total Cards
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT COUNT(*) FROM cards WHERE user_id=?"
            );
            ps1.setInt(1, userId);
            ResultSet rs1 = ps1.executeQuery();
            int totalCards = rs1.next() ? rs1.getInt(1) : 0;

        	//int totalCards = 0; // hardcode or skip for now

            // ✅ Plan & Last Login
            PreparedStatement ps2 = con.prepareStatement(
                "SELECT plan, last_login FROM users WHERE id=?"
            );
            ps2.setInt(1, userId);
            ResultSet rs2 = ps2.executeQuery();
            String plan = "Free";
            String lastLogin = "N/A";
            if (rs2.next()) {
                plan = rs2.getString("plan");
                lastLogin = rs2.getString("last_login");
            }

            // ✅ Profile Views (optional)
            int views = 0;
            try {
                PreparedStatement ps3 = con.prepareStatement(
                    "SELECT COUNT(*) FROM views WHERE user_id=?"
                );
                ps3.setInt(1, userId);
                ResultSet rs3 = ps3.executeQuery();
                views = rs3.next() ? rs3.getInt(1) : 0;
            } catch (SQLException e) {
                // if views table not created, ignore
                views = 0;
            }

            // ✅ Pass data to JSP
            request.setAttribute("totalCards", totalCards);
            request.setAttribute("plan", plan);
            request.setAttribute("lastLogin", lastLogin);
            request.setAttribute("views", views);

            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
