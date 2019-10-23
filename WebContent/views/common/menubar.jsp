<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <style>

        #navbar {
            width:100%;
            height:60px;
            position:fixed;
            z-index: 1;
            color:white;
            font-family: 'Fugaz One', cursive;
        }

        #category {
          width: 100%;
          height:60px;
          position: fixed;
          z-index: 1;
          background: white;
          opacity:0.8;
          font-family: 'Paytone One', sans-serif;
          font-size: 25px; 
          font-style: italic;
        }

        .nav-link:hover {
          text-decoration:underline;
          font-weight:bold;
        }
        
        hr {
            border: 1px solid black;
        }

        .btn {
            background: black;
            border: 1px solid white;
            color: white;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>
  <nav class="navbar navbar-dark bg-dark" id="navbar">
    <a class="navbar-brand" href="main.html" style="font-size : 28px;">LOOK SO FINE</a>
    <form class="form-inline">
      <input class="form-control mr-sm-2" type="search" placeholder="SEARCH" aria-label="SEARCH" style="font-family: 'Do Hyeon', sans-serif; font-style: italic;">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="background:black; text-decoration: none; border: 1px solid white;">SEARCH</button>
    </form>
  </nav>
  <nav style="padding:60px 0;">
      <ul class="nav justify-content-center" id="category">
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;" >STYLE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;">FAVORITE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="event.html" style="color: #000;">EVENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;">MY PAGE</a>
        </li>
      </ul>
    </nav>
</header>
</body>
</html>