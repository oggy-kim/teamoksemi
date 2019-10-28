<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원관리 : LOOK SO FINE</title>
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


         /* -------------sorting_box------------- */

        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }
  
        /* ---------------------------------- */

        .member_box {
            width : 80%;
            height : 25%;
            /* border : 1px solid black; */
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .member_detail_box {
            width : 80%;
            height : 40%;
            /* border : 1px solid black; */
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .table {
            text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
        }

         .table_title, .member_detail_title { /* 회원 정보 목록, 회원 정보 */
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        #member_detail_wrapper {
            width : 95%;
            height : 25%;
            margin : 5% auto;
        }

        .member_profile_box {
            width : 20%;
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

        .member_detail_1, .member_detail_2 {
            width : 30%;
            height : 100%;
            margin : 0 1%;
            display : inline-block;
        }

        #member_detail_table_1, #member_detail_table_2 {
            height : 100%;
            width : 100%;
        }

        #caption {
            caption-side:top;
            font-size:15px;
            color : black;
        }

        .member_detail_table td {
            padding : 0 2% 0 2%;
            border : 1px solid black;
            height : 15%;
        }

        /*-- 등급관리, 회원삭제 버튼 --*/

        #grade_upt_btn, #delete_btn {
            float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }

        /* -------search--------- */

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
<header>
  <nav class="navbar navbar-dark bg-dark" id="navbar">
    <a class="navbar-brand" href="main.html" style="font-size : 28px;">LOOK SO FINE</a>
    <form class="form-inline">
      <input class="form-control mr-sm-2" type="search" placeholder="SEARCH" aria-label="SEARCH">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="background:black; text-decoration: none; border: 1px solid white;">SEARCH</button>
    </form>
  </nav>
  <nav style="padding:60px 0;">
      <ul class="nav justify-content-center" id="category">
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;" >STYLE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"style="color: #000;">FAVORITE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="event.html"style="color: #000;">EVENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: #000;">MY PAGE</a>
        </li>
      </ul>
    </nav>
</header>
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
            <li class="list"><a href="#">OVERVIEW</a></li>
            <li class="list"><a href="#">회원관리</a></li>
            <li class="list"><a href="#">게시물관리</a></li>
            <li class="list"><a href="#">제휴쇼핑몰관리</a></li>
            <li class="list"><a href="#">문의사항관리</a></li>
            <li class="list"><a href="#">구글애널리틱스(예정)</a></li>            
        </ul>
    </div>
    <div class="line"></div>
    <div class="content">
        <div>
            <h2 id="content_title"> &nbsp;&nbsp;회원관리</h2>
        </div>
        <hr>

        <br>
        <br>
        <div class="member_box">
            <h4 class="table_title">회원 정보 목록</h4>
            <!-- 테이블 정렬 드롭박스 -->
            <div class="sorting_box">
                <select id="searchCondition" name="searchCondition" style="display:inline-block;">
                    <option value="member_no">회원번호</option>
                    <option value="member_id">아이디</option>
                    <option value="grade">등급</option>
                    <option value="join_date">가입일자</option>
                </select>
            </div>
            <!-- 회원정보리스트 테이블 -->
            <table class="table" id="member_table">
                <tr>
                    <th></th>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>등급</th>
                    <th>가입일자</th>
                    <th>최근접속일</th>
                </tr>
                <tr>    
                    <td>1</td>
                    <td>1</td>
                    <td>test1@gmail.com</td>
                    <td>테스트1어드민</td>
                    <td>S</td>
                    <td>19/10/24</td>
                    <td>최근접속일</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2</td>
                    <td>test2@gmail.com</td>
                    <td>테스트2쇼핑몰</td>
                    <td>A</td>
                    <td>19/10/24</td>
                    <td>최근접속일</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>3</td>
                    <td>test3@gmail.com</td>
                    <td>테스트3일반회원</td>
                    <td>B</td>
                    <td>19/10/24</td>
                    <td>최근접속일</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>4</td>
                    <td>test4@gmail.com</td>
                    <td>테스트4강등회원</td>
                    <td>C</td>
                    <td>19/10/24</td>
                    <td>최근접속일</td>
                </tr>    
                <tr>
                    <td>5</td>
                    <td>5</td>
                    <td>test5@gmail.com</td>
                    <td>테스트5탈퇴회원</td>
                    <td>D</td>
                    <td>19/10/24</td>
                    <td>최근접속일</td>
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
                    <option value="member_no">회원번호</option>
                    <option value="member_id">아이디</option>
                    <option value="member_nick">닉네임</option>
                </select>
                <input type="search" style="display:inline-block;">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
        </div>

        <br>
        <br>

        <div class="member_detail_box">
            <h4 class="member_detail_title">회원 상세 정보</h4>
            <section id="member_detail_wrapper">
                <!-- 프로필 사진 -->
                <div class="member_profile_box">
                    <div id="member_photo_wrapper">
                        <img id="member_photo" src="C:\Users\규내\Desktop\학원수업\3_WEBFRONT\semi_project\image\profile_example.jpg">
                    </div>
                </div>
                <!-- 회원정보란 1 -->
                <div class="member_detail_1">
                    <table class="table-condesed" id="member_detail_table_1">
                        <tr>
                            <td>회원번호</td>
                            <td><span>1</span></td>
                        </tr>
                        <tr>
                            <td>등급</td>
                            <td><span>S</span></td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td><span>test1@gmail.com</span></td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td><span>테스트1어드민</span></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td><span>M</span></td>
                        </tr>
                    </table>
                </div>
                <!-- 회원정보란 2-->
                <div class="member_detail_2">
                    <table class="table-condensed" id="member_detail_table_2">
                        <tr>
                            <td>선호스타일</td>
                            <td><span>따뜻한, 시크한</span></td>
                        </tr>
                        <tr>
                            <!-- DB에서 AGE -> BIRTH로 변경해야 함! -->
                            <td>출생년도</td>
                            <td><span>1990</span></td>
                        </tr>
                        <tr>
                            <td>가입일자</td>
                            <td><span>19/10/24</span></td>
                        </tr>
                        <tr>
                            <!-- 아직 DB에 추가하지 않은 내용! -->
                            <td>최근접속일</td> 
                            <td><span></span></td>
                        </tr>
                        <tr>
                            <td>현황</td>
                            <td><span>Y</span></td>
                        </tr>
                    </table>
                </div>
            </section>
            <!-- 해당 회원의 작성한 게시물 테이블 -->
            <div class="member_detail_3">
                <table class="table" id="member_board_table">
                    <caption id="caption">작성한 게시물</caption>
                    <tr>
                        <th>No.</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th>찜갯수</th>
                        <th>조회수</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <!-- 페이지네이션 -->
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
                <!-- 회원삭제, 등급관리 버튼 -->
                <button type="button" id="delete_btn" style="margin-right:5%;">회원삭제</button>    
                <button type="button" id="grade_upt_btn" style="margin-right:2%;">등급관리</button>
                
            </div>
        </div>
      
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>