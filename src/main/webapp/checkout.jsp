<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/checkout.css">
</head>
<body class="checkout-page">
<header>
    <jsp:include page="nav.jsp" />
</header>
<main class="checkout-box">
<h1>Bestellung abschließen</h1>

<c:if test="${not empty error}">
    <p class="checkout-error">
        <c:out value="${error}" />
    </p>
</c:if>

<form id="checkoutForm" action="${pageContext.request.contextPath}/checkout" method="post">
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

    <fieldset id="addressFields" class="checkout-address">
        <legend>Lieferadresse</legend>

        <label for="street">Straße *</label><br/>
        <input type="text" id="street" name="street" /><br/><br/>

        <label for="houseNumber">Hausnummer *</label><br/>
        <input type="text" id="houseNumber" name="houseNumber" /><br/><br/>

        <label for="postalCode">PLZ *</label><br/>
        <input type="text" id="postalCode" name="postalCode" inputmode="numeric" maxlength="5" /><br/><br/>

        <label for="city">Ort *</label><br/>
        <input type="text" id="city" name="city" /><br/><br/>
    </fieldset>

    <label for="note">Hinweis (optional)</label><br/>
    <textarea id="note" name="note" rows="3"></textarea><br/><br/>

    <button type="submit">Bestellung abschicken</button>
</form>

<p class="checkout-back"><a href="${pageContext.request.contextPath}/cart">Zurück zum Warenkorb</a></p>
</main>

<script src="${pageContext.request.contextPath}/js/checkout.js"></script>
</body>
</html>
