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
            top:calc(45vh - 200px);
            left:calc(45vw - 200px);
            overflow:hidden;
            background: rgba(223, 217, 230, 0.8);
            border-radius: 10%;
          }
        .box{
            position:absolute;
            height:100%;
            width:100%;
            font-family:Helvetica;
            color:#fff;
            padding:30px 0px;
            padding-top: 5px;
            font-family: 'Do Hyeon', sans-serif;
			font-style: italic;
            }
			#pass {
				margin-left: 18%;
              margin-bottom: 0%;
              margin-top:0%;
              margin-right: 20%;
			}
			#pass2 {
				margin-left: 18%;
              margin-bottom: 0%;
              margin-top:0%;
              margin-right: 20%;
			} 
			#btn {
				margin-left: 42%;
              margin-bottom: 10%;
              margin-top:18%;
              margin-right: 25%;
              background: rgba(59, 182, 11, 0.5);
                color: white;
                border: 1px;
                border-radius: 15px;
                padding-left: 5%;
                padding-right: 5%;
                padding-top: 1%;
                padding-bottom: 1%;

			}
            #pwd2 {
                margin-right: 5%;
            }
            #nav {
                background: rgba(59, 182, 11, 0.5);
                width:20%;
            }
            .left {
                border: 1px;
                background: rgba(128, 128, 128, 0.8);
            }
</style>

</head>
<body>

		<%@ include file="../common/menubar.jsp"%>
		<div class="inner-container">
				<div class="box">
<form method="post" action="<%= request.getContextPath()%>/resetPwd.look"
    onsubmit="return checkPwd();">
    <br>
    <div align="center"><p id="nav">비밀번호 재설정</p></div>
     <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
     <br><br> <br><br>
<span id="pass"><label class="left">변경할비밀번호</label>&nbsp;&nbsp;&nbsp;<input type="password" size="25" id="newPwd" name="newPwd" placeholder="변경할 비밀번호를 입력하세요"></span><br>
<br><span id="pass2"><label class="left" id="pwd2">비밀번호확인</label><input type="password" size="25" id="newPwd2" name="newPwd2" placeholder="비밀번호 확인"></span><br>
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