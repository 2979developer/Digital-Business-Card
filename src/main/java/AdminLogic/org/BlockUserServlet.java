package AdminLogic.org;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BlockUserServlet")
public class BlockUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            PreparedStatement ps = con.prepareStatement("UPDATE users SET is_blocked = 1 WHERE id=?");
            ps.setInt(1, userId);
            ps.executeUpdate();
            response.sendRedirect("admin.jsp?status=userBlocked");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        }
    }
}
