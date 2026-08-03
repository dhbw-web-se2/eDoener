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
        <h2>Angaben gemäß §5 TMG</h2>
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
        <h2>Vertretungsberechtigte Person</h2>
        <p>
            Diese Website wird von eDöner betrieben.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Haftung für Inhalte</h2>
        <p>
            Die Inhalte unserer Seiten wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Als Diensteanbieter sind wir gemäß §7 Abs. 1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Haftung für Links</h2>
        <p>
            Unsere Website enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Urheberrecht</h2>
        <p>
            Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des Autors oder Schöpfers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.
        </p>
    </section>

    <section class="impressum-section">
        <h2>Datenschutz</h2>
        <p>
            Die Nutzung unserer Website ist in der Regel ohne Angabe personenbezogener Daten möglich. Soweit auf unseren Seiten personenbezogene Daten erhoben werden, erfolgt dies, soweit möglich, stets auf freiwilliger Basis.
        </p>
    </section>
</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
