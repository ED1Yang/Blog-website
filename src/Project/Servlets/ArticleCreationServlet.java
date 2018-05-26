package Project.Servlets;

import Project.ArticleDAO.Article;
import Project.ArticleDAO.ArticleDAO;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ArticleCreationServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (UserDAO userDAO = new UserDAO()){
            req.setAttribute("User", userDAO.getUserBySession(req.getSession().getId()));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(req.getParameter("article") != null) {
            int articleId = Integer.parseInt(req.getParameter("article"));
            try(ArticleDAO articleDAO = new ArticleDAO()) {
                Article article = articleDAO.getArticleById(articleId);
                req.setAttribute("editing", true);
                req.setAttribute("articleId", article.getId());
                req.setAttribute("articleName", article.getTitle());
                req.setAttribute("articleContent", article.getContent());
                req.setAttribute("articleGenre", article.getGenre());
            }
            catch (SQLException e) {
                e.printStackTrace();
            }

        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/createArticlePage.jsp");
        dispatcher.forward(req, resp);
    }
}
