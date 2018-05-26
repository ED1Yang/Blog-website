package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ArticleCreationServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (UserDAO userDAO = new UserDAO()){
            req.setAttribute("User", userDAO.getUserBySession(req.getSession().getId()));
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/createArticlePage.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
