package business.persistence;

import business.entities.Employee;
import business.exceptions.UserException;

import java.sql.*;
import java.util.HashMap;

public class EmployeeMapper {

    private Database database;

    public EmployeeMapper(Database database)
    {
        this.database = database;
    }

    //Hashmaps til employees. Henter data fra databasens user tabel, og pakker det ind i et hashmap.

    public HashMap<Integer, Employee> getEmployee() throws UserException
    {
        HashMap<Integer, Employee> employeeMap = new HashMap<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM users";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    int balance = rs.getInt("balance");
                    employeeMap.put(id,new Employee(id,email,role,balance));
                }
                return employeeMap;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }
}
