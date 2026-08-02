<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<h1>Danke fuer deine Bestellung!</h1>

<c:if test="${sessionScope.lastOrder != null}">
<p><strong>Name:</strong> ${sessionScope.lastOrder.customerName}</p>
<p><strong>Lieferadresse:</strong> ${sessionScope.lastOrder.deliveryAddress}</p>
<p><strong>Hinweis:</strong> ${empty sessionScope.lastOrder.note ? '-' : sessionScope.lastOrder.note}</p>
<p><strong>Bestellt am:</strong> ${sessionScope.lastOrder.createdAt}</p>
</c:if>
<c:if test="${sessionScope.lastOrder == null}">
<p>Es wurden keine Bestelldaten gefunden.</p>
</c:if>

<p><a href="start.jsp">Zurueck zur Startseite</a></p>
</main>
</body>
</html>

