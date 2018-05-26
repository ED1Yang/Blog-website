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

public class ArticleViewerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = null;
        Article article = null;

        try (ArticleDAO articleDAO = new ArticleDAO()){
            try {
                article = articleDAO.getArticleById(Integer.parseInt(req.getParameter("article")));
            }
            catch (NumberFormatException e){
                article = articleDAO.getArticleById((int)req.getAttribute("article"));
            }
            username = article.getAuthor();
            req.setAttribute("article", article);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try(UserDAO userDAO = new UserDAO()) {
            if(userDAO.getUserBySession(req.getSession().getId()).getUerName().equals(username)){
                req.setAttribute("LoggedIn", true);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        if(req.getAttribute("Edited") != null) {
            req.setAttribute("Edited", true);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/article.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
