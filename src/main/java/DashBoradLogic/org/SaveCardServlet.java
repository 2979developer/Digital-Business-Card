package DashBoradLogic.org;


import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SaveCardServlet")
public class SaveCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Check user login session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        // ✅ Get form data
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

            // ✅ Insert card into DB
            String sql = "INSERT INTO cards (user_id, full_name, job_title, email, phone, website, card_title, card_design) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setString(3, title);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, website);
            ps.setString(7, "My Digital Card");   // default title
            ps.setString(8, "default-template");  // you can enhance later with templates

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // ✅ Redirect to MyCardsServlet instead of JSP
            	response.sendRedirect(request.getContextPath() + "/MyCardsServlet");
            } else {
                response.sendRedirect("createCard.jsp?status=failed");
            }


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("createCard.jsp?status=error");
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
