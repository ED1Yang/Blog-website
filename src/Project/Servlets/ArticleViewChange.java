package Project.Servlets;

import Project.ArticleDAO.ArticleDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ArticleViewChange extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Modifies the visibility of the article on server side
        int articleId = Integer.parseInt(req.getParameter("article"));
        boolean isHidden = Boolean.parseBoolean(req.getParameter("visibility"));
        try(ArticleDAO articleDAO = new ArticleDAO()) {
            articleDAO.changeVisibility(articleId, !isHidden);
            req.setAttribute("visChanged", true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
