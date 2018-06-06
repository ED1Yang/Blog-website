package Project.Servlets;

import Project.ArticleDAO.Article;
import Project.ArticleDAO.ArticleDAO;
import Project.CommentDAO.Comment;
import Project.CommentDAO.CommentDAO;
import Project.UserDAO.User;
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


public class CommentDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int comment_id = Integer.parseInt(req.getParameter("comment_id"));
        //Deletes comment on server by ID
        try (CommentDAO commentDAO = new CommentDAO()) {
            commentDAO.deleteComment(comment_id);
            int article_id = Integer.parseInt(req.getParameter("article_id"));
            req.setAttribute("article", article_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ArticleViewer");
        dispatcher.forward(req, resp);
    }
}
