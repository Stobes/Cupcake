package business.persistence;
import business.entities.Topping;
import business.exceptions.UserException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ToppingMapper
{
    private Database database;

    public ToppingMapper(Database database)
    {
        this.database = database;
    }


    public List<Topping> getToppings() throws UserException
    {
        List<Topping> toppingList = new ArrayList<>();
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
                    toppingList.add(new Topping(id,name,price));
                }
                return toppingList;
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