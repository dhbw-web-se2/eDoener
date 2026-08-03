# eDöner

Kleines Webengineering-Projekt für einen Döner-Imbiss. Die Anwendung verwendet Jakarta Servlets, JSP, JSTL und Sessions.

## Funktionen

- Speisekarte mit Kategorien, Bildern, Preisen, Zutaten und Allergenen
- Filter zum Ausblenden ausgewählter Allergene
- Anpassung von Döner und Yufka nach Fleischart, Soße, Schärfegrad und extra Käse
- Session-basierter Warenkorb mit Mengenänderung und Gesamtpreis
- Checkout für Lieferung oder Abholung
- Bestellbestätigung
- Kontaktformular und Impressum
- Darstellung für Desktop und Smartphone

## Voraussetzungen

- JDK 17
- Apache Tomcat 10.1 oder 11
- Maven 3.8 oder der enthaltene Maven Wrapper

## Bauen und testen

```bash
./mvnw clean test package
```

Die fertige WAR-Datei liegt anschließend unter:

```text
target/eDoener-1.0-SNAPSHOT.war
```

## Deployment auf Tomcat

Die WAR-Datei als `eDoener.war` in das Tomcat-Verzeichnis `webapps` kopieren:

```bash
cp target/eDoener-1.0-SNAPSHOT.war "$CATALINA_HOME/webapps/eDoener.war"
```

Nach dem Start von Tomcat ist die Anwendung erreichbar unter:

```text
http://localhost:8080/eDoener/
```

## Wichtige Seiten

| Seite | Pfad |
|---|---|
| Startseite | `/eDoener/` |
| Homepage | `/eDoener/homepage.jsp` |
| Speisekarte | `/eDoener/menu` |
| Warenkorb | `/eDoener/cart` |
| Checkout | `/eDoener/checkout` |
| Impressum | `/eDoener/impressum.jsp` |

## Tests

Die Unit-Tests prüfen die Warenkorb- und Menüdaten. Vor der Abgabe wurden zusätzlich die Hauptabläufe im Browser getestet:

1. Produkt auswählen und anpassen
2. Produkt in den Warenkorb legen
3. Menge ändern
4. Lieferung und Abholung abschließen
5. Leeren Warenkorb abweisen
6. Kontaktformular absenden
7. Navigation auf Desktop und Smartphone prüfen

## Hinweise

- Warenkörbe und Bestellungen werden nur in der HTTP-Session gespeichert.
- Nach einem Neustart von Tomcat sind diese Daten nicht mehr vorhanden.
- Das Kontaktformular zeigt eine Bestätigung an, versendet aber keine echte E-Mail.
