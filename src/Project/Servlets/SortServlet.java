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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SortServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (UserDAO userDAO = new UserDAO(); ArticleDAO articleDAO = new ArticleDAO()) {
            User user = userDAO.getUserBySession(request.getSession().getId());
            if (user != null) {
                request.setAttribute("user", user);
                request.setAttribute("LoggedIn", true);
            }
            String searchTerm = request.getParameter("keyword");
            String sortTerm = request.getParameter("category");
            //original db based sorting.
//            List<Article> searchResults = articleDAO.sortBy(searchTerm, sortTerm);
            //current java based sorting.
            List<Article> allResults = articleDAO.mainSearch(searchTerm);
            List<Article> searchResults = sortArticle(allResults,sortTerm);

            String logoName = request.getParameter("logo_name");
            switch (sortTerm) {
                case "article_name":
                    setOrder(request.getParameter("order_article"), request, searchResults, logoName, "orderAr");
                    break;
                case "genre":
                    setOrder(request.getParameter("order_genre"), request, searchResults, logoName, "orderG");
                    break;
                case "author_id":
                    setOrder(request.getParameter("order_author"), request, searchResults, logoName, "orderAu");
                    break;
                case "date":
                    setOrder(request.getParameter("order_date"), request, searchResults, logoName, "orderD");
                    break;
            }

            request.setAttribute("ArticlesSearched", searchResults);
            request.setAttribute("keyword", searchTerm);
//            request.setAttribute("Sorted", true);
//            request.setAttribute("order_by", sortTerm.toUpperCase());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/searchResultPage.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private void setOrder(String sortOrder, HttpServletRequest request, List<Article> searchResults, String logo, String orderinfo) {
        if (sortOrder == null || sortOrder.equals("")) {
            request.setAttribute(logo, "glyphicon glyphicon-triangle-top");
            request.setAttribute(orderinfo, "asc");
        } else if (sortOrder.equals("asc")) {
            Collections.reverse(searchResults);
            request.setAttribute(logo, "glyphicon glyphicon-triangle-bottom");
            request.setAttribute(orderinfo, "des");
        } else if (sortOrder.equals("des")) {
            request.setAttribute(logo, "glyphicon glyphicon-triangle-top");
            request.setAttribute(orderinfo, "asc");
        }
    }


    private List<Article> sortArticle(List<Article> list, String sortTerm) {
       Collections.sort(list, new Comparator<Article>() {
            @Override
            public int compare(Article a1, Article a2) {
                switch (sortTerm) {
                    case "article_name":
                        return a1.getTitle().compareTo(a2.getTitle());
                    case "genre":
                        return a1.getGenre().compareTo(a2.getGenre());
                    case "author-id":
                        return a1.getAuthor().compareTo(a2.getAuthor());
                    case "date":
                        return a1.getDate().compareTo(a2.getDate());
                    default:
                        return 0;
                }

            }
        });
       return list;
    }
}
