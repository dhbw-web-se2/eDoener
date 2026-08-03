<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bestellung erfolgreich</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/success.css">
</head>
<body class="success-page">
<header>
    <jsp:include page="nav.jsp" />
</header>
<main class="success-box">

<h1>Danke für deine Bestellung!</h1>

<c:if test="${sessionScope.lastOrder != null}">
<p><strong>Name:</strong> <c:out value="${sessionScope.lastOrder.customerName}" /></p>
<p><strong>Bestellart:</strong> <c:out value="${sessionScope.lastOrder.deliveryTypeLabel}" /></p>
<p><strong>Adresse:</strong> <c:out value="${sessionScope.lastOrder.deliveryAddress}" /></p>
<p><strong>Telefon:</strong> <c:out value="${sessionScope.lastOrder.phone}" /></p>
<p><strong>Gesamtpreis:</strong>
    <fmt:formatNumber value="${sessionScope.lastOrder.totalAmount}" minFractionDigits="2" maxFractionDigits="2" /> €
</p>
<p><strong>Hinweis:</strong> <c:out value="${empty sessionScope.lastOrder.note ? '-' : sessionScope.lastOrder.note}" /></p>
<p><strong>Bestellt am:</strong> <c:out value="${sessionScope.lastOrder.createdAtFormatted}" /></p>
<ul class="success-items">
    <c:forEach var="item" items="${sessionScope.lastOrder.items}">
        <li><c:out value="${item}" /></li>
    </c:forEach>
</ul>
</c:if>
<c:if test="${sessionScope.lastOrder == null}">
<p>Es wurden keine Bestelldaten gefunden.</p>
</c:if>

<p><a href="${pageContext.request.contextPath}/menu">Zurück zur Speisekarte</a></p>
</main>
</body>
</html>
