package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class SelfDeletionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(UserDAO userDAO = new UserDAO()) {
            userDAO.deleteUser(userDAO.getUserBySession(req.getSession().getId()).getUserName());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Account_Deleted.html");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}