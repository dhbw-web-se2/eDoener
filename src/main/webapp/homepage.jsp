<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <style>
        #us{
                margin-top: 120px;
                display: flex;
                flex-direction: column;
                align-items: center;
        }
    </style>
</head>
    <body class="page-enter">
    <script>
        window.addEventListener('load', () => {
            document.body.classList.add('page-enter-active');
        });
    </script>
        <header>
            <jsp:include page="nav.jsp"/>
        </header>
        <div id="us">
            <jsp:include page="us.jsp"/>
        </div>

        <div id="contact">
            <jsp:include page="contact.jsp"/>
        </div>
    </body>
</html>