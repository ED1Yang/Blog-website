package Project.Servlets;

import Project.ArticleDAO.Article;
import Project.ArticleDAO.ArticleDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EditArticleServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        String title = req.getParameter("articleTitle");
        String content = req.getParameter("articleBody");
        String author = req.getParameter("author");
        int articleId = Integer.parseInt(req.getParameter("articleId"));
        Article article = new Article(articleId, title, content, category, author);

        try(ArticleDAO articleDAO = new ArticleDAO()){
            articleDAO.updateArticle(article);
            req.setAttribute("Edited", true);
            req.setAttribute("article", articleDAO.getArticleById(Integer.parseInt(req.getParameter("articleId"))).getId());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ArticleViewer");
            dispatcher.forward(req, resp);
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
