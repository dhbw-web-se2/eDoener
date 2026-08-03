package de.uni.doener.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class MenuItemBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String productId;
    private String name;
    private String description;
    private BigDecimal basePrice;
    private final List<String> ingredients;
    private final List<String> allergens;

    public MenuItemBean() {
        this.basePrice = BigDecimal.ZERO;
        this.ingredients = new ArrayList<String>();
        this.allergens = new ArrayList<String>();
    }

    public MenuItemBean(String productId, String name, String description, BigDecimal basePrice) {
        this();
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.basePrice = basePrice;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }

    public List<String> getIngredients() {
        return ingredients;
    }

    public List<String> getAllergens() {
        return allergens;
    }

    public void addIngredient(String ingredient) {
        ingredients.add(ingredient);
    }

    public void addAllergen(String allergen) {
        allergens.add(allergen);
    }
}
