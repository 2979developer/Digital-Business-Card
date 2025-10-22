package DashBoradLogic.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteCardServlet")
public class DeleteCardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int cardId = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root")) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM cards WHERE id=? AND user_id=?");
            ps.setInt(1, cardId);
            ps.setInt(2, userId);
            int rows = ps.executeUpdate();

            if (rows > 0)
                response.sendRedirect("MyCardsServlet?status=deleted");
            else
                response.sendRedirect("MyCardsServlet?status=error");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("MyCardsServlet?status=error");
        }
    }
}
