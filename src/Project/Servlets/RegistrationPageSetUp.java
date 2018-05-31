package Project.Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RegistrationPageSetUp extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getAttribute("UsernameTaken") != null) {
            req.setAttribute("UsernameTaken", true);
        }
        if(req.getParameter("adminUserSetup") != null) {
            req.setAttribute("adminUserSetup", true);
        }

        String[] defaultAvatars = {"avatar.jpeg", "avatar2.png", "avatar5.png", "avatar6.png", "img_avatar.png", "img_avatar2.png"};

        req.setAttribute("defaultAvatars", defaultAvatars);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Registration_Form.jsp");
        dispatcher.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
