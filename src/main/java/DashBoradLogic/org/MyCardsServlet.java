package DashBoradLogic.org;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.org.Card;

import utils.DBConnection;


@WebServlet("/MyCardsServlet")
public class MyCardsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        
        List<Card> cards = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM cards WHERE user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Card card = new Card();
                card.setId(rs.getInt("id"));
                card.setUserId(rs.getInt("user_id"));
                card.setCardTitle(rs.getString("card_title"));
                card.setCardDesign(rs.getString("card_design"));
                card.setFullName(rs.getString("full_name"));
                card.setJobTitle(rs.getString("job_title"));
                card.setPhone(rs.getString("phone"));
                card.setEmail(rs.getString("email"));
                card.setWebsite(rs.getString("website"));
                cards.add(card);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("cards", cards);
        System.out.println("SESSION USER ID: " + session.getAttribute("userId"));
        System.out.println("Cards fetched: " + cards.size());

        request.getRequestDispatcher("myCards.jsp").forward(request, response);
    }
}
