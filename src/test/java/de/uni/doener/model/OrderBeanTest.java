package de.uni.doener.model;

import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;

class OrderBeanTest {

    @Test
    void pickupDoesNotShowEmptyAddress() {
        OrderBean order = new OrderBean();
        order.setDeliveryType("pickup");

        assertEquals("Abholung im Restaurant", order.getDeliveryAddress());
        assertEquals("Abholung", order.getDeliveryTypeLabel());
    }

    @Test
    void creationDateIsFormattedForUsers() {
        OrderBean order = new OrderBean();
        order.setCreatedAt(LocalDateTime.of(2026, 8, 3, 20, 45));

        assertEquals("03.08.2026, 20:45", order.getCreatedAtFormatted());
    }
}
