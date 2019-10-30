<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            /* ------ 규내 수정 -----*/
            padding : 5% 0 0 0;
            /* ---------------------*/
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
        .sublist {
            padding: 10px;
        }

        ul.category li a {
            margin:auto;
            color: black;
             /* ------ 규내 수정 -----*/
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 25px; 
            /* ---------------------*/
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


        /* -- 테이블 정렬 -- */

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

        .trend_box {
            width : 80%;
            height : 20%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .board_box, .board_detail_box {
            width : 80%;
            height : 21%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .table {
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

        .board_detail {
            width : 80%;
            height : 20%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .board_detail_title {
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }


        /* --------------search------------ */

        .searchArea {
            width:60%;
            margin-left:30%;
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
        
        /* --------------- */

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
            <li class="list" onclick="goGA();">구글애널리틱스(예정)</li>            
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
    	function goGA(){
    		location.href="<%= contextPath%>/ga.adm";
    	}
    </script>
    <div class="line"></div>
    <div class="content">
        <div id="content_title_wrapper">
            <h2 id="content_title"> &nbsp;&nbsp;게시물관리</h2>
        </div>
        <hr><br>

        <div class="trend_box">
            <h4 class="table_title">실시간 인기 게시글</h4>
            <br>
            <!-- 인기 게시글 조회기간 설정 -->
            <div class="date_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option>-----</option>
                    <option value="title">조회수</option>
                    <option value="content">찜갯수</option>
                    <option value="writer">댓글수</option>
                </select>    
                <input type="date" name="start_date" id="start_date">
                <input type="date" name="end_date" id="end_date">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            <!-- 인기 게시글 테이블 -->
            <table class="table" id="trend_table">
                <tr>
                    <th>순위</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>찜갯수</th>
                    <th>조회수</th>
                    <th>댓글수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
            </table>
        </div> 
        <br>
        <br>

        <div class="board_box">
            <h4 class="table_title">게시글 모아보기</h4>
            <!-- 테이블 정렬 버튼 -->
            <!-- <div class="sorting_box">
                <button id="view_btn" style="display:inline-block;">작성일</button>
                <button id="date_btn" style="display:inline-block;">조회수</button>       
            </div> -->
            <div class="sorting_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option value="write_date">작성일</option>
                    <option value="view_num">조회수</option>
                </select>
            </div>
            <!-- 전체 게시글 테이블 -->
            <table class="table" id="border_table">
                <tr>
                    <th>번호</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>찜갯수</th>
                    <th>조회수</th>
                    <th>댓글수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>학교 끝나고...</td>
                    <td>수연</td>
                    <td>19-10-24</td>
                    <td>58</td>
                    <td>000</td>
                    <td>000</td>
                </tr>
            </table>
            <br>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                </ul>
            </nav>

            <div class="searchArea">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option>-----</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="search" style="display:inline-block;">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
        </div>
        <br> 

        <div class="board_detail_box">
            <h4 class="board_detail_title">게시글 상세보기</h4>
                
        </div>
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>