<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, closet.model.vo.*"%>
<% 
	ArrayList<Closet> list = (ArrayList<Closet>) request.getAttribute("list");
	int topCount = (int) request.getAttribute("topCount");
	int bottomCount = (int) request.getAttribute("bottomCount");
	int accCount = (int) request.getAttribute("accCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOKSOFINE - 나의옷장</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link href="<%= request.getContextPath() %>/css/ui-choose.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap"
	rel="stylesheet" />
<style>
#navbar {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	text-align: center;
}

#category {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	background: white;
	opacity: 0.8;
}

.nav-link:hover {
	text-decoration: underline;
	font-weight: bold;
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

.content {
	width: 77%;
	height: 1100px;
	float: left;
	padding: 10px;
}

.menu {
	width: 20%;
	list-style-type: disc;
	float: left;
	font-size: 20px;
}

.line {
	width: 3%;
	float: left;
	border-left: 2px solid black;
	height: 1200px;
}

.list {
	padding: 10px;
}

.sublist {
	padding: 10px;
}

ul.category li a {
	margin: auto;
	color: black;
}

ul.category li a:hover {
	font-weight: bold;
	font-style: italic;
}

ul.category ul>li {
	list-style-type: square;
	margin: 5px 5px;
	text-decoration: none;
}

.left {
	width: 500px;
	height: 75%;
	border: 1px solid black;
	box-sizing: border-box;
	display: block;
}

.right {
	width: 50%;
	height: 1000px;
	/* border: 1px solid black; */
	box-sizing: border-box;
	display: block;
	visibility: hidden;
}

.mycloset {
	width: 100%;
	height: 90%;
	background-color: gray;
}

.left .button {
	text-align: center;
	width: 100%;
	height: 8%;
}

.right .first {
	width: 30%;
	height: 200px;
	display: inline-block;
	margin-right: 30px;
}

.right .thumbnail {
	width: 40%;
	height: 200px;
	position: relative;
	display: block;
}

#thumbnail-pic {
	width: 90%;
	height: 80%;
	margin: auto;
	z-index: 1;
	-webkit-mask-box-image: url(<%= request.getContextPath() %>/resources/images/closet/question.png);
}

#thumbnail-add {
	width: 90%;
	height: 20%;
	margin: auto;
	margin: auto;
	position: absolute;
	bottom: 0;
	left: 35%;
}

.right .cloth {
	width: 99%;
	height: auto;
}

.select-form {
	width: 99%;
	height: 80%;
}

.select-form tr {
	padding: 100px;
}

#select-top {
	visibility: collapse;
}

#select-bottom {
	visibility: collapse;
}

#select-acc {
	visibility: collapse;
}

ul.cloth-list { list-style:none;}



.carousel{
    width: 450px; margin: 0 auto;
	height: 140px; 
    position: relative;
}

.carousel .view{
    width: 450px ; margin: 0 auto;
	height: 140px;
    /* background-color: lightgray; */
    overflow: hidden;
}

.carousel .view .cloth-list{
    width: 1350px; 
	margin-left: -450px;
	height: 100%;
}
.carousel .view .cloth-list:after{content: "";display: block;clear: both;}

.carousel .view .cloth-list > li{
    float:left;
}

.carousel .view .cloth-list > li ul:after{content: "";display: block;clear: both;}

.carousel .view .cloth-list > li ul {
	width: 400px;
}

.carousel .view .cloth-list > li ul li{
	list-style:none;
    float: left;
    width: 130px; height: 130px;
    margin-left: 5px; margin-right: 5px;
}

.carousel .prev{
    position: absolute;
    left: 0; top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform:translateY(-50%);
    transform: translateY(-50%); 
}
.carousel .prev img {
	transform:rotateY(180deg);
	width: 50px; height: 50px;
}

.carousel .next{
    position: absolute;
    right: 0; top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform:translateY(-50%);
    transform: translateY(-50%);
}

.carousel .next img {
	width: 50px; height: 50px; 
} 
/* Carousel 기능구현 */

.myclothimg {
	width: 100%;
	height: 100%;
	-webkit-mask-box-image: url(<%= request.getContextPath() %>/resources/images/closet/hood.png);
}


</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<nav>
		<br />
		<div class="menuLine">
			<div class="div div1">
				<hr />
			</div>
			<div class="div div2">
				<div class="innermenu">My Page</div>
			</div>
			<div class="div div3">
				<hr />
			</div>
		</div>
	</nav>
	<br />
	<section>
		<div class="menu">
			<ul class="category">
				<li class="list" onclick="goMyCloset();">나의 옷장</li>
				<li class="list" onclick="goMyList();">내 게시물 관리</li>
				<li class="list" onclick="goQna();">FAQ / Q&A</li>
				<li class="list-readonly">개인정보관리
					<ul>
						<li class="sublist"
							onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인
							정보 수정</a>
						</li>
						<li class="sublist" onclick="goWishStyle();">선호 스타일</li>
						<li class="sublist"
							onclick="location.href='<%= contextPath %>/views/mypage/withdraw.jsp'">회원
							탈퇴</li>
					</ul>
				</li>
			</ul>
		</div>
		<script>
        function goMyCloset(){
            location.href="<%= contextPath %>/closet.look";
        }
        function goMyList(){
            location.href="<%= contextPath %>/mylist.look";
        }
        function goQna(){
            location.href="<%= contextPath %>/qna.look";
        }
        function goWishStyle(){
            location.href="<%= contextPath %>/withstyle.look";
        }
    	</script>
		<div class="line"></div>
		<div class="content">
			<div class="content left">
				<div class="content left button">
					<button onclick="addCloth();">옷 추가</button>
					<button>옷 삭제</button>
				</div>
				<div class="content left mycloset">
					상의
						<div class="carousel top">
							<div class="view">
								<ul class="cloth-list">
									<li>
										<ul>
											<li class="a1"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a2"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(1).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(1).getColourCode() %>)"></li>
											<li class="a3"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(2).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(2).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a4"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(3).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(3).getColourCode() %>)"></li>
											<li class="a5"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(4).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(4).getColourCode() %>)"></li>
											<li class="a6"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(5).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(5).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a7"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(6).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(6).getColourCode() %>)"></li>
											<li class="a8"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(7).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(7).getColourCode() %>)"></li>
											<li class="a9"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(8).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(8).getColourCode() %>)"></li>
										</ul>
									</li>
								</ul>
							</div>
							<p class="prev"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
							<p class="next"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
						</div>
						<hr>
						하의
						<div class="carousel bottom">
							<div class="view">
								<ul class="cloth-list">
									<li>
										<ul>
											<li class="a1"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a2"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a3"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a4"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a5"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a6"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a7"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a8"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a9"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
								</ul>
							</div>
							<p class="prev"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
							<p class="next"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
						</div>
						<hr>
						악세사리
						<div class="carousel acc">
							<div class="view">
								<ul class="cloth-list">
									<li>
										<ul>
											<li class="a1"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a2"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a3"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a4"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a5"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a6"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
									<li>
										<ul>
											<li class="a7"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a8"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
											<li class="a9"><img class="myclothimg" src="<%= request.getContextPath() %>/resources/images/closet/<%= list.get(0).getTypeCode().toLowerCase() %>.png" style="background-color: rgb(<%=list.get(0).getColourCode() %>)"></li>
										</ul>
									</li>
								</ul>
							</div>
							<p class="prev"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
							<p class="next"><img src="<%= contextPath %>/resources/images/icon/next.png"></p>
						</div>
				</div>
				<script>
					$(document).ready(function(){
						$('.next').click(function(){
							$('.cloth-list').stop().animate({'margin-left':'900px'},function(){
								$('.cloth-list>li').eq(0).appendTo('.cloth-list');
								$('.cloth-list').css({'margin-left':'-450px'});
							});
						});
						$('.prev').click(function(){
							$('.cloth-list').stop().animate({'margin-left':'0px'},function(){
								$('.cloth-list>li').eq(2).prependTo('.cloth-list');
								$('.cloth-list').css({'margin-left':'-450px'});
							});
						});
					});
				
				</script>
			</div>
			<form>
				<div class="content right">
					<div class="content right first">
						<select class="ui-choose" id="options">
							<option value="top">상의</option>
							<option value="bottom">하의</option>
							<option value="acc">악세사리</option>
						</select>
					</div>
					<div class="content right thumbnail">
						<div id="thumbnail-pic" align="center"
							style="background-color: rgb(211, 33, 45);"></div>
						<div id="thumbnail-add">
							<button type="button" id="add-btn">추가</button>
						</div>
					</div>
					<div class="content right cloth style">
						<table class="select-form">
							<tr>
								<td style="width: 100px">옷 이름</td>
								<td><input type="text" name="clothname" id="clothname"
									placeholder="미입력시 자동입력" /></td>
							</tr>
							<tr id="select-top">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-top"
									name="clothtype">
										<option value="tshirts">반팔티</option>
										<option value="mantoman">맨투맨</option>
										<option value="hood">후드티</option>
										<option value="knit">니트</option>
										<option value="cardigan">가디건</option>
										<option value="padding">패딩</option>
										<option value="jacket">자켓</option>
										<option value="blouse">원피스</option>
								</select></td>
							</tr>
							<tr id="select-bottom">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-bottom"
									name="clothtype">
										<option value="cotton">면바지</option>
										<option value="jean">청바지</option>
										<option value="short">반바지</option>
										<option value="shortskirt">짧은치마</option>
										<option value="longskirt">긴치마</option>
								</select></td>
							</tr>
							<tr id="select-acc">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-acc"
									name="clothtype">
										<option value="cap">모자</option>
										<option value="scarf">목도리</option>
										<option value="sneakers">스니커즈</option>
										<option value="dressshoes">구두</option>
										<option value="sandal">샌들</option>
								</select></td>
							</tr>
							<tr>
								<td>스타일(2개까지 선택)</td>
								<td><select class="ui-choose" multiple="multiple"
									id="style">
										<option value="1">#깔끔한</option>
										<option value="2">#빈티지</option>
										<option value="3">#힙스터</option>
										<option value="4">#스트릿</option>
										<option value="5">#시크한</option>
										<option value="6">#클래식</option>
										<option value="7">#러블리</option>
										<option value="8">#핑크룩</option>
										<option value="9">#섹시한</option>
										<option value="10">#럭셔리</option>
										<option value="11">#모던시크</option>
										<option value="12">#스쿨룩</option>
										<option value="13">#귀여운</option>
										<option value="14">#캐주얼</option>
										<option value="15">#유니크</option>
										<option value="16">#댄디룩</option>
								</select></td>
							</tr>
							<tr>
								<td>색감</td>
								<td><select class="ui-choose" id="colour">
										<option value="245,245,245">화이트</option>
										<option value="255,255,0">옐로우</option>
										<option value="211,33,45">레드</option>
										<option value="150,75,0">브라운</option>
										<option value="0,0,50">네이비</option>
										<option value="10,10,10">블랙</option>
										<option value="30,30,30">나도몰라</option>
										<option value="100,100,100">기타</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>핏</td>
								<td><select class="ui-choose" id="fit" name="fit">
										<option value="slim">슬림핏</option>
										<option value="basic">베이직</option>
										<option value="overfit">오버핏</option>
								</select></td>
							</tr>
							<tr>
								<td>계절감</td>
								<td><select class="ui-choose" id="season" name="season">
										<option value="sf">봄가을</option>
										<option value="su">여름</option>
										<option value="wi">겨울</option>
								</select></td>
							</tr>
							<tr>
								<td>브랜드</td>
								<td><input type="text" name="brand" id="brand" /></td>
							</tr>
							<tr>
								<td>구입시기</td>
								<td><input type="month" name="buydate" id="buydate" /></td>
							</tr>
							<tr>
								<td>관련메모</td>
								<td><input type="textarea" name="memo" id="memo" /></td>
							</tr>
						</table>
					</div>
					<!-- 옷장 기능 관련 Script -->
					<script src="<%= contextPath %>/js/ui-choose.js"></script>
					<script>
              function addCloth() {
                $(".content left").css({ width: "30%" });
                $(".right").css({ visibility: "visible" });
              }

              // https://www.jqueryscript.net/form/jQuery-Plugin-For-Easy-Select-Button-Group-ui-choose.html
              var options = $("#options").ui_choose();
              options.click = function(value, item) {
                console.log("click", value);

                $("tr[id *= select]").css({ visibility: "collapse" });
                switch (value) {
                  case "top":
                    $("#select-top").css({ visibility: "visible" });
                    break;
                  case "bottom":
                    $("#select-bottom").css({ visibility: "visible" });
                    break;
                  case "acc":
                    $("#select-acc").css({ visibility: "visible" });
                    break;
                }
              };

              var topcloth = $("#cloth-top").ui_choose();
              topcloth.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});
              };
              var bottom = $("#cloth-bottom").ui_choose();
              bottom.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});

              };
              var acc = $("#cloth-acc").ui_choose();
              acc.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});

              };

              var style = $("#style").ui_choose();
              style.click = function(value, item) {
                console.log("click", value);
                style = value;
                console.log(style);
              };
              console.log("style" + style);
              // style.change = function(value, item) {
              //     console.log('change', value);
              // };
              var colour = $("#colour").ui_choose();
              colour.click = function(value, item) {
            	var clothtype = "";
                console.log("click", value);
                $("#thumbnail-pic").attr(
                  "style",
                  "background-color: rgb(" + value + ");"
                );
                if(options.val() == 'top') {
                	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-top").val() + '.png)'});
                  } else if(options.val() == 'bottom') {
               	  	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-bottom").val() + '.png)'});
                  } else {
               	  	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-acc").val() + '.png)'});
                  };
              };
              colour.change = function(value, item) {
                console.log("change", value);
              };

              var fit = $("#fit").ui_choose();
              fit.click = function(value, item) {
                console.log("click", value);
              };
              fit.change = function(value, item) {
                console.log("change", value);
              };
              var season = $("#season").ui_choose();
              season.click = function(value, item) {
                console.log("click", value);
              };
              season.change = function(value, item) {
                console.log("change", value);
              };

              $(document).ready(function(){


                $("#add-btn").click(function(){
                  var obj = new Object();
                  if(options.val() == 'top') {
                    obj.clothtype = $("#cloth-top").val();
                  } else if(options.val() == 'bottom') {
                    obj.clothtype = $("#cloth-bottom").val();
                  } else {
                    obj.clothtype = $("cloth-acc").val();
                  };
                  obj.style = $("#style").val();
                  obj.colour = colour.val();
                  obj.fit = fit.val();
                  obj.season = season.val();
                  obj.brand = $("#brand").val();
                  obj.buydate = $("#buydate").val();
                  obj.memo = $('#memo').val();
                  console.log(obj);

                  var JSONData = JSON.stringify(obj);
                  $.ajax({
                    url: "/addnewcloth.look",
                    data: {
                      json: JSONData
                    },
                    type: "POST",
                    dataType: "json",
                    success: function(data) {

                    },
                    error: function() {
                      alert("에러 발생");
                    }
                  });

                });
              });  

            </script>
				</div>
			</form>
		</div>
	</section>

	<footer class="copyRight">
		<p>Copyright 2019. LookSoFine. All right reserved.</p>
	</footer>
</body>
</html>