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
import java.sql.Timestamp;

public class passwordValidation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //get parameter from the link.
        String username = req.getParameter("userName");
        String sid = req.getParameter("sid");

        //check if the link is valid.
        if (sid==null||username==null||sid.equals("") || username.equals("")) {
            resetFailed("linkNotValid", req, resp);
            return;
        } else {
            try (UserDAO userDAO = new UserDAO()) {
                User user = userDAO.getUserInfo(username);

                //username check.
                if (user == null) {
                    resetFailed("invalidUser", req, resp);
                    return;
                } else {
                    Timestamp currentDate = new Timestamp(System.currentTimeMillis());
                    long currentTime = currentDate.getTime() / 1000 * 1000;
                    long expireTime = user.getExpireTime();

                    //expiration check.
                    if (currentTime >= expireTime) {
                        resetFailed("expired", req, resp);
                        return;
                    } else {
                        req.setAttribute("username", username);
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Password_Reset.jsp");
                        dispatcher.forward(req, resp);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    //lead to reset-failed page showing the corresponding reason.
    private void resetFailed(String reason, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute(reason, true);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Reset_Failed.jsp");
        dispatcher.forward(req, resp);
    }
}
