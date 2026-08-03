<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styles.css">
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
        <div id="us">
            <jsp:include page="us.jsp"/>
        </div>

        <div id="contact">
            <jsp:include page="contact.jsp"/>
        </div>

        <div id="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
