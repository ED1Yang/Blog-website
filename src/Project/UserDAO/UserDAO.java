package Project.UserDAO;

import Project.HikariConnectionPool;
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

    public List<User> getUsersForAdmin() throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users ORDER BY last_name ASC")) {
            List<User> users = new ArrayList<>();
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                users.add(userFromResultSet(rs));
            }
            return users;
        }
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

    public User getUserBySession(String session) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE session = ?")) {
            stmt.setString(1, session);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return userFromResultSet(rs);
                } else {
                    return null;
                }
            }
        }
    }

    public String getUserImage(String username) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("SELECT image FROM users WHERE userName = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString(1);
                } else {
                    return null;
                }
            }
        }
    }

    public void deleteUserSession(String session) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET session = NULL WHERE session = ?")) {
            stmt.setString(1, session);
            stmt.executeUpdate();
            }
        }

    private User userFromResultSet(ResultSet rs) throws SQLException {
        return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                rs.getString(5), rs.getString(6), rs.getString(7),
                rs.getString(8), rs.getString(9), rs.getBoolean(10),rs.getString(11),rs.getString(12),rs.getLong(13));
    }


    public void addUser(User user) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("" +
                "INSERT INTO users (userName, pword, first_name, last_name, date_of_birth, country, description, image, email)" +
                "VALUES (?, ?, ?, ?, ? ,? ,?, ?,?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, user.getUerName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFirstName());
            stmt.setString(4, user.getLastName());
            stmt.setString(5, user.getDateOfBirth());
            stmt.setString(6, user.getCountry());
            stmt.setString(7, user.getDescription());
            stmt.setString(8, user.getImage());
            stmt.setString(9,user.getEmail());
            stmt.executeUpdate();
        }
    }

    public void updateUser(User user, User oldUser) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET userName = ?," +
                "pword = ?," +
                "first_name = ?," +
                "last_name = ?," +
                "date_of_birth = ?," +
                "country = ?," +
                "description = ?," +
                "image = ?," +
                "email = ?," +
                "validateCode = ?," +
                "ExpireTime = ?" +
                " WHERE userName = ?")) {
            stmt.setString(1, user.getUerName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFirstName());
            stmt.setString(4, user.getLastName());
            stmt.setString(5, user.getDateOfBirth());
            stmt.setString(6, user.getCountry());
            stmt.setString(7, user.getDescription());
            stmt.setString(8, user.getImage());
            stmt.setString(9,user.getEmail());
            stmt.setString(10,user.getValidateCode());
            stmt.setLong(11,user.getExpireTime());
            stmt.setString(12, oldUser.getUerName());
            stmt.executeUpdate();
        }
    }

    public void deleteUser(String username) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM users WHERE userName = ?")) {
            stmt.setString(1, username);
            stmt.executeUpdate();
        }
    }

    public boolean logIn(String session, String username, String password) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET session = ? WHERE username = ?")) {
            User user = getUserInfo(username);
            if(user.getPassword().equals(password)) {
                stmt.setString(1, session);
                stmt.setString(2, username);
                stmt.executeUpdate();
                return true;
            }
            else{
                return false;
            }
        }
    }

    public void logOut(String username) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("UPDATE users SET session = NULL WHERE username = ?")) {
            stmt.setString(1, username);
            stmt.executeUpdate();
        }
    }

    public boolean userNameValidation(String username) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(userName) FROM users WHERE userName = ?")) {
            stmt.setString(1,username);
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                if (rs.getInt(1) == 1) {
                    return false;
                } else {
                    return true;
                }
            }
        }
    }

    public boolean isAdmin(String username) throws SQLException{
        try(PreparedStatement stmt = conn.prepareStatement("SELECT isAdmin FROM users WHERE username = ?")) {
            stmt.setString(1, username);
            try(ResultSet rs = stmt.executeQuery()) {
                rs.next();
                if (rs.getInt(1) == 1) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }
    }

    @Override
    public void close() throws SQLException {
        this.conn.close();
    }
}
