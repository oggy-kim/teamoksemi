<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%
	// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();	
	
	// 메인화면 사진 변화 난수값
	int ran = (int)(1+5*Math.random());
	
	// 게시판
	Board board = (Board)request.getAttribute("board");
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
          background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
        }

        header {
          width:100%;
          height:120px;
        }

        .mainArea {
          background: darkgray;
          width: 70%;
          height: 400px;
          margin: auto;
        }

        .mainImgArea{
            width: 75%;
            height: 100%;
            float: left;
        }

        .weatherArea {
            width: 25%;
            height: 100%;
            float: left;
            color: white;
            margin: auto;
            font-family: 'Fugaz One', cursive;
            font-size: 30px;
            background: rgb(65, 65, 65);
            text-align: left;
        }

        .forecast {
          width:80%;
          height:100%;
          margin:20px 0 0 30px;
        }

        .dailyImg {
          width:80%;
          height:100%;
          margin:auto;
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
          height: 420px;
          float: left;
          border:1px solid lightgray;
          border-radius: 5px;
        }
        
        .subImg > div {
        	border:1px solid lightgray;
        	border-radius: 5px;
        }
        
        .subImg1:hover, .subImg2:hover {
        	cursor:pointer;
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
        
        .forecastIcon {
        	width:100%;
        	height:70%;
        }
        
        .fIcon {
        	width:33%;
        	float:left;
        	text-align:center;
        }
        
        .fData {
        	width:33%;
        	float:left;
        	text-align:center;
        	font-size:20px;
        	margin:20px 0;
        }
        
    </style>
    <script>
    
    $.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1835848&APPID=975353dea991d476ec748ec5b88c3a52&units=metric&cnt=7', function(data){
        var $cTemp = Math.round(data.list[0].main.temp);
        var $chum = Math.round(data.list[0].main.humidity);
        var $cwind = Math.round(data.list[0].wind.speed);
        var $wData = data.list[0].weather[0].main;
        var $wIcon = data.list[0].weather[0].icon;
        var cTemp = $cTemp;
        
        var $fIcon1 = data.list[1].weather[0].icon;
        var $fIcon2 = data.list[2].weather[0].icon;
        var $fIcon3 = data.list[3].weather[0].icon;
        var $fIcon4 = data.list[4].weather[0].icon;
        var $fIcon5 = data.list[5].weather[0].icon;
        var $fIcon6 = data.list[6].weather[0].icon;
        
        var $fData1 = data.list[1].weather[0].main;
        var $fData2 = data.list[2].weather[0].main;
        var $fData3 = data.list[3].weather[0].main;
        var $fData4 = data.list[4].weather[0].main;
        var $fData5 = data.list[5].weather[0].main;
        var $fData6 = data.list[6].weather[0].main;
        
        $('.cTemp').prepend($cTemp);
        $('.chum').append($chum).append($('.per'));
        $('.cwind').append($cwind).append($('persec'));
        $('.cicon').append('<img src="http://openweathermap.org/img/w/' + $wIcon + '.png" style="width:100px; height:100px;">').append($wData);
        
        $('.fIcon1').append('<img src="http://openweathermap.org/img/w/' + $fIcon1 + '.png" style="width:100px; height:100px;">')
        $('.fIcon2').append('<img src="http://openweathermap.org/img/w/' + $fIcon2 + '.png" style="width:100px; height:100px;">')
        $('.fIcon3').append('<img src="http://openweathermap.org/img/w/' + $fIcon3 + '.png" style="width:100px; height:100px;">')
        $('.fIcon4').append('<img src="http://openweathermap.org/img/w/' + $fIcon4 + '.png" style="width:100px; height:100px;">')
        $('.fIcon5').append('<img src="http://openweathermap.org/img/w/' + $fIcon5 + '.png" style="width:100px; height:100px;">')
        $('.fIcon6').append('<img src="http://openweathermap.org/img/w/' + $fIcon6 + '.png" style="width:100px; height:100px;">')
        
        $('.fData1').append($fData1);
        $('.fData2').append($fData2);
        $('.fData3').append($fData3);
        $('.fData4').append($fData4);
        $('.fData5').append($fData5);
        $('.fData6').append($fData6);
        
        let today = new Date();   

        let year = today.getFullYear(); // 년도
        let month = today.getMonth() + 1;  // 월
        let date = today.getDate();  // 날짜
        
        var cnt = 1;
        $(".fData").each(function(){
        	date++;
        	$(".fData" + cnt).prepend(year + '-' + month + '-' + date);
        	cnt++;
        }); 
        	
        console.log(cTemp);
        var memberNo = <%= m.getMemberNo() %>;
        $.ajax ({
        	url:"recommend.look",
        	data : {cTemp : cTemp, memberNo : memberNo},
        	type:"get",
    		dataType: "json",
    		success:function(result){
    			console.log("성공");	
    			console.log(result);
    			console.log(result.up);
    			console.log(result.down);
    			console.log(result.ac);
    			var ran1 = parseInt(result.up.length * Math.random());
    			var ran2 = parseInt(result.down.length * Math.random());
    			var ran3 = parseInt(result.ac.length * Math.random());
    			console.log(ran1);
    			console.log(ran2);
    			console.log(ran3);
    			document.getElementById( 'recommend1' ).setAttribute('src', 'resources/images/closet/' + result.up[ran1].typeCode  + '.png')
    			document.getElementById( 'recommend2' ).setAttribute('src', 'resources/images/closet/' + result.down[ran2].typeCode  + '.png')
    			document.getElementById( 'recommend3' ).setAttribute('src', 'resources/images/closet/' + result.ac[ran3].typeCode  + '.png')
    			
    		},
    		error:function() {
    			console.log("ajax 연동실패");
    		}
        });
      });
    	
      
    </script>
</head>
<body>
 	<%@ include file="menubar.jsp" %>
<br><br><br>
<section>
  <div class="mainArea">
    <div class="mainImgArea">
        <img class="mainImg mainImg1" src="<%= contextPath %>/resources/images/main/<%= ran %>.jpg">
    </div>  
    <div class="weatherArea">
          <div class="forecast">
            <div class="cicon"></div>
            <label>TEMP : </label> <label class="cTemp"> &deg;C</label>
            <br><br>
            <label class="chum">HUM : </label> <label>%</label>
            <br><br>
            <label class="cwind">WIND : </label> <label>m/s</label>
        </div>
    </div>
  </div>
  <br><br><br>
  <div class="middleArea">
    <div class="subImg subImg1" onclick="goStyle();">
        <div class="card" style="width: 100%; height: 100%; border:0px;">
        	<p style="text-align:center; font-size:20px; font-family: 'Fugaz One', cursive; margin:0;">BEST</p>
            <img src="<%= contextPath %>/resources/images/board/<%= board.getArticleNo() %>.jpg" class="card-img-top" style="width:80%; height:50%; margin:auto;">
            <div class="card-body" style="width:80%; height:50%; margin:auto;">
                <h5 class="card-title" style="font-family: 'Paytone One', sans-serif; font-size:30px; font-style: italic;">#OOTD</h5>
                <p class="card-text" style="font-family: 'Do Hyeon', sans-serif; font-size:30px; font-style: italic;"><%= board.getArticleContents() %></p>
                <p style="font-family: 'Paytone One', sans-serif; font-size:15px; font-style: italic;"> &hearts; &nbsp; <%= board.getArticleLikes() %> </p>
            </div>
        </div>
    </div>
    <div class="subImg subImg2" onclick="goMyCloset();">
        <div class="card" style="width: 100%; height:100%; border:0px; float:left;">
        	<p style="text-align:center; font-size:20px; font-family: 'Fugaz One', cursive; margin:0;">RECOMMEND</p>
			<div class="closet" style="width:80%; height:50%; margin:auto;">
				<img class="card-img-top" id="recommend1" style="width:50%; height:50%;">
            	<img class="card-img-top" id="recommend2" style="width:50%; height:50%;">
            	<img class="card-img-top" id="recommend3" style="width:40%; height:50%;">  
			</div>	     
            <div class="card-body" style="width:80%; height:50%; margin:auto;">
                <h5 class="card-title" style="font-family: 'Paytone One', sans-serif; font-size:30px; font-style: italic;">TODAY RECOMMEND</h5>
                <p class="card-text" style="font-family: 'Do Hyeon', sans-serif; font-size:20px; font-style: italic;">오늘같은 날씨에 이런 옷 어떠세요?</p>
            </div>
        </div>
    </div>
    <div class="subImg subImg3">
        <div class="card" style="width: 100%; height:100%; border:0px;">
    	<p style="text-align:center; font-size:20px; font-family: 'Fugaz One', cursive; margin:0;">FORECAST</p>
        	<div class="forecastArea" style="width:80%; height:50%; margin:auto;">
        		<div class="forecastIcon">
        			<div class="fIcon fIcon1"></div>
        			<div class="fIcon fIcon2"></div>
        			<div class="fIcon fIcon3"></div>
        			<div class="fIcon fIcon4"></div>
        			<div class="fIcon fIcon5"></div>
        			<div class="fIcon fIcon6"></div>
        		</div>
        	</div>
            <div class="card-body" style="font-family: 'Fugaz One', cursive; width:80%; height:50%; margin:auto; padding:0;">
            	<div class="fData fData1"><br></div>
            	<div class="fData fData2"><br></div>
            	<div class="fData fData3"><br></div>
            	<div class="fData fData4"><br></div>
            	<div class="fData fData5"><br></div>
            	<div class="fData fData6"><br></div>
            </div>
        </div>
    </div>
  </div>
  <br><br><br>
  <div class="styleImgArea">
     <div class="fotorama" data-fit="contain" data-arrows="false" data-width="100%" 
     		data-height="80%" data-ratio="4/3" data-autoplay="5000" onclick="goEvent();">
        <img src="<%= contextPath %>/resources/images/banner/styleshare.jpg">
        <img src="<%= contextPath %>/resources/images/banner/musinsa.jpg">
        <img src="<%= contextPath %>/resources/images/banner/styleshare1.jpg">
        <img src="<%= contextPath %>/resources/images/banner/musinsa1.jpg">
      </div>
   </div>
</section>
<br><br>
<footer class="copyRight">
  <p>Copyright 2019. LOOKSOFINE.  All right reserved.</p>
</footer>
<script>
function goStyle() {
	location.href="<%= contextPath %>/boardlist.look";
}

function goFavorite() {
	location.href="<%= contextPath %>/wishlist.look";
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

function goMyCloset() {
	location.href = "<%= contextPath %>/closet.look";
}


</script>
</body>
</html>