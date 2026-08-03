package de.uni.doener.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class MenuBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private final List<MenuCategoryBean> categories;

    public MenuBean() {
        categories = new ArrayList<MenuCategoryBean>();
        seedMenu();
    }

    public List<MenuCategoryBean> getCategories() {
        return categories;
    }

    public MenuItemBean getItemById(String productId) {
        if (productId == null) {
            return null;
        }

        for (MenuCategoryBean category : categories) {
            for (MenuItemBean item : category.getItems()) {
                if (productId.equals(item.getProductId())) {
                    return item;
                }
            }
        }

        return null;
    }

    private void seedMenu() {
        MenuCategoryBean classics = new MenuCategoryBean(
                "classic",
                "Klassiker",
                "Die beliebtesten eDöner-Standards für den schnellen Hunger.");
        MenuItemBean doenerClassic = new MenuItemBean("doener-classic", "Döner Classic", "Knuspriges Brot, frischer Salat und Kalbfleisch.", new BigDecimal("7.50"));
        doenerClassic.addIngredient("Fladenbrot");
        doenerClassic.addIngredient("Kalbfleisch");
        doenerClassic.addIngredient("Salat");
        doenerClassic.addIngredient("Tomaten");
        doenerClassic.addIngredient("Zwiebeln");
        doenerClassic.addAllergen("Gluten");
        classics.addItem(doenerClassic);

        MenuItemBean doenerCheese = new MenuItemBean("doener-cheese", "Döner mit Käse", "Unser Classic plus extra geschmolzener Käse.", new BigDecimal("8.50"));
        doenerCheese.addIngredient("Fladenbrot");
        doenerCheese.addIngredient("Kalbfleisch");
        doenerCheese.addIngredient("Käse");
        doenerCheese.addIngredient("Salat");
        doenerCheese.addAllergen("Gluten");
        doenerCheese.addAllergen("Milch");
        classics.addItem(doenerCheese);

        MenuItemBean yufkaClassic = new MenuItemBean("yufka-classic", "Yufka Döner", "Wahlweise mit Kalb oder Hähnchen im Fladenbrot.", new BigDecimal("8.20"));
        yufkaClassic.addIngredient("Yufka");
        yufkaClassic.addIngredient("Kalbfleisch");
        yufkaClassic.addIngredient("Salat");
        yufkaClassic.addIngredient("Kräutersoße");
        yufkaClassic.addAllergen("Gluten");
        yufkaClassic.addAllergen("Milch");
        classics.addItem(yufkaClassic);

        MenuCategoryBean veggie = new MenuCategoryBean(
                "veggie",
                "Vegetarisch",
                "Leichte Alternativen mit Falafel und Gemüse.");
        MenuItemBean doenerVegetarisch = new MenuItemBean("doener-vegetarisch", "Döner vegetarisch", "Vegetarische Variante mit Falafel und frischem Gemüse.", new BigDecimal("6.90"));
        doenerVegetarisch.addIngredient("Fladenbrot");
        doenerVegetarisch.addIngredient("Falafel");
        doenerVegetarisch.addIngredient("Salat");
        doenerVegetarisch.addIngredient("Gemüse");
        doenerVegetarisch.addAllergen("Gluten");
        veggie.addItem(doenerVegetarisch);

        MenuItemBean yufkaVegetarisch = new MenuItemBean("yufka-vegetarisch", "Yufka vegetarisch", "Frische Gemüsefüllung mit Hummus und Kräutern.", new BigDecimal("7.20"));
        yufkaVegetarisch.addIngredient("Yufka");
        yufkaVegetarisch.addIngredient("Gemüse");
        yufkaVegetarisch.addIngredient("Hummus");
        yufkaVegetarisch.addIngredient("Kräuter");
        yufkaVegetarisch.addAllergen("Gluten");
        veggie.addItem(yufkaVegetarisch);

        MenuCategoryBean snacks = new MenuCategoryBean(
                "snacks",
                "Snacks",
                "Perfekt zum Teilen oder für den kleinen Extra-Hunger.");
        MenuItemBean pommes = new MenuItemBean("pommes", "Pommes", "Goldgelb frittiert und schön knusprig.", new BigDecimal("3.50"));
        pommes.addIngredient("Kartoffeln");
        pommes.addIngredient("Pflanzenöl");
        snacks.addItem(pommes);

        MenuItemBean baklava = new MenuItemBean("baklava", "Baklava", "Süßes Dessert mit Honig und Pistazien.", new BigDecimal("3.20"));
        baklava.addIngredient("Teig");
        baklava.addIngredient("Honig");
        baklava.addIngredient("Pistazien");
        baklava.addAllergen("Gluten");
        baklava.addAllergen("Nüsse");
        snacks.addItem(baklava);

        MenuCategoryBean drinks = new MenuCategoryBean(
                "drinks",
                "Getränke",
                "Kalte Begleiter für dein Menü.");
        MenuItemBean ayran = new MenuItemBean("ayran", "Ayran", "Erfrischend und klassisch zum Döner.", new BigDecimal("2.00"));
        ayran.addIngredient("Joghurt");
        ayran.addIngredient("Wasser");
        ayran.addIngredient("Salz");
        ayran.addAllergen("Milch");
        drinks.addItem(ayran);

        MenuItemBean cola = new MenuItemBean("cola", "Cola", "0,33 l gekühlt serviert.", new BigDecimal("2.50"));
        cola.addIngredient("Getränk");
        drinks.addItem(cola);

        categories.add(classics);
        categories.add(veggie);
        categories.add(snacks);
        categories.add(drinks);
    }
}
