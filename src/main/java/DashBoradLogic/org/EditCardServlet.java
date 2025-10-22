package DashBoradLogic.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditCardServlet")
public class EditCardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cardId = Integer.parseInt(request.getParameter("id"));
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root")) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM cards WHERE id=?");
            ps.setInt(1, cardId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("full_name"));
                request.setAttribute("title", rs.getString("job_title"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("website", rs.getString("website"));
                request.getRequestDispatcher("editCard.jsp").forward(request, response);
            } else {
                response.sendRedirect("myCards.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("myCards.jsp?status=error");
        }
    }
}
