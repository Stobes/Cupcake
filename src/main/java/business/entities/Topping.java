package business.entities;

import java.util.Objects;

public class Topping {

    private final int id;
    private String description;
    private int price;

    public Topping(int id,String description, int price) {
        this.description = description;
        this.price = price;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
