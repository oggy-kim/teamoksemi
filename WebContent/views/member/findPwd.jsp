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
            	        font-family: 'Do Hyeon', sans-serif;
			font-style: italic;
            }
            #h3tag {
            position:absolute;
            color:black;
            }
            pre {
              margin-top: 50px;
              margin-bottom: 50px;
              margin-left: 50px;
              margin-right: 50px;
              font-size: 1.2em;
              font-weight: bold;
              color:rgba(87, 79, 79, 0.2);
              font-family: 'Do Hyeon', sans-serif;
			font-style: italic;
            }
            .email {
              position:absolute;
              margin-left: 25%;
              margin-bottom: 35%;
              margin-top:5%;
              margin-right: 40%;
              padding-top: 5px;
              width:50%;
              border:2px solid rgba(122, 120, 120,0.5);
              border-radius: 5px;
            }
            .button {
              position:absolute;
              padding-top: 0px;
              text-align: center;
              margin-left: 40%;
              margin-top:5%;
              border:1px;
              border-radius: 7px;
              background: rgba(0, 0, 255, 0.7);
              color:white;
              padding-left: 15px;
              padding-right: 15px;
              height: 8%;
            }
            #atag {
              position:absolute;
              margin-left: 36%;
              margin-bottom: 10%;
              margin-top:25%;
              margin-right: 20%;
              font-size: 1.2em;
            }
            #loginbtn {
              margin-left: 40%;
              margin-bottom: 10%;
              margin-top:35%;
              margin-right: 20%;
              position:absolute;
              background: rgba(17, 156, 98,0.8);
              color:white;
              border:1px;
              border-radius: 12px;
            }
            .span3 {
              top:calc(30vh - 200px);
              left:calc(29vw - 200px);
              margin-top: 3%;
              width:100%;
              border: 1px solid gray;
            }
            .send {
              margin-left: 32%;
              margin-bottom: 10%;
              margin-top:10%;
              margin-right: 15%;
            }
            #email-code {
              margin-top:25%;
              margin-right: 30%;
            }
            #code {
              margin-left: 28%;
              margin-bottom: 10%;
              margin-top:40%;
              margin-right: 30%;
            }
            #check-email-code-check {
              margin-top: 10%;
              background: rgb(38, 156, 202);
              color: white;
              border: 1px;
              border-radius: 5px;
              padding-left: 2%;
              padding-right: 2%;
              padding-top: 5px;
              padding-bottom: 5px;
            }
            #emailcode {
              margin-top: 10%;
              background: skyblue;
              color:white;
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
         비밀번호 찾기
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
  <h1 align="center">LOOK SO FINE</h1>
  <div class="inner-container">
    <div class="box">
      <h3 id="h3tag">비밀번호 찾기</h3>
      <br>
  <div class="span3"></div>
  <br>
  <pre align="center">이메일을 입력하면 다시 계정에 
비밀번호설정을 할 수 있는 인증코드를 보내드립니다.</pre>

  <form method="POST" action="<%= request.getContextPath() %>/changePage.look">
    <input type="email" class="login email" id="email" name="email" placeholder="  이메일 또는 닉네임을 입력하세요"><br>
  </form>
  
  
  <br>
   <div class="form-group" style="width: 38%; margin: 10px auto;">  
     <button type="button" id="email-code" class="btn btn-primary btn-lg btn-block" onclick="send_mail();">보내기</button>
  </div>  
  <!-- <a href="#" id="atag">새 계정 만들기</a><br>
  <button type="button" id="loginbtn" >로그인으로</button> -->
  
  
  <span id="code">
  &nbsp;&nbsp;<input type="text" placeholder="인증코드를 입력하세요." name="emailcode" id="emailcode">
  <button type="button" id="check-email-code-check" onclick="send_emailcheck();">확인</button>
</span>
  </div>
  
  <script type="text/javascript">
  code;
  
  //ajax는 이메일보내기용
	function send_mail() {
		var email = $("#email").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/sendEmail.look",
			type : "post",
			data : {email : email },
			success : function(result) {
				alert('이메일 인증코드가 발급되었습니다. 인증코드를 입력해주세요.');
				console.log(result);
				code=result;
				},
			error : function(e) {
				console.log('통실실패');
				console.log(e);
			}
		});
	}

	 //인증코드를 받고나서 제출하는기능
function send_emailcheck(){
	var email = $("#email").val();
	var emailcode = $("#emailcode").val();
	//인증번호 맞을경우
	
	//인증번호확인
	if(code == emailcode) {
		$("form").submit(); //맞으면 form 제출하면 서블릿으로 가니깐 name Parameter로 setAttribute시킬수있음.
		$("#email").val();
		//틀릴경우다시입력
	}else {
		alert('코드가 일치하지않습니다.');
		
	}
	
}
</script>

</section>
</body>
</html>