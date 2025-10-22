package DashBoradLogic.org;

import java.io.IOException;
import java.security.MessageDigest;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 🔒 Hash password (same logic as in LoginServlet)
	private String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(password.getBytes("UTF-8"));
			StringBuilder sb = new StringBuilder();
			for (byte b : hash) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (Exception e) {
			throw new RuntimeException("Error hashing password", e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp?error=Please login first");
			return;
		}

		int userId = (int) session.getAttribute("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String website = request.getParameter("website");
		String password = request.getParameter("password");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bizcard_ai", "root", "root");

			String sql;
			PreparedStatement ps;

			if (password != null && !password.isEmpty()) {
				// update including password
				sql = "UPDATE users SET username=?, email=?, phone=?, website=?, password_hash=? WHERE id=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, website);
				ps.setString(5, hashPassword(password));
				ps.setInt(6, userId);
			} else {
				// update without changing password
				sql = "UPDATE users SET username=?, email=?, phone=?, website=? WHERE id=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, website);
				ps.setInt(5, userId);
			}

			int rows = ps.executeUpdate();
			if (rows > 0) {
				session.setAttribute("username", name); // keep session updated
				request.setAttribute("message", "✅ Profile updated successfully!");
			} else {
				request.setAttribute("message", "⚠️ Profile update failed. Try again.");
			}

			con.close();

			// ✅ forward to profile.jsp (so request attribute works)
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "❌ Server error. Please try later.");
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
		}
	}
}
