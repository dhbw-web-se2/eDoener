<%--
  Created by IntelliJ IDEA.
  User: prke
  Date: 17.06.2026
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="contact-body">
    <div class="contact-page">
<div class="header_contact">
    <h1>Sie möchten Kontakt mit uns aufnehmen?</h1>
        <h2>Dann schreiben Sie uns direkt an!</h2>
</div>
    <div class="conatiner_contact">
    <div class="map">
    <img id="map-img" src="images/Map.png" alt="Standort des Geschäfts: Waldstr. 36, 76133 Karlsruhe">
    </div>
    <div class="contact">
    <form method="post" action="${pageContext.request.contextPath}/ContactServlet">
        <div class="row">
        <input type="text" name="vorname" placeholder="Vorame *" required>
        <input type="text" name="nachname" placeholder="Nachname *" required><br>
        </div>
        <div class="row">
        <input type="text" placeholder="Email *" required>
        <input type="text" placeholder="Telefonnummer"><br>
        </div>
        <input type="text" class="full" name="betreff" placeholder="Betreff *" required><br>
        <textarea class="full" placeholder="Ihre Nachricht *" required></textarea>
        <button type="submit">Senden</button>
    </form>
    </div>
    </div>
</div>
</div>

