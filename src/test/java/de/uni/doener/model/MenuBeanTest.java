package de.uni.doener.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertFalse;

class MenuBeanTest {

    @Test
    void menuContainsCategories() {
        MenuBean menuBean = new MenuBean();

        assertFalse(menuBean.getCategories().isEmpty());
    }

    @Test
    void findsKnownMenuItemById() {
        MenuBean menuBean = new MenuBean();

        MenuItemBean item = menuBean.getItemById("doener-vegetarisch");

        assertNotNull(item);
        assertEquals("Döner vegetarisch", item.getName());
    }
}
