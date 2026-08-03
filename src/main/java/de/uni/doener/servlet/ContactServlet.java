package de.uni.doener.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");

        String vorname = trim(request.getParameter("vorname"));
        String nachname = trim(request.getParameter("nachname"));
        String email = trim(request.getParameter("email"));
        String telefonnummer = trim(request.getParameter("telefonnummer"));
        String betreff = trim(request.getParameter("betreff"));
        String nachricht = trim(request.getParameter("nachricht"));

        if (vorname.isEmpty() || nachname.isEmpty() || email.isEmpty() || betreff.isEmpty() || nachricht.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bitte füllen Sie alle Pflichtfelder aus.");
            return;
        }

        request.setAttribute("vorname", vorname);
        request.setAttribute("nachname", nachname);
        request.setAttribute("email", email);
        request.setAttribute("telefonnummer", telefonnummer);
        request.setAttribute("betreff", betreff);
        request.setAttribute("nachricht", nachricht);

        request.getRequestDispatcher("/contact_processing.jsp").forward(request, response);
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
