package de.uni.doener.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MenuCategoryBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String name;
    private String description;
    private final List<MenuItemBean> items;

    public MenuCategoryBean() {
        this.items = new ArrayList<MenuItemBean>();
    }

    public MenuCategoryBean(String id, String name, String description) {
        this();
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public List<MenuItemBean> getItems() {
        return items;
    }

    public void addItem(MenuItemBean item) {
        items.add(item);
    }
}
