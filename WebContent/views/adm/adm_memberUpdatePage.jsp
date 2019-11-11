<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member member = (Member)request.getAttribute("member");

	//세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보수정 : LOOK SO FINE</title>
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
          position:fix ed;
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
      
      .list:hover {
          cursor: pointer;
          font-weight: 700;
      }
      
      .sublist {
          padding: 10px;
      }

      ul.category li a {
          margin:auto;
          color: black;
          font-family: 'Do Hyeon', sans-serif; 
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
          height: 2300px;
          float: left;
          display : block;
      }

      #content_title {
          /* font-family: 'Do Hyeon', sans-serif;  */
          font-weight : 700;
          font-family : 'Noto Serif KR', serif;
          font-size: 40px; 
          margin : 0;
      }

      #content_title_wrapper {
          margin : 0 auto;
      }

      hr {
          margin : 0;
      }
      
      table {
      	font-family : 'Noto Serif KR', serif;
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
            <li class="list" onclick="goMember();">회원관리</li>
            <li class="list" onclick="goBoard();">게시물관리</li>
            <li class="list" onclick="goShop();">제휴쇼핑몰관리</li>
            <li class="list" onclick="goQnA();">문의사항관리</li>       
        </ul>
    </div>
    <script>
    	// SUB-NAVI
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
    	
    	// MAIN NAVIBAR
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
        <div id="content_title_wrapper">
            <h2 id="content_title"> &nbsp;&nbsp;회원 정보 수정 페이지</h2>
        </div>
        <hr>
        
        <div class="shop_update_box">
            <h4 class="shop_update_title">정보 수정</h4>
            <br>
            <form class="date_box" action="<%= contextPath %>/update.member" method="post">    
              	
              	<table>
              			<tr>
              				<th>회원번호</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getMemberNo() %>"></td>
						</tr>
						<tr>
              				<th>아이디</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getMemberId() %>"></td>
              			</tr>
              			<tr>	
              				<th>닉네임</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getMemberNick() %>"></td>
              			</tr>
              			<tr>	
              				<th>성별</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getGender() %>"></td>
              			</tr>
              			<tr>	
              				<th>등급</th>
              				<%-- <td><input type="text" size="50" name="memberNo" value="<%= member.getGradeCode() %>"></td> --%>
              				<select>
              					<option value='S'>S</option>
              					<option value='A'>A</option>
              					<option value='B'>B</option>
              					<option value='C'>C</option>
              					<option value='D'>D</option>
              				</select> 
              			</tr>
              			<tr>	
              				<th>출생년도</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getBirthYear() %>"></td>
              			</tr>
              			<tr>	
              				<th>선호스타일</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getLikeStyle() %>"></td>
              			</tr>
              			<tr>	
              				<th>가입날짜</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getEntryDate() %>"></td>
              			</tr>		
              			<tr>
              				<th>현황</th>
              				<td><input type="text" size="50" name="memberNo" value="<%= member.getMemberStatus() %>"></td>
              			</tr>
              	</table>
               	<div align="center">
            		<button id="updateBtn" type="submit" style="display:inline-block;">저장하기</button>
            		<button type="button" onclick="location.href='<%= contextPath %>/member.adm">취소하기</button>
            	</div>
            </form>
        </div> 	
</body>
</html>