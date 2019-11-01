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
<style>
body {
	width: 100%;
	height: 1200px;
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
	height: 850px;
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
		<form action="<%= contextPath %>/deletewish.look" method="post">
			<table class="mytable" align="center">
				<caption>표 제목</caption>
				<tr>
					<th><input type="checkbox" id="select"
						style="width: 20px; height: 20px;" class="check-all"></th>
					<th class="th-1">찜한 게시물</th>
					<th>찜한 날짜</th>
					<th class="th-2">메모</th>
				</tr>
				<% if(list.isEmpty()){ %>
				<tr>
				
					<td coldspan="4">조회된 찜목록이 없습니다.</td>
				</tr>
				<% } else { %>
				<% for(WishList w : list) { %>
				<tr>
					<input type="hidden" value="<%= w.getMemberNo() %>">
					<td><input type="checkbox" id="select" name="delete" style="width: 20px; height: 20px;" value="<%= w.getArticleNo() %>"></td>
					<td><img src="<%= contextPath %>/resources/images/board/<%= w.getArticleNo() %>.jpg" width="130px" height="160px"></td>
					<td><%= w.getWishDate() %></td>
					<td><%= w.getWishMemo() %></td>
				</tr>
				<% } %>
				<% } %>
			</table>

			<button class="cart-select-delete-btn" onclick="deleteWish();" type="submit">선택삭제</button>
		</form>
		
		<br>
		<br>

		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button
				onclick="location.href='<%= contextPath %>/list.bo?currentPage=1'">
				&lt;&lt;</button>

			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
			<button disabled>&lt;</button>
			<% } else { %>
			<button
				onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'">
				&lt;</button>
			<% } %>

			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(p == currentPage){ %>
			<button disabled>
				<%= p %>
			</button>
			<% } else { %>
			<button
				onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
			<% } %>
			<% } %>

			<!-- 다음 페이지로 (>) -->
			<% if(currentPage == maxPage){ %>
			<button disabled>&gt;</button>
			<% } else { %>
			<button
				onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'">
				&gt;</button>
			<% } %>

			<!-- 맨 끝으로 (>>) -->
			<button
				onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= maxPage %>'">
				&gt;&gt;</button>
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

		<div class="page-2">
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="search"
					placeholder="SEARCH" aria-label="SEARCH">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					style="background: black; text-decoration: none; border: 1px solid white;">SEARCH</button>
			</form>
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
                $('.ca').prop('checked', this.checked);
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
        	// admin계정으로 로그인했을 때, admin페이지로 넘어갈 수 있도록 수정	
        	if("<%= gradeCode %>" == 'S'){
        		location.href="<%= contextPath %>/views/adm/adm_overview.jsp";
        	} else {
        		location.href="<%= contextPath %>/views/mypage/myPage.jsp";
        	}
        }
        
        function deleteWish() {
        	location.href="<%= contextPath %>/deletewish.look";
        }
</script>
</body>
</html>