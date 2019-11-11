<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = (Member)session.getAttribute("loginUser");
String gradeCode = m.getGradeCode();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOK SO FINE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link href="<%= request.getContextPath() %>/css/ui-choose.css" rel="stylesheet">

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
            margin: 10px;
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
            font-family: 'Do Hyeon', sans-serif;
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
        .update-member {
            width: 80%;
        }
        .update-member td {
            padding: 0 0 10px 10px;
        }

        .container {
            margin: 20px auto;
            max-width: 640px;
        }

</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
rel="stylesheet" type="text/css" />

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
        <h2>개인정보 수정</h2>
        <hr>
	<form action="<%= contextPath %>/update.look" method="post" enctype="multipart/form-data">
	<table class="update-member">
		<tr>
			<td width="100px">출생년도</td>
            <td width="120px">
                <select name="birthYear" id="birthYear">
                </select>
            </td>
        </tr>
        <script>
            var max = new Date().getFullYear();
            var min = max - 100;
            select = select = document.getElementById('birthYear');

            for(var i = min; i <= max; i++) {
                if(i == <%= loginUser.getBirthYear() %>) {
                    var opt = document.createElement('option');
                    opt.value = i;
                    opt.innerHTML = i;
                    opt.selected = true;
                    select.appendChild(opt);
                }
                var opt = document.createElement('option');
                opt.value = i;
                opt.innerHTML = i;
                select.appendChild(opt);
            }
        </script>

        <tr>
            <td>닉네임</td>
            <td><input type="text" id="memberNick" name="memberNick" value="<%= loginUser.getMemberNick() %>"></td>
            <td colspan="2"><button type="button" id="btn duplicate" class='btn btn-secondary'>중복확인</button></td> 
        </tr>
        <script>
        	$(function(){
        		$("#btn-duplicate").click(
                    function(){
                        var memberNick = $("#memberNick").val();
                console.log(memberNick);
                $.ajax({
                    url: "<%= contextPath %>/memberduplicate.look",
                    data: {memberNick : memberNick},
                    type: "post",
                    dataType: "text",
                    success: function(result) {
                        if(result > 0) {
                            alert("중복된 닉네임 값이 있습니다.");
                            $("#memberNick").focus();
                            $("#memberNick").css({"border-color":"red"});
                        } else {
                            alert("사용 가능한 닉네임입니다.");
                            $("#memberNick").css({"border-color":""});
                        }
                    },
                    error: function() {
                        alert("통신 실패입니다.");
                    }
                });
                    });
        		
        	});
        </script>
        <tr>
            <td>비밀번호 변경</td>
            <td><input type="password" id="memberPwd" name="memberPwd" value="<%= loginUser.getMemberPwd() %>"></td>
            <td>
               <div class="pwd-validate"></div> 

            </td>
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" id="memberPwd" name="memberPwd" value="<%= loginUser.getMemberPwd() %>"></td>
            </tr>
            <script>
                // 유효성 검사 추가필요
            
            
            </script>





            <tr>
			<td>프로필 사진</td> <!-- cropper.js 추가 필요(사진 1:1 업로드) -->
            <td><div style="width:100px; height: 100px; margin: auto;">
                    <img id="profileImg" src="<%= request.getContextPath() %>/resources/images/profile/<%= loginUser.getMemberNo() %>.jpg" style="width:100px; height:100px"></div></td>
            <td>
                    <input type="file" id="profilePic" name="profilePic" class='btn btn-secondary'>
            
            </td>
        </tr>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    
                    reader.onload = function(e) {
                    $('#profileImg').attr('src', e.target.result);
                    $('#profileImg').attr('style', "width:100px; height:100px"); 
                    }
                    reader.readAsDataURL(input.files[0]);
                }
                }
                $("#profilePic").change(function() {
                readURL(this);
                });
        
        </script>
        
		<tr>
		
		<tr>
			<td>선호 스타일</td>
			<td colspan="2"><select class="ui-choose" multiple="multiple" name="likeStyle" id="style">
										<option value="깔끔한"">#깔끔한</option>
										<option value="빈티지">#빈티지</option>
										<option value="힙스터">#힙스터</option>
                                        <option value="스트릿">#스트릿</option>
										<option value="시크한">#시크한</option>
										<option value="클래식">#클래식</option>
										<option value="러블리">#러블리</option>
										<option value="핑크룩">#핑크룩</option>
										<option value="섹시한">#섹시한</option>
										<option value="럭셔리">#럭셔리</option>
										<option value="모던싴">#모던싴</option>
										<option value="스쿨룩">#스쿨룩</option>
										<option value="귀여운">#귀여운</option>
										<option value="캐주얼">#캐주얼</option>
										<option value="유니크">#유니크</option>
										<option value="댄디룩">#댄디룩</option>
								</select></td>
		</tr>
	</table>
    <button class='btn btn-secondary'>업데이트</button> <!-- 업데이트 후 변경된 정보로 loginUser Update 필요  -->
    



	</form>
    </div>
    <script src="<%= contextPath %>/js/ui-choose.js"></script>
    <script>

    var style = $("#style").ui_choose();
    style.click = function(value, item) {
      console.log("click", value);
      style = value;
      console.log(style);
    };
    console.log("style" + style);

    
  </script>
  
  
  <div class="content">
        <h2>회원 탈퇴</h2>
        <hr>
        <h4>회원탈퇴 안내</h4>
        <p>회원탈퇴를 하기 전에 안내 사항을 꼭 확인해주세요.
        <br><br>
        1. 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>
        2. 탈퇴 후 회원정보 및 개인서비스 이용기록은 모두 삭제됩니다. </p>
        <br><br>

        <form action="<%= contextPath %>/withdraw.look" method="POST" onsubmit="return confirm('탈퇴 시 개인 데이터는 모두 삭제됩니다. 그래도 탈퇴하시겠습니까?');">
          <input type="checkbox" id="withdraw" name="withdraw" unchecked>
          안내사항을 모두 확인하였으며, 이에 동의합니다. <br><br>
          <button id="submit" class='btn btn-secondary' disabled>확인</button>
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