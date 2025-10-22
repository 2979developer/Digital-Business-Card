package AdminLogic.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateCardServlet")
public class UpdateCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all form parameters
        String cardIdStr = request.getParameter("cardId");
        int cardId = 0;
        if (cardIdStr != null && !cardIdStr.isEmpty()) {
            cardId = Integer.parseInt(cardIdStr);
        }
        
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

            String sql = "UPDATE cards SET full_name=?, job_title=?, email=?, phone=?, website=? WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, website);
            ps.setInt(6, cardId);

            int rows = ps.executeUpdate();

            // --- THIS IS THE CORRECTED PART ---
            if (rows > 0) {
                // SUCCESS: Redirect back to editCard.jsp with a success status
                response.sendRedirect("editCard.jsp?id=" + cardId + "&status=updated");
            } else {
                // FAILED: Redirect back to editCard.jsp with a failed status
                response.sendRedirect("editCard.jsp?id=" + cardId + "&status=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // ERROR: Redirect back to editCard.jsp with an error status
            response.sendRedirect("editCard.jsp?id=" + cardId + "&status=error");
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