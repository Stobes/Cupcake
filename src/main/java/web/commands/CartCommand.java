package web.commands;

import business.entities.*;
import business.exceptions.UserException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class CartCommand extends CommandUnprotectedPage {

    public CartCommand(String pageToShow) { super(pageToShow); }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {
        int topId;
        int bottomId;
        int quantity;

        try {
            topId = Integer.parseInt(request.getParameter("topping"));
            bottomId = Integer.parseInt(request.getParameter("bottom"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            throw new UserException("Fejl i indtastning på forsiden");
        }

        List<Topping> toppingList = (List<Topping>) request.getServletContext().getAttribute("topList");
        List<Bottom> bottomList = (List<Bottom>) request.getServletContext().getAttribute("¨bottomList");

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        Topping topping = getTopItemFromId(toppingList, topId);
        Bottom bottom = getBottomItemFromId(bottomList, bottomId);
        CartItems cartItem = new CartItems(topping, bottom, quantity);

        cart.addToCart(cartItem);

        session.setAttribute("cart", cart);

        return pageToShow;
    }

    private Topping getTopItemFromId(List<Topping> topList, int topId) {
        for (Topping topping : topList) {
            if (topping.getId() == topId) {
                return topping;
            }
        }
        return null;
    }

    private Bottom getBottomItemFromId(List<Bottom> bottomList, int bottomId) {
        for (Bottom bottom : bottomList) {
            if (bottom.getId() == bottomId) {
                return bottom;
            }
        }
        return  null;
    }
}
