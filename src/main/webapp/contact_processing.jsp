<%--
  Created by IntelliJ IDEA.
  User: prke
  Date: 15.07.2026
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
    <title>Deine Nachricht wurde versendet!</title>
    <style>

    </style>
</head>
<body id="process_body">
<img id="process-logo" src="${pageContext.request.contextPath}/images/Logo.webp" alt="Unser Logo">
<div id="contact_processing_div">
    <h1 id="process_h1">Deine Nachricht wurde versendet!</h1>
        <p>
            Hey <c:out value="${vorname}" />,<br>
            wir haben deine Nachricht erhalten!<br>
            Wir melden uns unter <strong><c:out value="${email}" /></strong> bei dir.
        </p>
        <div class="contact-confirmation">
            <p><strong>Betreff:</strong> <c:out value="${betreff}" /></p>
            <p><strong>Nachricht:</strong><br><c:out value="${nachricht}" /></p>
            <c:if test="${not empty telefonnummer}">
                <p><strong>Telefon:</strong> <c:out value="${telefonnummer}" /></p>
            </c:if>
        </div>
        <a class="buttons process-home-link" href="${pageContext.request.contextPath}/homepage.jsp">Zurück zur Homepage</a>
</div>
</body>
</html>
