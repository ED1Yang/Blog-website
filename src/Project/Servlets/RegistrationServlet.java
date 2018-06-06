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

public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (UserDAO userDAO = new UserDAO()) {
            User user = new User();
            user.setFirstName(req.getParameter("fname"));
            user.setLastName(req.getParameter("lname"));

            String username = req.getParameter("uname");
            if (userDAO.userNameValidation(username)) {
                user.setUserName(username);
            } else {
                req.setAttribute("UsernameTaken", true);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegistrationForm.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            user.setDateOfBirth(req.getParameter("dob"));
            user.setCountry(req.getParameter("country"));
            user.setPassword(req.getParameter("pwd"));
            user.setEmail(req.getParameter("email"));
            String avatar = req.getParameter("avatar");
            if (avatar != null) {
                user.setImage(avatar);
            }

            userDAO.addUser(user);

            if(req.getParameter("adminUser") == null) {
                userDAO.logIn(req.getSession().getId(), username, req.getParameter("pwd"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        //check if the user is uploading a image.
        String isUploadingImage = req.getParameter("upload");

        if (isUploadingImage.equals("true")) {
            if(req.getParameter("adminUser") != null) {
                req.setAttribute("adminUser", true);
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UploadImage.jsp");
            dispatcher.forward(req, resp);

        }

        else if(req.getParameter("adminUser") != null) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserAdmin");
            dispatcher.forward(req, resp);
        }

        else {

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login_page.jsp");
            dispatcher.forward(req, resp);
        }

    }


}
