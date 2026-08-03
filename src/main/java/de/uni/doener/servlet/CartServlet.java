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

        String name = menuItem != null ? menuItem.getName() : request.getParameter("name");
        String priceText = menuItem != null ? menuItem.getBasePrice().toPlainString() : request.getParameter("price");

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

        if (!isEmpty(returnTo)) {
            return returnTo;
        }

        return request.getContextPath() + "/cart";
    }
}
