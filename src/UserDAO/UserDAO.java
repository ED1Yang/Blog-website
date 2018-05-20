package UserDAO;

import ArticleDAO.Article;
import ArticleDAO.HikariConnectionPool;
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("Duplicates")

public class UserDAO implements AutoCloseable {

    private final Connection conn;

    public UserDAO() throws SQLException {
        this.conn = HikariConnectionPool.getConnection();
    }

    public User getUserInfo(String username) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE userName = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return userFromResultSet(rs);
                } else {
                    return null;
                }
            }
        }
    }

    private User userFromResultSet(ResultSet rs) throws SQLException {
        return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
    }

    public void addUser(User user) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("" +
                "INSERT INTO users (userName, pword, first_name, last_name, date_of_birth, country, description, image)" +
                "VALUES (?, ?, ?, ?, ? ,? ,?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUerName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFirstName());
            stmt.setString(4, user.getLastName());
            stmt.setString(5, user.getDateOfBirth());
            stmt.setString(6, user.getCountry());
            stmt.setString(7, user.getDescription());
            stmt.setString(8, user.getImage());
            stmt.executeUpdate();
        }
    }

    @Override
    public void close() throws SQLException {
        this.conn.close();
    }
}
