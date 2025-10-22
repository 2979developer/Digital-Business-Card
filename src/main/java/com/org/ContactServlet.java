package com.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

            String sql = "INSERT INTO contact_messages(name, email, message, created_at) VALUES (?, ?, ?, NOW())";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // Set session attribute for popup
                HttpSession session = request.getSession();
                session.setAttribute("contactMessage", "Your message has been sent successfully!");
            }

            // Redirect back to contact page
            response.sendRedirect("contact.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=Server error, try again later");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
