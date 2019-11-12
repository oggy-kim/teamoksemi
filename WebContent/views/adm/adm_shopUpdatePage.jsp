<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shop.model.vo.Shop"%>
<% 
	Shop shop = (Shop)request.getAttribute("shop");

	//세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴쇼핑몰 정보수정 : LOOK SO FINE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<style>

      body {
        width : 100%;
        height : 1600px;
         background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
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

      ul.category li {
          margin:auto;
          color: black;
          font-family: 'Do Hyeon', sans-serif; 
          font-size: 30px; 
      }

      ul.category li:hover {
          /* font-weight: bold; */
          text-decoration : underline;
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
      
      table.sortable th {
      		vertical-align : middle;
		    background-color:#eee;
		    color:#666666;
		    font-weight: bold;
		    cursor: default;
		}
      
      .shop_update_box {
      		background : white;
      		width : 45%;
        	height : 35%;
        	margin-top : 5%;
        	margin-left : 5%;
        	box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
      }
      
      .shop_update_title {
            margin : 5% 0 0 5%;
            padding : 5% 0 0 0;
            /* font-family: 'Do Hyeon', sans-serif; */
            font-family : 'Noto Serif KR', serif;
            font-weight : 700; 
            font-size: 28px; 
       }
       
       .content_box {
       		margin-left : 5%;
       } 
       
       #updateBtn, #cancelBtn {
       		font-family : 'Noto Serif KR', serif;
			float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
            margin-right : 5%;
		}
		
		.btnArea {
			margin-right : 15%;
			margin-top : 3%;
			margin-botton : 10%;
			width : 50%;
			/* border : 1px solid black; */
			float : right;
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
            <h2 id="content_title"> &nbsp;&nbsp;쇼핑몰 정보수정 페이지</h2>
        </div>
        <hr>
        
        <div class="shop_update_box">
            <h4 class="shop_update_title">정보 수정</h4>
            <br>
            <form class="content_box" action="<%= contextPath %>/update.shop" method="post">    
              	
              	<table class='sortable table' style="font-family : 'Noto Serif KR', serif; width:90%; margin-top:3%;">
              			<tr>
              				<th>회사번호</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="shopNo" value="<%= shop.getShopNo() %>"></td>
						</tr>
						<tr>
              				<th>회사명</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="shopName" value="<%= shop.getShopName() %>"></td>
              			</tr>
              			<tr>	
              				<th>계약상태</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="status" value="<%= shop.getStatus() %>"></td>
              			</tr>
              			<tr>	
              				<th>등급</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="shopGradeCode" value="<%= shop.getShopGradeCode() %>"></td>
              			</tr>
              			<tr>	
              				<th>계약시작일</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="contractDate" value="<%= shop.getContractDate() %>"></td>
              			</tr>
              			<tr>	
              				<th>계약만료일</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="expireDate" value="<%= shop.getExpireDate() %>"></td>
              			</tr>
              			<tr>	
              				<th>계약금</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="contractMoney" value="<%= shop.getContractMoney() %>"></td>
              			</tr>
              			<%-- <tr>	
              				<th>담당자</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="shopPIC" value="<%= shop.getShopPIC() %>"></td>
              			</tr> --%>		
              			<tr>
              				<th>연락처</th>
              				<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="30" name="shopContact" value="<%= shop.getShopContact() %>"></td>
              			</tr>
              	</table>
               	<div class='btnArea' align="center">
            		<button id="updateBtn" type="submit" style="display:inline-block;">저장하기</button>
            		<button id="cancelBtn" type="button" onclick="goBack();">취소하기</button>
            	</div>
            </form>
        </div> 	
        
        <script>
        	function goBack() {
        		window.history.go(-1);
        	}
        </script>
</body>
</html>