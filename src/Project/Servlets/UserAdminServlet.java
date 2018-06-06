package Project.Servlets;

import Project.UserDAO.User;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserAdminServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(UserDAO userDAO = new UserDAO()) {
            if(userDAO.getUserBySession(req.getSession().getId()) != null && userDAO.getUserBySession(req.getSession().getId()).isAdmin()) {
                List<User> users = userDAO.getUsersForAdmin();
                req.setAttribute("users", users);
                if(req.getAttribute("deleted") != null) {
                    req.setAttribute("deleted", true);
                }
                req.setAttribute("currentUser", userDAO.getUserBySession(req.getSession().getId()));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserAdmin.jsp");
                dispatcher.forward(req, resp);
            }
            else{
                //Sends not allowed error if user tries to navigate here without appropriate permission
                resp.sendError(401);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }


}
