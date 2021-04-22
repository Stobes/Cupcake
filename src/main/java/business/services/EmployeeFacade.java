package business.services;
import business.entities.Employee;
import business.persistence.BottomMapper;
import business.persistence.Database;
import business.exceptions.UserException;
import business.persistence.EmployeeMapper;
import business.persistence.ToppingMapper;
import java.util.HashMap;


public class EmployeeFacade
{
    //Her blev der lavet noget til jsp.
    EmployeeMapper employeeMapper;


    public EmployeeFacade(Database database)
    {
        employeeMapper = new EmployeeMapper(database);
    }

    public HashMap<Integer,Employee> getEmployee() throws UserException{
        return employeeMapper.getEmployee();
    }
}
