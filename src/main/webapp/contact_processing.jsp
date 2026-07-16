<%--
  Created by IntelliJ IDEA.
  User: prke
  Date: 15.07.2026
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/styles.css">
    <title>Deine Nachricht wurde versendet!</title>
    <style>

    </style>
</head>
<body id="process_body">
<img id="process-logo" src="images/Logo.png" alt="Unser Logo">
<div id="contact_processing_div">
    <h1 id="process_h1">Deine Nachricht wurde versendet!</h1>
        <p>
            Hey ${vorname},<br>
            wir haben deine Nachricht erhalten!<br>
            Wir werden uns bald bei dir melden,<br>
            damit wir uns um dein Anliegen <b> <span style="color: #165C26"> "${betreff}" </span> </b> kümmern können.
        </p>
        <a href="homepage.jsp">
        <button class="buttons">Zurück zur Homepage</button>
        </a>
</div>
</body>
</html>
