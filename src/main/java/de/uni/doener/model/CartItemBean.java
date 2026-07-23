package de.uni.doener.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Ein einzelner Eintrag im Warenkorb.
 */
public class CartItemBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String productId;
    private String name;
    private BigDecimal price;
    private int quantity;

    public CartItemBean() {
        this.price = BigDecimal.ZERO;
        this.quantity = 1;
    }

    public CartItemBean(String productId, String name, BigDecimal price, int quantity) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getSubtotal() {
        return price.multiply(BigDecimal.valueOf(quantity));
    }
}