<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
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
<title>LOOK SO FINE</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap"
	rel="stylesheet">
<style>
body {
	width: 100%;
	height: 1000px;
}

#navbar {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	color: white;
	font-family: 'Fugaz One', cursive;
}

#category {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	background: white;
	opacity: 0.8;
	font-family: 'Paytone One', sans-serif;
	font-size: 25px;
	font-style: italic;
}

.nav-link:hover {
	text-decoration: underline;
	font-weight: bold;
}

section {
	width: 100%;
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
	width: 100%;
	height: 20px;
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

.sharingArea {
	background: white;
	width: 85%;
	height: 320px;
	margin: auto;
}

.newlistArea {
	background: white;
	width: 85%;
	height: 300px;
	margin: auto;
}

.sponserArea {
	background: white;
	width: 85%;
	height: 300px;
	margin: auto;
}

.sharing {
	float: left;
}

.newlist {
	float: left;
}

.sponser {
	float: left;
}

.click {
	text-align: center;
}

.button {
	width: 25px;
	height: 25px;
	text-align: center;
	cursor: pointer;
}

.button:active {
	-ms-transform: rotate(180deg);
	-webkit-transform: rotate(1800deg);
	transform: rotate(180deg);
}

.onclick {
	background: white;
	border: 1px solid white;
}

.sfirst, .ssecond, .sthird, .sfourth, .sfifth {
	width: 18%;
	height: 250px;
	margin: 0.9%;
}

.pfirst, .psecond, .pthird {
	width: 25%;
	height: 90%;
	margin: 4%;
}

.sponser-a, .sponser-b, .sponser-c {
	text-align: center;
}

.write {
	float: right;
	height: 20px;
}

#popupDiv { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background: white;
	width: 1200px;
	height: 700px;
	display: none;
	z-index: 2;
	border-radius: 10px;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}

#popCloseBtn {
	background: white;
	position: absolute;
	left: 95%;
	z-index: 100;
	margin-right: 8px;
	width: 40px;
	height: 40px;
	border: 1px solid white;
}

#popOpenBtn {
	background: white;
	border: 1px solid white;
	height: 250px;
}

.popOpen {
	background: white;
	border: 1px solid white;
	height: 250px;
}

.display {
	display: inline-block;
}

.left {
	width: 49.5%;
	box-sizing: border-box;
	/* border: 1px solid black; */
	border-top-left-radius: 10px;
	height: 95%;
}

.right {
	width: 49.5%;
	box-sizing: border-box;
	/* border: 1px solid yellow; */
	height: 95%;
}

.leftsection {
	height: 80%;
	width: 80%;
	margin: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<section>
		<div class="sharingArea">
			<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">SHARING</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>
			<br>
			<div class="write">
				<button onclick="write()">글쓰기</button>
				<a>보류</a>
			</div>
			<br>

			<% if(list.isEmpty()) { %>
			<div class="empty" algin="center">
				조회된 리스트가 없습니다.
			</div>
			<% } else { %>
			<% for(Board b : list) { %>
			<div class="sharing sfirst">
				<button id="popOpenBtn" class="popOpen">
					<img src="<%= contextPath %>/resources/images/board/<%= b.getArticleNo() %>.jpg" width="220px" height="260px">
				</button>
			</div>
			<% } %>
            <% } %>

			<br clear="both">

			<br>
			
			<div class="pagingArea" align="center">
                <!-- 맨 처음으로 (<<) -->
                <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button disabled> &lt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button disabled> <%= p %> </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button disabled> &gt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
            
			<div class="page-1">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<br clear="both"> <br>
		
		<br><br><br><br><br>

		<div class="newlistArea">
			<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">NEW LIST</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>
			<div class="newlist sfirst">
				<a href="" target="_blank"><img src="image/ui/n1.jpg"
					class="newlist-img1" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="image/ui/n2.jpg"
					class="newlist-img2" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="image/ui/n3.jpg"
					class="newlist-img3" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="image/ui/n4.jpg"
					class="newlist-img4" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="image/ui/n5.jpg"
					class="newlist-img5" style="width: 100%; height: 100%;"></a>
			</div>

		</div>

		<br>
		<br>
		<br>
		<br>
		<br>

		<div class="sponserArea">
			<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">SPONSER</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>

			<div class="sponser pfirst">
				<a href="" target="_blank"><img src="image/ui/s1.jpg"
					class="sponser-img1"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-a">
					<h4 style="text-align: center;">2019 FASHIONABLE</h4>
					</p></a>
			</div>

			<div class="sponser psecond">
				<a href="" target="_blank"><img src="image/ui/s2.jpg"
					class="sponser-img2"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-b">
					<h4 style="text-align: center;">SPAO HOT</h4>
					</p></a>
			</div>

			<div class="sponser pthird">
				<a href="" target="_blank"><img src="image/ui/s3.jpg"
					class="sponser-img3"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-c">
					<h4 style="text-align: center;">PUMA FALL WINTER</h4>
					</p></a>
			</div>

		</div>

		<div id="popup_mask"></div>
		<!-- 팝업 배경 DIV -->

		<div id="popupDiv">
			<!-- 팝업창 -->
			<button id="popCloseBtn">
				<img src="image/ui/delete.png" style="width: 40px; height: 40px;">
			</button>
			<div class="display left">
				<div class="leftsection">
					<img src="image/ui/1.jpg" style="width: 100%; height: 100%;">
				</div>
			</div>
			<div class="display right">
				<div class="user" style="width: 100%; height: 20%;">
					<a>안녕하세요?</a>
				</div>
				<div class="reply" style="width: 100%; height: 50%;">
					<a>댓글창</a>
				</div>
				<div class="wish" style="width: 100%; height: 20%;">
					<button onclick="wish()">찜하기</button>
				</div>
			</div>

		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer class="copyRight">
		<p>Copyright 2019. LookSoFine. All right reserved.</p>
	</footer>
	<script>
    $(document).ready(function(){
            
        $(".popOpen").click(function(event){
     
            $("#popupDiv").css({
                "top": (($(window).height()-$("#popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
                 
            }); 
                
            $("#popup_mask").css("display","block");
            $("#popupDiv").css("display","block");
                
            $("body").css("overflow","hidden");
        });
            
        $("#popCloseBtn").click(function(event){
            $("#popup_mask").css("display","none");
            $("#popupDiv").css("display","none");
            $("body").css("overflow","auto");
        });
         
        
    });
    
    function goStyle() {
    	location.href="<%= contextPath %>/list.bo";
    }

    function goFavorite() {
    	location.href="<%= contextPath %>/list.fa";
    }

    function goEvent() {
    	location.href="<%= contextPath %>/views/event/eventPage.jsp";
    }

    function goMypage() {
    	location.href="<%= contextPath %>/views/mypage/myPage.jsp";
    }
        
    </script>
</body>
</html>