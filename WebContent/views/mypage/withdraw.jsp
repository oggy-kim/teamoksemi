<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK SO FINE</title>
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
        .list:hover, .sublist:hover {
            cursor: pointer;
            font-weight: 700;
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
                    <li class="sublist" onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인 정보 수정</li>
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
    <div class="content">
            <h2>회원 탈퇴</h2>
            <hr>
            <p>회원탈퇴 안내<br>
            회원탈퇴를 하기 전에 안내 사항을 꼭 확인해주세요.
            <br><br>
            1. 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>
            2. 탈퇴 후 회원정보 및 개인서비스 이용기록은 모두 삭제됩니다. 
            <br><br>

            <form action="<%= contextPath %>/withdraw.look" method="POST" onsubmit="return confirm('탈퇴 시 개인 데이터는 모두 삭제됩니다. 그래도 탈퇴하시겠습니까?');">
              <input type="checkbox" id="withdraw" name="withdraw" unchecked>
              안내사항을 모두 확인하였으며, 이에 동의합니다. <br><br>
              <button id="submit" disabled>확인</button>
            </form>


            <script>
                $("input:checkbox").change(checkedChange);
                    function checkedChange(){
                        // prop() : 선택한 요소의 속성 값을 반환하거나 설정
                        console.log($(this).prop("checked"));
                        if($(this).prop("checked")) {
                            $("#submit").attr('disabled', false);
                        } else {
                            $("#submit").attr('disabled', true);
                        }
                        }
            </script>

    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>