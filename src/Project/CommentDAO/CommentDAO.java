package Project.CommentDAO;

import Project.HikariConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("Duplicates")

public class CommentDAO implements AutoCloseable {

    private final Connection conn;

    public CommentDAO() throws SQLException {
        this.conn = HikariConnectionPool.getConnection();
    }

    public List<Comment> getComments(int articleID) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM comments WHERE article_id = ?")) {
            stmt.setInt(1, articleID);
            try (ResultSet rs = stmt.executeQuery()) {
                List<Comment> comments = new ArrayList<>();
                while (rs.next()) {
                    comments.add(commentFromResultSet(rs));
                }
                return comments;
            }
        }
    }


    private Comment commentFromResultSet(ResultSet rs) throws SQLException {
        return new Comment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5), rs.getBoolean(6), rs.getInt(7));
    }


    public void addComment(Comment comment) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO comments(article_id, userName, userComment, parentComment) VALUES (?,?,?,?)")) {
            stmt.setInt(1, comment.getArticle_id());
            stmt.setString(2, comment.getUserName());
            stmt.setString(3, comment.getText());
            stmt.setInt(4, comment.getParentComment());
            stmt.executeUpdate();
        }
    }

    public void deleteComment1(Comment comment) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM comments WHERE article_id = ? AND userName = ?")) {
            stmt.setInt(1, comment.getArticle_id());
            stmt.setString(2, comment.getUserName());
            stmt.executeUpdate();
        }
    }

    public void deleteComment(int comment_id) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM comments WHERE commentID = ?")) {
            stmt.setInt(1, comment_id);
            stmt.executeUpdate();
        }
    }

    public List<String> getUsers(int articleId) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("SELECT DISTINCT userName FROM comments WHERE article_id = ?")) {
            stmt.setInt(1, articleId);
            List<String> users = new ArrayList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    users.add(rs.getString(1));
                }
                return users;
            }
        }
    }

    public void changeVisbility(int id, boolean isHidden) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement("UPDATE comments SET isHidden = ? WHERE commentID = ?")) {
            stmt.setBoolean(1, isHidden);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        }
    }


    @Override
    public void close() throws SQLException {
        this.conn.close();
    }
}
