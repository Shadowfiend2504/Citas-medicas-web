package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import io.github.cdimascio.dotenv.Dotenv;

public class ConexionBD {

    private static final Dotenv dotenv = Dotenv.configure()
            .ignoreIfMissing()
            .load();

    private static final String DB_HOST = dotenv.get("DB_HOST", "127.0.0.1");
    private static final String DB_PORT = dotenv.get("DB_PORT", "3306");
    private static final String DB_NAME = dotenv.get("DB_NAME", "baseDatosCitasMedicas252");
    private static final String DB_USER = dotenv.get("DB_USER", "root");
    private static final String DB_PASS = dotenv.get("DB_PASS", "12345");

    private static final String url = String.format(
        "jdbc:mysql://%s:%s/%s",
        DB_HOST,
        DB_PORT,
        DB_NAME
    );

    public static Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url, DB_USER, DB_PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("No se encontró el driver de MySQL: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            System.err.println("URL: " + url + ", Usuario: " + DB_USER);
        }
        return conexion;
    }
}
