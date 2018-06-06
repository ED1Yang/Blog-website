package Project.ArticleDAO;

import Project.HikariConnectionPool;
import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ArticleDAO implements AutoCloseable {

    private final Connection conn;

    public ArticleDAO() throws SQLException {
        this.conn = HikariConnectionPool.getConnection();
    }

    public List<Article> getAllArticles() throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles")) {
            return selectResult(stmt);
        }
    }



    //get all articles posted before current time.

    public List<Article> getAllArticlesBeforeDate() throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE date <= current_timestamp")) {
            return selectResult(stmt);
        }
    }



    //search the title, author and content of all articles containing the keyword.

    public List<Article> mainSearch(String keyword) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE article_name LIKE ? OR article_content LIKE ? OR author_id LIKE ?")) {
            stmt.setString(1, "%"+keyword+"%");
            stmt.setString(2, "%"+keyword+"%");
            stmt.setString(3, "%"+keyword+"%");
            return selectResult(stmt);

        }
    }

    public List<Article> getArticlesByGenre(String genre) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE genre = ? ORDER BY date DESC")) {
            stmt.setString(1, genre);
            return selectResult(stmt);

        }
    }


    public Article getArticleById(int id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE article_id = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return articleFromResultSet(rs);
                } else {
                    return null;
                }
            }
        }
    }

    private Article articleFromResultSet(ResultSet rs) throws SQLException {
        return new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
                rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7));
    }


    public void addArticle(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO articles (article_name, article_content, genre, author_id, date) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getGenre());
            stmt.setString(4, article.getAuthor());
            stmt.setString(5, article.getDate());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                rs.next();
                article.setId(rs.getInt(1));
            }
        }
    }


    public void updateArticle(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE articles SET article_name = ?, article_content = ?, date=?, genre = ? WHERE article_id = ?")) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getDate());
            stmt.setString(4, article.getGenre());
            stmt.setInt(5, article.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteArticle(int id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM articles WHERE article_id = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public void changeVisibility(int id, boolean isHidden) throws SQLException {
        try(PreparedStatement stmt = conn.prepareStatement("UPDATE articles SET isHidden = ? WHERE article_id = ?")) {
            stmt.setBoolean(1, isHidden);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        }
    }

    @Override
    public void close() throws SQLException {
        this.conn.close();
    }


    //method frequently used to get articles.

    private List<Article> selectResult(PreparedStatement stmt) throws SQLException{
        try (ResultSet rs = stmt.executeQuery()) {
            List<Article> articles = new ArrayList<>();
            while (rs.next()) {
                articles.add(articleFromResultSet(rs));
            }
            return articles;
        }
    }
}
