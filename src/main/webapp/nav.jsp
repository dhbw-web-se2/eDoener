
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html id="navbarhtml">
<head>
  <title></title>
  <style>
    #navbarhtml, #navbarbody{
      margin: 0;
      padding: 0;
      width: 100%;
    }
    #navbar {
      position: sticky;
      align-self: stretch;
      box-sizing: border-box;
      top: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
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
      padding: 15px;
    }
  </style>
</head>
<body id="navbarbody">

  <nav id="navbar">
    <a href="start.jsp">
    <img src="images/Logo.png" alt="Logo">
    </a>
    <ul>
      <li><a href="#us">Über uns</a></li>
      <li><a href="menu.jsp">Menü</a></li>
      <li><a href="contact.jsp">Kontakt</a></li>
    </ul>
  </nav>


</body>
</html>
