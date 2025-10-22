package AdminLogic.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminInsertCardServlet")
public class AdminInsertCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

            String sql = "INSERT INTO cards (user_id, full_name, job_title, email, phone, website, card_title, card_design) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setString(3, title);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, website);
            ps.setString(7, "Admin Added Card");
            ps.setString(8, "default-template");

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // ✅ Redirect to admin.jsp with success message
                response.sendRedirect("admin.jsp?status=success");
            } else {
                response.sendRedirect("admin.jsp?status=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
