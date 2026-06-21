<%@ page import="de.uni.doener.model.OrderBean" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bestellung erfolgreich</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/success.css">
</head>
<body class="success-page">
<main class="success-box">
<%
    OrderBean order = (OrderBean) session.getAttribute("lastOrder");
%>

<h1>Danke fuer deine Bestellung!</h1>

<% if (order != null) { %>
<p><strong>Name:</strong> <%= order.getCustomerName() %></p>
<p><strong>Lieferadresse:</strong> <%= order.getDeliveryAddress() %></p>
<p><strong>Hinweis:</strong> <%= order.getNote() == null || order.getNote().isEmpty() ? "-" : order.getNote() %></p>
<p><strong>Bestellt am:</strong> <%= order.getCreatedAt() %></p>
<% } else { %>
<p>Es wurden keine Bestelldaten gefunden.</p>
<% } %>

<p><a href="start.jsp">Zurueck zur Startseite</a></p>
</main>
</body>
</html>

