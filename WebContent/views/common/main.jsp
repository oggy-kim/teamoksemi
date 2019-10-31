<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <!-- fotorama -->
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
    <style>
        body {
          width : 100%;
          height : 1600px;
        }

        header {
          width:100%;
          height:120px;
        }

        .mainArea {
          background: darkgray;
          width: 80%;
          height: 400px;
          margin: auto;
        }

        .mainImgArea{
            width: 80%;
            height: 100%;
            float: left;
        }

        .weatherArea {
            width: 20%;
            height: 100%;
            float: left;
            color: white;
            margin: auto;
            font-family: 'Fugaz One', cursive;
            font-size: 20px;
            background: rgb(65, 65, 65);
            text-align: left;
        }

        .weatherArea .up {
          width: 100%;
          height: 60%;
        }

        .weatherArea .down {
          width: 100%;
          height: 40%;
        }

        .forecast {
          width:80%;
          height:100%;
          margin:auto;
        }

        .dailyImg {
          width:80%;
          height:100%;
          margin:auto;
        }

        .weatherArea .up img {
          width:100%;
          height:100%;
          padding:10px 0;
        }

        .mainImg {
            float: left;
        }

        .mainImg1 {
            width: 100%;
            height: 100%;
        }

        .middleArea {
          width: 80%;
          height: 500px;
          margin: auto;
        }

        .subImg {
          background: darkgray;
          width: 30%;
          height: 400px;
          float: left;
        }

        .subImg1 {
          margin: 10px 1.7%;
        }

        .subImg2 {
          margin: 10px 1.7%;
        }

        .subImg3 {
          margin: 10px 1.6%;
        }

        .styleImgArea{
          width: 80%;
		  margin: 0 auto;
        }

        .copyRight {
          text-align: center;
          padding: 100px 0;

        }

        .cicon {
          text-transform: uppercase;
        }
    </style>
    <script>
    
      $.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=975353dea991d476ec748ec5b88c3a52&units=metric', function(data){
        var $ctemp = data.main.temp;
        var $chum = data.main.humidity;
        var $cwind = data.wind.speed;
        var $wIcon = data.weather[0].icon;
        var $wData = data.weather[0].main;

        $('.ctemp').prepend($ctemp);
        $('.chum').append($chum).append($('.per'));
        $('.cwind').append($cwind).append($('persec'));
        $('.cicon').append('<img src="http://openweathermap.org/img/w/' + $wIcon + '.png" />').append($wData);
      });
      
    </script>
</head>
<body>
 	<%@ include file="menubar.jsp" %>
<br>
<section>
  <div class="mainArea">
    <div class="mainImgArea">
        <img class="mainImg mainImg1" src="<%= contextPath %>/resources/images/main.png">
    </div>  
    <div class="weatherArea">
        <div class="up">
          <div class="dailyImg">
            <img src="<%= contextPath %>/resources/images/daily.png">
          </div>
        </div>
        <div class="down">
          <div class="forecast">
            <div class="cicon"></div>
            <label>TEMP : </label> <label class="ctemp"> &deg;C</label>
            <br>
            <label class="chum">HUM : </label> <label>%</label>
            <br>
            <label class="cwind">WIND : </label> <label>m/s</label>
          </div>
        </div>
    </div>
  </div>
  <div class="middleArea">
    <br>
    <div class="subImg subImg1">
        <div class="card" style="width: 100%; height: 100%;">
            <img src="<%= contextPath %>/resources/images/tour1.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" style="float:right; text-decoration: none; background: darkgray;">detail >></a>
            </div>
        </div>
    </div>
    <div class="subImg subImg2">
        <div class="card" style="width: 100%; height:100%;">
            <img src="<%= contextPath %>/resources/images/tour2.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" style="float:right; text-decoration: none; background: darkgray;">detail>></a>
            </div>
        </div>
    </div>
    <div class="subImg subImg3">
        <div class="card" style="width: 100%; height:100%;">
            <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
        </div>
    </div>
  </div>
  <!-- 스타일 이미지 -->
  <div class="styleImgArea">
     <div class="fotorama" data-fit="contain" data-arrows="true" data-width="100%" data-height="80%" data-ratio="4/3" data-allowfullscreen="true" data-autoplay="3000">
        <img src="<%= contextPath %>/resources/images/style1.PNG" class="inner">
        <img src="<%= contextPath %>/resources/images/style2.PNG" class="inner">
        <img src="<%= contextPath %>/resources/images/style3.PNG" class="inner">
        <img src="<%= contextPath %>/resources/images/style4.PNG" class="inner">
      </div>
   </div>
</section>
<br><br>
<footer class="copyRight">
  <p>Copyright 2019. LOOKSOFINE.  All right reserved.</p>
</footer>
<script>
function goMain() {
	location.href="<%= contextPath %>";
}

function goStyle() {
	location.href="<%= contextPath %>/list.bo";
}

function goFavorite() {
	location.href="<%= contextPath %>/list.fa";
}

function goEvent() {
	location.href="<%= contextPath %>/views/event/eventPage.jsp";
}

function goMypage() {
	// admin계정으로 로그인했을 때, admin페이지로 넘어갈 수 있도록 수정	
	if("<%= gradeCode %>" == 'S'){
		location.href="<%= contextPath %>/views/adm/adm_overview.jsp";
	} else {
		location.href="<%= contextPath %>/views/mypage/myPage.jsp";
	}
}
</script>
</body>
</html>