<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%	
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    
    ArrayList<BoardComment> rlist = (ArrayList<BoardComment>)request.getAttribute("rlist");
    ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
    
 	// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
 	Member m = (Member)session.getAttribute("loginUser");
 	String gradeCode = m.getGradeCode();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LOOK SO FINE</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gaegu|McLaren&display=swap" rel="stylesheet">
<style>
body {
	width: 100%;
	height: 1000px;
}

#navbar {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	color: white;
	font-family: 'Fugaz One', cursive;
}

#category {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	background: white;
	opacity: 0.8;
	font-family: 'Paytone One', sans-serif;
	font-size: 25px;
	font-style: italic;
}

.nav-link:hover {
	text-decoration: underline;
	font-weight: bold;
}

section {
	width: 100%;
	
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
	width: 100%;
	height: 20px;
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

.sharingArea {
	background: white;
	width: 85%;
	height: 320px;
	margin: auto;
}

.newlistArea {
	background: white;
	width: 85%;
	height: 300px;
	margin: auto;
}

.sponserArea {
	background: white;
	width: 85%;
	height: 300px;
	margin: auto;
}

.sharing {
	float: left;
}

.newlist {
	float: left;
}

.sponser {
	float: left;
}

.click {
	text-align: center;
}

.button {
	width: 25px;
	height: 25px;
	text-align: center;
	cursor: pointer;
}

.button:active {
	-ms-transform: rotate(180deg);
	-webkit-transform: rotate(1800deg);
	transform: rotate(180deg);
}

.onclick {
	background: white;
	border: 1px solid white;
}

.sfirst, .ssecond, .sthird, .sfourth, .sfifth {
	width: 18%;
	height: 250px;
	margin: 0.9%;
}

.pfirst, .psecond, .pthird {
	width: 25%;
	height: 90%;
	margin: 4%;
}

.sponser-a, .sponser-b, .sponser-c {
	text-align: center;
}

.write {
	float: right;
	height: 20px;
}

.display {
	display: inline-block;
}

.left {
	width: 49.5%;
	box-sizing: border-box;
	/* border: 1px solid black; */
	border-top-left-radius: 10px;
	height: 95%;
}

.right {
	width: 49.5%;
	box-sizing: border-box;
	/* border: 1px solid yellow; */
	height: 95%;
}

.leftsection {
	height: 80%;
	width: 80%;
	margin: auto;
}

img:hover {
	cursor:pointer;
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<section>
		<div class="sharingArea">
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
			<div class="write">
				<button onclick="location.href='<%= contextPath %>/views/board/boardInsertForm.jsp'">글쓰기</button>
			</div>
			<div style="height: 10px;"></div>
			<a href="#layer2" class="btn-example">★한번은 클릭해주세요</a>
			<div class="dim-layer">
				<div class="dimBg"></div>
				<div id="layer2" class="pop-layer">
					<div class="pop-container">
						<div class="pop-conts">
							<!--content //-->
							<p class="ctxt mb20">
								★게시글 이용시 주의사항★<br>
								<br> 해당 사진 클릭시 상세보기 페이지로 이동합니다.<br>
								<br> 게시물 상세보기에서 댓글을 작성할 수 있습니다.<br>
								<br> 댓글은 작성시 본인이 삭제할 수 없기에 신중히 댓글을 달아주세요!
							</p>

							<div class="btn-r">
								<a href="#" class="btn-layerClose">Close</a>
							</div>
							<!--// content-->
						</div>
					</div>
				</div>
			</div>
			<br>

			<%
				if (flist.isEmpty()) {
			%>
			<div class="empty" algin="center">조회된 리스트가 없습니다.</div>
			<% } else { %>
			<%-- <% for(Board b : list) { %> --%>
				<%-- <input type="hidden" value="<%= b.getArticleNo() %>"> --%>
				<% for(Attachment at : flist){ %>
					<%-- <% if(b.getArticleNo() == at.getArticleNo()){ %> --%>
					<div class="sharing sfirst">
						<img src="<%= contextPath %>/resources/images/board/<%= at.getChangeName() %>" width="220px" height="260px" class="picture" title="<%= at.getArticleNo() %>">
					</div>
			<% } %>
			<% } %>
			<%-- <% } %> --%>
			<%-- <% } %> --%>

			<br clear="both"> <br>

			<div class="pagingArea" align="center">

                <!-- 맨 처음으로 (<<) -->
                <button onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button disabled> &lt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button disabled> <%= p %> </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button disabled> &gt; </button>
                <% } else { %>
                <button onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
            
			<!-- <div class="page-1">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div> -->
		</div>

		<br clear="both"> <br> <br>
		<br>
		<br>
		<br>
		<br>

		<div class="newlistArea">
			<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">NEW LIST</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>
			<div class="newlist sfirst">
				<a href="" target="_blank"><img src="resources/images/newsponser/n1.jpg"
					class="newlist-img1" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="resources/images/newsponser/n2.jpg"
					class="newlist-img2" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="resources/images/newsponser/n3.jpg"
					class="newlist-img3" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="resources/images/newsponser/n4.jpg"
					class="newlist-img4" style="width: 100%; height: 100%;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="" target="_blank"><img src="resources/images/newsponser/n5.jpg"
					class="newlist-img5" style="width: 100%; height: 100%;"></a>
			</div>

		</div>

		<br> <br> <br> <br> <br>

		<div class="sponserArea">
			<div class="menuLine">
				<div class="div div1">
					<hr>
				</div>
				<div class="div div2">
					<div class="innermenu">SPONSER</div>
				</div>
				<div class="div div3">
					<hr>
				</div>
			</div>

			<div class="sponser pfirst">
				<a href="" target="_blank"><img src="resources/images/newsponser/s2.jpg"
					class="sponser-img1"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-a">
					<h4 style="text-align: center;">2019 FASHIONABLE</h4>
					</p></a>
			</div>

			<div class="sponser psecond">
				<a href="" target="_blank"><img src="resources/images/newsponser/s1.jpg"
					class="sponser-img2"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-b">
					<h4 style="text-align: center;">SPAO HOT</h4>
					</p></a>
			</div>

			<div class="sponser pthird">
				<a href="" target="_blank"><img src="resources/images/newsponser/s3.jpg"
					class="sponser-img3"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-c">
					<h4 style="text-align: center;">PUMA FALL WINTER</h4>
					</p></a>
			</div>

		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer class="copyRight">
		<p>Copyright 2019. LookSoFine. All right reserved.</p>
	</footer>
	<script>
    function goStyle() {
    	location.href="<%= contextPath %>/boardlist.look";
    }

    function goFavorite() {
    	location.href="<%= contextPath %>/wishlist.look";
    }

    function goEvent() {
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
        
    $(".picture").click(function(){
    	var aNo = $(this).attr('title');
    	location.href="<%= contextPath %>/boarddetail.look?aNo="+aNo;
    });
    
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