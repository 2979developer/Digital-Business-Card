package DashBoradLogic.org;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // clear all session data
        }

        // Set a session attribute for logout message
        request.getSession(true).setAttribute("logoutMessage", "Logged out successfully!");

        // Redirect to index.jsp
        response.sendRedirect("index.jsp");
    }
}
