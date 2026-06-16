<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Checkout</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>
<h1>Lieferdaten</h1>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color: #b30000;"><%= error %></p>
<% } %>

<form id="checkoutForm" action="checkout" method="post">
    <label for="customerName">Name *</label><br/>
    <input type="text" id="customerName" name="customerName" required /><br/><br/>

    <label for="street">Strasse *</label><br/>
    <input type="text" id="street" name="street" required /><br/><br/>

    <label for="houseNumber">Hausnummer *</label><br/>
    <input type="text" id="houseNumber" name="houseNumber" required /><br/><br/>

    <label for="postalCode">PLZ *</label><br/>
    <input type="text" id="postalCode" name="postalCode" required /><br/><br/>

    <label for="city">Ort *</label><br/>
    <input type="text" id="city" name="city" required /><br/><br/>

    <label for="note">Hinweis (optional)</label><br/>
    <textarea id="note" name="note" rows="3"></textarea><br/><br/>

    <button type="submit">Bestellung abschicken</button>
</form>

<script src="js/checkout.js"></script>
</body>
</html>

