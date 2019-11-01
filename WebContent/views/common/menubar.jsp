<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	//회원 가입 성공 메세지 출력용
	String msg = (String)session.getAttribute("msg");
	
	//request.getContextPath() 변수화
	String contextPath = request.getContextPath();
  
	//2_1_1. session 객체에 담겨진 loginUser 정보를 변수에 담기
	Member loginUser = (Member) session.getAttribute("loginUser");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- font -->
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
          font-weight:bold;
          cursor:pointer;
          text-decoration:underline;
        }
        
        .navbar a:hover {
        	cursor:pointer;
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
        
        .btn-light {
        	background:white;
        	margin:0 0 0 10px;
        }
        
         
    </style>
    <script>
    	var msg = "<%= msg %>";
		$(function(){
			if(msg != "null"){
				alert(msg);
				<% session.removeAttribute("msg"); %>
			}
		});
    </script>
</head>
<body>
<header>
  <nav class="navbar navbar-dark bg-dark" id="navbar">
    <a class="navbar-brand" style="font-size : 28px;" onclick="goMain();">LOOK SO FINE</a>
    <%if (loginUser != null) {%>
      <form class="form-inline" action="<%= contextPath %>/search.look">
      <input class="form-control mr-sm-2" id="keyword" name="keyword" type="search" placeholder="SEARCH" aria-label="SEARCH" style="font-family: 'Do Hyeon', sans-serif; font-style: italic;">
      <button class="btn btn-outline-success" id="search" my-2 my-sm-0" type="submit" style="background:black; text-decoration: none; color:white; border: 1px solid white;" disabled>SEARCH</button>
      <button type="button" class="btn btn-light" onclick="logout();"><img src="<%= contextPath %>/resources/images/logout.png" width="23" height="23"></button>
    </form>
    <% } %>
  </nav>
  <nav style="padding:60px 0;">
      <ul class="nav justify-content-center" id="category">
        <li class="nav-item">
          <p class="nav-link" style="color: #000;" onclick="goStyle();">STYLE</p>
        </li>
        <li class="nav-item">
          <p class="nav-link" style="color: #000;" onclick="goFavorite();">FAVORITE</p>
        </li>
        <li class="nav-item">
          <p class="nav-link" style="color: #000;" onclick="goEvent();">EVENT</p>
        </li>
        <li class="nav-item">
          <p class="nav-link" style="color: #000;" onclick="goMypage();">MY PAGE</p>
        </li>
      </ul>
    </nav>
</header>
<script>
	
	function goMain() {
		location.href="<%= contextPath %>";
	}
	
	function logout(){
		location.href = '<%= request.getContextPath() %>/logout.me';
	}

	$(function(){
		$("#keyword").change(function(){
			if($("#keyword").val() != "") {
				$("#search").attr('disabled', false);
			} else {
				$("#search").attr('disabled', true);
				$("#search").css('color', 'white');
			}
		}); 		
	});

	
</script>

</body>
</html>