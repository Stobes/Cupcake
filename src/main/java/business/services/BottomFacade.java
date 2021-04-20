package business.services;

import business.entities.Bottom;
import business.persistence.BottomMapper;
import business.persistence.Database;
import business.exceptions.UserException;


public class BottomFacade
{
    BottomMapper bottomMapper;

    public BottomFacade(Database database)
    {
        bottomMapper = new BottomMapper(database);
    }


    public Bottom createBottom(String discription, int price) throws UserException
    {
        Bottom bottom = new Bottom(discription, price);
        bottomMapper.createBottom(bottom);
        return bottom;
    }
}