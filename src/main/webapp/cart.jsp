<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Warenkorb</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cart.css">
</head>
<body class="cart-page">
<header>
    <jsp:include page="nav.jsp" />
</header>

<main class="cart-container">
    <h1>Dein Warenkorb</h1>

    <c:choose>
        <c:when test="${empty sessionScope.cart.items}">
            <div class="cart-empty">
                <p>Dein Warenkorb ist noch leer.</p>
                <a class="cart-link" href="${pageContext.request.contextPath}/menu">
                    Zur Speisekarte
                </a>
            </div>
        </c:when>

        <c:otherwise>
            <c:forEach items="${sessionScope.cart.items}" var="item">
                <section class="cart-item">
                    <div class="cart-item-product">
                        <c:if test="${not empty item.imagePath}">
                            <img class="cart-item-image"
                                 src="${pageContext.request.contextPath}/${item.imagePath}"
                                 alt="${item.name}">
                        </c:if>

                        <div class="cart-item-info">
                            <h2><c:out value="${item.name}" /></h2>
                            <p>
                                Einzelpreis:
                                <fmt:formatNumber value="${item.price}" minFractionDigits="2" maxFractionDigits="2" /> €
                            </p>
                            <p>
                                Zwischensumme:
                                <strong>
                                    <fmt:formatNumber value="${item.subtotal}" minFractionDigits="2" maxFractionDigits="2" /> €
                                </strong>
                            </p>
                        </div>
                    </div>

                    <div class="cart-actions">
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="${item.productId}">

                            <label for="quantity-${item.productId}">Menge</label>
                            <input id="quantity-${item.productId}"
                                   type="number"
                                   name="quantity"
                                   value="${item.quantity}"
                                   min="0"
                                   required>
                            <button type="submit">Aktualisieren</button>
                        </form>

                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productId" value="${item.productId}">
                            <button class="remove-button" type="submit">Entfernen</button>
                        </form>
                    </div>
                </section>
            </c:forEach>

            <section class="cart-summary">
                <p>
                    Artikel: <strong><c:out value="${sessionScope.cart.totalQuantity}" /></strong>
                </p>
                <p class="cart-total">
                    Gesamtpreis:
                    <strong>
                        <fmt:formatNumber value="${sessionScope.cart.totalPrice}"
                                          minFractionDigits="2"
                                          maxFractionDigits="2" /> €
                    </strong>
                </p>

                <div class="summary-actions">
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="clear">
                        <button class="clear-button" type="submit">Warenkorb leeren</button>
                    </form>

                    <a class="checkout-link" href="${pageContext.request.contextPath}/checkout">
                        Weiter zum Checkout
                    </a>
                </div>
            </section>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
