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
        String customerName = trim(request.getParameter("customerName"));
        String street = trim(request.getParameter("street"));
        String houseNumber = trim(request.getParameter("houseNumber"));
        String postalCode = trim(request.getParameter("postalCode"));
        String city = trim(request.getParameter("city"));
        String note = trim(request.getParameter("note"));

        if (customerName.isEmpty() || street.isEmpty() || houseNumber.isEmpty() || postalCode.isEmpty() || city.isEmpty()) {
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

        HttpSession session = request.getSession();
        Object cartTotal = session.getAttribute("cartTotal");
        if (cartTotal instanceof BigDecimal) {
            order.setTotalAmount((BigDecimal) cartTotal);
        }

        @SuppressWarnings("unchecked")
        List<String> cartItems = (List<String>) session.getAttribute("cartItems");
        if (cartItems != null) {
            order.setItems(new ArrayList<String>(cartItems));
        }

        @SuppressWarnings("unchecked")
        List<OrderBean> orders = (List<OrderBean>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<OrderBean>();
        }
        orders.add(order);

        session.setAttribute("orders", orders);
        session.setAttribute("lastOrder", order);

        response.sendRedirect(request.getContextPath() + "/success.jsp");
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}

