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

public class NewArticleServlet extends HttpServlet{
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
        String date = req.getParameter("articleDate");
        Article article = new Article(title, content, category, author, date);

        try(ArticleDAO articleDAO = new ArticleDAO()){
            articleDAO.addArticle(article);
            req.setAttribute("Added", true);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
