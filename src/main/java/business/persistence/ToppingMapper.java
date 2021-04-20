package business.persistence;

import business.entities.Topping;
import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;

public class ToppingMapper
{
    private Database database;

    public ToppingMapper(Database database)
    {
        this.database = database;
    }

    public void createTopping(Topping topping) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "INSERT INTO topping (topping_discription, price) VALUES (?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, topping.getDiscription());
                ps.setInt(2, topping.getPrice());

                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                topping.setId(id);
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