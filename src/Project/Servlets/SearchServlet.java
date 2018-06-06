package Project.Servlets;

import Project.ArticleDAO.Article;
import Project.ArticleDAO.ArticleDAO;
import Project.UserDAO.User;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class SearchServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(UserDAO userDAO = new UserDAO(); ArticleDAO articleDAO = new ArticleDAO()) {
            User user = userDAO.getUserBySession(request.getSession().getId());
            //info for the nav bar.
            if(user != null) {
                request.setAttribute("user", user);
                request.setAttribute("LoggedIn", true);
            }

            //search with keyword.
            String searchTerm = request.getParameter("keyword");
            List<Article> searchResults = articleDAO.mainSearch(searchTerm);
            request.setAttribute("ArticlesSearched", searchResults);
            request.setAttribute("keyword",searchTerm);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/searchResultPage.jsp");
            dispatcher.forward(request, response);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
