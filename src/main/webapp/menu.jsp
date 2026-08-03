<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${empty menuBean}">
    <c:redirect url="${pageContext.request.contextPath}/menu" />
</c:if>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eDöner - Speisekarte</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
</head>
<body class="menu-page">
<header>
    <jsp:include page="nav.jsp" />
</header>

<main class="menu-shell">
    <section class="menu-hero">
        <div>
            <p class="menu-kicker">Frisch. Schnell. Lecker.</p>
            <h1>Unsere Speisekarte</h1>
        </div>

        <div class="menu-summary">
            <strong>Warenkorb</strong>
            <span><c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.totalQuantity}" /> Artikel</span>
            <span>
                <fmt:formatNumber value="${empty sessionScope.cart ? 0 : sessionScope.cart.totalPrice}"
                                  minFractionDigits="2"
                                  maxFractionDigits="2" /> €
            </span>
        </div>
    </section>

    <c:forEach var="category" items="${menuBean.categories}">
        <section class="menu-category" id="cat-${category.id}">
            <div class="menu-category-header">
                <h2><c:out value="${category.name}" /></h2>
                <p><c:out value="${category.description}" /></p>
            </div>

            <div class="menu-grid">
                <c:forEach var="item" items="${category.items}">
                    <article class="menu-card">
                        <div class="menu-card-body">
                            <h3><c:out value="${item.name}" /></h3>
                            <p class="menu-description"><c:out value="${item.description}" /></p>
                        </div>

                        <div class="menu-card-footer">
                            <span class="menu-price">
                                <fmt:formatNumber value="${item.basePrice}" minFractionDigits="2" maxFractionDigits="2" /> €
                            </span>

                            <form class="menu-add-form" action="${pageContext.request.contextPath}/cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${item.productId}">
                                <input type="hidden" name="returnTo" value="${pageContext.request.contextPath}/menu">
                                <button type="submit" class="menu-add-button">In den Warenkorb</button>
                            </form>
                        </div>

                        <details class="menu-details">
                            <summary>Inhaltsstoffe und Allergene ansehen</summary>
                            <div class="menu-details-content">
                                <div>
                                    <strong>Zutaten</strong>
                                    <c:choose>
                                        <c:when test="${empty item.ingredients}">
                                            <p>Keine Angaben.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <ul>
                                                <c:forEach var="ingredient" items="${item.ingredients}">
                                                    <li><c:out value="${ingredient}" /></li>
                                                </c:forEach>
                                            </ul>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div>
                                    <strong>Allergene</strong>
                                    <c:choose>
                                        <c:when test="${empty item.allergens}">
                                            <p>Keine Angaben.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <ul>
                                                <c:forEach var="allergen" items="${item.allergens}">
                                                    <li><c:out value="${allergen}" /></li>
                                                </c:forEach>
                                            </ul>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </details>
                    </article>
                </c:forEach>
            </div>
        </section>
    </c:forEach>
</main>
</body>
</html>
