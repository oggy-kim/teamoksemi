<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, shop.model.vo.Shop"%>
<% 
	// Shop 목록
	ArrayList<Shop> list = (ArrayList<Shop>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제휴쇼핑몰관리 : LOOK SO FINE</title>
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

        /* ----------------- shop ------------------------ */

        /* -------------sorting_box------------- */

        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }

     
        
        /* ---------------------------------- */


        .sales_box {
            width : 80%;
            height : 15%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        } 

        .date_box {
            width : 80%;
            height : 15%;
            margin-left : 5%;
        }

        .profit_detail_wrapper {
            height : 45%;
            width : 100%;
            margin-top : 2%;
        }

        #vertical_line {
            width: 2%;
            display : inline-block;
            border-left: 2px solid black;
            height: 100px;
        }

        #sales_num{
            display : inline-block;
            width : 15%;
            height : 100%;
            margin : 2% 2% 0 5%;
        } 
        
        #profit_num {
            display : inline-block;
            width : 60%;
            height : 100%;
            margin : 2% 2% 0 2%;
        }

        .shop_box {
            width : 80%;
            height : 23%;
            margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

		#shop_table {
			text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
		}

        .table {
            text-align : center;
            width : 85%;
            margin : 1% 0 0 5%;
            font-size : 15px;
        }

        .box_title, .table_title { /* 수익 및 거래총량 /제휴 쇼핑몰 리스트 제목 */
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        .board_detail {
            width : 80%;
            height : 20%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .board_detail_title {
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        #update_btn, #delete_btn {
            float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }

        /* -------search--------- */

        .searchArea {
            width:30%;
            margin-left:35%;
        } 
        
        #searchBtn{
            height:30px;
            width:80px;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }
        #searchBtn:hover {
            cursor:pointer;
        }

        /* --------------- */

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
            <li class="list" onclick="goGA();">구글애널리틱스(예정)</li>            
        </ul>
    </div>
    <script>
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
    	function goGA(){
    		location.href="<%= contextPath%>/ga.adm";
    	}
    </script>
    <div class="line"></div>
    <div class="content">
        <div id="content_title_wrapper">
            <h2 id="content_title"> &nbsp;&nbsp;제휴쇼핑몰관리</h2>
        </div>
        <hr><br>

        <div class="sales_box">
            <h4 class="box_title">수익 및 거래총량</h4>
            <br>
            <!-- 날짜 조회 탭 -->
            <div class="date_box">    
                <input type="date" name="start_date" id="start_date">
                <input type="date" name="end_date" id="end_date">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            <!-- 가로 구분선 -->
            <hr id="horizon_line" style="width:85%; margin-left:5%;">
            <!-- 거래수 / 수익 -->
            <div class="profit_detail_wrapper">
                <div class="profit_detail" id="sales_num">
                    <a class="profit_detail_title" style=" font-size:25px;">거래수</a>
                    <p style="font-size:75px; text-align:left;" >100</p>
                </div>
                <div id="vertical_line"></div>
                <div class="profit_detail" id="profit_num">
                    <a class="profit_detail_title" style="font-size:25px;">수익</a>
                    <p style="font-size:75px; text-align:left;">KRW00,000,000</p>
                </div>
            </div>
            
        </div> 
        <br>
        <br>

        <div class="shop_box">
            <h4 class="table_title">제휴 쇼핑몰 리스트</h4>
            <div class="sorting_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option value="cont_status">계약상태</option>
                    <option value="cont_money">계약금</option>
                </select>
            </div>
            <!-- 제휴 쇼핑몰 리스트 테이블 -->
            <table class="table" id="shop_table">
                <tr>
                    <th>회사번호</th>
                    <th>회사명</th>
                    <th>계약상태</th>
                    <th>등급</th>
                    <th>계약시작일</th>
                    <th>계약만료일</th>
                    <th>계약금</th>
                    <th>연락처</th>
                </tr>
                  <% if(list.isEmpty()){ %>
               		 <tr>
                		<td colspan="5">작성된 게시글이 없습니다.</td>
                	<tr>
                	<% } else { %>
                	<% for(Shop s : list){ %>    
 					<tr>
 					<td><%= s.getShopNo() %></td>
                    <td><%= s.getShopName() %></td>
                    <td><%= s.getStatus() %></td>
                    <td><%= s.getShopGradeCode() %></td>
                    <td><%= s.getContractDate() %></td>
                    <td><%= s.getExpireDate() %></td>
                    <td><%= s.getContractMoney() %></td>
                    <td><%= s.getShopContact() %></td>
                </tr>
                <% } %>
                <% } %>  
            </table>
            <br>
            <!-- 페이지네이션 -->
             <div class="pagingArea" align="center">
               <!-- 맨 처음으로 (<<) -->
               <button onclick="location.href='<%= contextPath %>/.shop?currentPage=1'"> &lt;&lt; </button>

               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
               <% } %>

               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= p %>'"><%= p %></button>
               <% } %>
               <% } %>

               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
               <% } %>

               <!-- 맨 끝으로 (>>) -->
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
          	 </div>
          	 <br>
            <!-- 검색옵션, 검색버튼 -->
            <div class="searchArea">
                <input type="search" style="display:inline-block;">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            <br>
            <!-- 수정, 삭제버튼-->
            <button type="button" id="delete_btn" style="margin-right:5%;">쇼핑몰삭제</button>    
            <button type="button" id="update_btn" style="margin-right:2%;">쇼핑몰수정</button>

        </div>
        <br> 

    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>