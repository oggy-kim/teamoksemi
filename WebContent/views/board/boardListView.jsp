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

.sfirst{
	width: 20%;
	height: 250px;
	margin-left:5.2%;
	margin-top:1.5%;
	margin-bottom:1.5%;
	border-radius:5px;
	
}

.sfirst:hover {
	transform: perspective(300px) translateZ(70px);
	transition:all 0.5s;
}

.ssecond {
	width: 18%;
	height: 300px;
	margin: 0.9%;
}

.ssecond:hover {
	transform: perspective(300px) translateZ(70px);
	transition:all 0.5s;
}

.pfirst:hover {
	transform: perspective(300px) translateZ(70px);
	transition:all 0.5s;
}

.pfirst{
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

.writee {
	border-radius:5px;
	border: 1px solid skyblue;
	background-color: rgba(0,0,0,0);
	color: black;
}

.writee:hover {
    transition-duration: 1s;
    background-color:gray; 
    font-weight:bold;
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

img {
	margin:auto;
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

.writee {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
}

.layer a {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
}

.font {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
}

.pop-conts {
	font-family: 'McLaren', cursive;
	font-family: 'Gaegu', cursive;
}

.fonta {
    border-radius:5px;
	border: 1px solid skyblue;
	background-color: rgba(0,0,0,0);
	color: black;
}
        
.fonta:hover {
	transition-duration: 1s;
	background-color:gray; 
    font-weight:bold;
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
				<button class="writee" onclick="location.href='<%= contextPath %>/views/board/boardInsertForm.jsp'">글쓰기</button>
			</div>
			<div class="layer" style="height: 10px;">
			<a href="#layer2" class="btn-example">★게시글 이용시 주의사항★</a>
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
					<div class="sharing sfirst" style="width:220px; height:260px;">
						<img src="<%= contextPath %>/resources/images/board/<%= at.getChangeName() %>" width="220px" height="260px" class="picture" title="<%= at.getArticleNo() %>"
						style="border-radius:5px;">
					</div>
			<% } %>
			<% } %>
			<%-- <% } %> --%>
			<%-- <% } %> --%>

			<br clear="both"> <br>

			<div class="font">
			<div class="pagingArea" align="center">

                <!-- 맨 처음으로 (<<) -->
                <button class="fonta" onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=1'"> &lt;&lt; </button>

                <!-- 이전 페이지로 (<) -->
                <% if(currentPage == 1){ %>
                <button class="fonta" disabled> &lt; </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
                <% } %>

                <!-- 10개의 페이지 목록 -->
                <% for(int p = startPage; p <= endPage; p++){ %>
                <% if(p == currentPage){ %>
                <button class="fonta" disabled> <%= p %> </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= p %>'"><%= p %></button>
                <% } %>
                <% } %>

                <!-- 다음 페이지로 (>) -->
                <% if(currentPage == maxPage){ %>
                <button class="fonta" disabled> &gt; </button>
                <% } else { %>
                <button class="fonta" onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
                <% } %>

                <!-- 맨 끝으로 (>>) -->
                <button class="fonta" onclick="location.href='<%= contextPath %>/boardlist.look?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
            </div>
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
			<div class="newlist ssecond">
				<a href="http://spao.elandmall.com/goods/initGoodsDetail.action?goods_no=1911809894&vir_vend_no=VV16001887&sale_shop_divi_cd=10&disp_ctg_no=1606001527&sale_area_no=D1606000649&tr_yn=Y&conts_dist_no=C19111155474734&conts_divi_cd=10&rel_no=1911809894&rel_divi_cd=10&brand_nm=%EC%8A%A4%ED%8C%8C%EC%98%A4&goods_nm=%EC%97%AC%EC%84%B1+%EC%B9%B4%EB%9D%BC%ED%8D%BC+%EB%AA%A8%EC%A7%81%EC%BD%94%ED%8A%B8_SPJW94VG22&cust_sale_price=129000&ga_ctg_nm=SPAO+%EB%A9%94%EC%9D%B8&dlp_list=&dlp_category=WOMEN%2F%EC%95%84%EC%9A%B0%ED%84%B0%2F%EC%BD%94%ED%8A%B8" target="">
				<img src="resources/images/newlist/share1.jpg"
					class="newlist-img1" style="width: 100%; height: 100%; border-radius:5px;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="http://spao.elandmall.com/goods/initGoodsDetail.action?goods_no=1911807935&vir_vend_no=VV16001887&sale_shop_divi_cd=10&disp_ctg_no=1606001527&sale_area_no=D1606000649&tr_yn=Y&conts_dist_no=C19111155477158&conts_divi_cd=10&rel_no=1911807935&rel_divi_cd=10&brand_nm=%EC%8A%A4%ED%8C%8C%EC%98%A4&goods_nm=%ED%8C%A8%EB%94%A9+%EB%8D%94%ED%94%8C%EC%BD%94%ED%8A%B8_SPJP94VC25&cust_sale_price=79920&ga_ctg_nm=SPAO+%EB%A9%94%EC%9D%B8&dlp_list=&dlp_category=MEN%2F%EC%95%84%EC%9A%B0%ED%84%B0%2F%ED%8C%A8%EB%94%A9%2C%EB%8B%A4%EC%9A%B4" target="">
				<img src="resources/images/newlist/share2.jpg"
					class="newlist-img2" style="width: 100%; height: 100%; border-radius:5px;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="https://store.musinsa.com/app/product/detail/1209123/0" target="">
				<img src="resources/images/newlist/share3.jpg"
					class="newlist-img3" style="width: 100%; height: 100%; border-radius:5px;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="https://store.musinsa.com/app/product/detail/404949/0" target="">
				<img src="resources/images/newlist/share4.jpg"
					class="newlist-img4" style="width: 100%; height: 100%; border-radius:5px;"></a>
			</div>
			<div class="newlist ssecond">
				<a href="https://www.benito.co.kr/product/%ED%8F%AC%EC%8A%A4-%EC%8A%AC%EB%9E%99%EC%8A%A4-3color-sl/13538/category/36/display/2/" target="">
				<img src="resources/images/newlist/share5.jpg"
					class="newlist-img5" style="width: 100%; height: 100%; border-radius:5px;"></a>
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
				<a href="http://spao.elandmall.com/shop/initPlanShop.action?disp_ctg_no=1904387758" target="">
				<img src="resources/images/newsponser/sponser1-1.jpg"
					class="sponser-img1"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-a">
					<h4 style="text-align: center;">폴리스 & 덤블 최대 1만원 할인</h4>
					</p></a>
			</div>

			<div class="sponser pfirst">
				<a href="https://kr.puma.com/puffer-long-down-jkt-14.html" target="">
				<img src="resources/images/newsponser/sponser1-2.jpg"
					class="sponser-img2"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-b">
					<h4 style="text-align: center;">PUFFER LONG DOWN JKT</h4>
					</p></a>
			</div>

			<div class="sponser pfirst">
				<a href="http://spao.elandmall.com/shop/initPlanShop.action?disp_ctg_no=1910415305" target="">
				<img src="resources/images/newsponser/sponser1-3.jpg"
					class="sponser-img3"
					style="width: 100%; height: 100%; border-radius: 5px;">
					<p class="sponser-c">
					<h4 style="text-align: center;">Harry Potter 마지막 콜라보레이션</h4>
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