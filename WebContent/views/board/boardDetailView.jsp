<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	Board board = (Board)request.getAttribute("board");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	ArrayList<BoardComment> rlist = (ArrayList<BoardComment>)request.getAttribute("rlist");
	Board at = (Board)request.getAttribute("at");
	
	String gradeCode = m.getGradeCode();
	
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
    <link href="https://fonts.googleapis.com/css?family=Gaegu|McLaren&display=swap" rel="stylesheet">
    <style>

        body {
          width : 100%;
          background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
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
            font-family: 'McLaren', cursive;
			font-family: 'Gaegu', cursive;
			font-size: 18px;
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
          padding: 50px 0;
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
			height:530px;
			background:white;
			color:black;
			margin-top:50px;
        }
        
        .left{
			float: left;
        	width:550px;
        	margin-top:50px;
        }
        
        .right {
			float: left;
        	width:550px;
			height: 100%;
        }
        
        #addComment {
        	width:80px;
        }
        
        .input1 {
        	width:200px;
        	text-align:center;
        }
        
        #CommentContent {
        	width:400px;
        	text-align:center;
        }
        
        button {
        	border-radius:5px;
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
			color: black;
        }
        
        button:hover{
    		transition-duration: 1s;
    		background-color:gray; 
    		font-weight:bold;
        }
        
        table {
        	text-align:center;
        }
        
        .fonta, #jjim, #addComment {
    		border-radius:5px;
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
			color: black;
		}
        
		.fonta:hover, #jjim:hover, #addComment:hover{
			transition-duration: 1s;
			background-color:gray; 
    		font-weight:bold;
		}
		.boarddetail {
			display: block;
			width: 200px;
			border: 1px solid gray;
		}

		
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

<section>
	<div class="detail">
		<form action="<%= contextPath %>/wishinsert.look" method="post">
		<div class="left" align="center">
			<img src="<%= contextPath %>/resources/images/board/<%= at.getArticleNo() %>.jpg" width="350px" height="400px">
		<br><br>
		<input type="text" placeholder="간단한 메모를 작성하세요." name="memo" class="input1">
		<input id="aNo" type="hidden" name="aNo" value="<%= at.getArticleNo() %>">
		<input id="memberno" type="hidden" name="memberno" value="<%= m.getMemberNo() %>">
		<input id="likes" type="hidden" name="likes" value="<%= at.getArticleLikes() %>">
		<button type="submit" id="jjim">찜하기</button>
		</div>
		</form>
		<div class="right">
			<br><br>
					<div class="boarddetail">
						작성자 : <%= at.getMemberNick() %>
					</div>
					<div class="boarddetail">
						게시일 :  <%= at.getArticleDate() %>
					</div>
					<div class="boarddetail">
						조회수 : <%= at.getArticleViews() %>
					</div>
					<div class="boarddetail">
						찜수 : <%= at.getArticleLikes() %>
					</div>
					<div class="boarddetail">
						게시물 내용 : <%= at.getArticleContents() %>
					</div>
			
			<div class="CommentArea">
				<div class="CommentAjax">
				<div id="CommentSelectArea">
				<table id="CommentSelectTable" border="1" align="center">
					<% if(rlist.isEmpty()) { %>
						<tr>
							<td colspan="2">조회된 댓글목록이 없습니다.</td>
						</tr>
					<% } else { %>
					<% for(BoardComment c : rlist) { %>
						<tr>
							<td width="150px" style="font-weight:bold;"><%= c.getMemberNick() %></td>
							<td width="400px"><%= c.getCommentContents() %></td>
						</tr>
					<% } %>
					<% } %>
				</table>
				</div>
				
				<br>
				
				<div class="pagingArea" align="center">
                <button class="fonta" onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=1&aNo=<%= board.getArticleNo() %>'"> &lt;&lt; </button>

                <% if(currentPage == 1){ %>
                <button class="fonta" disabled> &lt; </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= currentPage - 1 %>&aNo=<%= board.getArticleNo() %>'"> &lt; </button>
                <% } %>

                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button class="fonta" disabled> <%= p %> </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= p %>&aNo=<%= board.getArticleNo() %>'"><%= p %></button>
                <% } %>
                <% } %>

                <% if(currentPage == maxPage){ %>
                <button class="fonta" disabled> &gt; </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= currentPage + 1 %>&aNo=<%= board.getArticleNo() %>'"> &gt; </button>
                <% } %>

                <button class="fonta" onclick="location.href='<%= contextPath %>/boarddetail.look?currentPage=<%= maxPage %>&aNo=<%= board.getArticleNo() %>'"> &gt;&gt; </button>
            </div>
            </div>
				<br>
				<div class="CommentWriterArea">
					<table align="center">
						<tr>
							<td><input type="text" id="CommentContent" placeholder="댓글 내용을 쓰세요."></td>
							<td><button id="addComment">댓글등록</button></td>
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
					
					$CommentTable = $("#CommentSelectTable");
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
	
	function goStyle() {
		location.href="<%= contextPath %>/boardlist.look";
	}

	function goFavorite() {
		location.href="<%= contextPath %>/wishlist.look";
	}

	function goEvent() {s
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
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>
