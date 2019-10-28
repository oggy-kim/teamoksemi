<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지 : LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">

    <style>

        body {
          width : 100%;
          height : 1600px;
        }

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

        section {
            width: 100%;
            height: 1200px;
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

        .copyRight {
          text-align: center;
          padding: 100px 0;
        }

        .menuLine {
            margin: auto;
            width: 80%;
            height: 100px;
            align-items: center;
        }

        .div {
            width: 33%;
            margin: auto;
            float: left;
            text-align: center;
        }

        .innermenu {
            width: 100px;
            height: 30px;
            text-align: center;
            border: 1px solid black;
            border-radius: 5px;
            margin: auto;
            font-weight: bold;
            font-size: 18px;
        }

        .menu {
            width: 18%;
            list-style-type: disc;
            float: left;
            font-size: 20px;
            /* ------ 규내 수정 -----*/
            padding : 5% 0 0 0;
            /* ---------------------*/
        }

        .line {
            width: 5%;
            float: left;
            border-left: 2px solid black;
            height: 1200px;
        }

        .list {
            padding: 10px;
        }
        .sublist {
            padding: 10px;
        }

        ul.category li a {
            margin:auto;
            color: black;
             /* ------ 규내 수정 -----*/
             font-family: 'Do Hyeon', sans-serif; 
            font-size: 25px; 
            /* ---------------------*/ 
        }

        ul.category li a:hover {
            font-weight: bold;
            font-style: italic;
        }

        ul.category ul > li {
            list-style-type: square;
            margin: 5px 5px;
            text-decoration: none;
        }


        /* -------------------- content -------------------- */

        .content {
            width: 75%;
            height: 2000px;
            float: left;
            display : block;
        }

        #content_title {
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 40px; 
            margin : 0;
        }

        #content_title_wrapper {
            margin : 0 auto;
        }

        hr {
            margin : 0;
        }


    </style>
</head>
<body>
<header>
  <nav class="navbar navbar-dark bg-dark" id="navbar">
    <a class="navbar-brand" href="main.html" style="font-size : 28px;">LOOK SO FINE</a>
    <form class="form-inline">
      <input class="form-control mr-sm-2" type="search" placeholder="SEARCH" aria-label="SEARCH">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="background:black; text-decoration: none; border: 1px solid white;">SEARCH</button>
    </form>
  </nav>
  <nav style="padding:60px 0;">
      <ul class="nav justify-content-center" id="category">
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;" >STYLE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"style="color: #000;">FAVORITE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="event.html"style="color: #000;">EVENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;">MY PAGE</a>
        </li>
      </ul>
    </nav>
</header>
<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
          ADMIN
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
    <div class="menu">
        <ul class="category">
            <li class="list"><a href="#">OVERVIEW</a></li>
            <li class="list"><a href="#">회원관리</a></li>
            <li class="list"><a href="#">게시물관리</a></li>
            <li class="list"><a href="#">제휴쇼핑몰관리</a></li>
            <li class="list"><a href="#">문의사항관리</a></li>
            <li class="list"><a href="#">구글애널리틱스(예정)</a></li>            
        </ul>
    </div>
    <div class="line"></div>
    <div class="content">
        <div>
            <h2 id="content_title"> &nbsp;&nbsp;OVERVIEW</h2>
        </div>
        <hr>

        <br>
        <br>
        
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>