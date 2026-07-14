package de.uni.doener.model;

import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class CartBeanTest {

    @Test
    void sameProductIncreasesQuantity() {
        CartBean cart = new CartBean();

        cart.addItem("doener", "Döner", new BigDecimal("7.50"));
        cart.addItem("doener", "Döner", new BigDecimal("7.50"));

        assertEquals(1, cart.getItems().size());
        assertEquals(2, cart.getItems().get(0).getQuantity());
    }

    @Test
    void totalPriceUsesQuantity() {
        CartBean cart = new CartBean();

        cart.addItem("doener", "Döner", new BigDecimal("7.50"));
        cart.updateQuantity("doener", 3);

        assertEquals(new BigDecimal("22.50"), cart.getTotalPrice());
    }

    @Test
    void quantityZeroRemovesProduct() {
        CartBean cart = new CartBean();

        cart.addItem("ayran", "Ayran", new BigDecimal("2.00"));
        cart.updateQuantity("ayran", 0);

        assertTrue(cart.isEmpty());
    }

    @Test
    void clearRemovesAllProducts() {
        CartBean cart = new CartBean();

        cart.addItem("doener", "Döner", new BigDecimal("7.50"));
        cart.addItem("ayran", "Ayran", new BigDecimal("2.00"));
        cart.clear();

        assertTrue(cart.isEmpty());
        assertEquals(BigDecimal.ZERO, cart.getTotalPrice());
    }
}
