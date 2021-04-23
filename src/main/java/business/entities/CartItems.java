package business.entities;

public class CartItems {

    private Topping topping;
    private Bottom bottom;
    private int quantity;

    public CartItems(Topping topping, Bottom bottom, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.quantity = quantity;
    }

    public double getPrice() {
        return (topping.getPrice() + bottom.getPrice()) * quantity;
    }

    public Topping getTop() { return topping; }

    public void setTop() {this.topping = topping; }

    public Bottom getBottom() { return bottom; }

    public void setBottom(Bottom bottom) { this.bottom = bottom; }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
