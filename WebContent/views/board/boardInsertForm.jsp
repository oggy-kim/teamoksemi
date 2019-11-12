<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();
	Board board = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Gaegu|McLaren&display=swap" rel="stylesheet">
    
    <style>

body {
	width: 100%;
	height: 400px;
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
            height: 450px;
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
            height: 30px;
            align-items: center;
            margin-top:24px;
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
			width:220px;
			height:260px;
			border:2px dashed darkgray;
			text-align:center;
			display:table-cell;
			vertical-align:middle;
		}
	
		.btnArea {
			width:200px;
			margin:auto;
		}
		
		button{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
			color: white;
        }
        
        .end{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
			color: white;
        }
        
        button:hover{
    		transition-duration: 1s;
    		background-color:gray; 
    		font-weight:bold;
        }
        
        .end:hover{
    		transition-duration: 1s;
    		background-color:gray; 
    		font-weight:bold;
        }
        
        .pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}

.font {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
	font-size:20px;
}

.layer {
	margin-left:140px;
}

.tt {
	border:gray;
	width:30%;
	height:100%;
	margin:auto;
	box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
	position:relative;
    z-index:1;
	
}

.tt:after {
	background-image:url("<%= request.getContextPath() %>/resources/images/insertboard/aaaa.jpg");
	top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.8;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
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
					<div class="innermenu">INSERT</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>
			<br>
	<br><br>
	<!-- <div id="summernote"></div>
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            tabsize: 2,
            height: 200,
           	width: 900
        });
    });
  </script> -->

	<section>
	<div class="tt">
	<%-- <img src="<%= contextPath %>/resources/images/insertboard/aa.jpg"> --%>
	<div class="font">
	  <div class="layer" style="height: 10px;">
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="#layer2" class="btn-example">★게시글 작성시 주의사항★</a>
			<div class="dim-layer">
				<div class="dimBg"></div>
				<div id="layer2" class="pop-layer">
					<div class="pop-container">
						<div class="pop-conts">
							<!--content //-->
							<p class="ctxt mb20">
								★게시글 등록시 주의사항★<br>
								<br> 가로 220, 세로 260 사이즈로 등록해주세요.<br>
								<br> 내용은 짧고 간단하게 작성해주세요.<br>
								<br> 게시물 삭제는 My Page에서 가능합니다.
							</p>

							<div class="btn-r">
								<a href="#" class="btn-layerClose">Close</a>
							</div>
							<!--// content-->
						</div>
					</div>
				</div>
			</div>
			</div>
		<div class="outer">
			<br>
			
			<form action="<%= contextPath %>/boardinsert.look" method="post" enctype="multipart/form-data">
				<input type="hidden" name="memberno" value=<%= loginUser.getMemberNo() %>>
				<div class="insertArea">
					<table align="center">
						<tr>
							<td style="font-weight:bold; color:white;">사진</td>
							<td colspan="2">
								<div id="titleImgArea">
									<img id="titleImg" width="220" height="260" name="titleImg">
								</div>
							</td>
						</tr>
						<tr>
							<td width="100px" style="font-weight:bold; color:white;">내용</td>
							<td colspan="2"><input type="text" placeholder="내용을 입력하세요." style="text-align:center; width:250px; height:40px; letter-spacing: -2px" name="content">
						</tr>
					</table>
					
					<div id="fileArea">
						<input type="file" id="thumbnailImg" name="thumbnailImg" onchange="LoadImg(this,1)">
					</div>
				
						
					<script>
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg").click();
						});
					});

					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){
								
								switch(num){
								case 1 : 
									$("#titleImg").attr("src", e.target.result);
									break;
								}
								
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
					
					</script>
					
					<br>
					
					<div class="btnArea">
						&nbsp;&nbsp;
						<button type="button" onclick="javascript:history.back();">취소하기</button>
						<button type="submit" class="end">작성완료</button>
					</div>	
				</div>
				</div>
			</form>
		</div>
		</div>
	</section>
<footer class="copyRight">
  <p>Copyright 2019. LOOKSOFINE.  All right reserved.</p>
</footer>
<script>
function goStyle() {
	location.href="<%= contextPath %>/boardlist.look";
}

function goFavorite() {
	location.href="<%= contextPath %>/wishlist.look";
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

$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});

function layer_popup(el){

    var $el = $(el);
    var isDim = $el.prev().hasClass('dimBg');

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 띄우기
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
}


</script>
</body>
</html>
