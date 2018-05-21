package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            UserDAO login = new UserDAO();
            if (login.logIn(req.getSession().getId(), username, password)) {
                req.setAttribute("LoggedIn", true);
                req.setAttribute("UserImage", login.getUserInfo(username).getImage());
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ApolloWebPage.jsp");
                dispatcher.forward(req, resp);
            }
            else {
                req.setAttribute("FailedLogIn", true);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login_page.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
