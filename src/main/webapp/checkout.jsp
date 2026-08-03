<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Checkout</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/checkout.css">
</head>
<body class="checkout-page">
<main class="checkout-box">
<h1>Lieferdaten</h1>

<c:if test="${not empty error}">
    <p class="checkout-error">
        <c:out value="${error}" />
    </p>
</c:if>

<form id="checkoutForm" action="checkout" method="post">
    <label for="customerName">Name *</label><br/>
    <input type="text" id="customerName" name="customerName" required /><br/><br/>

    <label for="phone">Telefonnummer *</label><br/>
    <input type="tel" id="phone" name="phone" required /><br/><br/>

    <label for="deliveryType">Lieferart *</label><br/>
    <select id="deliveryType" name="deliveryType" required>
        <option value="">-- Bitte wählen --</option>
        <option value="delivery">Lieferung</option>
        <option value="pickup">Abholung</option>
    </select><br/><br/>

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
</main>

<script src="js/checkout.js"></script>
</body>
</html>

