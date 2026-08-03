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

    <section class="allergen-filter" aria-labelledby="allergen-filter-title">
        <div>
            <h2 id="allergen-filter-title">Allergene ausblenden</h2>
            <p>Wähle Allergene aus, die du vermeiden möchtest.</p>
        </div>
        <div class="allergen-filter-options">
            <label><input type="checkbox" name="allergen" value="gluten"> Gluten</label>
            <label><input type="checkbox" name="allergen" value="milch"> Milch</label>
            <label><input type="checkbox" name="allergen" value="nüsse"> Nüsse</label>
            <button type="button" id="clearAllergenFilter">Filter zurücksetzen</button>
        </div>
        <p id="filterResult" class="filter-result" aria-live="polite"></p>
    </section>

    <c:forEach var="category" items="${menuBean.categories}">
        <section class="menu-category" id="cat-${category.id}">
            <div class="menu-category-header">
                <h2><c:out value="${category.name}" /></h2>
                <p><c:out value="${category.description}" /></p>
            </div>

            <div class="menu-grid">
                <c:forEach var="item" items="${category.items}">
                    <article class="menu-card" data-allergens="${item.allergenSearchText}">
                        <img class="menu-card-image"
                             src="${pageContext.request.contextPath}/${item.imagePath}"
                             alt="${item.name}">
                        <div class="menu-card-body">
                            <div class="menu-card-title">
                                <h3><c:out value="${item.name}" /></h3>
                                <div class="menu-badges">
                                    <c:if test="${not empty item.badgeLabel}">
                                        <span class="menu-badge menu-badge-highlight"><c:out value="${item.badgeLabel}" /></span>
                                    </c:if>
                                    <c:if test="${item.vegetarian}">
                                        <span class="menu-badge">Vegetarisch</span>
                                    </c:if>
                                </div>
                            </div>
                            <p class="menu-description"><c:out value="${item.description}" /></p>
                        </div>

                        <form class="menu-add-form" action="${pageContext.request.contextPath}/cart" method="post">
                            <c:if test="${item.customizable}">
                                <div class="menu-options">
                                    <c:choose>
                                        <c:when test="${item.vegetarian}">
                                            <input type="hidden" name="meat" value="Falafel">
                                        </c:when>
                                        <c:otherwise>
                                            <label>
                                                Fleischart
                                                <select name="meat">
                                                    <option value="Kalb">Kalb</option>
                                                    <option value="Hähnchen">Hähnchen</option>
                                                </select>
                                            </label>
                                        </c:otherwise>
                                    </c:choose>

                                    <label>
                                        Soße
                                        <select name="sauce">
                                            <option value="Kräuter">Kräuter</option>
                                            <option value="Knoblauch">Knoblauch</option>
                                            <option value="Scharf">Scharf</option>
                                            <option value="Ohne Soße">Ohne Soße</option>
                                        </select>
                                    </label>

                                    <label>
                                        Schärfegrad
                                        <select name="spice">
                                            <option value="Mild">Mild</option>
                                            <option value="Mittel">Mittel</option>
                                            <option value="Scharf">Scharf</option>
                                        </select>
                                    </label>

                                    <label class="menu-option-checkbox">
                                        <input type="checkbox" name="extraCheese" value="true">
                                        Extra Käse (+1,00 €)
                                    </label>
                                </div>
                            </c:if>

                            <div class="menu-card-footer">
                                <span class="menu-price">
                                    <fmt:formatNumber value="${item.basePrice}" minFractionDigits="2" maxFractionDigits="2" /> €
                                </span>

                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${item.productId}">
                                <input type="hidden" name="returnTo" value="${pageContext.request.contextPath}/menu">
                                <button type="submit" class="menu-add-button">In den Warenkorb</button>
                            </div>
                        </form>

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

    <p id="noMenuResults" class="menu-no-results" hidden>
        Für diese Auswahl wurden keine passenden Gerichte gefunden.
    </p>
</main>
<script src="${pageContext.request.contextPath}/js/menu.js"></script>
</body>
</html>
