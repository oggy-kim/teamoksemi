<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//2_1_1. session 객체에 담겨진 loginUser 정보를 변수에 담기
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {
	background: url('<%= request.getContextPath() %>/resources/images/background2.jpg') no-repeat;
	background-size : cover;
	width:100%;
	height:820px;
}
.inner {
	position: absolute;
}

.inner-container {
	width: 400px;
	height: 400px;
	position: absolute;
	position: fixed;
	top: calc(55vh - 200px);
	left: calc(50vw - 200px);
	overflow: hidden;
}

.API {
	position: absolute;
	top: calc(110vh - 200px);
	left: calc(50vw - 180px);
}

.box {
	position: absolute;
	height: 100%;
	width: 100%;
	color: rgba(255, 255, 255, 0.9);
	background: rgba(100, 100, 100, 0.8);
	padding: 30px 0px;
	padding-top: 5px;
	font-family: 'Fugaz One', cursive;
}

.box h1 {
	text-align: center;
	margin: 30px 0;
	font-size: 40px;
}

.box input {
	display: block;
	width: 300px;
	margin: 20px auto;
	padding: 15px;
	background: rgba(210, 210, 210, 0.8);
	color: #fff;
	border: 0;
}

.box input:focus, .box input:active, .box button:focus, .box button:active
	{
	outline: none;
}

.box button {
	background: rgba(210, 210, 210, 0.8);
	border: 0;
	color: #fff;
	padding: 10px;
	font-size: 20px;
	width: 330px;
	margin: 20px auto;
	display: block;
	cursor: pointer;
}

.box button:active {
	background: rgba(120, 120, 120, 0.9);
}

.box p {
	font-size: 14px;
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
}

.box p span {
	cursor: pointer;
	color: rgba(150, 150, 150, 0.9);
}

#goMain {
	width: 200px;
	margin: auto;
}

</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>
	<%if (loginUser == null) {%>
	<div class="back"></div>
	<div class="inner-container">
		<div class="box">
			<h1>LOOK SO FINE</h1>
			<form method="post" action="<%=contextPath%>/login.me"
				onsubmit="return validate();">
				<input type="text" placeholder="Email" name="userId"> <input
					type="password" placeholder="Password" name="userPwd">
				<button type="submit">LOGIN</button>
				<p>
					회원이아니세요? <span onclick="memberJoin();">회원가입</span>
				</p>
				<p>
					ID/비밀번호를 잃어버렸나요?<span>ID/비밀번호찾기</span>
				</p>
			</form>
		</div>
	</div>
	<%} else {
		response.sendRedirect("views/common/main.jsp");
	}%>
</body>
<script>
	function memberJoin() {
		location.href="<%= contextPath %>/memberJoin.me";
	}
</script>
</html>