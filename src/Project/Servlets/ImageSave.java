package Project.Servlets;

import Project.Base64;
import Project.UserDAO.User;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ImageSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text=req.getParameter("pathname");
        String pathname = text.substring(text.indexOf(",")+1);
        try(UserDAO userDAO=new UserDAO()){
            User olduser = userDAO.getUserBySession(req.getSession().getId());
            User user = userDAO.getUserBySession(req.getSession().getId());

            String imagename=user.getUerName()+".png";
            String fullpath=getServletContext().getRealPath("/Avatars") + "\\";
            Base64.GenerateImage(pathname, fullpath+imagename);
            user.setImage(imagename);
            userDAO.updateUser(user,olduser);

            req.setAttribute("user",user);
            req.setAttribute("updated",true);
            if(req.getParameter("adminUser") != null) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserAdmin");
                dispatcher.forward(req, resp);
            }
            else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/User_Profile.jsp");
                dispatcher.forward(req, resp);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
