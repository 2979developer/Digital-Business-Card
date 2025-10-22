package AdminLogic.org;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminDeleteCardServlet")
public class AdminDeleteCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int cardId = Integer.parseInt(request.getParameter("cardId"));

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            PreparedStatement ps = con.prepareStatement("DELETE FROM cards WHERE id=?");
            ps.setInt(1, cardId);
            ps.executeUpdate();
            response.sendRedirect("admin.jsp?status=cardDeleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        }
    }
}
