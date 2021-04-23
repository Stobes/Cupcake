package business.services;
import business.entities.Bottom;
import business.persistence.BottomMapper;
import business.persistence.Database;
import business.exceptions.UserException;

import java.util.List;


public class BottomFacade
{
    //Her blev der lavet noget til jsp.
    BottomMapper bottomMapper;

    public BottomFacade(Database database)
    {
        bottomMapper = new BottomMapper(database);
    }

    public List<Bottom> getBottoms() throws UserException{
        return bottomMapper.getBottoms();
    }
}