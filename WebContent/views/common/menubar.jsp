<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	//회원 가입 성공 메세지 출력용
	String msg = (String)session.getAttribute("msg");
	
	//request.getContextPath() 변수화
	String contextPath = request.getContextPath();
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
    <form class="form-inline" action="<%= contextPath %>/search">
      <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="SEARCH" aria-label="SEARCH" style="font-family: 'Do Hyeon', sans-serif; font-style: italic;">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="background:black; text-decoration: none; border: 1px solid white;">SEARCH</button>
      <button type="button" class="btn btn-light" style="font-family: 'Do Hyeon', sans-serif;" onclick="logout();"><img src="<%= contextPath %>/resources/images/logout.png" width="23" height="23"></button>
    </form>
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
	
	function validate(){
	if($("#userId").val().trim().length==0){
		alert("이메일를 입력하세요");
		$("#userId").select();
		return false;
	}
	
	if($("#userPwd").val().trim().length==0){
		alert("비밀번호를 입력하세요");
		$("#userPwd").select();
		return false;
	}
	
	return true;
	// 여기까지 작성 했으면 LoginServlet 만들러 가기 ~!!
}
	function goMain() {
		location.href="<%= contextPath %>";
	}
	
	function logout(){
		location.href = '<%= request.getContextPath() %>/logout.me';
	}
</script>

</body>
</html>