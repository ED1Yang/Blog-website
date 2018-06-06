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

public class NewUserInformation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //get all info from form.
        String username = req.getParameter("username");
        String password = req.getParameter("pword");
        String firstName = req.getParameter("fname");
        String lastName = req.getParameter("lname");
        String dob = req.getParameter("dob");
        String description = req.getParameter("description");
        String country = req.getParameter("country");
        String email = req.getParameter("email");

        try (UserDAO userDAO = new UserDAO()){
            boolean isChanged = false;
            User newUser = userDAO.getUserBySession(req.getSession().getId());
            User oldUser = userDAO.getUserBySession(req.getSession().getId());

            /*check one by one if user's info has been changed.
              update the info if it's modified.
             */

            if (!newUser.getUserName().equals(username)) {
                newUser.setUserName(username);
                isChanged = true;
            }
            if (!newUser.getPassword().equals(password)) {
                newUser.setPassword(password);
                isChanged = true;

            }
            if (!newUser.getCountry().equals(country)) {
                newUser.setCountry(country);
                isChanged = true;

            }
            if (!newUser.getDateOfBirth().equals(dob)) {
                newUser.setDateOfBirth(dob);
                isChanged = true;

            }
            if (!newUser.getEmail().equals(email)) {
                newUser.setEmail(email);
                isChanged = true;

            }
            if (!newUser.getFirstName().equals(firstName)) {
                newUser.setFirstName(firstName);
                isChanged = true;

            }
            if (!newUser.getLastName().equals(lastName)) {
                newUser.setLastName(lastName);
                isChanged = true;

            }
            if (newUser.getDescription()==null&&description!=null||(!newUser.getDescription().equals(description))) {
                newUser.setDescription(description);
                isChanged = true;
            }

            //set boolean to get feedback from website.
            if(isChanged){
                req.setAttribute("isChanged",true);
            }else{
                req.setAttribute("noChange",true);
            }
            req.setAttribute("user",newUser);
            userDAO.updateUser(newUser,oldUser);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Account_Settings.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
