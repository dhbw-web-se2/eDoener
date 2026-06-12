
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Willkommen bei eDöner!</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <style>
        body {
            opacity: 1;
            transform: translateY(0);
            transition: transform 0.6s ease, opacity 0.6s ease;
        }
        .page-exit-active {
            transform: translateY(-100px);
            opacity: 0;
        }
        .page-enter {
            transform: translateY(100px);
            opacity: 0;
        }
        .page-enter-active {
            transform: translateY(0);
            opacity: 1;
            transition: transform 0.6s ease, opacity 0.6s ease;
        }
    </style>
</head>
<body>
        <div class="wrap">

            <div class="container">
                <img id="Logo" src="images/Logo.png" alt="Logo">

                <div class="openings">
                    <h2>Öffnungszeiten</h2>
                    <p>Montag-Freitag: 11:45-21:00</p>
                    <p>Samstag-Sonntag: 11:45-22:00</p>
                </div>
            </div>

            <button id="Startbutton" onclick="uebrgang('${pageContext.request.contextPath}/homepage.jsp')">
                Homepage</button>

        </div>
    <script>
        function uebrgang(zielseite) {
            document.body.classList.add('page-exit-active');

            document.body.addEventListener('transitionend', () => {
                window.location.href = zielseite;
            },{ once: true});
        }
    </script>

</body>
</html>
