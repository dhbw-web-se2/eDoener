package de.uni.doener.servlet;

import de.uni.doener.model.CartBean;
import de.uni.doener.model.CartItemBean;
import de.uni.doener.model.OrderBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        CartBean cart = (CartBean) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("error", "Ihr Warenkorb ist leer. Bitte fügen Sie zuerst Artikel hinzu.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }
        
        String customerName = trim(request.getParameter("customerName"));
        String phone = trim(request.getParameter("phone"));
        String deliveryType = trim(request.getParameter("deliveryType"));
        String street = trim(request.getParameter("street"));
        String houseNumber = trim(request.getParameter("houseNumber"));
        String postalCode = trim(request.getParameter("postalCode"));
        String city = trim(request.getParameter("city"));
        String note = trim(request.getParameter("note"));

        if (!"delivery".equals(deliveryType) && !"pickup".equals(deliveryType)) {
            request.setAttribute("error", "Bitte wählen Sie Lieferung oder Abholung aus.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

        boolean addressMissing = "delivery".equals(deliveryType)
                && (street.isEmpty() || houseNumber.isEmpty() || postalCode.isEmpty() || city.isEmpty());

        if (customerName.isEmpty() || phone.isEmpty() || addressMissing) {
            request.setAttribute("error", "Bitte füllen Sie alle Pflichtfelder aus.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

        if ("delivery".equals(deliveryType) && !postalCode.matches("\\d{5}")) {
            request.setAttribute("error", "Bitte geben Sie eine gültige fünfstellige PLZ ein.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

        OrderBean order = new OrderBean();
        order.setCustomerName(customerName);
        order.setStreet(street);
        order.setHouseNumber(houseNumber);
        order.setPostalCode(postalCode);
        order.setCity(city);
        order.setNote(note);
        order.setPhone(phone);
        order.setDeliveryType(deliveryType);

        order.setTotalAmount(cart.getTotalPrice());

        List<String> orderItems = new ArrayList<String>();
        for (CartItemBean item : cart.getItems()) {
            orderItems.add(item.getQuantity() + " x " + item.getName());
        }
        order.setItems(orderItems);

        @SuppressWarnings("unchecked")
        List<OrderBean> orders = (List<OrderBean>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<OrderBean>();
        }
        orders.add(order);

        session.setAttribute("orders", orders);
        session.setAttribute("lastOrder", order);
        
        cart.clear();
        session.removeAttribute("cartItems");
        session.removeAttribute("cartTotal");

        response.sendRedirect(request.getContextPath() + "/success.jsp");
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
