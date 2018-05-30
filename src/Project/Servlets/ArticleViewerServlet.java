package Project.Servlets;

import Project.ArticleDAO.Article;
import Project.ArticleDAO.ArticleDAO;
import Project.CommentDAO.Comment;
import Project.CommentDAO.CommentDAO;
import Project.UserDAO.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class ArticleViewerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = null;
        Article article = null;
        HashMap<String,String> userImages = new HashMap<>();

        try (ArticleDAO articleDAO = new ArticleDAO(); CommentDAO commentDAO = new CommentDAO(); UserDAO userDAO = new UserDAO()){
            try {
                article = articleDAO.getArticleById(Integer.parseInt(req.getParameter("article")));
            }
            catch (NumberFormatException e){
                article = articleDAO.getArticleById((int)req.getAttribute("article"));
            }
            username = article.getAuthor();
            req.setAttribute("article", article);

            List<Comment> comments= commentDAO.getComments(article.getId());
            List<String> users = commentDAO.getUsers(article.getId());
            for (String user:users) {
                userImages.put(user, userDAO.getUserImage(user));
            }
            req.setAttribute("icons", userImages);
            req.setAttribute("comments",comments);

            if(userDAO.getUserBySession(req.getSession().getId()) != null){
                req.setAttribute("LoggedIn", true);
                String uname = userDAO.getUserBySession(req.getSession().getId()).getUerName();
                req.setAttribute("username",uname);
                req.setAttribute("isAdmin", userDAO.isAdmin(uname));
                OwnershipChecking(username, req);
            }

        } catch (SQLException e) {
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

    public static void OwnershipChecking(String username, HttpServletRequest req) {
        try(UserDAO userDAO = new UserDAO()) {
            if (userDAO.getUserBySession(req.getSession().getId()).getUerName().equals(username)) {
                req.setAttribute("Owner", true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
