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
import java.util.List;

public class HomePageServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArticleDAO articles = new ArticleDAO();
            List<Article> articlesListTech = articles.getArticlesByGenre("Technology");
            List<Article> articlesListPol = articles.getArticlesByGenre("Politics");
            List<Article> articlesListBus = articles.getArticlesByGenre("Business");
            request.setAttribute("TechArticle", articlesListTech.get(0).getContent());
            request.setAttribute("BusArticle", articlesListBus.get(0).getContent());
            request.setAttribute("PolArticle", articlesListPol.get(0).getContent());
            List<Article> allArticles = articles.getAllArticles();
            request.setAttribute("AllArticles", allArticles);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ApolloWebPage.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
