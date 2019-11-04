<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Board board = (Board)request.getAttribute("board");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	ArrayList<BoardComment> rlist = (ArrayList<BoardComment>)request.getAttribute("rlist");
	
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
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
        
        .detail {
        	border:1px solid black;
        	width:1200px;
			height:500px;
			background:black;
			color:white;
			margin:auto;
			margin-top:50px;
        }
        
        .left{
        	float:left;
        	width:550px;
        	margin-top:50px;
        }
        
        .right {
        	float:left;
        	width:550px;
        }
        

    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
          Style
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
	<div class="detail">
		<div class="left" align="center">
			<img src="<%= contextPath %>/resources/images/board/<%= board.getArticleNo() %>.jpg" width="350px" height="400px">
		</div>
		<div class="right">
			<div class="tableArea">
				<%-- <table align="center" width="550px">
					<tr>
						<td><span><%= board.getMemberNo() %></span>
						<td><span><%= board.getArticleViews() %></span>
						<td><span><%= board.getArticleLikes() %></span>
					</tr>
					
				</table> --%>
				<table align="center" width="550px">
				<tr>
					<td>게시글번호</td>
					<td><span><%= board.getArticleNo() %></span></td>
					<td>찜수</td>
					<td colspan="3"><span><%= board.getArticleLikes() %></span></td>
				</tr>
				<tr>
					<td>작성자번호</td>
					<td><span><%= board.getMemberNick() %></span></td>
					<td>조회수</td>
					<td><span><%= board.getArticleViews() %></span></td>
					<td>작성일</td>
					<td><span><%= board.getArticleDate() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6"><p id="content"><%= board.getArticleContents() %></p></td>
				</tr>
			</table>
			</div>
			
			<div class="CommentArea">
				<div id="CommentSelectArea">
				<table id="CommentSelectTable" border="1" align="center">
					<% if(rlist.isEmpty()) { %>
						<tr>
							<td colspan="2">조회된 목록이 없습니다.</td>
						</tr>
					<% } else { %>
					<% for(BoardComment c : rlist) { %>
						<tr>
							<td width="150px"><%= c.getMemberNick() %></td>
							<td width="400px"><%= c.getCommentContents() %></td>
						</tr>
					<% } %>
					<% } %>
				</table>
				</div>
				
							<div class="pagingArea" align="center">
                <!-- 맨 처음으로 (<<) -->
                <button onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button disabled> &lt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button disabled> <%= p %> </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button disabled> &gt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
				
				<div class="CommentWriterArea">
					<table align="center">
						<tr>
							<td><textarea rows="3" cols="80" id="CommentContent"></textarea>
							<td><button id="addComment">댓글등록</button>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function(){
		$("#addComment").click(function(){
			var articleno = "<%= board.getArticleNo() %>";
			var writer = "<%= loginUser.getMemberNick() %>";
			var content = $("#CommentContent").val();
			
			$.ajax({
				url : "insertcomment.look",
				type : "post",
				dataType : "json",
				data : {articleno:articleno, writer:writer, content:content},
				success : function(data){
					console.log(data);
					
					$CommentTable = $("CommentSelectTable");
					$CommentTable.html("");
					
					for(var key in data){
						
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].memberNick).css("width", "150px");
						var $contentTd = $("<td>").text(data[key].commentContents).css("width", "400px");
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						
						$CommentTable.append($tr);
					}
					$("#CommentContent").val("");
				},
				error : function(){
					console.log("통신 실패!");
				}
			});
		});
	});
</script>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>