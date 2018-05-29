
package Project.Servlets;

import Project.UserDAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class CheckAvailability extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (UserDAO userDAO=new UserDAO(); PrintWriter out = response.getWriter()){
            String uname = request.getParameter("uname");
            boolean isValidate = userDAO.userNameValidation(uname);
            if (isValidate) {
                out.println("<font color=green><b>" + uname + "</b> is avaliable");
            } else {
                out.println("<font color=red><b>" + uname + "</b> is already in use</font>");
            }

            out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
