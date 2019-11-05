<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>
<% 
	// QNA 목록
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
	// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
 	Member m = (Member)session.getAttribute("loginUser");
 	String gradeCode = m.getGradeCode();
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의사항관리 : LOOK SO FINE</title>
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
            height: 2800px;
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

        /* -----------------  qna & qna_detail ------------------------ */

        

        /* -------------sorting_box------------- */

        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }
        
        /* ---------------------------------- */


        .qna_box {
            width : 80%;
            height : 18%;

            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

		#qna_table {
			text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
		}

        .qna_detail_box {
            width : 80%;
            height : 25%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .table {
            text-align : center;
            width : 85%;
            margin : 1% 0 0 5%;
            font-size : 15px;
        }

        .qna_title, .qna_detail_title { /*  qna 제목 */
            margin-top : 3%;
            margin-left : 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 

        }

  /* -------search--------- */


        .searchArea {
            width:60%;
            margin-left:30%;
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
    	function goGA(){
    		location.href="<%= contextPath%>/ga.adm";
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
            <h2 id="content_title"> &nbsp;&nbsp;문의사항 관리</h2>
        </div>
        <hr>
        <br>
    
        <div class="qna_box">
            <h4 class="qna_title">QnA</h4>
            <!-- 테이블 정렬 버튼 -->
            <div class="sorting_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option value="write_date">작성일</option>
                    <option value="comment_status">답변여부</option>
                </select>
            </div>
            <!-- QnA 리스트 테이블 -->
            <table class="table" id="qna_table">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변여부</th>
                </tr>
                <% if(list.isEmpty()){ %>
               		 <tr>
                		<td colspan="5">작성된 게시글이 없습니다.</td>
                	<tr>
                	<% } else { %>
                	<% for(QnA q : list){ %>    
 					<tr>
 					<td><%= q.getQnaNo() %></td>
                    <td><%= q.getQnaTitle() %></td>
                    <td><%= q.getMemberNick() %></td>
                    <td><%= q.getEnrollDate() %></td>
                    <td><%= q.getAnswerStatus() %></td>
                </tr>
                <% } %>
                <% } %>  
            </table>
            <br>
            <!-- 페이지네이션 -->
             <div class="pagingArea" align="center">
               <!-- 맨 처음으로 (<<) -->
               <button onclick="location.href='<%= contextPath %>/qna.adm?currentPage=1'"> &lt;&lt; </button>

               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/qna.adm?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
               <% } %>

               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/qna.adm?currentPage=<%= p %>'"><%= p %></button>
               <% } %>
               <% } %>

               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/qna.adm?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
               <% } %>

               <!-- 맨 끝으로 (>>) -->
               <button onclick="location.href='<%= contextPath %>/qna.adm?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
          	 </div>
			<br>
            <div class="searchArea">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option>-----</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="search" style="display:inline-block;">
             <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>

        </div>
        <br> 
        <script>
        // QNA 상세보기
            	$(function(){
            		$("#qna_table td").mouseenter(function(){
            			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
            		}).mouseout(function(){
            			$(this).parent().css({"background":"white"});
            		}).click(function(){ // QNA click시, 해당 QNA 상세정보가 하위에 표시
            			var con = document.getElementById("qna_detail");
            			if(con.style.display != 'none'){
            				con.style.display = 'none';
            			} else {
            				con.style.display = 'block';
            			}
            		}); 
            	});
        </script>

        <div class="qna_detail_box" id="qna_detail">
            <h4 class="qna_detail_title">QnA 상세보기</h4>
            
            

         
        </div>

</div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>