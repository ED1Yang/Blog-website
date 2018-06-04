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

public class PasswordReset extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (UserDAO userDAO = new UserDAO()){
            String username=req.getParameter("username");
            User olduser = userDAO.getUserInfo(username);
            User user = userDAO.getUserInfo(username);
            System.out.println("user is :"+ user);
            //not sure if the session works here.
            String newPassword=req.getParameter("password");
            user.setPassword(newPassword);
            userDAO.updateUser(user,olduser);


            req.setAttribute("newPasswordSet",true);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login_page.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
