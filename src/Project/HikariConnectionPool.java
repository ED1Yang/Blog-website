package Project;

import com.zaxxer.hikari.HikariDataSource;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class HikariConnectionPool {
    private static HikariDataSource hds;

    static {

        hds = new HikariDataSource();
        hds.setJdbcUrl("jdbc:mysql://db.sporadic.nz:3306/Team_GREA");
        hds.setDriverClassName("com.mysql.jdbc.Driver");
        hds.setUsername("gsik152");
        hds.setPassword("FlyUseOnScienceDineDo");
        hds.setMaximumPoolSize(100);
    }

    public static Connection getConnection() throws SQLException {
        return hds.getConnection();
    }


}