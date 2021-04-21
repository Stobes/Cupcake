package business.persistence;
import business.entities.Topping;
import business.exceptions.UserException;
import java.sql.*;
import java.util.HashMap;

public class ToppingMapper
{
    private Database database;

    public ToppingMapper(Database database)
    {
        this.database = database;
    }

    //Her blev der også lavet noget.

    public HashMap<Integer,Topping> getToppings() throws UserException
    {
        HashMap<Integer, Topping> toppingMap = new HashMap<>();
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM topping";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("topping_id");
                    String name = rs.getString("topping_description");
                    int price = rs.getInt("price");
                    toppingMap.put(id,new Topping(id,name,price));
                }
                return toppingMap;
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