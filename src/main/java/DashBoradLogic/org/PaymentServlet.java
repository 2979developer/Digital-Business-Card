package DashBoradLogic.org;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String plan = request.getParameter("plan");
        double amount = 0.0;

        // ✅ Assign plan price
        if ("Silver".equalsIgnoreCase(plan)) {
            amount = 499.0;
        } else if ("Gold".equalsIgnoreCase(plan)) {
            amount = 999.0;
        } else {
            amount = 0.0; // Free plan
        }

        Connection con = null;
        PreparedStatement psPayment = null;
        PreparedStatement psUser = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

            // ✅ 1. Insert payment record
            String sql1 = "INSERT INTO payments (user_id, plan, amount, payment_status) VALUES (?, ?, ?, ?)";
            psPayment = con.prepareStatement(sql1);
            psPayment.setInt(1, userId);
            psPayment.setString(2, plan);
            psPayment.setDouble(3, amount);
            psPayment.setString(4, "Success");
            psPayment.executeUpdate();

            // ✅ 2. Update user's plan in 'users' table
            String sql2 = "UPDATE users SET plan=? WHERE id=?";
            psUser = con.prepareStatement(sql2);
            psUser.setString(1, plan);
            psUser.setInt(2, userId);
            psUser.executeUpdate();

            // ✅ 3. Redirect with success message
            response.sendRedirect("payment.jsp?status=success");

        } catch (Exception e) {
            e.printStackTrace();
//            System.out.println(e);
            response.sendRedirect("payment.jsp?status=error");
        } finally {
            try {
                if (psPayment != null) psPayment.close();
                if (psUser != null) psUser.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
