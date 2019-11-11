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

        .qna_box {
            width : 80%;
            /* height : 18%; */
			height : auto;	
        	overflow : hidden;
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
        	visibility : hidden;
            width : 80%;
            height : 25%;
            margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .qna_title, .qna_detail_title { /*  qna 제목 */
            margin-top : 3%;
            margin-left : 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }
        
        .qna_detail_contents {
        	float : left;
			width : 42%;
			height : 65%;
			margin-top : 2%;
			margin-left : 5%;
			border : 1px solid black;
			font-size : 15px;
			display:inline-block;
			vertical-align : bottom; /* 적용 안됨 */ 	
        }
         
        
		#answer_btn, #delete_btn {
			/* float : right; */
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
		}
		
		 .btnArea {
			margin-right : 2%;
			margin-top : 3%;
			margin-botton : 10%;
			width : 20%;
			/* border : 1px solid black; */
			float : right;
		}

  /* -------search--------- */


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
            <h2 id="content_title"> &nbsp;&nbsp;문의사항 관리</h2>
        </div>
        <hr>
        <br>
    
        <div class="qna_box">
            <h4 class="qna_title">QnA</h4>
            <p style="margin-left:5%;">상세보기를 원하는 문의글을 클릭하면, 하단에 해당하는 문의글의 상세정보를 볼 수 있습니다.</p>
            
            <!-- 테이블 정렬 버튼 -->
            <div class="sorting_box">
                <select id="sortCondition" name="sortCondition" style="display:inline-block;">
                    <option value="newest_date">최신순</option>
                    <option value="oldest_date">오래된순</option>
                    <option value="comment_status">답변여부</option>
                </select>
            </div>
            
            <!-- QnA 리스트 테이블 -->
            <table class="sortable table" id="qna_table">
                <thead id="qna_table1">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변여부</th>
                </tr>
                </thead>
               <tbody id="qna_table2">
                <% if(list.isEmpty()){ %>
               		<tr>
                		<td colspan="5">작성된 게시글이 없습니다.</td>
                	</tr>
               	<% } else { %>
               	<% for(QnA q : list){ %>    
 					<tr>
	 					<td id="qNo"><%= q.getQnaNo() %></td>
	                    <td><%= q.getQnaTitle() %></td>
	                    <td><%= q.getMemberNick() %></td>
	                    <td><%= q.getEnrollDate() %></td>
	                    <td><%= q.getAnswerStatus() %></td>
                	</tr>
               		<% } %>
                <% } %>
                </tbody>
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
                <select id="searchCondition" name="sort" style="display:inline-block;">
                    <option>-----</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" style="display:inline-block;" id="searchKeyword">
             	<button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
			<br>
        </div>
        <br> 
        
        <div class="qna_detail_box" id="qna_detail">
            
        </div>
        
        
        <script>
        // QNA 상세보기
            	$(function(){ // 동적 대상 function 주기 (수정하기)
            		$(document).on('mouseenter', '#qna_table2 td', function(){
            			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
            		}).on('mouseout', '#qna_table2 td', function(){
            			$(this).parent().css({"background":"white"});
            		});             		
            	});
        
            	// 정렬하기
        		$("#sortCondition").change(function(){
            		var sort = this.value;
            		
            		$.ajax({
            			url : "<%= contextPath %>/sortQNA.adm",
            			type : "post",
            			dataType : "json",
            			data : {sort:sort},// key:value 
            			success : function(data){
            				console.log('성공');
            				console.log(sort);
            				var $tableBody = $("#qna_table2");
            				
            				$tableBody.html(""); // 테이블 초기화
            			
            				for(var key in data){
	              				var $tr = $("<tr>");
	            				var $noTd = $("<td>").text(data[key].qnaNo);
								var $titleTd = $("<td>").text(data[key].qnaTitle);
								var $nickTd = $("<td>").text(data[key].memberNick);
								var $dateTd = $("<td>").text(data[key].enrollDate);
								var $statusTd = $("<td>").text(data[key].answerStatus);
	            				
								$tr.append($noTd);
								$tr.append($titleTd);
								$tr.append($nickTd);
								$tr.append($dateTd);
								$tr.append($statusTd);
								
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
            		$(document).on('click', '#qna_table2 td', function(){
            			        	
                        var qnaNo = $(this).parent().children("#qNo").html();
                        console.log("qnaNo=" + qnaNo); 
                        
                        $.ajax({
                            url: "<%= contextPath %>/detailQNA.adm",
                            data: {qnaNo : qnaNo},
                            type: "get",
                            dataType: "json",
                            success : function(result){ 
            					console.log("ajax 연동성공");
                            	// console.log(result);
            	           		$("#qna_detail").css({"visibility":"visible"});

            	           		var detail = "";

            	           		detail += "<h4 class='qna_detail_title'>QnA 상세보기</h4>" + 
    	           				  "<p style='margin-left:5%;'>선택한 문의글을 상세 조회하고, 해당 문의글에 답변을 달거나 문의글을 삭제 할 수 있습니다.</p>" +
            	           					"<div class='qna_detail_contents'>" + 
            	           						"<table class='table' style='width:100%; height:100%;'>" + 
	            	           						"<tr><th colspan='1'>글번호</th><td colspan='1'>" + result.qnaNo + "</td><th colspan='1'>닉네임</th><td colspan='1'>" + result.memberNick + "</td></tr>" +
	                                         		"<tr><th colspan='1'>작성일</th><td colspan='1'>" + result.enrollDate + "</td><th colspan='1'>답변여부</th><td colspan='1'>" + result.answerStatus + "</td></tr>" +
	                                         		"<tr><th colspan='1'>제목</th><td colspan='3'>" + result.qnaTitle + "</td></tr>" +
	                                         		"<tr><th colspan='1'>내용</th><td colspan='3'>" + result.qnaContents + "</td></tr>" +
	                                         		"<tr><th colspan='1'>답변</th><td colspan='3'>" + result.answerContents + "</td></tr></table>" + 
                                         	"</div>" +
                                         "<div class='qna_detail_contents'>" + 
                                         	"<textarea style='width:100%; height:100%; resize:none;' placeholder='답변여부에 따라 답변을 할 수 있도록 활성화시키는 function 주기'></textarea>" + 
                                         "</div>" + 
                                         "<div class='btnArea'>" + 
	                                        "<button type='submit' id='delete_btn' style='display:inline-block; margin-right : 5%;' onclick='deleteQNA();'>글 삭제</button>" +
                                         	"<button type='submit' id='answer_btn' style='display:inline-block; margin-right : 5%;'>답변등록</button>" + 
                                         "</div>" +
                                         "<form action='' id='detailForm' method='post'><input type='hidden' name='qnaNo' value='"+result.qnaNo+"'></form>";
                                         
                                console.log(detail);

            	           		$("#qna_detail").html(detail);
            	           		
            	           		// console.log($('#qna_detail').html());
            				
                            },
                            error: function() {
                                console.log("ajax 연동실패");
                            }
                        });
                    });
                });
        
        		// 검색하기
        		$(function(){
        			$(document).on('click', "#searchBtn", function(){
        				var sort = $("#searchCondition").val();
        				var keyword = $("#searchKeyword").val();
        				
        				console.log(sort);
        				console.log(keyword);
        				
        				$.ajax({
                			url : "<%= contextPath %>/searchQNA.adm",
                			type : "get",
                			dataType : "json",
                			data : {sort:sort, keyword:keyword},// key:value 
                			success : function(data){
                				console.log('성공');
                				console.log(sort);
                				var $tableBody = $("#qna_table2");
                				
                				$tableBody.html("");
                			
                				for(var key in data){
    	              				var $tr = $("<tr>");
    	            				var $noTd = $("<td>").text(data[key].qnaNo);
    								var $titleTd = $("<td>").text(data[key].qnaTitle);
    								var $nickTd = $("<td>").text(data[key].memberNick);
    								var $dateTd = $("<td>").text(data[key].enrollDate);
    								var $statusTd = $("<td>").text(data[key].answerStatus);
    	            				
    								$tr.append($noTd);
    								$tr.append($titleTd);
    								$tr.append($nickTd);
    								$tr.append($dateTd);
    								$tr.append($statusTd);
    								
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
		function deleteQNA() { // 서블릿 만들기
    		$("#detailForm").attr("action", "<%= contextPath%>/deleteQNA.adm");
    		$("#detailForm").submit();
    		alert("성공적으로 삭제되었습니다.");
    	}
    	
		</script>
        
</div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>