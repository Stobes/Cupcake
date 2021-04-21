package business.persistence;

import business.entities.Bottom;
import business.entities.Topping;
import business.exceptions.UserException;
import business.entities.User;

import java.sql.*;
import java.util.HashMap;

public class BottomMapper
{
    private Database database;

    public BottomMapper(Database database)
    {
        this.database = database;
    }

    //Her blev der også lavet noget.

    public HashMap<Integer,Bottom> getBottoms() throws UserException
    {
        HashMap<Integer, Bottom> bottomMap = new HashMap<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM bottom";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("bottom_id");
                    String name = rs.getString("bottom_description");
                    int price = rs.getInt("price");
                    bottomMap.put(id,new Bottom(id,name,price));
                }
                return bottomMap;
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