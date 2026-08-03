package de.uni.doener.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Speichert den Warenkorb eines Benutzers.
 * Die Bean wird im Session-Scope abgelegt.
 */
public class CartBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private final List<CartItemBean> items;

    public CartBean() {
        items = new ArrayList<CartItemBean>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }

    public void addItem(String productId, String name, BigDecimal price) {
        addItem(productId, name, price, null);
    }

    public void addItem(String productId, String name, BigDecimal price, String imagePath) {
        CartItemBean existingItem = findItem(productId);

        if (existingItem == null) {
            items.add(new CartItemBean(productId, name, price, 1, imagePath));
        } else {
            existingItem.setQuantity(existingItem.getQuantity() + 1);
            if (existingItem.getImagePath() == null && imagePath != null) {
                existingItem.setImagePath(imagePath);
            }
        }
    }

    public void updateQuantity(String productId, int quantity) {
        if (quantity <= 0) {
            removeItem(productId);
            return;
        }

        CartItemBean item = findItem(productId);
        if (item != null) {
            item.setQuantity(quantity);
        }
    }

    public void removeItem(String productId) {
        CartItemBean item = findItem(productId);
        if (item != null) {
            items.remove(item);
        }
    }

    public void clear() {
        items.clear();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public int getTotalQuantity() {
        int totalQuantity = 0;

        for (CartItemBean item : items) {
            totalQuantity += item.getQuantity();
        }

        return totalQuantity;
    }

    public BigDecimal getTotalPrice() {
        BigDecimal totalPrice = BigDecimal.ZERO;

        for (CartItemBean item : items) {
            totalPrice = totalPrice.add(item.getSubtotal());
        }

        return totalPrice;
    }

    private CartItemBean findItem(String productId) {
        for (CartItemBean item : items) {
            if (item.getProductId().equals(productId)) {
                return item;
            }
        }

        return null;
    }
}