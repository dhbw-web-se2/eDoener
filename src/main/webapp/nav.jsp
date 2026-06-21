
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
      position: fixed;
      z-index: 1000;
      left: 0;
      width: 100%;

      top: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 30px;
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
      padding-right: 50px;
      gap: 50px;
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
      <li><a href="#contact">Kontakt</a></li>
    </ul>
  </nav>


</body>
</html>
