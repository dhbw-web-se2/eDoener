<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
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
    </body>
</html>