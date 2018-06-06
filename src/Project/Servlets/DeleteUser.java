package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Deletes user by username
        try(UserDAO userDAO = new UserDAO()) {
            String username = req.getParameter("username");
            userDAO.deleteUser(username);
            req.setAttribute("deleted", true);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserAdmin");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}