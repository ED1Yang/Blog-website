package ArticleDAO;

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
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM articles WHERE id = ?")) {
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
        return new Article(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
    }

    public void saveArticle(Article article) throws SQLException {
        if (article.getId() == null) {
            addArticle(article);
        } else {
            updateArticle(article);
        }
    }

    public void addArticle(Article article) throws SQLException {
        if (article.getId() == null) {
            addArticle_generateId(article);
        } else {
            addArticle_supplyId(article);
        }
    }

    private void addArticle_generateId(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO articles (title, content) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                rs.next();
                article.setId(rs.getInt(1));
            }
        }
    }

    private void addArticle_supplyId(Article article) throws SQLException {

        if (article.getId() == null) {
            throw new IllegalArgumentException("article's id cannot be null.");
        }

        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO articles (id, title, content) VALUES (?, ?, ?)")) {
            stmt.setInt(1, article.getId());
            stmt.setString(2, article.getTitle());
            stmt.setString(3, article.getContent());
            stmt.executeUpdate();
        }
    }

    public void updateArticle(Article article) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE articles SET title = ?, content = ? WHERE id = ?")) {
            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setInt(3, article.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteArticle(int id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM articles WHERE id = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    @Override
    public void close() throws SQLException {
        this.conn.close();
    }
}
