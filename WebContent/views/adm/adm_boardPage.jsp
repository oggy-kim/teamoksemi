<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<% 
	// Board 목록
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
    <title>게시물관리 : LOOK SO FINE</title>
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

        ul.category li {
            margin:auto;
            color: black;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 30px; 
        }

        ul.category li:hover {
            text-decoration: underline;
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

        /* ----------------- board ---------------- */

		table {
			text-align : center;
			vertical-align : middle;
		}
		
		table.sortable thead {
		    background-color:#eee;
		    color:#666666;
		    font-weight: bold;
		    cursor: default;
		}

        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }
        
        /* -- 인기 게시글 조회기간 설정 -- */
        
        .date_box {
            width : 80%;
            height : 10%;
            margin-left : 5%;
        }

        /* .trend_box {
            width : 80%;
            height : 20%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        } */

        .board_box {
            width : 80%;
            height : auto;
        	overflow : hidden;
            margin-left : 5%;
            margin-top : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }
                
        #trend_table {
        	text-align : center;
            width : 85%;
            margin : 1% 0 0 5%;
            font-size : 15px;
        }
        
        #board_table {
        	text-align : center;
        	width : 85%;
        	margin : 1% 0 0 5%;
        	font-size : 15px;	
        } 

        .table_title { 
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        .board_detail_box {
        	visibility : hidden;
        	width : 80%;
        	height : 25%;
        	margin-left : 5%;
        	box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .board_detail_title {
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

		.board_detail_contents {
			float : left;
			width : 42%;
			height : 60%;
			margin-top : 2%;
			margin-left : 5%;
			border : 1px solid black;
			font-size : 15px;
			display:inline-block;	
		}

		#delete_board_btn, #delete_comment_btn {
			float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
		}
		
		.btnArea {
			margin-right : 5%;
			margin-top : 3%;
			margin-botton : 10%;
			width : 25%;
			/* border : 1px solid black; */
			float : right;
		}


        /* --------------search------------ */

        .searchArea {
            width:60%;
            margin-left:30%;
            margin-bottom:5%;
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
            <h2 id="content_title"> &nbsp;&nbsp;게시물관리</h2>
        </div>
        <hr><br>

        <!-- <div class="trend_box">
            <h4 class="table_title">실시간 인기 게시물</h4>
            <br>
            인기 게시물 조회기간 설정
            <div class="date_box">
                <select id="searchCondition1" name="searchCondition" style="display:inline-block;">
                    <option>-----</option>
                    <option value="trend_title">조회수</option>
                    <option value="trend_content">찜갯수</option>
                    <option value="trend_writer">댓글수</option>
                </select>    
                <input type="date" name="start_date" id="start_date">
                <input type="date" name="end_date" id="end_date">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            인기 게시물 테이블
            <table class="sortable table" id="trend_table" class="sortable">
            <thead>
                <tr>
                    <th>순위</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>찜갯수</th>
                    <th>조회수</th>
                    <th>댓글수</th>
                </tr>
               </thead>
               <tbody>
                <tr>
                    <td>1</td>
                    <td>아직</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>구현</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>안</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>했</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>음</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
               </tbody>
            </table>
        </div> 
        <br>
        <br> -->

        <div class="board_box">
            <h4 class="table_title">게시물 모아보기</h4>
            <p style="margin-left:5%;">상세보기를 원하는 게시물을 클릭하면, 하단에 해당하는 게시글의 상세정보를 볼 수 있습니다.</p>            
            <div class="sorting_box">
                <select id="sortCondition" name="sortCondition" style="display:inline-block;">
                    <option value="write_date">작성일</option>
                    <option value="like_num">찜갯수</option>
                    <option value="view_num">조회수</option>
                </select>
            </div>
            <!-- 전체 게시글 테이블 -->
            <table class="sortable table" id="board_table">
                <thead id="board_table1">
                <tr>
                    <th>번호</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>찜갯수</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody id="board_table2">
                <% if(list.isEmpty()){ %>
               		<tr>
                		<td colspan="6">작성된 게시글이 없습니다.</td>
                	<tr>
                	<% } else { %>
                	<% for(Board b : list){ %>    
 					<tr>
	 					<td id="aNo"><%= b.getArticleNo() %></td>
	                    <td><%= b.getMemberNick() %></td>
	                    <td><%= b.getArticleContents() %></td>
	                    <td><%= b.getArticleDate() %></td>
	                    <td><%= b.getArticleLikes() %></td>
	                    <td><%= b.getArticleViews() %></td>
                	</tr>
                <% } %>
                <% } %>
                </tbody>
            </table>
            <br>
            <!-- 페이지네이션 -->
             <div class="pagingArea" align="center">
               <!-- 맨 처음으로 (<<) -->
               <button onclick="location.href='<%= contextPath %>/.board?currentPage=1'"> &lt;&lt; </button>

               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/board.adm?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
               <% } %>

               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/board.adm?currentPage=<%= p %>'"><%= p %></button>
               <% } %>
               <% } %>

               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/board.adm?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
               <% } %>

               <!-- 맨 끝으로 (>>) -->
               <button onclick="location.href='<%= contextPath %>/board.adm?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
          	 </div>
            </table>
            <br>
            <div class="searchArea">
                <select id="searchCondition2" name="sort" style="display:inline-block;">
                    <option>-----</option>
                     <option value="contents">내용</option>
                     <option value="writer">작성자</option>
                </select>
                <input type="text" style="display:inline-block;" id="searchKeyword">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
        </div>
        <br> 
        
        <div class="board_detail_box" id="board_detail">
           
             
        </div>
        
		<script>
        // BOARD 상세보기
    		$(function(){ // 동적 대상 function 주기
           		$(document).on('mouseenter', '#board_table2 td', function(){
           			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
           		}).on('mouseout', '#board_table2 td', function(){
           			$(this).parent().css({"background":"white"});
           		});
    		}); 
       
        // 정렬하기
            $("#sortCondition").change(function(){
        		var sort = this.value;
        		console.log(sort);
        		
        		$.ajax({
        			url : "<%= contextPath %>/sortBoard.adm",
        			type : "post",
        			dataType : "json",
        			data : {sort:sort},// key:value 
        			success : function(data){
        				console.log('정렬하기_ajax연동성공');
        				console.log(sort);
        				var $tableBody = $("#board_table2");
        				
        				//$tableBody.empty();
        				$tableBody.html(""); // 테이블 초기화
        			
        				for(var key in data){
              				var $tr = $("<tr>");
							var $noTd = $("<td>").text(data[key].articleNo);
              				var $nickTd = $("<td>").text(data[key].memberNick);
							var $contentTd = $("<td>").text(data[key].articleContents);
							var $dateTd = $("<td>").text(data[key].articleDate);
							var $likeTd = $("<td>").text(data[key].articleLikes);
							var $viewTd = $("<td>").text(data[key].articleViews);	
							
							$tr.append($noTd);
							$tr.append($nickTd);
							$tr.append($nickTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($likeTd);
							$tr.append($viewTd);
							
							$tableBody.append($tr);
        				}
        				
        			},
        			error : function(){
        				console.log('정렬하기_ajax 연동실패');
        			}
        		});
        	});

        // 상세보기
             $(function(){ 
          		$(document).on('click', '#board_table2 td', function(){
          			        	
                      var aNo = $(this).parent().children("#aNo").html();
                      console.log("aNo="+aNo); 
                      
                      $.ajax({
                          url: "<%= contextPath %>/detailBoard.adm",
                          data: {aNo : aNo},
                          type: "get",
                          dataType: "json",
                          success : function(result){ 
          					console.log("상세보기_ajax 연동성공");
             
          					// console.log(result);
          	           		$("#board_detail").css({"visibility":"visible"});

          	           		var detail = "";

          	           		detail += "<h4 class='board_detail_title'>게시물 상세보기</h4>" +
          	           				  "<p style='margin-left:5%;'>선택한 게시물을 상세 조회하고, 해당 게시물을 삭제하거나 게시물의 댓글을 삭제 할 수 있습니다.</p>" +
          	           				  "<div class='board_detail_contents'></div>" +
          	           				  "<div class='board_detail_contents'>" + 
          	           				  "<table class='table' style='width:100%; height:100%;'>" + 
          	           				  "<th colspan='1'>글번호</th><td colspan='1'>" + result.articleNo + "</td><th colspan='1'>닉네임</th><td colspan='1'>" + result.memberNick + "</td></tr>" +
                                       "<tr><th colspan='1'>선호스타일</th><td colspan='3'>" + result.likeStyle + "</td></tr>" +
                                       "<tr><th colspan='1'>찜수</th><td colspan='1'>" + result.ariticleLikes + "</td><th colspan='1'>조회수</th><td colspan='1'>" + result.articleViews + "</td></tr>" +
                                       "<tr><th colspan='1'>작성일</th><td colspan='1'>" + result.articleDate + "</td><th colspan='1'>등록여부</th><td colspan='1'>" + result.status + "</td></tr>" + 
                                       "<tr><th colspan='1'>내용</th><td colspan='3'>" + result.articleContents + "</td></tr>" + 
                                       "</table></div>" +
                                   	   // "<div>댓글 : </div>" : 댓글은 어떻게 넣지?	
                                       "<div class='btnArea'><button type='button' id='delete_board_btn' style='margin-right : 5%;' onclick='deleteBoard();'>게시물삭제</button>" +
                                       "<button type='button' id='delete_comment_btn' style='margin-right : 2%;' onclick='deleteBoardComment();'>댓글삭제</button></div>" + 
                                       "<form action='' id='detailForm' method='post'><input type='hidden' name='articleNo' value='"+result.articleNo+"'></form>";                                       
                              
                                       // console.log(detail);

          	           		$("#board_detail").html(detail);
          	           		
          	           		// console.log($('#board_detail').html());
          				
                          },
                          error: function() {
                              console.log("상세보기_ajax 연동실패");
                          }
                      });
                  });
              });

        
        // 검색하기 -> 내용 검색 안되고, 작성자 검색만 됨(19.11.10.)
        $(function(){
       			$(document).on('click', "#searchBtn", function(){
       				var sort = $("#searchCondition2").val();
       				var keyword = $("#searchKeyword").val();
       				
       				console.log("jsp_sort="+sort);
       				console.log("jsp_keyword="+keyword);
       				
       				$.ajax({
               			url : "<%= contextPath %>/searchBoard.adm",
               			type : "get",
               			dataType : "json",
               			data : {sort:sort, keyword:keyword},// key:value 
               			success : function(data){
               				console.log('검색하기_ajax 연동 성공');
               				console.log(sort);
               				var $tableBody = $("#board_table2");
               				
               				$tableBody.html("");
               			
               				for(var key in data){
               					var $tr = $("<tr>");
    							var $noTd = $("<td>").text(data[key].articleNo);
                  				var $nickTd = $("<td>").text(data[key].memberNick);
    							var $contentTd = $("<td>").text(data[key].articleContents);
    							var $dateTd = $("<td>").text(data[key].articleDate);
    							var $likeTd = $("<td>").text(data[key].articleLikes);
    							var $viewTd = $("<td>").text(data[key].articleViews);	
    							
    							$tr.append($noTd);
    							$tr.append($nickTd);
    							$tr.append($nickTd);
    							$tr.append($contentTd);
    							$tr.append($dateTd);
    							$tr.append($likeTd);
    							$tr.append($viewTd);
    							
    							$tableBody.append($tr);	
               				}
               				
               			},
               			error : function(){
               				console.log('검색하기_ajax 연동 실패');
               			}
       			});
       		});
       		});
        
        </script>
        
        <script>
		function deleteBoard() {
    		$("#detailForm").attr("action", "<%= contextPath%>/delete.board");
    		$("#detailForm").submit();
    		alert("성공적으로 삭제되었습니다.");
    	}
    	
		// 어떻게 하지?ㅋㅋㅋㅋㅋㅋ
    	function deletBoardComment(){
    		$("#detailForm").attr("action", "<%= contextPath%>/delete.comment"); 
    		$("#detailForm").submit();
    	}
		</script>
     
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>