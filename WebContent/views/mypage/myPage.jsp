<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK SO FINE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
<style>
#navbar {
            width:100%;
            height:60px;
            position:fixed;
            z-index: 1;
            text-align: center;
        }

        #category {
          width: 100%;
          height:60px;
          position: fixed;
          z-index: 1;
          background: white;
          opacity:0.8;
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

        .content {
            width: 65%;
            height: 500px;
            float: left;
        }

        .menu {
            width: 20%;
            list-style-type: disc;
            float: left;
            font-size: 20px;
        }

        .line {
            width: 5%;
            float: left;
            border-left: 2px solid black;
            height: 1200px;
        }

        .list, .list-readonly {
            padding: 10px;
        }
        .sublist {
            padding: 10px;
        }

        ul.category li a {
            margin:auto;
            color: black;
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

        .mytype {
          background: lightgray;
          margin: auto;
          padding: 10px;
          width: 50%;
        }

        button.mytype {
          width: 23%;
          color: black;
          border-radius: 5px;
          border: 0px;
          background: gray;
          font-weight: 600;
        }

        .list:hover, .sublist:hover {
            cursor: pointer;
            font-weight: 700;
        }
</style>


</head>
<body>
 	<%@ include file="../common/menubar.jsp" %>
 	
 	<nav>
        <br>
        <div class="menuLine">
        <div class="div div1"><hr></div>
        <div class="div div2">
            <div class="innermenu">
                My Page
            </div>
        </div>
        <div class="div div3"><hr></div>
      </div>
      </nav>
      <br>
<section>
    <div class="menu">
        <ul class="category">
            <li class="list" onclick="goMyCloset();">나의 옷장</li>
            <li class="list" onclick="goMyList();">내 게시물 관리</li>
            <li class="list" onclick="goQna();">FAQ / Q&A</li>
            <li class="list-readonly">개인정보관리
             <ul>
                    <li class="sublist" onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인 정보 수정</a></li>
                    <li class="sublist" onclick="goWishStyle();">선호 스타일</li>
                    <li class="sublist" onclick="location.href='<%= contextPath %>/views/mypage/withdraw.jsp'">회원 탈퇴</li>
                </ul>
            </li>
        </ul>
    </div>
    <script>
        function goMyCloset(){
            location.href="<%= contextPath %>/closet.look";
        }
        function goMyList(){
            location.href="<%= contextPath %>/mylist.look";
        }
        function goQna(){
            location.href="<%= contextPath %>/qna.look";
        }
        function goWishStyle(){
            location.href="<%= contextPath %>/withstyle.look";
        }
    </script>


    <div class="line"></div>
    <div class="content">
        <h2>Overview</h2>
        <hr>
        
        <div class="mytype">
          <button class="mytype hashtag1" disabled>깔끔한</button>
          <button class="mytype hashtag2" disabled>세련된</button>
          아기바위 님의 페이지입니다. 
          <img src="https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/egg-3442-4c317615ec1fd800728672f2c168aca5@1x.jpg" weight="50px" width="50px">

        </div>


    <div class="article left">
    <article class="favoritestyle">
    선호하는 스타일 관리란
    </div>
    </article>    
    <div class="article right">
    <article class="myboard">
    내 게시물 관리란
    </article>

    <article class="myqna">
    Q&A란

    </article>
   </div>

    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>