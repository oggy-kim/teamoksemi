<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, shop.model.vo.Shop"%>
<% 
	// Shop 목록
	ArrayList<Shop> list = (ArrayList<Shop>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
	// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
 	Member m = (Member)session.getAttribute("loginUser");
 	String gradeCode = m.getGradeCode();
 	
 	// sorting 기준 변수 받기
	String sort = (String)request.getAttribute("sort");
 	
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제휴쇼핑몰관리 : LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <style>

        body {
          width : 100%;
          height : 1600px;
        }

        #navbar {
            width:100%;
            height:60px;
            position:fix ed;
            z-index: 1;
            color:white;
            font-family: 'Fugaz One', cursive;
        }

        #category {
          width: 100%;
          height:60px;
          position: fixed;
          z-index: 1;
          background: white;
          opacity:0.8;
          font-family: 'Paytone One', sans-serif;
          font-size: 25px; 
          font-style: italic;
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

        .menu {
            width: 18%;
            list-style-type: disc;
            float: left;
            font-size: 20px;
            padding : 5% 0 0 0;
        }

        .line {
            width: 5%;
            float: left;
            border-left: 2px solid black;
            height: 1200px;
        }

        .list {
            padding: 10px;
        }
        
        .list:hover {
            cursor: pointer;
            font-weight: 700;
        }
        
        .sublist {
            padding: 10px;
        }

        ul.category li a {
            margin:auto;
            color: black;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 25px; 
        }

        ul.category li a:hover {
            font-weight: bold;
            font-style: italic;
        }

        ul.category ul > li {
            list-style-type: square;
            margin: 5px 5px;
            text-decoration: none;
        }


        /* -------------------- content -------------------- */

        .content {
            width: 75%;
            height: 2300px;
            float: left;
            display : block;
        }

        #content_title {
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 40px; 
            margin : 0;
        }

        #content_title_wrapper {
            margin : 0 auto;
        }

        hr {
            margin : 0;
        }

        /* ----------------- shop ------------------------ */

        /* -------------sorting_box------------- */

		
		/* Sortable tables */
		table.sortable thead {
		    background-color:#eee;
		    color:#666666;
		    font-weight: bold;
		    cursor: default;
		}
		
        .sorting_box {
            margin-right:10%;
            margin-bottom:1%;
            float : right;
        }


        .sales_box {
            width : 80%;
            height : 15%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        } 

        .date_box {
            width : 80%;
            height : 15%;
            margin-left : 5%;
        }

        .profit_detail_wrapper {
            height : 45%;
            width : 100%;
            margin-top : 0;
        }

        #vertical_line {
            width: 2%;
            display : inline-block;
            border-left: 2px solid black;
            height: 100px;
        }

        #sales_num{
            display : inline-block;
            width : 15%;
            height : 100%;
            margin : 2% 2% 0 5%;
        } 
        
        #profit_num {
            display : inline-block;
            width : 60%;
            height : 100%;
            margin : 2% 2% 0 2%;
        }

        .shop_box {
            width : 80%;
			height : auto;
        	overflow : hidden;
            margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }
        
         .shop_detail_box {
         	visibility : hidden; 
         	width : 80%;
         	height : 23%;
         	margin-left : 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
         }

		#shop_detail_contents { /* 다시 조정하기 */
			width : 80%;
			height : 60%;
			margin-top : 2%;
			margin-left : 5%;
			border : 1px solid black;			
		}

		#shop_table {
			text-align : center;
            width : 85%;
            margin : 3% 0 0 5%;
            font-size : 15px;
		}

        .table {
            text-align : center;
            width : 85%;
            margin : 1% 0 0 5%;
            font-size : 15px;
        }

        .box_title, .table_title { /* 수익 및 거래총량 /제휴 쇼핑몰 리스트 제목 */
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        .shop_detail {
            width : 80%;
            height : 20%;
            margin : 0 0 0 5%;
            box-shadow : 3px 3px 5px rgba(36, 34, 34, 0.849);
        }

        .shop_detail_title {
            margin : 3% 0 0 5%;
            padding : 2% 0 0 0;
            font-family: 'Do Hyeon', sans-serif; 
            font-size: 28px; 
        }

        #update_btn, #delete_btn {
            float : right;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }

        /* -------search--------- */

        .searchArea {
            width:60%;
            margin-left:30%;
            margin-bottom:5%;
        } 
        
        #searchBtn{
            height:30px;
            width:80px;
            background:gray;
            border:gray;
            color:white;
            border-radius:5px;
        }
        
        #searchBtn:hover {
            cursor:pointer;
        }

		.btnArea {
			 margin-botton:10%;
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
          ADMIN
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
    <div class="menu">
        <ul class="category">
            <li class="list" onclick="goMember();">회원관리</li>
            <li class="list" onclick="goBoard();">게시물관리</li>
            <li class="list" onclick="goShop();">제휴쇼핑몰관리</li>
            <li class="list" onclick="goQnA();">문의사항관리</li>       
        </ul>
    </div>
    <script>
    	// SUB-NAVI
    	function goMember(){
    		location.href="<%= contextPath%>/member.adm";
    	}
    	function goBoard(){
    		location.href="<%= contextPath%>/board.adm";
    	}
    	function goShop(){
    		location.href="<%= contextPath%>/shop.adm";
    	}
    	function goQnA(){
    		location.href="<%= contextPath%>/qna.adm";
    	}
    	
    	// MAIN NAVIBAR
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
    </script>
    <div class="line"></div>
    <div class="content">
        <div id="content_title_wrapper">
            <h2 id="content_title"> &nbsp;&nbsp;제휴쇼핑몰관리</h2>
        </div>
        <hr>

        <div class="sales_box">
            <h4 class="box_title">수익 및 거래총량</h4>
            <br>
            <!-- 날짜 조회 탭 -->
            <div class="date_box">    
                <input type="date" name="start_date" id="start_date">
                <input type="date" name="end_date" id="end_date">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            <!-- 가로 구분선 -->
            <hr id="horizon_line" style="width:85%; margin-left:5%;">
            <!-- 거래수 / 수익 -->
            <div class="profit_detail_wrapper">
                <div class="profit_detail" id="sales_num">
                    <a class="profit_detail_title" style=" font-size:25px;">거래수</a>
                    <p style="font-size:75px; text-align:left;" >100</p>
                </div>
                <div id="vertical_line"></div>
                <div class="profit_detail" id="profit_num">
                    <a class="profit_detail_title" style="font-size:25px;">수익</a>
                    <p style="font-size:75px; text-align:left;">KRW00,000,000</p>
                </div>
            </div>
        </div> 
        <br><br>

        <div class="shop_box">
            <h4 class="table_title">제휴 쇼핑몰 리스트</h4>
            <div class="sorting_box">
                <select id="sortCondition" name="sortCondition" style="display:inline-block;">
                    <option value="cont_money">계약금</option>
                    <option value="cont_status">계약상태</option>
                </select>
            </div>
            
            <!-- 제휴 쇼핑몰 리스트 테이블 -->
            <table class="sortable table" id="shop_table">
                <thead id="shop_tabl2">
                <tr>
                    <th>회사번호</th>
                    <th>회사명</th>
                    <th>계약상태</th>
                    <th>등급</th>
                    <th>계약시작일</th>
                    <th>계약만료일</th>
                    <th>계약금</th>
                    <th>연락처</th>
                </tr>
                </thead>
            	<tbody id="shop_table2">
                <% if(list.isEmpty()){ %>
               		 <tr>
                		<td colspan="8">작성된 게시글이 없습니다.</td>
                	 </tr>
               	<% } else { %>
               	<% for(Shop sl : list){ %>    
					<tr>
	 					<td id="sNo"><%= sl.getShopNo() %></td>
	                    <td><%= sl.getShopName() %></td>
	                    <td><%= sl.getStatus() %></td>
	                    <td><%= sl.getShopGradeCode() %></td>
	                    <td><%= sl.getContractDate() %></td>
	                    <td><%= sl.getExpireDate() %></td>
	                    <td><%= sl.getContractMoney() %></td>
	                    <td><%= sl.getShopContact() %></td>
               		</tr>
                	<% } %>
                <% } %>  
               	</tbody>	
            </table>
            <br>
            <!-- 페이지네이션 -->
             <div class="pagingArea" align="center">
               <!-- 맨 처음으로 (<<) -->
               <button onclick="location.href='<%= contextPath %>/.shop?currentPage=1'"> &lt;&lt; </button>

               <!-- 이전 페이지로 (<) -->
               <% if(currentPage == 1){ %>
               <button disabled> &lt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
               <% } %>

               <!-- 10개의 페이지 목록 -->
               <% for(int p = startPage; p <= endPage; p++){ %>
               <% if(p == currentPage){ %>
               <button disabled> <%= p %> </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= p %>'"><%= p %></button>
               <% } %>
               <% } %>

               <!-- 다음 페이지로 (>) -->
               <% if(currentPage == maxPage){ %>
               <button disabled> &gt; </button>
               <% } else { %>
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
               <% } %>

               <!-- 맨 끝으로 (>>) -->
               <button onclick="location.href='<%= contextPath %>/shop.adm?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
          	 </div>
          	 <br>
            <!-- 검색옵션, 검색버튼 -->
            <div class="searchArea">
            	<select id="searchCondition" name="sort" style="display:inline-block;">
                    <option>-----</option>
                    <option value="shopName">회사명</option>
                </select>
                <input type="text" style="display:inline-block;" id="searchKeyword">
                <button id="searchBtn" type="submit" style="display:inline-block;">검색하기</button>
            </div>
            <br>
            
        </div>
        <br> 
        <script>
        // SHOP 상세보기 -> 선생님 수정
        	/* $(function(){ // 동적 대상 function 주기
            		$('#shop_table2 td').on({'mouseenter' : function(){
            			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
            		}, 'mouseout' : function(){
            			$(this).parent().css({"background":"white"});
            		}, 'click' : function(){ // SHOP click시, 해당 SHOP 상세정보가 하위에 표시
            			var shopNo = $(this).parent().children("#sNo").html();
                        console.log(shopNo); 
            		});
        	});  */
        
        	// 동적 대상 function 주기
        	$(function(){ 
        		$(document).on('mouseenter', '#shop_table2 td', function(){
        			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
        		}).on('mouseout', '#shop_table2 td', function(){
        			$(this).parent().css({"background":"white"});
        		});             		
        	});
        	
        	// 정렬하기
        	$("#sortCondition").change(function(){
        		var sort = this.value;
        		
        		$.ajax({
        			url : "<%= contextPath %>/sortShop.adm",
        			type : "post",
        			dataType : "json",
        			data : {sort:sort},// key:value 
        			success : function(data){
        				console.log('성공');
        				console.log(sort);
        				var $tableBody = $("#shop_table2");
        				
        				//$tableBody.empty();
        				$tableBody.html(""); // 테이블 초기화
        			
        				for(var key in data){
              				var $tr = $("<tr>");
            				var $noTd = $("<td>").text(data[key].shopNo);
            				var $nameTd = $("<td>").text(data[key].shopName);
							var $statusTd = $("<td>").text(data[key].status);
							var $gradeTd = $("<td>").text(data[key].shopGradeCode);
							var $contdTd = $("<td>").text(data[key].contractDate);
							var $exdTd = $("<td>").text(data[key].expireDate);
							var $contmTd = $("<td>").text(data[key].contractMoney);
							var $shopcTd = $("<td>").text(data[key].shopContact);
            				
							$tr.append($noTd);
							$tr.append($nameTd);
							$tr.append($statusTd);
							$tr.append($gradeTd);
							$tr.append($contdTd);
							$tr.append($exdTd);
							$tr.append($contmTd);
							$tr.append($shopcTd);
							
							$tableBody.append($tr);

        				}
        				
        			},
        			error : function(){
        				console.log('실패');
        			}
        		});
        	});
        	
        	// 상세보기 
        	$(function(){ 
        		$(document).on('click', '#shop_table2 td', function(){
        			        	
                    var shopNo = $(this).parent().children("#sNo").html();
                    // console.log("shopNo="+shopNo); // ok
                    
                    $.ajax({
                        url: "<%= contextPath %>/detailShop.adm",
                        data: {shopNo : shopNo},
                        type: "get",
                        dataType: "json",
                        success : function(result){ 
        					console.log("ajax 연동성공");
                        	// console.log(result);
        	           		$("#shop_detail").css({"visibility":"visible"});

        	           		var detail = "";

        	           		detail += "<h4 class='shop_detail_title'>쇼핑몰 상세보기</h4><div id='shop_detail_contents'><div>회사번호 : " + result.shopNo + "</div>" +
                                     "<div>회사명 : " + result.shopName + "</div>" +
                                     "<div>계약상태 : " + result.status + "</div>" +
                                     "<div>등급 : " + result.shopGradeCode + "</div>" + 
                                     "<div>계약시작일 : " + result.contractDate + "</div>" +
                                     "<div>계약만료일 : " + result.expireDate + "</div>" +
                                     "<div>계약금 : " + result.contractMoney + "</div>" +
                                     "<div>담당자 : " + result.shopPIC + "</div>" +
                                     "<div>연락처 : " + result.shopContact + "</div></div>" +
                                     "<div class='btnArea'><button type='button' id='delete_btn' onclick='deleteShop();' style='margin-right : 5%;'>쇼핑몰삭제</button>" +
                                     "<button type='button' id='update_btn' onclick='updateShop();' style='margin-right : 2%;'>쇼핑몰수정</button></div>" +
                                     "<form action='' id='detailForm' method='post'><input type='hidden' name='shopNo' value='"+result.shopNo+"'></form>";
                                     
                            console.log(detail);
                            console.log(result.shopNo);

        	           		$("#shop_detail").html(detail);
        	           		
        	           		// console.log($('#shop_detail').html());
        				
                        },
                        error: function() {
                            console.log("ajax 연동실패");
                        }
                    });
                });
            });
        	

        	// 검색하기
        	$(function(){
        			$(document).on('click', "#searchBtn", function(){
        				var sort = $("#searchCondition").val();
        				var keyword = $("#searchKeyword").val();
        				
        				console.log(sort);
        				console.log(keyword);
        				
        				$.ajax({
                			url : "<%= contextPath %>/searchShop.adm",
                			type : "get",
                			dataType : "json",
                			data : {sort:sort, keyword:keyword},// key:value 
                			success : function(data){
                				console.log('성공');
                				console.log(sort);
                				var $tableBody = $("#shop_table2");
                				
                				$tableBody.html("");
                			
                				for(var key in data){
    	              				var $tr = $("<tr>");
    	            				var $noTd = $("<td>").text(data[key].shopNo);
    	            				var $nameTd = $("<td>").text(data[key].shopName);
    								var $statusTd = $("<td>").text(data[key].status);
    								var $gradeTd = $("<td>").text(data[key].shopGradeCode);
    								var $contdTd = $("<td>").text(data[key].contractDate);
    								var $exdTd = $("<td>").text(data[key].expireDate);
    								var $contmTd = $("<td>").text(data[key].contractMoney);
    								var $shopcTd = $("<td>").text(data[key].shopContact);
    	            				
    								$tr.append($noTd);
    								$tr.append($nameTd);
    								$tr.append($statusTd);
    								$tr.append($gradeTd);
    								$tr.append($contdTd);
    								$tr.append($exdTd);
    								$tr.append($contmTd);
    								$tr.append($shopcTd);
    								
    								$tableBody.append($tr);
                				}
                				
                			},
                			error : function(){
                				console.log('실패');
                			}
        			});
        		});
        		});
        	
     	</script>

		<script>
		function deleteShop() {
    		$("#detailForm").attr("action", "<%= contextPath%>/delete.shop");
    		$("#detailForm").submit();
     		/* alert("성공적으로 삭제되었습니다."); */
    	}
    	
    	function updateShop(){
    		$("#detailForm").attr("action", "<%= contextPath%>/updateForm.shop"); 
    		$("#detailForm").submit();
    	}
		</script>

		<div class="shop_detail_box" id="shop_detail">
            
        </div>

    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
</body>
</html>