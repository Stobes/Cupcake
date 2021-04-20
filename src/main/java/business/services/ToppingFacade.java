package business.services;

import business.entities.Topping;
import business.persistence.Database;
import business.exceptions.UserException;
import business.persistence.ToppingMapper;

public class ToppingFacade
{
    ToppingMapper toppingMapper;

    public ToppingFacade(Database database)
    {
        toppingMapper = new ToppingMapper(database);
    }


    public Topping createTopping(String discription, int price) throws UserException
    {
        Topping topping = new Topping(discription, price);
        toppingMapper.createTopping(topping);
        return topping;
    }
}
