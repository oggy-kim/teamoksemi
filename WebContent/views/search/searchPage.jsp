<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, java.util.ArrayList"%>
<%
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");

	String keyword = (String)request.getAttribute("keyword");
	
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <style>

        body {
          width : 100%;
          height:2200px;
		  background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
        }

        section {
            width: 100%;
			height: 2000px;
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

        .search {
            width: 80%;
            height : auto;
        	overflow:hidden;
            margin: auto;
        }

        .search1 {
            height: 200px;
        }
        .hastag {
            height: 100px;
            margin:40px 0;
        }
        
        .hastag button {
            width: 10%;
        	height:auto;
            text-align: center;
            border-radius: 5px;
            float: left;
            margin: 2% 0 0 8.1%;
            font-family: 'Do Hyeon', sans-serif;
        }

        .hastag button a {
            text-decoration: none;            
            font-size:25px;
        }

        .searchTitle{
        	margin:0 0 0 10%;
            height: 100px;
            text-align: left;
            font-family: 'Do Hyeon', sans-serif;
        }

        .searchTitle h1 {
            margin: 1% 0 0 3%;
            font-size: 60px;
        }
        
        .searchName {
            height: 100px;
            text-align: left;
        }

        .searchName h3 {
            margin: 1% 0 0 3%;
        }
        .searchName hr {
            width: 93%;
            margin: 1% 0 0 3%;
        }
		
        .subImg {
          width: 20%;
          height: 380px;
          float: left;
          
        }
        
        .subImg:hover {
        	cursor:pointer;
        }

        .subImg1 {
          margin: 10px 6.5%;
        }

        .subImg2 {
          margin: 10px 6.5%;
        }

        .subImg3 {
          margin: 10px 6.5%;
        }
        
        .thumbnail {
        	height : auto;
        	overflow:hidden;
        }
        
        #detail {
        	font-family: 'Fugaz One', cursive;
        	text-align: center;
           	margin: 30px 0 0 48%;
           	border-radius: 5px;
        }
        
        #detail a {
        	color: black;
            text-decoration: none;
        }
        
        .searchDetailForm {
        	background:white;
    		visibility: hidden;
    		position: fixed;
    		top: 20%;
    		left: 20%;
        	width: 60%;
        	height: 70%;
    	}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
          SEARCH
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
	<div class="searchTitle">
           <h1 style="font-family: 'Do Hyeon', sans-serif;"><%= keyword %> 검색결과</h1>
    </div>
    <br>
    <div class="search search2">
        <div class="searchName">
            <h3>STYLE</h3>
            <hr>
        </div>
        	<% if(blist.size() == 0) { %>
 		        <div class="thumbnail">
        		<h1 style="text-align : center;"><%= keyword %> 검색 결과가 없습니다.</h1>
        	<% } else if(blist.size() <= 6) {%>        	
        		<%for(int i = 0; i < blist.size(); i++) { %>
            	<div class="subImg subImg1">
                <div class="card" style="width: 100%; height:100%;">
                <input type="hidden" value="<%= blist.get(i).getArticleNo() %>">
                    <img src="<%= contextPath %>/resources/images/board/<%= blist.get(i).getArticleNo() %>.jpg" width="100" height="60%" class="card-img-top">                    
                    <div class="card-body" height="40%">
                        <p class="card-text" style="font-family: 'Do Hyeon', sans-serif;"><%= blist.get(i).getArticleContents() %></p>
                    </div>                                       
                </div>
            	</div>
            <% } %>
            <% } else { %>
            	<%for(int i = 0; i < 6; i++) { %>
            		<div class="subImg subImg1">
                	<div class="card" style="width: 100%; height:100%;">
                	<input type="hidden" value="<%= blist.get(i).getArticleNo() %>">
                    <img src="<%= contextPath %>/resources/images/board/<%= blist.get(i).getArticleNo() %>.jpg" width="100" height="60%" class="card-img-top">                    
                    <div class="card-body" height="40%">
                        <p class="card-text" style="font-family: 'Do Hyeon', sans-serif;"><%= blist.get(i).getArticleContents() %></p>
                    </div>                                       
                	</div>
            	</div>            	
             <% } %>
             <button id="detail"><a href="<%= contextPath %>/boardlist.look">DETAIL</a></button>
            <% } %> 
        </div>
    </div>    
    <br>
    <div class="search search4">
        <div class="searchName">
            <h3>SHOP</h3>
            <hr>
        </div>
        <div class="thumbnail">
            <div class="subImg subImg1"><a style="text-decoration:none; color:black;" 
            	href="https://store.musinsa.com/app/product/search?type=&keyword_value=&keyword_url=&q=<%= keyword %>" target="_blank"> 
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/shop/musinsa.jpg" class="card-img-top" style="height:70%;">
                    <div class="card-body">
                        <p class="card-text" style="font-family: 'Do Hyeon', sans-serif;">무신사 <%= keyword %> 검색결과 보기</p>
                    </div>
                </div>
                </a>
            </div>
            <div class="subImg subImg2"><a style="text-decoration:none; color:black;" 
            	href="https://www.styleshare.kr/search?keyword=<%= keyword %>" target="_blank">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/shop/styleshare.jpg" class="card-img-top" style="height:70%;">
                    <div class="card-body">
                        <p class="card-text" style="font-family: 'Do Hyeon', sans-serif;">스타일쉐어 <%= keyword %> 검색결과 보기</p>
                    </div>
                </div>
                </a>
            </div>
            <div class="subImg subImg3"><a style="text-decoration:none; color:black;" 
            	href="https://search.shopping.naver.com/search/all.nhn?query=<%= keyword %>&cat_id=&frm=NVSHATC" target="_blank">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/shop/naver.png" class="card-img-top" style="height:70%;">
                    <div class="card-body">
                        <p class="card-text" style="font-family: 'Do Hyeon', sans-serif;">네이버쇼핑 <%= keyword %> 검색결과 보기</p>
                    </div>
                </div>
                </a>
            </div>
        </div>
    </div>
    <div class="searchDetailForm" id="searchDetailForm">
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
<script>
function goMain() {
	location.href="<%= contextPath %>";
}

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

$(function(){
	$(".card").click(function(){
		 var articleNo = $(this).children("input").val();
		 console.log(articleNo);
		 $.ajax ({
			 url:"searchdetail.look",
			 data : {articleNo : articleNo},
			 type:"get",
			 dataType: "json",
			 success:function(result){
				 console.log(result);
				 $("body").click(function(){
					 $(".searchDetailForm").css({"visibility":"hidden"});
					 $("body").css({"background":"url('<%= request.getContextPath() %>/resources/images/mainback.jpg')"});
				 });
				 $(".searchDetailForm").css("visibility", "visible");
				 $("body").css({"background": "gray"});
				 
				 	var detail = "";
				 	var num = result.articleNo;

	           		detail += "<div style='width:50%; height:100%; float:left;'>" + 
	           					"<img src='resources/images/board/" + result.articleNo + ".jpg' width='100%' height='100%'>" + 
	           				  "</div>" +
	           				  "<div style='width:50%; height:30%; float:left;'>" + 
	           				  	"<div style='width:80%; height:80%; margin:3% 0 0 10%; border:1px solid rgba(192,192,192,0.8); border-radius:15px;'>" + 
	           				  		"<div>" + 
	           				  			// 사진 나중에 memberNo로 바꿔야함
	           				  			"<img src='resources/images/profile/" + result.memberNo + ".jpg' style='float:left; width:150px; height:153px; border-top-left-radius: 15px; border-bottom-left-radius: 15px;'>" + 
	           				  		"</div>" + 
	           				  		"<p style='text-align:center; font-size:20px; margin:25px 0; font-family: Do Hyeon, sans-serif;'> ID : " + result.memberNick + "</p>" +
	           				  		"<p style='text-align:center; font-size:20px; margin:25px 0; font-family: Do Hyeon, sans-serif;'> LIKE : " + result.likeStyle + "</p>" + 
	           				  	"</div>" + 
	           				  	"</div>" +
	           				  	"<div style='width:50%; height:40%; float:left;'>" + 
	           				  		"<div style='width:80%; height:80%; margin:3% 0 0 10%; border:1px solid rgba(192,192,192,0.8); border-radius:15px;'>" + 
	           				  			"<p style='text-align:left; font-size:20px; margin:25px 0 0 25px; font-family: Do Hyeon, sans-serif;'>" + result.articleContents + "</p>" + 
	           				  		"</div>" + 
	           				  	"</div>" + 
	           				  	"<div style='width:50%; height:10%; float:left;'>" + 
	           				  		"<div style='width:50%; height:100%; float:left;'>" + 
	           				  			"<div style='width:80%; height:80%; margin:0.5% 0 0 10%; border:1px solid rgba(192,192,192,0.8); border-radius:15px;'>" + 
	           				  			"<p style='text-align:center; font-size:20px; margin:10px 0; font-family: Do Hyeon, sans-serif;'> VIEWS : " + result.articleViews + "</p>" + 
	           				  		"</div>" + 
	           				  	"</div>" + 
	           				  	"<div style='width:50%; height:100%; float:left;'>" + 
	           				  		"<div style='width:80%; height:80%; margin:0.5% 0 0 10%; border:1px solid rgba(192,192,192,0.8); border-radius:15px;'>" + 
	           				  			"<p style='text-align:center; font-size:20px; margin:10px 0; font-family: Do Hyeon, sans-serif;'> &hearts; " + result.articleWishes + "</p>" + 
	           				  		"<div>" + 
	           				  	"</div>" +
	           				  "</div>" +
	           				  "</div>"+
	           				  "<div style='float:left; margin:20px 0 0 43%;'>" + 
	           				  	"<button id='detail'style='margin:20px 0;'><a href='<%= contextPath %>/boardlist.look'>" + "DETAIL" + "</a></button>" + 
	           				  "</div>";
	           				
	           				  	
                 	console.log(detail);

	           		$(".searchDetailForm").html(detail);
	           		
	           		console.log($('.searchDetailForm').html());
				},
             		error: function() {
                 	console.log("ajax 연동실패");
             }
		 });
	});
});

</script>
</body>
</html>