package Project.ArticleDAO;

import Project.HikariConnectionPool;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("Duplicates")

public class ArticleDAO implements AutoCloseable {

    private final Connection conn;

    public ArticleDAO() throws SQLException {
        this.conn = HikariConnectionPool.getConnection();
    }

    public List<Article> getAllArticles() throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles")) {
            try (ResultSet rs = stmt.executeQuery()) {
                List<Article> articles = new ArrayList<>();
                while (rs.next()) {
                    articles.add(articleFromResultSet(rs));
                }
                return articles;
            }
        }
    }

    public List<Article> getArticlesByGenre(String genre) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE genre = ?")) {
            stmt.setString(1, genre);
            try (ResultSet rs = stmt.executeQuery()) {
                List<Article> articles = new ArrayList<>();
                while (rs.next()) {
                    articles.add(articleFromResultSet(rs));
                }
                return articles;
            }
        }
    }

    public List<Article> getArticlesByAuthor(String id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE author_id = ?")) {
            stmt.setString(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                List<Article> articles = new ArrayList<>();
                while (rs.next()) {
                    articles.add(articleFromResultSet(rs));
                }
                return articles;
            }
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

    public void saveArticle(Article article) throws SQLException {
        if (article.getId() == null) {
            addArticle(article);
        } else {
            updateArticle(article);
        }
    }

    public void addArticle(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO articles (article_name, article_content, genre, author_id) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getGenre());
            stmt.setString(4, article.getAuthor());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                rs.next();
                article.setId(rs.getInt(1));
            }
        }
    }


    public void updateArticle(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE articles SET article_name = ?, article_content = ? WHERE article_id = ?")) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setInt(3, article.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteArticle(int id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM articles WHERE article_id = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public void changeVisbility(int id, boolean isHidden) throws SQLException {
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
}
