package business.entities;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItems> cartItemsList = new ArrayList<>();

    public Cart() {}

    public List<CartItems> getCartItemsList() {
        return cartItemsList;
    }

    public int getNumberOfItems() {
        return cartItemsList.size();
    }

    public void addToCart(CartItems cartItem) { cartItemsList.add(cartItem); }

    public void removeFromCart(CartItems cartItem) {cartItemsList.remove(cartItem); }

    public double totalSum() {
        double sum = 0.0;
        for (CartItems cartItem : cartItemsList) {
            sum += cartItem.getPrice();
        }
        return sum;
    }
}
