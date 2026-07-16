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
        String vorname = request.getParameter("vorname");
        String nachname = request.getParameter("nachname");
        String betreff = request.getParameter("betreff");

        request.setAttribute("vorname", vorname);
        request.setAttribute("nachname", nachname);
        request.setAttribute("betreff", betreff);

        request.getRequestDispatcher("/contact_processing.jsp").forward(request, response);
    }
}
