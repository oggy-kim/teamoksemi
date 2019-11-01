<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>

        body {
          background: url('<%= request.getContextPath() %>/resources/images/background2.jpg') no-repeat;
	      	background-size : cover;
        }
        section {
            width: 100%;
            height: 1200px;
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
        .inner {
          position: relative;
        }
        .inner-container{
          width:800px;
          height:50%;
          position:absolute;
          top:calc(50vh - 200px);
          left:calc(43vw - 200px);
          overflow:hidden;
          background: rgba(100, 100, 100, 0.8);
          padding: 30px;
        }
          .box{
            position:absolute;
            height:100%;
            width:100%;
            font-family:Helvetica;
            color:white;
            padding:30px 0px;
          }
          .left {
            border:1px;
            background:rgba(128, 128, 128,0.8);
            padding: 5px;
            margin: 5px;
            margin-right: 10px;
            width: 14%;
            text-align: center;
          }
          #btn {
            background: rgb(38, 156, 202);
            color:white;
            border:1px;
            border-radius: 5px;
            padding-left: 2%;
            padding-right: 2%;
            padding-top: 5px;
            padding-bottom: 5px;
          }
          #btn2 {
            background: rgba(59, 182, 11, 0.5);
            color:white;
            border:1px;
            border-radius: 15px;
            position:absolute;
            margin-left: 23%;
            margin-top: 10%;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 5px;
            padding-bottom: 5px;
          }
          .input {
            padding: 5px;
            margin-left: 2%;
          }
          span {
            color:skyblue;
          }
          #checkbox {
            margin-left: 13px;
          }
          .name {
            margin-right: 3%;
          }
          #gender1 {
            color:white;
            padding-left: 5px;
          }
          #gedner2 {
            margin-left: 20px;
          }
          #spangender {
            margin-left: 20px;
          }
        
    </style>

</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
				<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
         회원가입
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
		<section>
  <!-- <h1 align="center">LOOK SO FINE</h1> -->
    <div>
    		<form id="joinForm" name="joinForm" 
		action="<%= request.getContextPath() %>/insert.me" method="post"
		onsubmit="return joinValidate();">
		
      <div class="inner-container">
          <div class="box">
      <label class="left">닉네임</label>&nbsp;<input type="text" class="input name"  
      placeholder="닉네임을 입력하세요" name="userNick"><button id="btn">중복확인</button><br>
     <br>
      <label class="left">성별</label>
      <span id="spangender"><input type="radio" name="gender" value="M"><label id="gender1">남
      </label><input type="radio" id="gedner2" name="gender" value="F"><label id="gender1">여</label>
      </span><br>

   <!-- 기본적인기능 다완성하고 추가기능구현하기
    <button id="btn">인증하기</button><br>
    <label class="left">코드번호</label> <input type="text" class="input" placeholder="코드번호를 입력하세요">
    <label id="checkbox"><input type="checkbox" checked><span>인증완료</span></label><br> -->
    <label class="left">이메일</label>&nbsp;<input type="email" class="input" 
    placeholder="이메일을 입력하세요" name="userId" required><br>
    
   <label class="left">비밀번호</label> <input type="password" class="input"
    placeholder="비밀번호를 입력하세요" name="userPwd" required> <br>
    <label class="left">비밀번호확인</label> 
    <input type="password" class="input" 
    placeholder="6~12자리 영문 숫자로 입력" name="userPwd2" required> <br>
    <button type="submit" id="btn2">가입하기</button>
  </div>
</div>
</form>
</div>
</section>
	<script>
	// 2. 유효성 검사
	function joinValidate(){
		if($("#joinForm input[name=userPwd]").val() != $("#joinForm input[name=userPwd2]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;
		}
		
		if(!(/^[가-힣]{2,}$/.test($(".name").val()))){
			alert('닉네임은 한글로 2글자 이상 입력');
			$(".name").select();
			return false;
		}
		
		return true;
<%-- 	function joinSuccess() {
		location.href="<%= contextPath %>/views/member/joinSuccess.jsp";
		/* <a href="${pageContext.request.contextPath}views/member/joinSuccess.jsp"> */
	} --%>
	
	
		})
	
	</script>
</body>
</html>