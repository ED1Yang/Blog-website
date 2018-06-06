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

public class CommentCreationServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String comment=req.getParameter("comments");
        int id=Integer.parseInt(req.getParameter("articleId"));
        String username=req.getParameter("username");
        String parent = req.getParameter("comment_id");
        System.out.println(parent);

        //Checks if comment is main or reply, and executes constructor accordingly
        try(CommentDAO commentDAO=new CommentDAO(); ArticleDAO articleDAO=new ArticleDAO()){
            Comment newComment = null;
            if(parent != null) {
                newComment=new Comment(id,username,comment, Integer.parseInt(parent));
            } else {
                newComment = new Comment(id,username,comment);
            }
            commentDAO.addComment(newComment);
            Article article = articleDAO.getArticleById(id);
            req.setAttribute("article", article.getId());

        }catch (SQLException e){
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ArticleViewer");
        dispatcher.forward(req, resp);
    }
}
