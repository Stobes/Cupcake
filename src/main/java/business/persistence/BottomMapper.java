package business.persistence;

import business.entities.Bottom;
import business.entities.Topping;
import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;

public class BottomMapper
{
    private Database database;

    public BottomMapper(Database database)
    {
        this.database = database;
    }

    public void createBottom(Bottom bottom) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "INSERT INTO topping (bottom_discription, price) VALUES (?, ?)";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, bottom.getDiscription());
                ps.setInt(2, bottom.getPrice());

                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                bottom.setId(id);
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