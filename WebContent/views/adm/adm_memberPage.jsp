<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Date, board.model.vo.*, member.model.vo.*"%>
<%
	// 회원정보 목록 
	ArrayList<Member> mlist = (ArrayList<Member>)request.getAttribute("mlist");
	
	// 회원 상세정보 
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode(); // 회원등급코드
    
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
		
		table {
			text-align : center;
			font-family : 'Noto Serif KR', serif;
		}
		
		table.sortable th {
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
  
        .member_box {
            width : 80%;
            height : auto;
        	overflow : hidden;
            margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }
        
		#member_detail_box {
			/*visibility : hidden;*/
            width : 80%;
            height : 40%;
            margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
		}
        
        #member_table, #member_board_table {
        	
       		text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
        }

         .table_title { /* 회원 정보 목록, 회원 정보 */
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            /* font-family: 'Do Hyeon', sans-serif; */
            font-family : 'Noto Serif KR', serif; 
            font-weight : 700;
            font-size: 28px; 
        }
        
        .member_detail_title {
			margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            /* font-family: 'Do Hyeon', sans-serif;  */
            font-family : 'Noto Serif KR', serif;
            font-weight : 700;
            font-size: 28px;        
        }

        #member_detail_wrapper {
            width : 95%;
            height : 25%;
            margin : 5% auto;
        }

        .member_profile_box {
            width : 25%;
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

        #member_detail_1, #member_detail_2 {
            width : 30%;
            height : 100%;
            margin : 0 1%;
            display : inline-block;
        }

        #member_detail_table_1, #member_detail_table_2 {
            height : 100%;
            width : 100%;
        }
        
        /* #member_detail_table_1 th {
        	background-color:#eee;
		    color:#666666;
		    font-weight: bold;
		    cursor: default;
        } */

        .member_detail_table td {
            padding : 0 2% 0 2%;
            border : 1px solid black;
            height : 15%;
        }

        /*-- 등급관리, 회원삭제 버튼 --*/

		.btnArea {
			margin-right : 5%;
			margin-top : 3%;
			margin-botton : 10%;
			width : 25%;
			/* border : 1px solid black; */
			float : right;
		}

        #update_btn, #delete_btn {
        	font-family : 'Noto Serif KR', serif;
            float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }

        /* -------search--------- */

        .searchArea {
            width : 60%;
            margin-left : 30%;
            margin-bottom : 5%;
        } 
        
        #searchBtn{
        	font-family : 'Noto Serif KR', serif;
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
    </script>
    <div class="line"></div>
    <div class="content">
        <div>
            <h2 id="content_title">&nbsp;&nbsp;회원관리</h2>
        </div>
        <hr><br><br>
        <div class="member_box">
            <h4 class="table_title">회원 정보 목록</h4>
            <p style="margin-left:5%; font-family : 'Noto Serif KR', serif;">상세보기를 원하는 회원을 클릭하면, 하단에 해당하는 회원의 상세정보를 볼 수 있습니다.</p>
            <!-- 테이블 정렬 드롭박스 -->
            <div class="sorting_box">
                <select id="sortCondition" name="sortCondition" style="display:inline-block; font-family : 'Noto Serif KR', serif;">
                    <option value="member_no">회원번호</option>
                    <option value="member_nick">닉네임</option>
                    <option value="grade">등급</option>
                    <option value="entry_date">가입일자</option>
                </select>
            </div>
            <!-- 회원정보리스트 테이블 -->
            <table class="sortable table" id="member_table">
                <thead id="member_table1">
                <tr>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>등급</th>
                    <th>가입일자</th>
                 	<!-- <th>최근접속일</th> -->
                </tr>
                </thead>
                <tbody id="member_table2">
                <% if(mlist.isEmpty()){ %>
	                <tr>
	                	<td colspan="6">등록된 회원내역이 없습니다.</td>
	                <tr>
                <% } else { %>
                <% for(Member ml : mlist){ %>    
	 				<tr>
	                    <td id="mNo"><%= ml.getMemberNo() %></td>
	                    <td><%= ml.getMemberId() %></td>
	                    <td><%= ml.getMemberNick() %></td>
	                    <td><%= ml.getGradeCode() %></td>
	                    <td><%= ml.getEntryDate() %></td>
	                    <!-- <td>최근접속일</td> -->
	                </tr>
                <% } %>
                <% } %> 
                </tbody>  
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
         
            <br>
            <div class="searchArea">
                <select id="searchCondition" name="sort" style="display:inline-block; font-family : 'Noto Serif KR', serif;">
                    <option>-----</option>
                    <option value="member_no">회원번호</option>
                    <option value="member_id">아이디</option>
                    <option value="member_nick">닉네임</option>
                </select>
                <input type="text" style="display:inline-block; font-family : 'Noto Serif KR', serif;" id="searchKeyword">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
        </div>
        <br><br> 

      <!-- 작성한 글 리스트  -->  	
      <div class="member_detail_box" id="member_detail_box">
         <div></div>
         <div>
         	<table id='member_board_table'>
         	
         	</table>
           <!-- 페이지네이션 추가--> 
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
		<div class='btnArea' style='display:inline-block; width:100px;'>
			<button type='button' id='delete_btn' style='margin-right : 5%;' onclick='deleteMember();'>회원삭제</button>
          	<button type='button' id='update_btn' style='margin-right : 2%;' onclick='updateMember();'>회원수정</button>
         </div> 
         <form action='' id='detailForm' method='post'>
         	<input type='hidden' name='memberNo' value='memberNo'>
         </form>
      </div>    
  	 </div>

       	<script>            	
           // 동적 대상 function 주기
          	$(function(){ 
          		$(document).on('mouseenter', '#member_table2 td', function(){
          			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
          		}).on('mouseout', '#member_table2 td', function(){
          			$(this).parent().css({"background":"white"});
          		});             		
          	});
           
           // 정렬하기
           	 $("#sortCondition").change(function(){
           		var sort = this.value;
           		console.log(sort);
           		
           		$.ajax({
           			url : "<%= contextPath %>/sortMember.adm",
           			type : "post",
           			dataType : "json",
           			data : {sort:sort},// key:value 
           			success : function(data){
           				console.log('성공');
           				console.log(sort);
           				var $tableBody = $("#member_table2");

           				$tableBody.html(""); // 테이블 초기화
           			
           				for(var key in data){
                 			var $tr = $("<tr>");
   							var $noTd = $("<td>").text(data[key].memberNo);
                 			var $idTd = $("<td>").text(data[key].memberId);
   							var $nickTd = $("<td>").text(data[key].memberNick);
   							var $codeTd = $("<td>").text(data[key].gradeCode);
   							var $entdTd = $("<td>").text(data[key].entryDate);	
   							
   							$tr.append($noTd);
   							$tr.append($idTd);
   							$tr.append($nickTd);
   							$tr.append($codeTd);
   							$tr.append($entdTd);
   							
   							$tableBody.append($tr);
           				}
           				
           			},
           			error : function(){
           				console.log('실패');
           			}
           		});
           	});
           
           
          // 상세보기 
          $(function(){ 
         		$(document).on('click', '#member_table2 td', function(){
         			        	
                     var memberNo = $(this).parent().children("#mNo").html();
                     // console.log("memberNo="+memberNo); // ok
                     
                     $.ajax({
                         url: "<%= contextPath %>/detailMember.adm",
                         data: {memberNo : memberNo},
                         type: "get",
                         dataType: "json",
                         success : function(result){ 
         					console.log("상세보기_ajax 연동성공");

                         	// $("#member_detail_box").css({"visibility":"visible"});

         	           		var detail = "";

         	           		detail += "<h4 class='member_detail_title'>회원 상세 정보</h4>" +
          				  			  "<p style='margin-left:5%; font-family : 'Noto Serif KR', serif;'>선택한 회원의 정보를 상세 조회하고, 해당 회원의 정보를 수정하거나 삭제 할 수 있습니다.</p><section id='member_detail_wrapper'>" +
         	           			      "<div class='member_profile_box'>" + 
         	           			      	"<div id='member_photo_wrapper'>" + 
         	           			      		"<img id='member_photo' src='" + result.profile + "'></div></div>" +
         	           				  "<div id='member_detail_1'><table class='sortable table' id='member_detail_table_1'><tr><th>회원번호 </th><td>" + result.memberNo + "</td></tr>" +
                                      "<tr><th>회원아이디</th><td>" + result.memberId + "</td></tr>" +
	                                  "<tr><th>회원닉네임</th><td>" + result.memberNick + "</td></tr>" + 
                                      "<tr><th>성별</th><td>" + result.gender + "</td></tr>" +
                                      "<tr><th>회원등급</th><td>" + result.gradeCode + "</td></tr></table></div>" +
                                      "<div id='member_detail_2'><table class='sortable table' id='member_detail_table_2'><tr><th>출생년도</th><td>" + result.birthYear + "</td></tr>" +
                                      "<tr><th>선호스타일</th><td>" + result.likeStyle + "</td></tr>" +
                                      "<tr><th>가입날짜</th><td>" + result.entryDate + "</td></tr>" +
                                      "<tr><th>현황 </th><td>" + result.memberStatus + "</td></tr><tr><th>최근접속일</th><td>구현안함</td></tr></table></div>" +
                                      "</section>";
                                      
                            // console.log("detail="+detail);

         	           		$("#member_detail_box").html(detail);
         	           		
         	           		// console.log($('#member_detail').html());
                         },
                         error: function() {
                             console.log("상세보기_ajax 연동실패");
                         }
                     });
                     
                 }).on('click', '#member_table2 td', function(){

              		var memberNo = $(this).parent().children("#mNo").html();
             		console.log("memberNo="+memberNo);
              		
             		$.ajax({
             			url : "<%= contextPath %>/detailMboard.adm",
             			type : "post",
             			dataType : "json",
             			data : {memberNo:memberNo},// key:value 
             			success : function(data){
             				console.log('작성한글리스트_성공');
             				var $tableBody = $("#member_board_table");
             				console.log(data)
             				$tableBody.html(""); // 테이블 초기화
    				   			
             				for(var key in data){
             			
                   				var $tr = $("<tr>");
     							var $aNo = $("<td>").text(data[key].articleNo);
                   				var $aCont = $("<td>").text(data[key].articleContents);
     							var $aDate = $("<td>").text(data[key].articleDate);
     							var $aView = $("<td>").text(data[key].articleViews);
     							var $aLike = $("<td>").text(data[key].articleLikes);	
     							
     							$tr.append($aNo);
     							$tr.append($aCont);
     							$tr.append($aDate);
     							$tr.append($aView);
     							$tr.append($aLike);
     							
     							$tableBody.append($tr);
             				}
             				
             			},
             			error : function(){
             				console.log('작성한글_실패');
             			}                	 
                 });
             		
             });
          
          }); 		
          // 상세보기 회원이 작성한 글 리스트 보기 
<%--        		$("#member_board_table").click(function(){
         		var memberNo = $("member_table2 td").parent().children("#mNo").html();
         		
         		$.ajax({
         			url : "<%= contextPath %>/detailMboard.adm",
         			type : "post",
         			dataType : "json",
         			data : {memberNo:memberNo},// key:value 
         			success : function(data){
         				console.log('작성한글리스트_성공');
         				var $tableBody = $("#member_board_table");

         				$tableBody.html(""); // 테이블 초기화
				   			
         				for(var key in data){
               				var $tr = $("<tr>");
 							var $aNo = $("<td>").text(data[key].articleNo);
               				var $aCont = $("<td>").text(data[key].articleContents);
 							var $aDate = $("<td>").text(data[key].articleDate);
 							var $aView = $("<td>").text(data[key].articleViews);
 							var $aLike = $("<td>").text(data[key].articleLikes);	
 							
 							$tr.append($aNo);
 							$tr.append($aCont);
 							$tr.append($aDate);
 							$tr.append($aView);
 							$tr.append($aLike);
 							
 							$tableBody.append($tr);
         				}
         				
         			},
         			error : function(){
         				console.log('작성한글_실패');
         			}
         		});
         	});
 --%>           

        // 검색하기
      	$(function(){
     			$(document).on('click', "#searchBtn", function(){
     				var sort = $("#searchCondition").val();
     				var keyword = $("#searchKeyword").val();
     				
     				console.log(sort);
     				console.log(keyword);
     				
     				$.ajax({
             			url : "<%= contextPath %>/searchMember.adm",
             			type : "get",
             			dataType : "json",
             			data : {sort:sort, keyword:keyword},// key:value 
             			success : function(data){
             				console.log('성공');
             				console.log(sort);
             				var $tableBody = $("#member_table2");
             				
             				$tableBody.html("");
             			
             				for(var key in data){
             				var $tr = $("<tr>");
   							var $noTd = $("<td>").text(data[key].memberNo);
                 			var $idTd = $("<td>").text(data[key].memberId);
   							var $nickTd = $("<td>").text(data[key].memberNick);
   							var $codeTd = $("<td>").text(data[key].gradeCode);
   							var $entdTd = $("<td>").text(data[key].entryDate);	
   							
   							$tr.append($noTd);
   							$tr.append($idTd);
   							$tr.append($nickTd);
   							$tr.append($codeTd);
   							$tr.append($entdTd);
   							
   							$tableBody.append($tr);
             				}
             				
             			},
             			error : function(){
             				console.log('실패');
             			}
     			});
     		});
     		});
        	
        </script>
          	
       	<script>
		function deleteMember() {
    		$("#detailForm").attr("action", "<%= contextPath%>/delete.member");
    		$("#detailForm").submit();
     		alert("성공적으로 삭제되었습니다.");
    	}
    	
    	function updateMember(){
    		$("#detailForm").attr("action", "<%= contextPath%>/updateForm.member"); 
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