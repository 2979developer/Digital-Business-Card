package AdminLogic.org;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root")) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Delete user's cards first (cascade optional)
            PreparedStatement psCards = con.prepareStatement("DELETE FROM cards WHERE user_id=?");
            psCards.setInt(1, userId);
            psCards.executeUpdate();

            // Then delete user
            PreparedStatement psUser = con.prepareStatement("DELETE FROM users WHERE id=?");
            psUser.setInt(1, userId);
            psUser.executeUpdate();

            response.sendRedirect("admin.jsp?status=userDeleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        }
    }
}
