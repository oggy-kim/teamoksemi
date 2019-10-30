<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        body {
          width : 100%;
          height : 1600px;
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
            top:calc(65vh - 200px);
            left:calc(45vw - 200px);
            overflow:hidden;
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
            #h3tag {
            position:absolute;
            color:black;
            }
            pre {
              margin-right: 50px;
              font-size: 1.2em;
              font-weight: bold;
              color:rgba(87, 79, 79, 0.2);
            }
            .email {
              position:absolute;
              top:calc(35vh - 200px);
              left:calc(12vw - 200px);
              padding-top: 5px;
              width:50%;
              margin-left: 15%;
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
            #ptag {
              color:black;
              margin-top:17%;
              margin-right: 50px;
            }
            #atag {
              position:absolute;
              top:calc(55vh - 200px);
              left:calc(22vw - 200px);
              font-size: 1.2em;
            }
            #loginbtn {
              position:absolute;
              top:calc(65vh - 200px);
              left:calc(22.5vw - 200px);
              background: rgba(17, 156, 98,0.8);
              color:white;
              border:1px;
              border-radius: 12px;
            }
            .pptag {
              width:42%;
              border: 1px solid gray;

            }
            .span3 {
              top:calc(30vh - 200px);
              left:calc(29vw - 200px);
              margin-top: 3%;
              width:100%;
              border: 1px solid gray;
            }
            .span1{
              position:absolute;
              top:calc(49vh - 200px);
              left:calc(27vw - 200px);
            }
            .span2 {
              position:absolute;
              top:calc(49vh - 200px);
              left:calc(9vw - 200px);
            }
            .send {
              position:absolute;
              top:calc(38vh - 200px);
              left:calc(8vw - 200px);
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
  <pre align="center">이메일 또는 닉네임을 입력하면
다시 계정에 로그인 할 수 있는 링크를 보내드립니다.</pre>
  <form method="POST">
    <input type="email" class="login email" type="text" placeholder="  이메일 또는 닉네임을 입력하세요"><br>
    <button type="submit" class="login button send">로그인 링크 보내기</button>
    <span id="oror"><span class="pptag span1"></span><p align="center" id="ptag">또는</p><span class="pptag span2"></span></span>
  </form>
  <br>
  <a href="#" id="atag">새 계정 만들기</a><br>
  <button type="submit" id="loginbtn" >로그인으로</button>
  </div>
  </div>
</section>
</body>
</html>