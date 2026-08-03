<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

<main class="checkout-content">
    <section class="checkout-summary">
        <h1>Deine Bestellung</h1>

        <c:choose>
            <c:when test="${empty sessionScope.cart.items}">
                <p class="checkout-empty">Dein Warenkorb ist leer.</p>
            </c:when>
            <c:otherwise>
                <div class="checkout-items">
                    <c:forEach var="item" items="${sessionScope.cart.items}">
                        <article class="checkout-item">
                            <c:if test="${not empty item.imagePath}">
                                <img src="${pageContext.request.contextPath}/${item.imagePath}"
                                     alt="${item.name}">
                            </c:if>
                            <div class="checkout-item-text">
                                <h2><c:out value="${item.name}" /></h2>
                                <p>
                                    <c:out value="${item.quantity}" /> x
                                    <fmt:formatNumber value="${item.price}"
                                                      minFractionDigits="2"
                                                      maxFractionDigits="2" /> €
                                </p>
                                <strong>
                                    <fmt:formatNumber value="${item.subtotal}"
                                                      minFractionDigits="2"
                                                      maxFractionDigits="2" /> €
                                </strong>
                            </div>
                        </article>
                    </c:forEach>
                </div>

                <div class="checkout-total">
                    <span>Gesamtpreis</span>
                    <strong>
                        <fmt:formatNumber value="${sessionScope.cart.totalPrice}"
                                          minFractionDigits="2"
                                          maxFractionDigits="2" /> €
                    </strong>
                </div>
            </c:otherwise>
        </c:choose>
    </section>

    <section class="checkout-box">
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
    </section>
</main>

<script src="${pageContext.request.contextPath}/js/checkout.js"></script>
</body>
</html>
