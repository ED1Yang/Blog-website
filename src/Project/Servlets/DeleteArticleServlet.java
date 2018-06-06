package Project.Servlets;

import Project.ArticleDAO.ArticleDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteArticleServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Deletes article by ID
        try(ArticleDAO articleDAO = new ArticleDAO()) {
            articleDAO.deleteArticle(Integer.parseInt(req.getParameter("article")));
            req.setAttribute("deleted", true);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
            dispatcher.forward(req, resp);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
