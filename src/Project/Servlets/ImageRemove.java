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

public class ImageRemove extends HttpServlet {

    //set the avatar of the user to the default image.
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(UserDAO userDAO=new UserDAO()){
            User olduser = userDAO.getUserBySession(req.getSession().getId());
            User user = userDAO.getUserBySession(req.getSession().getId());
            user.setImage("avatarimg.png");
            userDAO.updateUser(user,olduser);
            req.setAttribute("user",user);
            req.setAttribute("removed",true);


            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/User_Profile.jsp");
            dispatcher.forward(req, resp);
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
