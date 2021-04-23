package business.services;
import business.entities.Topping;
import business.persistence.Database;
import business.exceptions.UserException;
import business.persistence.ToppingMapper;

import java.util.List;


public class ToppingFacade
{
    //Her blev der lavet noget til jsp.
    ToppingMapper toppingMapper;

    public ToppingFacade(Database database)
    {
        toppingMapper = new ToppingMapper(database);
    }

    public List<Topping> getToppings() throws UserException{
        return toppingMapper.getToppings();
    }
}
