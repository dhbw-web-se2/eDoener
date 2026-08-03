package de.uni.doener.servlet;

import de.uni.doener.model.CartBean;
import de.uni.doener.model.CartItemBean;
import de.uni.doener.model.MenuBean;
import de.uni.doener.model.MenuItemBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet fuer den Warenkorb.
 *
 * Die Daten werden in der Session gespeichert. Dadurch hat jeder
 * Benutzer seinen eigenen Warenkorb.
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        CartBean cart = getCart(session);

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addProduct(request, cart);
        } else if ("update".equals(action)) {
            updateProduct(request, cart);
        } else if ("remove".equals(action)) {
            cart.removeItem(request.getParameter("productId"));
        } else if ("clear".equals(action)) {
            cart.clear();
        }

        updateCheckoutData(session, cart);

        // Nach einem POST wird erneut die Warenkorbseite aufgerufen.
        // Dadurch wird ein doppeltes Absenden beim Aktualisieren verhindert.
        response.sendRedirect(getReturnTo(request));
    }

    private CartBean getCart(HttpSession session) {
        CartBean cart = (CartBean) session.getAttribute("cart");

        if (cart == null) {
            cart = new CartBean();
            session.setAttribute("cart", cart);
        }

        return cart;
    }

    private void addProduct(HttpServletRequest request, CartBean cart) {
        String productId = request.getParameter("productId");
        MenuItemBean menuItem = new MenuBean().getItemById(productId);

        if (menuItem == null) {
            return;
        }

        String name = menuItem.getName();
        String priceText = menuItem.getBasePrice().toPlainString();

        if (menuItem.isCustomizable()) {
            String meat = menuItem.isVegetarian()
                    ? "Falafel"
                    : allowedValue(request.getParameter("meat"), "Kalb", "Kalb", "Hähnchen");
            String sauce = allowedValue(request.getParameter("sauce"), "Kräuter", "Kräuter", "Knoblauch", "Scharf", "Ohne Soße");
            String spice = allowedValue(request.getParameter("spice"), "Mild", "Mild", "Mittel", "Scharf");
            boolean extraCheese = "true".equals(request.getParameter("extraCheese"));

            StringBuilder options = new StringBuilder();
            options.append(meat).append(", ").append(sauce).append(", ").append(spice);
            if (extraCheese) {
                options.append(", extra Käse");
                priceText = menuItem.getBasePrice().add(new BigDecimal("1.00")).toPlainString();
            }

            name = menuItem.getName() + " (" + options + ")";
            productId = menuItem.getProductId() + "|" + meat + "|" + sauce + "|" + spice + "|" + extraCheese;
        }

        if (isEmpty(productId) || isEmpty(name) || isEmpty(priceText)) {
            return;
        }

        try {
            BigDecimal price = new BigDecimal(priceText.replace(',', '.'));

            if (price.compareTo(BigDecimal.ZERO) >= 0) {
                cart.addItem(productId, name, price);
            }
        } catch (NumberFormatException ignored) {
            // Ungueltige Preise werden nicht in den Warenkorb aufgenommen.
        }
    }

    private void updateProduct(HttpServletRequest request, CartBean cart) {
        String productId = request.getParameter("productId");
        String quantityText = request.getParameter("quantity");

        if (isEmpty(productId) || isEmpty(quantityText)) {
            return;
        }

        try {
            int quantity = Integer.parseInt(quantityText);
            cart.updateQuantity(productId, quantity);
        } catch (NumberFormatException ignored) {
            // Bei einer ungueltigen Menge bleibt der Warenkorb unveraendert.
        }
    }

    /**
     * Der vorhandene Checkout erwartet diese beiden Session-Attribute.
     * Sie werden hier aus dem CartBean erzeugt, damit beide Teile
     * ohne komplizierte Abhaengigkeiten zusammenarbeiten.
     */
    private void updateCheckoutData(HttpSession session, CartBean cart) {
        List<String> cartItems = new ArrayList<String>();

        for (CartItemBean item : cart.getItems()) {
            cartItems.add(item.getQuantity() + " x " + item.getName());
        }

        session.setAttribute("cartItems", cartItems);
        session.setAttribute("cartTotal", cart.getTotalPrice());
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    private String getReturnTo(HttpServletRequest request) {
        String returnTo = request.getParameter("returnTo");
        String menuPath = request.getContextPath() + "/menu";
        String cartPath = request.getContextPath() + "/cart";

        if (menuPath.equals(returnTo)) {
            return menuPath;
        }

        if (cartPath.equals(returnTo)) {
            return cartPath;
        }

        return cartPath;
    }

    private String allowedValue(String value, String defaultValue, String... allowedValues) {
        for (String allowedValue : allowedValues) {
            if (allowedValue.equals(value)) {
                return allowedValue;
            }
        }

        return defaultValue;
    }
}
