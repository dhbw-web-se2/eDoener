
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
    }
    #navbar {
      position: sticky;
      top: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 30px;
      background-color: rgb(31, 107, 60);
    }
    #navbar img{
      width: 100px;
      height: 100px;
    }
    #navbar ul{
      display: flex;
      list-style: none;
      margin: 0;
      padding: 0;
      gap: 20px;
    }
    #navbar ul li a{
      color: white;
      font-family: Arial, sans-serif;
      font-weight: bold;
      font-size: 30px;
      text-decoration: none;
    }
  </style>
</head>
<body>

  <nav id="navbar">
    <img src="images/Logo.png" alt="Logo">
    <ul>
      <li><a href="menu.jsp">Menü</a></li>
      <li><a href="about.jsp">Über uns</a></li>
      <li><a href="contact.jsp">Kontakt</a></li>
    </ul>
  </nav>


</body>
</html>
