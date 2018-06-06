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

public class AccountSettingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (UserDAO userDAO = new UserDAO()){
            User user = userDAO.getUserBySession(req.getSession().getId());
            req.setAttribute("user",user);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Account_Settings.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
