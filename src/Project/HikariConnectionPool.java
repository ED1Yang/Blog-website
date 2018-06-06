package Project;

import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class HikariConnectionPool {
    private static HikariDataSource hds;

    static {
        hds = new HikariDataSource();
        hds.setJdbcUrl("jdbc:mysql://db.sporadic.nz:3306/Team_GREA");
        hds.setDriverClassName("com.mysql.jdbc.Driver");
        hds.setUsername("tyan227");
        hds.setPassword("OutsideMostBerryOfficial");
        hds.setMaximumPoolSize(5);
    }

    public static Connection getConnection() throws SQLException {
        return hds.getConnection();
    }
}