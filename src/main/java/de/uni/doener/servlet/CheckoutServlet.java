package de.uni.doener.servlet;

import de.uni.doener.model.OrderBean;
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

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        @SuppressWarnings("unchecked")
        List<String> cartItems = (List<String>) session.getAttribute("cartItems");
        
        // Validate cart is not empty
        if (cartItems == null || cartItems.isEmpty()) {
            request.setAttribute("error", "Ihr Einkaufswagen ist leer. Bitte fuegen Sie zuerst Artikel hinzu.");
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

        if (customerName.isEmpty() || phone.isEmpty() || deliveryType.isEmpty() || street.isEmpty() || houseNumber.isEmpty() || postalCode.isEmpty() || city.isEmpty()) {
            request.setAttribute("error", "Bitte alle Pflichtfelder ausfuellen.");
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

        Object cartTotal = session.getAttribute("cartTotal");
        if (cartTotal instanceof BigDecimal) {
            order.setTotalAmount((BigDecimal) cartTotal);
        }

        order.setItems(new ArrayList<String>(cartItems));

        @SuppressWarnings("unchecked")
        List<OrderBean> orders = (List<OrderBean>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<OrderBean>();
        }
        orders.add(order);

        session.setAttribute("orders", orders);
        session.setAttribute("lastOrder", order);
        
        // Clear the cart after successful order
        session.removeAttribute("cartItems");
        session.removeAttribute("cartTotal");

        response.sendRedirect(request.getContextPath() + "/success.jsp");
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}

