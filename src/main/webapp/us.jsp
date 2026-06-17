<%--
  Created by IntelliJ IDEA.
  User: prke
  Date: 16.06.2026
  Description: Über uns Seite für eDöner
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>Über uns - eDöner</title>
    <style>
        body {

            font-family: Arial, sans-serif;
            margin: 0;

            background:
                    linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
                    url('images/Doener1.jpg');

            background-size: cover;
            background-position: center;


        }

        #ush1 {
            color: white;
            margin: 40px 0;
        }

        h2 {
            color: #165C26;
            margin-bottom: 10px;
        }

        section {

            width: 60%;
            max-width: 700px;

            background-color: rgba(255, 255, 255, 0.9);
            color: #222;
            padding: 20px;
            margin-bottom: 25px;

            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);

            text-align: left;

        }
    </style>
</head>

<body id="usbody">

<h1 id="ush1">Traditioneller Döner – neu interpretiert</h1>

<section class="fleisch">
    <h2 id="ush2">Frisches Fleisch</h2>
    <p>
        Bei eDöner legen wir größten Wert auf Qualität. Unsere Drehspieße werden täglich<br>
        frisch geliefert und bestehen aus hochwertigem Bio-Kalbsfleisch sowie<br>
        zartem Hühnerfleisch von regionalen Bauern. So garantieren wir Ihnen ein<br>
        unvergleichliches Geschmackserlebnis bei jedem Besuch.
    </p>
</section>

<section class="brot">
    <h2>Frisch gebackenes Brot</h2>
    <p>
        Unser Brot wird jeden Tag direkt vor Ort frisch gebacken.<br>
        Es basiert auf einem traditionellen Familienrezept des Inhabers,<br>
        das seit Generationen weitergegeben wird – außen knusprig,<br>
        innen weich und perfekt abgestimmt auf unseren Döner.
    </p>
</section>

<section class="toppings">
    <h2>Unsere Toppings</h2>
    <p>
        Ein perfekter Döner lebt von seinen Zutaten.<br>
        Deshalb verwenden wir ausschließlich frisches Gemüse aus der Region,<br>
        darunter knackiger Eisbergsalat, aromatisches Rotkraut und fein geschnittene Zwiebeln.<br>
        Das Highlight sind jedoch unsere hausgemachten Soßen:
    </p>

    <ol type="I">
        <li>eDöner Knoblauchsoße</li>
        <li>eDöner Cocktailsoße</li>
        <li>eDöner Feuersoße</li>
        <li>eDöner Sweet Currysoße</li>
    </ol>
</section>

<section class="angebote">
    <h2>Angebote</h2>
    <ul>
        <li>Schülerangebot: Montag–Freitag, 12:00–13:30 Uhr → nur 6,00€</li>
        <li>Happy Hour: täglich von 18:00–19:00 Uhr → nur 7,00€</li>
    </ul>
</section>

</body>
</html>