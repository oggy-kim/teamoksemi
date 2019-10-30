<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.sql.Date, board.model.vo.*, member.model.vo.*"%>
<%
	// 회원정보 목록 
	ArrayList<Member> mlist = (ArrayList<Member>)request.getAttribute("mlist");
	
	// 회원 상세정보 
	Member m = (Member)session.getAttribute("loginUser");

	String profile = m.getProfile(); // 프로필사진
	int memberNo = m.getMemberNo(); // 회원번호
	String gradeCode = m.getGradeCode(); // 회원등급코드
	String memberId = m.getMemberId(); // 회원아이디
	String memberNick = m.getMemberNick(); // 회원닉네임
    String gender = m.getGender(); // 회원성별
    
    String likeStyle = m.getLikeStyle(); // 선호스타일
    int birthYear = m.getBirthYear(); // 연령
    Date entryDate = m.getEntryDate(); // 가입날짜
    String memberStatus = m.getMemberStatus(); // 탈퇴여부
    // 최근접속일 아직 처리 안함 (중간점검 이후 -> 장기미접속 회원은 강등회원으로 처리)
    
    // 회원 상세정보 박스 내, 회원 작성글 조회
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    
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
    <title>회원관리 : LOOK SO FINE</title>
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


         /* -------------------- member -------------------- */


         /* -------------sorting_box------------- */

        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }
  
        /* ---------------------------------- */

        .member_box {
            width : 80%;
            height : 25%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }


		#member_detail {
			display : none;
		}

        .member_detail_box {
            width : 80%;
            height : 40%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        /* .table {
            text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
        } */
        
        #member_table, #member_board_table{
       		text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
        }

         .table_title, .member_detail_title { /* 회원 정보 목록, 회원 정보 */
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        #member_detail_wrapper {
            width : 95%;
            height : 25%;
            margin : 5% auto;
        }

        .member_profile_box {
            width : 20%;
            height : 100%;
            display : inline-block;
            border : 1px solid black;
            margin : 0 3%;
        }

        #member_photo_wrapper {
            margin : 5%;
            float : left;
            width : 90%;
            height : 90%;
        }

        #member_photo {
            width : 100%;
            height : 100%;
        }

        .member_detail_1, .member_detail_2 {
            width : 30%;
            height : 100%;
            margin : 0 1%;
            display : inline-block;
        }

        #member_detail_table_1, #member_detail_table_2 {
            height : 100%;
            width : 100%;
        }

        #caption {
            caption-side:top;
            font-size:15px;
            color : black;
        }

        .member_detail_table td {
            padding : 0 2% 0 2%;
            border : 1px solid black;
            height : 15%;
        }

        /*-- 등급관리, 회원삭제 버튼 --*/

        #grade_upt_btn, #delete_btn {
            float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
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
        <div>
            <h2 id="content_title">&nbsp;&nbsp;회원관리</h2>
        </div>
        <hr>

        <br>
        <br>
        <div class="member_box">
            <h4 class="table_title">회원 정보 목록</h4>
            <!-- 테이블 정렬 드롭박스 -->
            <div class="sorting_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option value="member_no">회원번호</option>
                    <option value="member_id">아이디</option>
                    <option value="grade">등급</option>
                    <option value="join_date">가입일자</option>
                </select>
            </div>
            <!-- 회원정보리스트 테이블 -->
            <table class="table" id="member_table">
                <tr>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>등급</th>
                    <th>가입일자</th>
                    <th>최근접속일</th>
                </tr>
                <% if(mlist.isEmpty()){ %>
                <tr>
                	<td colspan="6">등록된 회원내역이 없습니다.</td>
                <tr>
                <% } else { %>
                <% for(Member ml : mlist){ %>    
 				<tr>
                    <td><%= ml.getMemberNo() %></td>
                    <td><%= ml.getMemberId() %></td>
                    <td><%= ml.getMemberNick() %></td>
                    <td><%= ml.getGradeCode() %></td>
                    <td><%= ml.getEntryDate() %></td>
                    <td>최근접속일</td>
                </tr>
                <% } %>
                <% } %>   
            </table> 
            <!-- 페이지네이션 -->
        	 <div class="pagingArea" align="center">
               <!-- 맨 처음으로 (<<) -->
               <button onclick="location.href='<%= contextPath %>/member.adm?currentPage=1'"> &lt;&lt; </button>

               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/member.adm?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
               <% } %>

               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/member.adm?currentPage=<%= p %>'"><%= p %></button>
               <% } %>
               <% } %>

               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/member.adm?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
               <% } %>

               <!-- 맨 끝으로 (>>) -->
               <button onclick="location.href='<%= contextPath %>/member.adm?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
           </div> 
            <script>
            	// 회원정보 상세보기
            	$(function(){
            		$("#member_table td").mouseenter(function(){
            			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
            		}).mouseout(function(){
            			$(this).parent().css({"background":"white"});
            		}).click(function(){ // 회원정보 click시, 해당 회원의 상세정보가 하위에 표시
            			var con = document.getElementById("member_detail");
            			if(con.style.display != 'none'){
            				con.style.display = 'none';
            			} else {
            				con.style.display = 'block';
            			}
            		}); 
            	});
            </script>
            <br>

            <div class="searchArea">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option>-----</option>
                    <option value="member_no">회원번호</option>
                    <option value="member_id">아이디</option>
                    <option value="member_nick">닉네임</option>
                </select>
                <input type="search" style="display:inline-block;">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
        </div>

        <br>
        <br>

        <div class="member_detail_box" id="member_detail">
            <h4 class="member_detail_title">회원 상세 정보</h4>
            <section id="member_detail_wrapper">
                <!-- 프로필 사진 -->
                <div class="member_profile_box">
                    <div id="member_photo_wrapper">
                        <img id="member_photo" src="<%= profile %>">
                    </div>
                </div>
                <!-- 회원정보란 1 -->
                <div class="member_detail_1">
                    <table class="table-condensed" id="member_detail_table_1">
                        <tr>
                            <td>회원번호</td>
                            <td><span><%= memberNo %></span></td>
                        </tr>
                        <tr>
                            <td>등급</td>
                            <td><span><%= gradeCode %></span></td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td><span><%= memberId %></span></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td><span><%= memberNick %></span></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td><span><%= gender %></span></td>
                        </tr>
                    </table>
                </div>
                <!-- 회원정보란 2-->
                <div class="member_detail_2">
                    <table class="table-condensed" id="member_detail_table_2">
                        <tr>
                            <td>선호스타일</td>
                            <td><span><%= likeStyle  %></span></td>
                        </tr>
                        <tr>
                            <!-- DB에서 AGE -> BIRTH로 변경해야 함! -->
                            <td>출생년도</td>
                            <td><span><%= birthYear %></span></td>
                        </tr>
                        <tr>
                            <td>가입일자</td>
                            <td><span><%= entryDate %></span></td>
                        </tr>
                        <tr>
                            <!-- 아직 DB에 추가하지 않은 내용! -->
                            <td>최근접속일</td> 
                            <td><span>아직 추가 안함</span></td>
                        </tr>
                        <tr>
                            <td>현황</td>
                            <td><span><%= memberStatus %></span></td>
                        </tr>
                    </table>
                </div>
            </section>
            <!-- 해당 회원의 작성한 게시물 테이블 -->
            <div class="member_detail_3">
                <table class="table" id="member_board_table">
                    <caption id="caption">작성한 게시물</caption>
                    <tr>
                    	<th>번호</th>
                        <th>게시사진</th>
                        <th>게시일자</th>
                        <th>조회수</th>
                        <th>찜수</th>
                        <th>댓글수</th>
                        <th>최근댓글</th>
                    </tr>
                <% if(mlist.isEmpty()){ %>
               		 <tr>
                		<td colspan="5">작성된 게시글이 없습니다.</td>
                	<tr>
                	<% } else { %>
                	<% for(Board b : list){ %>    
 					<tr>
 					<td><%= b.getArticleNo() %></td>
                    <td><img src="<%= contextPath %>/resources/images/board/<%= b.getArticleNo()%>.jpg" idth="80px" height="80px"></td>
                    <td><%= b.getArticleDate() %></td>
                    <td><%= b.getArticleViews() %></td>
                    <td><%= b.getArticleLikes() %></td>
                    <td><%= b.getArticleLikes() %></td> <!-- 댓글수 --> 
                    <td><%= b.getArticleLikes() %></td> <!-- 최근댓글(아직 미구현) -->             
                </tr>
                <% } %>
                <% } %>  
                </table>
                <!-- 페이지네이션 -->
              
      
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>