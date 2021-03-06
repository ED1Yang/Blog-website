package Project.Servlets;

import Project.CommentDAO.CommentDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class CommentViewChange extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int commentId = Integer.parseInt(req.getParameter("comment_id"));
        boolean isHidden = Boolean.parseBoolean(req.getParameter("visibility"));
        //Reverses visibility of comment on server side
        try(CommentDAO commentDAO = new CommentDAO()) {
            commentDAO.changeVisibility(commentId, !isHidden);
            req.setAttribute("visChanged", true);
            req.setAttribute("article", req.getParameter("article"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ArticleViewer");
        dispatcher.forward(req, resp);
    }
}
