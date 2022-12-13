package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DBConnection {
	private final String serverName = "MSI\\RUBIE";
	private final String dbName = "OgFruit";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "";
	private final String password = "";

public Connection getConnectionW() throws Exception {
	String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";integratedSecurity=true;databaseName=" + dbName + ";encrtypt=true;trustServerCertificate=true;sslProtocol=TLSv1.2";
	if (instance == null || instance.trim().isEmpty())
	{
		url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";integratedSecurity=true;databaseName=" + dbName + ";encrtypt=true;trustServerCertificate=true;sslProtocol=TLSv1.2";
	}
	//DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	return DriverManager.getConnection(url, userID, password);
//	String dbDriver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	Connection conn = null;
//	try {
//		Class.forName(dbDriver);
//		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=OFruit;user=sa;password=123456;encrypt=true;trustServerCertificate=true;");
//		System.out.println("Connect Successfully!");
//	} catch (Exception ex) {
//		System.out.println("Connect Failure!");
//		ex.printStackTrace();
//	}
//	return conn;
}
public static boolean
isValidPassword(String password)
{
    String regex = "^(?=.*[0-9])"
                   + "(?=.*[a-z])(?=.*[A-Z])"
                   + "(?=.*[@#$%^&+=])"
                   + "(?=\\S+$).{8,20}$";

    Pattern p = Pattern.compile(regex);

    if (password == null) {
        return false;
    }

    Matcher m = p.matcher(password);

    return m.matches();
}

//String dbURL = "jdbc:sqlserver://localhost\\sqlexpress;user=sa;password=secret";

public static void main(String[] args) {
	try {
		System.out.println(new DBConnection().getConnectionW());
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
	
}
}