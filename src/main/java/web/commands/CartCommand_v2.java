package web.commands;

import business.entities.Cart;
import business.entities.CartItems;
import business.entities.Bottom;
import business.entities.Topping;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class CartCommand_v2 extends CommandUnprotectedPage
{
    public CartCommand_v2(String pageToShow)
    {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        int topId;
        int bottomId;
        int quantity;

        try
        {
            topId = Integer.parseInt(request.getParameter("top"));
            bottomId = Integer.parseInt(request.getParameter("bottom"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        catch (NumberFormatException ex)
        {
            throw new UserException("Fejl i indtastning på forsiden");
        }

        List<Topping> topList = (List<Topping>) request.getServletContext().getAttribute("topList");
        List<Bottom> bottomList = (List<Bottom>) request.getServletContext().getAttribute("bottomList");

        HttpSession session = request.getSession();

        Cart basket = (Cart) session.getAttribute("basket");

        if (basket == null)
        {
            basket = new Cart();
        }

        Topping top = getTopItemFromId(topList, topId);
        Bottom bottom = getButtomItemFromId(bottomList, bottomId);
        CartItems basketItem = new CartItems(top, bottom, quantity);

        basket.addToCart(basketItem);

        session.setAttribute("basket", basket);

        return pageToShow;
    }

    private Topping getTopItemFromId(List<Topping> topList, int topId)
    {
        for (Topping top : topList)
        {
            if (top.getId() == topId)
            {
                return top;
            }
        }
        return null;
    }

    private Bottom getButtomItemFromId(List<Bottom> bottomList, int bottomId)
    {
        for (Bottom bottom : bottomList)
        {
            if (bottom.getId() == bottomId)
            {
                return bottom;
            }
        }
        return null;
    }

}
