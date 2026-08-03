<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Impressum - eDöner</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
</head>
<body>
<header>
    <jsp:include page="nav.jsp" />
</header>

<main class="impressum-container">
    <h1>Impressum</h1>
    
    <section class="impressum-section">
        <h2>Angaben zum Anbieter</h2>
        <p>
            <strong>Name und Anschrift:</strong><br>
            eDöner<br>
            Waldstr. 36<br>
            76133 Karlsruhe<br>
            Deutschland
        </p>
    </section>

    <section class="impressum-section">
        <h2>Kontaktinformationen</h2>
        <p>
            <strong>Telefon:</strong> +49 721 98765432<br>
            <strong>E-Mail:</strong> <a href="mailto:info@edoener.de">info@edoener.de</a>
        </p>
    </section>

    <section class="impressum-section">
        <h2>Hinweis zum Projekt</h2>
        <p>
            Diese Website ist ein studentisches Webengineering-Projekt der DHBW Karlsruhe.
            Sie dient ausschließlich zu Demonstrations- und Lernzwecken.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Inhalte</h2>
        <p>
            Restaurantname, Kontaktdaten, Speisekarte und Bestellablauf sind Beispiele für dieses Studienprojekt.
            Es werden keine echten Bestellungen verarbeitet.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Datenschutz</h2>
        <p>
            Eingaben aus Warenkorb, Checkout und Kontaktformular werden nur in der aktuellen Sitzung verarbeitet
            und nicht dauerhaft gespeichert oder an Dritte übertragen.
        </p>
    </section>
</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
