<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, java.util.ArrayList"%>
<%
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");

	String keyword = (String)request.getAttribute("keyword");
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
            height : 600px;
            margin: auto;
        }

        .search1 {
            height: 200px;
        }
        .hastag {
            height: 100px;
        }
        
        .hastag button {
            width: 10%;
            height: 30%;
            text-align: center;
            border-radius: 5px;
            float: left;
            margin: 2% 0 0 8.1%;
        }

        .hastag button a {
            text-decoration: none;
        }

        .searchTitle{
            height: 100px;
            text-align: left;
        }

        .searchTitle h1 {
            margin: 1% 0 0 3%;
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
        	height : 400px;
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
    <div class="search search1">
        <div class="hastag">
            <button><a href="#">#가디건</a></button>
            <button><a href="#">#가을가디건</a></button>
            <button><a href="#">#여자가디건</a></button>
            <button><a href="#">#남자가디건</a></button>
            <button><a href="#">#오버핏가디건</a></button>
        </div>
        <div class="searchTitle">
           <h1><%= keyword %>검색결과</h1>
        </div>
    </div>
    <br>
    <div class="search search2">
        <div class="searchName">
            <h3>STYLE</h3>
            <hr>
        </div>
        <div class="thumbnail">
        	<%if(blist.size() <= 3) {%>        	
        		<%for(int i = 0; i < blist.size(); i++) { %>
            	<div class="subImg subImg1">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/board/<%= blist.get(i).getArticleNo() %>.jpg" width="100" height="70%" class="card-img-top">                    
                    <div class="card-body" height="30%">
                        <p class="card-text"><%= blist.get(i).getArticleContents() %></p>
                    </div>                                       
                </div>
            	</div>
            <% } %>
            <% } else { %>
            	<%for(int i = 0; i < 3; i++) { %>
            		<div class="subImg subImg1">
                	<div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/board/<%= blist.get(i).getArticleNo() %>.jpg" width="100" height="70%" class="card-img-top">                    
                    <div class="card-body" height="30%">
                        <p class="card-text"><%= blist.get(i).getArticleContents() %></p>
                    </div>                                       
                	</div>
            	</div>            	
             <% } %>
            <% } %> 
        </div>
        <button id="detail"><a href="#">DETAIL</a></button>
    </div>    
    <br>
    <div class="search search3">
        <div class="searchName">
            <h3>OOTD</h3>
            <hr>
        </div>
        <div class="thumbnail">
            <div class="subImg subImg1">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="subImg subImg2">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="subImg subImg3">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>  
        <button id="detail"><a href="#">DETAIL</a></button>
    </div>
    <br>
    <div class="search search4">
        <div class="searchName">
            <h3>SHOP</h3>
            <hr>
        </div>
        <div class="thumbnail">
            <div class="subImg subImg1">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="subImg subImg2">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
            <div class="subImg subImg3">
                <div class="card" style="width: 100%; height:100%;">
                    <img src="<%= contextPath %>/resources/images/tour3.jpg" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>
        <button id="detail"><a href="#">DETAIL</a></button>  
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>