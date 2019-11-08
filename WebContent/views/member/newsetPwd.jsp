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
            width: 120px;
            height: 30px;
            text-align: center;
            border: 1px solid black;
            border-radius: 5px;
            margin: auto;
            font-weight: bold;
            font-size: 18px;
        }




		.inner {
            position: absolute;
          }
        .inner-container{
            width:600px;
            height:450px;
            position:absolute;
            top:calc(60vh - 200px);
            left:calc(45vw - 200px);
            overflow:hidden;
            background: rgba(223, 217, 230, 0.8);
          }
        .box{
            position:absolute;
            height:100%;
            width:100%;
            font-family:Helvetica;
            color:#fff;
            padding:30px 0px;
            padding-top: 5px;
            }
			/* #pass {
				margin-left: 40%;
              margin-bottom: 10%;
              margin-top:10%;
              margin-right: 30%;
			}*/
			#pass2 {
				margin-left: 28%;
              margin-bottom: 10%;
              margin-top:10%;
              margin-right: 30%;
			} 
			#btn {
				margin-left: 28%;
              margin-bottom: 10%;
              margin-top:40%;
              margin-right: 30%;
			}
</style>

</head>
<body>

		<%@ include file="../common/menubar.jsp"%>
		<div class="inner-container">
				<div class="box">
<form method="post" action="<%= request.getContextPath()%>/resetPwd.look"
	onsubmit="return checkPwd();">
	 <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
<label>변경할비밀번호</label><span id="pass"><input type="password" id="newPwd" name="newPwd" placeholder="변경할 비밀번호를 입력하세요"></span><br>
<br><label>비밀번호확인</label><span id="pass2"><input type="password" id="newPwd2" name="newPwd2" placeholder="비밀번호 확인"></span><br>
<button id="btn">제출</button>

</form>
</div>
</div>

<script>
	function checkPwd() {
		var newPwd = $("#newPwd");
		var newPwd2 = $("#newPwd2");
		
		if(newPwd.val().trim() == "" || newPwd2.val().trim() == "" ) {
			return false;
		}
		if(newPwd.val() != newPwd2.val()) {
			alert('비밀번호가 다릅니다.');
			newPwd2.select();
			return false;
		}
		return true;
	}
</script>
</body>
</html>