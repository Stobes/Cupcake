package business.entities;

public class CartItems {

    private Topping top;
    private Bottom bottom;
    private int quantity;

    public CartItems(Topping top, Bottom bottom, int quantity) {
        this.top = top;
        this.bottom = bottom;
        this.quantity = quantity;
    }

    public double getPrice() {
        return (top.getPrice() + bottom.getPrice()) * quantity;
    }

    public Topping getTop() { return top; }

    public void setTop() {this.top = top; }

    public Bottom getBottom() { return bottom; }

    public void setBottom(Bottom bottom) { this.bottom = bottom; }



}
