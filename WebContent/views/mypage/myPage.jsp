<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" %>
<% 
	//세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
    String gradeCode = m.getGradeCode();
    
    String[] styleArr = m.getLikeStyle().split(",");
    int i = 0;

    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK SO FINE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<style>
	body {
		background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
	}
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
            font-family: 'Do Hyeon', sans-serif;
            width: 65%;
            float: left;
        }

        .menu {
            font-family: 'Do Hyeon', sans-serif;
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
          border-radius: 10px;
          margin: auto;
          width: 450px;
          height: 150px;
        }

        .nickname {
            margin: auto;
            width: 65%;
            height: 100%; 
            float: left;
            padding-top: 20px;
            text-align: center;

        }
        .profilepic {
            float: right;
            margin: 5px 5px 0 0;
            width: 130px;
            height: 130px;
            border-radius: 10px;
        }


        button.mytype {
        margin: auto;
          width: 70px;
          height: 40px;
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

        .article {
            float: left;
            width: 49%;
            /* border: 1px solid black; */
        }

        .article .favoritestyle {
            width: 100%;
            height: 550px;
            background-color: lightgray;
            border-radius: 10px;
        }
        .favorite {
            height: 30%;
            /* border: 1px solid black; */
        }

        .article .myboard {
            height: 250px;
        }
        .article .myqna {
            height: 250px;
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
    <!-- 좌측 네비바 -->
    <div class="menu">
            <ul class="category">
                <li class="list" onclick="goMyCloset();">나의 옷장</li>
                <li class="list" onclick="goMyList();">내 게시물 관리</li>
                <li class="list" onclick="goQna();">FAQ / Q&A</li>
                <li class="list" onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인정보관리</li>
            </ul>
        </div>
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
        function goMyCloset(){
            location.href="<%= contextPath %>/closet.look";
        }
        function goMyList(){
            location.href="<%= contextPath %>/mylist.look";
        }
        function goQna(){
            location.href="<%= contextPath %>/qna.look";
        }
    </script>

    <div class="line"></div>
    <div class="content">
        <h2>Overview</h2>
        <hr>
        <div class="mytype">
        <div class="mytype nickname">
        <% for(i = 0; i < styleArr.length; i++) { %>
            <button class="mytype hashtag" disabled><%= styleArr[i] %></button>
        <% } %> 스타일을 즐기는 <br><br>
        <b><%= m.getMemberNick() %></b> 님의 페이지입니다. &nbsp; &nbsp; 
    </div>
    <div class="mytype profilepic"> 
    <img class="profilepic" src="<%= contextPath %>/resources/images/profile/<%= m.getMemberNo() %>.jpg">
    </div>  
    </div>
    <br><br>

    <div class="article left">
        <h4 align="center">선호스타일</h4>
    <article class="favoritestyle">
    <div class="favorite top">

    </div>
    <hr>

    <div class="favorite bottom">

    </div>
    <hr>
    <div class="favorite acc">


    </div>
    </article>
    <script>
        $(function(){
        $.ajax({
            url: "<%= contextPath %>/closet.look",
            type: "POST", 
            data: {likestatus : "Y"},
            dataType: "json",
            success: function(result){
                console.log(result);
                var i = 0;
                var top = $(".favorite top").html();
                var bottom = $(".favorite .bottom").html();
                var acc = $(".favorite .acc").html();
                top += "아휴!";

            },
            error: function() {
                console.log("ajax 연동실패");
            }       

        });
        });
    
    </script>
    </div>
    <div class="article right">
            <h4 align="center">내 게시물 관리</h4>
    <article class="myboard">

    </article>
<h4 align="center">나의 Q&A</h4>
    <article class="myqna">

    </article>
   </div>

    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>