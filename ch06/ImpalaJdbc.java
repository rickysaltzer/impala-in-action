import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;   
import java.sql.Statement;  
import java.sql.SQLException;

public class ImpalaJdbc {
    public static void main(String[] args) {
           final String HIVE_DRIVER = "org.apache.hive.jdbc.HiveDriver";
           final String IMPALA_CONNECTION = "jdbc:hive2://192.168.122.189:21050/default;auth=noSasl";
           final String QUERY1 = "SELECT count(*) as totalhits FROM weblog.weblog";                 
           final String QUERY2 = "SELECT substr(requesttime, 2, 11) as dayofmonth, count(*) as hits FROM weblog.weblog GROUP BY dayofmonth ORDER BY hits DESC LIMIT 31";                                               

           Connection connection = null;
           Statement statement = null;
           ResultSet resultSet = null;

           try {
               Class.forName(HIVE_DRIVER);
               connection = DriverManager.getConnection(IMPALA_CONNECTION);
               statement = connection.createStatement();
               resultSet = statement.executeQuery(QUERY1); 
               while (resultSet.next()) {                 
                   int totalhits = resultSet.getInt("totalhits"); 
                   System.out.println("Total Number of Hits: " + totalhits);
               }

               resultSet = statement.executeQuery(QUERY2);

               System.out.println("DayOfMonth, Number of Hits");
               while (resultSet.next()) {                
                   String dayofmonth = resultSet.getString("dayofmonth"); 
                   int totalhits = resultSet.getInt("hits"); 
                   System.out.println(dayofmonth +", " + totalhits);
               }
            } catch (SQLException e) {
               System.out.println("SQL Exception");
               e.printStackTrace();
            } catch (Exception e) {
               System.out.println("Java Exception");
            }
            finally {
               try {
                   resultSet.close();
                   statement.close();
                   connection.close();
               } catch (Exception e) {
                   System.out.println("Java Exceptioni - Close");
                   e.printStackTrace();
               }
            }
    }
}


