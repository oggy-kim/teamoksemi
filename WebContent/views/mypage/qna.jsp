<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*" %>
<%
    ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOKSOFINE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
<style>
    #navbar {
        width:100%;
        height:60px;
        position:fixed;
        z-index: 1;
        text-align: center;
    }

    #category {
        width: 100%;
        height:60px;
        position: fixed;
        z-index: 1;
        background: white;
        opacity:0.8;
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

    .content {
        width: 65%;
        height: 500px;
        float: left;
    }

    .menu {
        width: 20%;
        list-style-type: disc;
        float: left;
        font-size: 20px;
    }

    .line {
        width: 5%;
        float: left;
        border-left: 2px solid black;
        height: 1200px;
    }

    .list, .list-readonly {
        padding: 10px;
    }
    .sublist {
        padding: 10px;
    }

    ul.category li a {
        margin:auto;
        color: black;
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

    .mytype {
        background: lightgray;
        margin: auto;
        padding: 10px;
        width: 50%;
    }

    button.mytype {
        width: 23%;
        color: black;
        border-radius: 5px;
        border: 0px;
        background: gray;
        font-weight: 600;
    }

    .list:hover, .sublist:hover {
        cursor: pointer;
        font-weight: 700;
    }
        .FAQArea .q {
        width:80%;
        height:30px;
        background:black;
        color:white;
        border-radius:5px;
        text-align:left;
        cursor:pointer;
        margin-bottom:5px;
    }

    .FAQArea .a {
        border:0px solid black;
        width:80%;
        font-size: 80%;
        border-radius:5px;
        display: none;
    }
    .myQnAListArea {
        width: 80%;
        align-content: center;
    }
    #myQnAList {
        width: 100%;
        text-align: center;
    }
    #myQnAList th {
        height: 50px;
        background: gray;
    }
    #myQnAList td {
        height: 50px;
    }
    
    .QnAInsertForm {
    	background: lightgray;
    	visibility: hidden;
    	position: fixed;
    	top: 20%;
    	left: 20%;
        width: 800px;
        height: 400px;
    }
    .QnADetailForm {
    	background: lightgray;
    	visibility: hidden;
    	position: fixed;
    	top: 20%;
    	left: 20%;
        width: 800px;
        height: 400px;
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
                My Page
            </div>
        </div>
        <div class="div div3"><hr></div>
    </div>
</nav>
<br>
<section>
    <div class="menu">
        <ul class="category">
            <li class="list" onclick="goMyCloset();">나의 옷장</li>
            <li class="list" onclick="goMyList();">내 게시물 관리</li>
            <li class="list" onclick="goQna();">FAQ / Q&A</li>
            <li class="list-readonly">개인정보관리
                <ul>
                    <li class="sublist" onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인 정보 수정</a></li>
                    <li class="sublist" onclick="goWishStyle();">선호 스타일</li>
                    <li class="sublist" onclick="location.href='<%= contextPath %>/views/mypage/withdraw.jsp'">회원 탈퇴</li>
                </ul>
            </li>
        </ul>
    </div>
    <script>
        function goMyCloset(){
            location.href="<%= contextPath %>/closet.look";
        }
        function goMyList(){
            location.href="<%= contextPath %>/mylist.look";
        }
        function goQna(){
            location.href="<%= contextPath %>/qna.look";
        }
        function goWishStyle(){
            location.href="<%= contextPath %>/withstyle.look";
        }
    </script>


    <div class="line"></div>
    <div class="QnAInsertForm" id="QnAInsertForm">
		<br>
			<h2 align="center">Q&A 문의글 등록</h2>
			<div class="tableArea">
				<form id="qnasubmit" action="<%= contextPath %>/qnasubmit.look" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" size="60" name="title" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3">
								<textarea rows="5" cols="60" name="content" style="resize:none" required></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="button" onclick="">취소하기(이거 안돼...)</button>
						<button id="submit" type="submit">문의글 등록</button>
					</div>
				</form>
				
			</div>
	</div>
	<script>
           	function showQnAInsertForm(){
           		$("#QnAInsertForm").css("visibility", "visible");
           		$("body").css({"background": "gray"});
           		$(".menu").css({"pointer-events":"none"});
           	}
           </script>
	<div class="QnADetailForm" id="QnADetailForm">
		</div>
    
    <div class="content">
        <h2>FAQ</h2>
        <hr>
    	<div class="FAQArea">
    		<div class="q">&nbsp;Q. 회원 가입은 어떻게 하나요?</div>
      <p class="a">LOOKSOFINE 아이디는 이메일로 이루어져 있습니다. <br>
        회원가입은 홈페이지 상단 ‘회원 가입’ 메뉴를 통하여 해주시면 됩니다. <br>
        신규 가입 고객이신 경우, 이메일로 본인 인증을 해주셔야 하며, 인증하신 후에 가입하실 수 있습니다.</p>
      <div class="q">&nbsp; Q. 회원 정보 수정은 어디서 하나요?</div>
      <p class="a">회원정보는 로그인 후 변경 하실 수 있습니다. 마이페이지 > 회원정보 메뉴를 통해 변경 하실 수 있습니다. 회원 정보는 주문 시 사용되오니 꼭 정확하게 기재하시기 바랍니다.</p>
      <div class="q">&nbsp; Q. 회원 탈퇴는 어떻게 하나요?</div>
      <p class="a">회원 탈퇴는 마이페이지 > 회원 탈퇴의 하위 메뉴를 통해 신청하실 수 있습니다.</p>
      <div class="q">&nbsp; Q. LOOKSOFINE 랭킹은 믿을 수 있나요?</div>
      <p class="a">LOOKSOFINE 랭킹은 매출 및 클릭수를 기반으로 자동으로 계산되며, 저희는 어떠한 조작도 행하고 있지 않습니다.</p>
      <div class="q">&nbsp; Q. LOOKSOFINE의 업무 시간이 궁금해요. 주말에도 문의가 가능한가요?</div>
      <p class="a">LOOKSOFINE의 업무시간 안내입니다.<br>
          평일 : 오전 9시 ~ 오후3시30분 <br>
          토, 일,공휴일 : 휴무<br>
          스토어관련 전화 : 1544-7199<br>
          1번 : 상품문의 / 회원관련<br>
          2번 : 배송 / 교환 / 환불관련<br>
          전화 업무가 많아 연결이 불가능한 경우가 있습니다. 연결이 지연될 경우, 1:1 게시판을 통해 문의해주시면 보다 빠른 응답을 해드리도록 하겠습니다. 또한 상품 상세에 대한 내용(사이즈/재고/교환 및 환불 현황)이 아닌 대부분의 문의 내용은 본 FAQ를 통해서 확인이 가능하니 많은 이용 부탁드립니다.</p>
        
          <br><br>
        
        
    	</div>
    	
    	  <script>
    $(function(){
        $('.q').click(function() {
            $(this).siblings("p.a").slideUp(0);
            $(this).next("p").slideToggle(0, function(){
            });
        })
    });
	$(function(){
        $('#myQnAList td').click(
            function() {
            var qnaNo = $(this).parent().children("input").val();
            $.ajax({
                url: "qnadetail.look",
                data: {qnaNo : qnaNo},
                type: "get",
                dataType: "json",
                success : function(result){ 
					console.log(result);
					console.log(result.enrollDate);
                    console.log(result.qnaTitle);
	           		$("body").click(function(){
	           			$("#QnADetailForm").css({"visibility":"hidden"}); 
		           		$("body").css({"background": "none"});
	           		});
					$("#QnADetailForm").css("visibility", "visible");
	           		$("body").css({"background": "gray"});
	           		$(".menu").css({"pointer-events":"none"});


	           		var detail = "";

	           		detail += "<div>등록일 : " + result.enrollDate + "</div>" +
                             "<div>제목 : " + result.qnaTitle + "</div>" +
                             "<div>문의내용 : " + result.qnaContents + "</div>" +
                             "<div>답변여부 : " + result.answerStatus + "</div>" + 
                             "<div>답변내용 : " + result.answerContents + "</div>";
                    console.log(detail);

	           		$(".QnADetailForm").html(detail);
	           		
	           		console.log($('.QnADetailForm').html());
				},
                error: function() {
                    console.log("ajax 연동실패");
                }
            });
        });
    });
</script>
        <span><h2>나의 Q&A</h2></span>
        <hr>
        <div class="myQnAListArea">
	        <p>총 <%= listCount%> 개의 게시물이 있습니다.</p>
            <div class="btn-qna" align="right">
				<button onclick="showQnAInsertForm();">Q&A 문의글 등록</button>
            </div>
            
            <table id="myQnAList">
                <tr>
                    <th width="100">문의일자</th>
                    <th width="100">문의내역</th>
                    <th width="150">문의내용</th>
                    <th width="80">답변여부</th>
                    <th>답변내역</th>
                </tr>
                <% if(list.isEmpty()){ %>
                <tr>
                    <td colspan="3">조회된 문의사항 내역이 없습니다.</td>
                </tr>
                <% } else { %>
                <% for(QnA q : list) {%>
                <tr>
                    <input type="hidden" value="<%= q.getQnaNo() %>">
                    <td><%= q.getEnrollDate() %></td>
                    <td><%= q.getQnaTitle() %></td>
                    <td><%= q.getQnaContents()%></td>
                    <td><%= q.getAnswerStatus() %></td>
                    <td><%= q.getAnswerContents() %></td>
                </tr>
                <% } %>
                <% } %>

            </table>
            <div class="pagingArea" align="center">
                <!-- 맨 처음으로 (<<) -->
                <button onclick="location.href='<%= contextPath %>/qna.look?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button disabled> &lt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/qna.look?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button disabled> <%= p %> </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/qna.look?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button disabled> &gt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/qna.look?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button onclick="location.href='<%= contextPath %>/qna.look?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
        </div>


    </div>
</section>
<footer class="copyRight">
    <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>