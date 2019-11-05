<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <style>

<style>
body {
	width: 100%;
	height: 600px;
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
        
        .insertArea {
			width:500px;
			height:450px;
			margin:auto;
		}
        
        #titleImgArea:hover {
        	cursor:pointer;
        }
        
        #titleImgArea {
			width:350px;
			height:200px;
			border:2px dashed darkgray;
			text-align:center;
			display:table-cell;
			vertical-align:middle;
		}
	
		.btnArea {
			width:200px;
			margin:auto;
		}
        
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">SHARING</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>
			<br>
	<br><br>
	<section>
		<div class="outer">
			<br>
			
			<form action="<%= contextPath %>/boardinsert.look" method="post" enctype="multipart/form-data">
				<div class="insertArea">
					<table align="center">
						<tr>
							<td>사진</td>
							<td colspan="2">
								<div id="titleImgArea">
									<img id="titleImg" width="350" height="200">
								</div>
							</td>
						</tr>
						<tr>
							<td width="100px">내용</td>
							<td colspan="2"><textarea name="content" rows="5" cols="30" style="resize:none;"></textarea>
						</tr>
					</table>
					
					<div id="fileArea">
						<input type="file" id="thumbnailImg" name="thumbnailImg" onchange="LoadImg(this,1)">
					</div>
					
					<script>
					$(function(){
						$("fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("thumbnailImg").click();
						});
					});

					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){
								
								$("#titleImg").attr("src", e.target.result);
								
								reader.readAsDataURL(value.files[0]);
							}
						}
					}
					
					</script>
					
					<br>
					
					<div class="btnArea">
						<button type="button" onclick="javascript:history.back();">취소하기</button>
						<button type="submit">작성완료</button>
					</div>	
				</div>
			</form>
		</div>
	</section>
<footer class="copyRight">
  <p>Copyright 2019. LOOKSOFINE.  All right reserved.</p>
</footer>
<script>
function goStyle() {
	location.href="<%= contextPath %>/list.bo";
}

function goFavorite() {
	location.href="<%= contextPath %>/list.fa";
}

function goEvent() {s
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


</script>
</body>
</html>
