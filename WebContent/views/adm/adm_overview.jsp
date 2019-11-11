 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자페이지 : LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
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
            padding : 5% 0 0 0;
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
            /* font-family: 'Do Hyeon', sans-serif; */
            font-family: 'Noto Serif KR', serif; 
            font-size: 25px; 
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

		.list:hover {
            cursor: pointer;
            font-weight: 700;
        }

		.overview_image_wrapper {
			height:100%;
			width : 15%; 
			float : left;
		}

		#overview_welcome {
			font-family: 'Noto Serif KR', serif;
			width : 80%;
			height : auto;
			overflow : hidden;
			margin-bottom : 5%;
			cursor : pointer;
			background : black;
			color : white;
		}

		.overview_box {
			font-family: 'Noto Serif KR', serif;
			width : 80%;
			height : auto;
			overflow : hidden;
			/* box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849); */
			margin-bottom : 5%;
			cursor : pointer;
		}
		
		.overview_box:hover {
			border:2px solid black;
		}
		
		.overview_box p {
			font-size : 23px;
			margin-left : 3%;
		}
		
		.overview_box h3 {
			font-weight : 700;
			font-size : 30px;
			margin-left : 3%; 
		}
		
		.overview_contents{
			width:85%; 
			height:100%; 
			display:inline-block;
			/* box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849); */
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
         <!--    <li class="list" onclick="goMember();">회원관리</li>
            <li class="list" onclick="goBoard();">게시물관리</li>
            <li class="list" onclick="goShop();">제휴쇼핑몰관리</li>
            <li class="list" onclick="goQnA();">문의사항관리</li>   -->        
        </ul>
    </div>
    <script>
    	// sub-nav (adm)
    	function goMember(){
    		location.href="<%= contextPath%>/member.adm";
    	}
    	function goBoard(){
    		location.href="<%= contextPath%>/board.adm";
    	}
    	function goShop(){
    		location.href="<%= contextPath%>/shop.adm";
    	}
    	function goQnA(){
    		location.href="<%= contextPath%>/qna.adm";
    	}
    	
    	// main-nav
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
    </script>
    <div class="line"></div>
    <div class="content">
        <div>
            <h2 id="content_title">&nbsp;&nbsp;OVERVIEW</h2>
        </div>
        <hr><br>
         <div id="overview_welcome" onclick="goMypage();">
            <br><h4 class="welcome_message" style='font-weight:700;'>&nbsp;&nbsp;&nbsp;관리자 페이지입니다. 무엇을 도와드릴까요?</h4><br>
        </div> 
        
        <div class="overview_box" onclick="goMember();">
	        <div class="overview_image_wrapper">
	        	<img id="image_member" src="<%= contextPath %>/resources/images/adm/member.png" style="width:100%; height:100%; margin:0; padding:0;">
	        </div>
	        <div class="overview_contents" id="member">
	       		<br><br>
	       		<h3>회원관리</h3><br>
	       		<p>모든 회원들의 정보를 조회하고, 수정하거나 삭제 할 수 있습니다.</p>
	        </div>
        </div>	
        	
        <div class="overview_box" onclick="goBoard();">	
       		<div class="overview_image_wrapper">
       			<img id="image_board" src="<%= contextPath %>/resources/images/adm/board.png" style="width:100%; height:100%; margin:0; padding:0;">
       		</div>
			<div class="overview_contents" id="board">       		
       			<br><br>
       			<h3 >게시물관리</h3><br>
       			<p>회원들이 올린 게시글들을 조회하고, 게시물이나 댓글을 수정하거나 삭제 할 수 있습니다. </p>
        	</div>
        </div>	
    
    
    	<div class="overview_box" onclick="goShop();">	
       		<div class="overview_image_wrapper">
       			<img id="image_shop" src="<%= contextPath %>/resources/images/adm/shop.png" style="width:100%; height:100%; margin:0; padding:0;">
       		</div>
			<div class="overview_contents" id="shop">
	       		<br><br>
    	   		<h3>제휴쇼핑몰관리</h3><br>
       			<p>당사와 제휴를 맺은 쇼핑몰들의 정보를 조회하고, 수정하거나 삭제 할 수 있습니다. </p>
 			</div>	
 		</div>
 		
 		<div class="overview_box" onclick="goQnA();">	
       		<div class="overview_image_wrapper">
       			<img id="image_qna" src="<%= contextPath %>/resources/images/adm/qna.png" style="width:100%; height:100%; margin:0; padding:0;">
       		</div>
			<div class="overview_contents" id="qna">
       			<br><br>
       			<h3 >문의사항관리</h3><br>
       			<p>회원들의 문의 사항을 조회하고, 답변을 달 수 있습니다. </p>
       		</div>       	
		</div>
 
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>