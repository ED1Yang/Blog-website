package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class UserProfileServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            new UserDAO().getUserBySession(req.getSession().getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}