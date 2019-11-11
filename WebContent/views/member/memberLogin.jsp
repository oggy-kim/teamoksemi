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
            width: 100px;
            height: 30px;
            text-align: center;
            border: 1px solid black;
            border-radius: 5px;
            margin: auto;
            font-weight: bold;
            font-size: 18px;
        }
	        body{
		  		padding:0;
			 	 margin:0;
			}
			
			.inner {
			  position: absolute;
			}
			.inner-container{
			  width:400px;
			  height:400px;
			  position:absolute;
			  position: fixed;
			  top:calc(55vh - 200px);
			  left:calc(50vw - 200px);
			  overflow:hidden;
			}
			.API {
			  position: absolute;
			  top:calc(110vh - 200px);
			  left:calc(50vw - 180px);
			}
			
			.box{
			  position:absolute;
			  height:100%;
			  width:100%;
			  font-family:Helvetica;
			  color:#fff;
			  background:rgba(0,0,0,0.13);
			  padding:30px 0px;
			  padding-top: 5px;
			}
			.box h1{
			  text-align:center;
			  margin:30px 0;
			  font-size:30px;
			}
			.box input{
			  display:block;
			  width:300px;
			  margin:20px auto;
			  padding:15px; 
			  background:rgba(0,0,0,0.2);
			  color:#fff;
			  border:0;
			}
			.box input:focus,.box input:active,.box button:focus,.box button:active{
			  outline:none;
			}
			.box button{
			  background:#742ECC;
			  border:0;
			  color:#fff;
			  padding:10px;
			  font-size:20px;
			  width:330px;
			  margin:20px auto;
			  display:block;
			  cursor:pointer;
			}
			.box button:active{
			  background:#27ae60;
			}
			.box p{
			  font-size:14px;
			  text-align:center;
			}
			.box p span{
			  cursor:pointer;
			  color:#666;
			}
			    </style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
	<section>
        <div class="inner-container">
          <div class="box">
            <h1>LookSoFine</h1>
            <form method="post">
            <input type="email" placeholder="Email"/>
            <input type="password" placeholder="Password"/>
            <button>Login</button>
            <p>회원이아니세요? <span>회원가입</span></p>
            <p>ID/비밀번호를 잃어버렸나요?<span>ID/비밀번호찾기</span></p>
            </form>
          </div>
        </div>
      </div>
</section>

	
</body>
</html>