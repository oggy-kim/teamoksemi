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
	font-family: Helvetica;
	color: #fff;
	background: rgba(0, 0, 0, 0.13);
	padding: 30px 0px;
	padding-top: 5px;
}

.box h1 {
	text-align: center;
	margin: 30px 0;
	font-size: 30px;
}

.box input {
	display: block;
	width: 300px;
	margin: 20px auto;
	padding: 15px;
	background: rgba(0, 0, 0, 0.2);
	color: #fff;
	border: 0;
}

.box input:focus, .box input:active, .box button:focus, .box button:active
	{
	outline: none;
}

.box button {
	background: #742ECC;
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
	background: #27ae60;
}

.box p {
	font-size: 14px;
	text-align: center;
}

.box p span {
	cursor: pointer;
	color: #666;
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
	<div class="inner-container">
		<div class="box">
			<h1>LOOKSOFINE</h1>
			<form method="post" action="<%=contextPath%>/login.me"
				onsubmit="return validate();">
				<input type="text" placeholder="Email" name="userId"> <input
					type="password" placeholder="Password" name="userPwd">
				<button type="submit">Login</button>
				<p>
					회원이아니세요? <span onclick="memberJoin();">회원가입</span>
				</p>
				<p>
					ID/비밀번호를 잃어버렸나요?<span>ID/비밀번호찾기</span>
					호롤로롤로로로로로로로로
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