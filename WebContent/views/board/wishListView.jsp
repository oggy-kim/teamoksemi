<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();		

	ArrayList<WishList> list = (ArrayList<WishList>)request.getAttribute("list");
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
<link href="https://fonts.googleapis.com/css?family=Gaegu|McLaren&display=swap" rel="stylesheet">
<style>
body {
	width: 100%;
	height: 1000px;
	background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
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
	height: 800px;
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

.mytable {
	border-collapse: collapse;
	border-top: 3px solid black;
	width: 80%;
	text-align: center;
}

.mytable th {
	color: black;
	background: gray;
	text-align: center;
}

.mytable th, .mytable td {
	padding: 10px;
	border: 1px solid #ddd;
}

.mytable th:first-child, .mytable td:first-child {
	border-left: 0;
}

.mytable th:last-child, .mytable td:last-child {
	border-right: 0;
}

.mytable tr td:first-child {
	text-align: center;
}

.mytable caption {
	caption-side: bottom;
	display: none;
}

.th-1 {
	width: 300px;
}

.th-2 {
	width: 400px;
}

.th-3 {
	width: 600px;
}

.table td {
	vertical-align: middle;
}

.cart-select-delete-btn {
	margin-left: 182px;
}

.page-2 {
	margin-left: 620px;
}

.table {
	margin-left: auto;
	margin-right: auto;
}

img:hover {
	cursor:pointer;
}

button {
	border-radius:5px;
	border: 1px solid skyblue;
	background-color: rgba(0,0,0,0);
	color: black;
}

button:hover {
    transition-duration: 1s;
    background-color:gray; 
    font-weight:bold;
}

.font {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
}

.none {
	border:1px solid white;
}

.fonta, .delete {
    border-radius:5px;
	border: 1px solid skyblue;
	background-color: rgba(0,0,0,0);
	color: black;
}
        
.fonta:hover, .delete:hover {
	transition-duration: 1s;
	background-color:gray; 
    font-weight:bold;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<nav>
		<br>
		<div class="menuLine">
			<div class="div div1">
				<hr>
			</div>
			<div class="div div2">
				<div class="innermenu">FAVORITE</div>
			</div>
			<div class="div div3">
				<hr>
			</div>
		</div>
	</nav>
	<br>
	<section>
	<div class="font">
		<form action="<%= contextPath %>/deletewish.look" method="post">
			<table class="mytable" align="center">
				<caption>표 제목</caption>
				<tr>
					<th><input type="checkbox" id="select"
						style="width: 20px; height: 20px;" class="check-all"></th>
					<th class="th-1" style="font-size:20px;">찜한 게시물</th>
					<th class="th-2" style="font-size:20px;">찜한 날짜</th>
					<th class="th-3" style="font-size:20px;">메모</th>
				</tr>
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="4" class="none">조회된 찜목록이 없습니다..</td>
				</tr>
				<% } else { %>
				<% for(WishList w : list) { %>
				<tr>
					<input type="hidden" value="<%= w.getWishNo() %>">
					<td><input type="checkbox" class="select" name="delete" style="width: 20px; height: 20px;" value="<%= w.getWishNo() %>"></td>
					<td><img src="<%= contextPath %>/resources/images/board/<%= w.getArticleNo() %>.jpg" class="picture" title="<%= w.getWishNo() %>" width="130px" height="160px"></td>
					<td style="font-size:18px;"><%= w.getWishDate() %></td>
					<td style="font-size:18px;"><%= w.getWishMemo() %></td>
				</tr>
				<% } %>
				<% } %>
			</table>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="cart-select-delete-btn" onclick="deleteWish();" type="submit" style="font-size:20px;" class="delete">선택삭제</button>
		</form>
		
		<br>
		<br>

		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button class="fonta"
				onclick="location.href='<%= contextPath %>/wishlist.look?currentPage=1'">
				&lt;&lt;</button>

			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
			<button class="fonta" disabled>&lt;</button>
			<% } else { %>
			<button class="fonta"
				onclick="location.href='<%= contextPath %>/wishlist.look?currentPage=<%= currentPage - 1 %>'">
				&lt;</button>
			<% } %>
		
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(p == currentPage){ %>
			<button class="fonta" disabled>
				<%= p %>
			</button>
			<% } else { %>
			<button class="fonta"
				onclick="location.href='<%= contextPath %>/wishlist.look?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
			<% } %>

			<!-- 다음 페이지로 (>) -->
			<% if(currentPage == maxPage){ %>
			<button class="fonta" disabled>&gt;</button>
			<% } else { %>
			<button class="fonta"
				onclick="location.href='<%= contextPath %>/wishlist.look?currentPage=<%= currentPage + 1 %>'">
				&gt;</button>
			<% } %>

			<!-- 맨 끝으로 (>>) -->
			<% if(currentPage == maxPage){ %>
			<button class="fonta" disabled>&gt;&gt;</button>
			<% } else { %>
			
			<button class="fonta"
				onclick="location.href='<%= contextPath %>/wishlist.look?currentPage=<%= maxPage %>'">
				&gt;&gt;</button>
			<% } %>
		</div>

		<!-- <div class="page-1">
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
		</div> -->
	</div>
	</section>
	<br>
	<br>
	<footer class="copyRight">
		<p>Copyright 2019. LookSoFine. All right reserved.</p>
	</footer>
	<script>
        $(document).ready(function(){
            $('.check-all').click(function(){
                $('.select').prop('checked', this.checked);
            });
        });
        
        function goMain() {
        	location.href="<%= contextPath %>";
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
        	location.href="<%= contextPath %>/views/mypage/myPage.jsp";
        }
        
        $(".picture").click(function(){
        	var aNo = $(this).attr('title');
        	location.href="<%= contextPath %>/boarddetail.look?aNo="+aNo;
        });
    </script>
</body>
</html>
