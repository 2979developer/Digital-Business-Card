package com.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.security.MessageDigest;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

            String hashedPassword = hashPassword(password);

            // 1️⃣ Try login with hashed password
            ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password_hash=?");
            ps.setString(1, email);
            ps.setString(2, hashedPassword);
            rs = ps.executeQuery();

            if (!rs.next()) {
                // 2️⃣ If not found, try login with old plaintext password
                rs.close();
                ps.close();
                ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password_hash=?");
                ps.setString(1, email);
                ps.setString(2, password); // plaintext
                rs = ps.executeQuery();

                if (rs.next()) {
                    // Legacy login successful → update password to hashed
                    PreparedStatement psUpdate = con.prepareStatement(
                        "UPDATE users SET password_hash=? WHERE id=?");
                    psUpdate.setString(1, hashedPassword);
                    psUpdate.setInt(2, rs.getInt("id"));
                    psUpdate.executeUpdate();
                    psUpdate.close();
                } else {
                    // Login failed
                    request.setAttribute("errorMessage", "Invalid email or password.");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                    return;
                }
            }

            // ✅ Set session
            HttpSession session = request.getSession();
            session.setAttribute("userId", rs.getInt("id"));
            session.setAttribute("username", rs.getString("username"));

            // ✅ Update last login
            PreparedStatement psUpdateLogin = con.prepareStatement(
                "UPDATE users SET last_login=NOW() WHERE id=?");
            psUpdateLogin.setInt(1, rs.getInt("id"));
            psUpdateLogin.executeUpdate();
            psUpdateLogin.close();

            // ✅ Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server Error");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte b : hash) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
