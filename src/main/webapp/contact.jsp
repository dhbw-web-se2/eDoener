<%--
  Created by IntelliJ IDEA.
  User: prke
  Date: 17.06.2026
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kontakt</title>
    <style>
        .contact-page {
            background-color: rgb(31, 107, 60);
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .conatiner_contact {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 30px;
            margin-top: 30px;
        }
        h1, h2 {
            text-align: center;
            color: #165C26;

        }
        .map, .contact {
            border: 1px solid #ccc;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            width: 50%;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9);

        }
        img{
            max-width: 100%;
            height: auto;
            border-radius: 10px;

        }
        .row{
            display: flex;
            gap: 10px;
            width: 100%;
        }
        .contact{
            padding: 10px;
        }
        .row input{
            flex: 1;
            padding: 10px;
            font-family: Arial, sans-serif;
        }
        .full{
            width: 98%;
            padding: 10px;
            margin-top: 10px;
            font-family: Arial, sans-serif;
        }
        .contact form{
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .contact button {
            width: 98%;
            height: 50px;
            padding: 10px;
            background-color: #1f6b3c;
            color: white;
            border: none;
            cursor: pointer;
            font-family: Arial, sans-serif;
            font-weight: bold;
        }
        .header_contact{
            border: 1px solid #ccc;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.9);

        }


    </style>
</head>
<body>
<div class="contact-page">
<div class="header_contact">
    <h1>Sie möchten Kontakt mit uns aufnehmen?</h1>
        <h2>Dann schreiben Sie uns direkt an!</h2>
</div>
    <div class="conatiner_contact">
    <div class="map">
    <img src="images/Map.png">
    </div>
    <div class="contact">
    <form>
        <div class="row">
        <input type="text" placeholder="Vorame *" required>
        <input type="text" placeholder="Nachname *" required><br>
        </div>
        <div class="row">
        <input type="text" placeholder="Email *" required>
        <input type="text" placeholder="Telefonnummer *" required><br>
        </div>
        <input type="text" class="full" placeholder="Betreff *" required><br>
        <textarea class="full" placeholder="Ihre Nachricht *" required></textarea>
        <button type="submit">Senden</button>
    </form>
    </div>
    </div>
</div>
</body>
</html>
