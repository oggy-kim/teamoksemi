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
    
	Member m = (Member)session.getAttribute("loginUser");
    String gradeCode = m.getGradeCode();
%>
<html>
<head>
    <title>LOOKSOFINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <style>
    	body {
		background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
	}
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
            font-family: 'Do Hyeon', sans-serif;
            width: 65%;
            height: 500px;
            float: left;
        }

        .menu {
            font-family: 'Do Hyeon', sans-serif;
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

        .list:hover {
            cursor: pointer;
            font-weight: 700;
        }

        .myListArea {
            width: 80%;
            align-content: center;
        }
        #myListArea {
            width: 100%;
            text-align: center;
            border-bottom: 1px solid gray;
        }
        #myListArea th {
            height: 50px;
            background: gray;
        }
        #myListArea td {
            height: 85px;
        }

        #myListArea tr:hover {
            background-color: lightgray;
            transition: all 0.3s;
        }
        #myListArea td:hover {
            cursor: pointer;
            
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
    <!-- 좌측 네비바 -->
    <div class="menu">
            <ul class="category">
                <li class="list" onclick="goMyCloset();">나의 옷장</li>
                <li class="list" onclick="goMyList();">내 게시물 관리</li>
                <li class="list" onclick="goQna();">FAQ / Q&A</li>
                <li class="list" onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인정보관리</li>
            </ul>
        </div>
        <script>
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
            function goMyCloset(){
                location.href="<%= contextPath %>/closet.look";
            }
            function goMyList(){
                location.href="<%= contextPath %>/mylist.look";
            }
            function goQna(){
                location.href="<%= contextPath %>/qna.look";
            }
        </script>


    <div class="line"></div>
    <div class="content">
        <h2>내 게시물 관리</h2>
        <hr>
        <p>총 <%= listCount%> 개의 나의 게시물이 있습니다.

    </p>
        <div class="myListArea">
            <span class="dtn-delete">
                <form action="<%= contextPath%>/deletemylist.look" method="POST">
                    <button class="btn btn-secondary" id="submit">삭제</button>
                <!-- <select id="sortCondition" name="sortCondition">
                    <option value="date" selected>작성일 순</option>
                    <option value="like">좋아요 순</option>
                    <option value="reply">최근 댓글 순</option>
                </select> -->
            </span>
            <table id="myListArea">
                <tr>
                    <th width="40">선택</th>
                    <th width="105">게시사진</th>
                    <th width="100">게시일자</th>
                    <th width="50">조회수</th>
                    <th width="50">찜수</th>
                </tr>
                <% if(list.isEmpty()){ %>
                <tr>
                    <td colspan="5">조회된 리스트가 없습니다.</td>
                </tr>
                <% } else { %>
                <% for(Board b : list) {%>
                <tr id="boardDetail">
                    <input type="hidden" value="<%= b.getArticleNo() %>">
                    <td><input type="checkbox" name="delete" value="<%= b.getArticleNo() %>"></td>
                    <td><img src="<%= contextPath %>/resources/images/board/<%= b.getArticleNo() %>.jpg" width="100px" height="100px"></td>
                    <td><%= b.getArticleDate() %></td>
                    <td><%= b.getArticleViews() %></td>
                    <td><%= b.getArticleLikes() %></td>
                </tr>
                <% } %>
                <% } %>
                
            </table>
       				</form>
            <div class="pagingArea" align="center">
                <!-- 맨 처음으로 (<<) -->
                <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/mylist.look?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button class="btn btn-secondary" disabled> &lt; </button>
                <% } else { %>
                <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/mylist.look?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button class="btn btn-secondary" disabled> <%= p %> </button>
                <% } else { %>
                <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/mylist.look?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button class="btn btn-secondary" disabled> &gt; </button>
                <% } else { %>
                <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/mylist.look?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/mylist.look?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
        </div>


    </div>

    <script>


    $("#myListArea tr td").click(function(){
        var aNo = $(this).parent().children("input").val();
        console.log(aNo);
    	location.href="<%= contextPath %>/boarddetail.look?aNo="+aNo;
    });
    
    </script>
</section>
<footer class="copyRight">
    <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>