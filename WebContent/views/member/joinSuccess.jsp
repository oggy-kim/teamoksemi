<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String userId = (String)request.getAttribute("userId");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        body {
		background: url('<%= request.getContextPath() %>/resources/images/background2.jpg') no-repeat;
		background-size : cover;
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
        .inner {
          position: relative;
        }
        .inner-container{
          width:1000px;
          height:900px;
          position:absolute;
          top:calc(45vh - 200px);
          left:calc(40vw - 200px);
          overflow:hidden;
        }
          .box{
            position:absolute;
            height:100%;
            width:100%;
            font-family:Helvetica;
            color:white;
            padding:30px 0px;
            background: rgba(100, 100, 100, 0.8);
          }
          .left {
            border:1px;
            background:rgba(128, 128, 128,0.8);
            padding: 5px;
            margin: 5px;
            margin-right: 10px;
            width: 14%;
            text-align: center;
          }
          .stylebt {
            display: inline-block;
            border:1px solid rgba(124, 122, 122,0.5);
            border-radius: 20px;
            margin: 2px; 
            padding-left: 1.5px;
             padding-right: 2px;

          }
          .stylediv {
            width: 32%;
            position:absolute;
            top:calc(60% - 200px);
            border: 2px solid rgba(119, 115, 115,0.3);
            color:black;
            font-size: 1.1em;
          }
          #submit {
            background: rgba(59, 182, 11, 0.5);
            color:white;
            border:1px;
            border-radius: 15px;
            position:absolute;
            margin-left: 40%;
            margin-top: 26%;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 5px;
            padding-bottom: 5px;
          }
          #mainbtn {
            background: rgba(59, 182, 11, 0.5);
            color:white;
            border:1px;
            border-radius: 15px;
            position:absolute;
            margin-left: 48%;
            margin-top: 26%;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 5px;
            padding-bottom: 5px;
          }
          .left {
            border:1px;
            background:rgba(128, 128, 128,0.8);
            padding: 5px;
            margin-right: 10px;
            width: 14%;
            text-align: center;
            margin-right: 25px;
            margin-top: 18px;
          }
          #age {
            color:black;
            margin-right: 18px;
          }
          #btn {
            background: rgb(38, 156, 202);
            color:white;
            border:1px;
            border-radius: 5px;
            padding-left: 2%;
            padding-right: 2%;
            padding-top: 3px;
            padding-bottom: 3px;
          }
          #stylespan {
            width:38%;
            border: 2px solid rgba(128, 128, 128,0.4);
            padding: 8px;
            padding-left: 15px;
            padding-right: 15px;
          }
         .font {
           font-size: 0.8em;
         }
         .blue {
           color:blue;
           font-weight: bold;
         }
         .pink {
           color:pink;
         }
         .skyblue {
           color:rgba(9, 192, 192, 0.7);
         }
         .green {
           color:rgba(58, 184, 106, 0.8);
         }
         #asd {
           text-decoration: line-through;
         }
         #preview {
          position:absolute;
          top:calc(50vh - 200px);
          left:calc(40vw - 200px);
         }
         td {
           padding: 7px;
         }
         /* table {
           margin: auto;
         }
         #s1 {
           margin: auto;
         } */
         
    </style>

<script>
      function appendYear(){
            var date = new Date();
            var year = date.getFullYear();
            var selectValue = document.getElementById("year");
            var optionIndex = 0;
  
      for(var i=year-100; i<=year; i++){
        selectValue.add(new Option(i),optionIndex++); 
        //  selectValue.add(new Option(i+"년",i),optionIndex++);                        
        }
  
  }


      
  </script>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	
	<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
         추가정보
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
	<section>  
<form id="updateinfo" action="<%= request.getContextPath() %>/updateinfo.me" 
	method="post" enctype="multipart/form-data" onsubmit="return addinformation();">
  	<input type="hidden" name="userId" value="<%= userId %>">
    <div class="inner-container">
        <div class="box">
          <h1 align="center">회원가입을 축하합니다.</h1>
          <br>
          
          <p align="center"><span id="asd">필수사항</span><img src=""></img> / 선택사항<img src=""></img></p>
          <p align="center">※추가정보를 선택을 하지않으면 스타일추천을 받을수없습니다</p>
          
          <label class="left">출생년도</label> <select id="year" name="year" onclick="appendYear();"> <option value="">- 선택하세요 -</option> </select> 
          <br>
          <label class="left">프로필사진</label>
          <input type="file"  id="upfile"  name="upfile"><br>
          <div id='preview'></div>

    </span><br>



    <table border="1">

      <tr>
        <td>깔끔한</td>
        <td>빈티지</td>
        <td>힙스터</td>
        <td>스트릿</td>
      </tr>
      <tr>
        <td>시크한</td>
        <td>클래식</td>
        <td>러블리</td>
        <td>펑크룩</td>
      </tr>
      <tr>
        <td>섹시한</td>
        <td>럭셔리</td>
        <td>모던시크</td>
        <td>스쿨룩</td>
      </tr>
      <tr>
        <td>귀여운</td>
        <td>캐주얼</td>
        <td>유니크</td>
        <td>댄디룩</td>
      </tr>
    </table>
    <br>
    <!-- 선호스타일 : <span id="stylechoice"></span><br>
    선호스타일 : <span id="stylechoice"></span> -->
    선호스타일 : <input type="text" id="s1" name="s1" readonly></input><br>
    선호스타일 : <input type="text" id="s2" name="s2" readonly></input>


  </div>
</div>
</div>
</div>
<button id="submit" type="submit" onclick="addinformation();">저장하기</button>
<button type="button" id="mainbtn" onclick="goMain();" >건너뛰기</button>

</form>
</section>
<script>
      //     $(".stylebt").on({'mouseenter':function(){
      //       $(this).css("background", "red");
      //   },
      //     'click':function(){
      //       $("#style1").css("background" , "red");
      // },
      //   'click':function(){
      //       $(this).off('mouseenter').off('mouseleave').css("background", "orangered").text("선택됨");
      //   }});

        // 'mouseleave':function(){
        //     $(this).css("background", "yellow");

             $("#upfile").change(function(){
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    
                    reader.onload = function(e) {
                        $('#preview').html("<img src=" + e.target.result + " width='100' height='100'>");
                    }
                    reader.readAsDataURL(this.files[0]);
                }
           });

                   $(document).ready(function() {
            $("td").on("click", function() {
              
                    // 1. 처음 선택할 때
                    if($("#s1").val() == ""){
                      $(this).css("background", "red");                       
                      $("#s1").val($(this).text());
                    // 2. 두번째 선택할 때
                    }else if($(this).text() != $("#s1").val() && $("#s1").val() != "" && $("#s2").val() == ""){
                      $("#s2").val($(this).text());
                      $(this).css("background", "red"); 
                    // 3. 두 개 다 선택 되어 있을 때
                    }else{
                      // 이미 선택 된 값을 다시 클릭 할 때
                      if($(this).text() == $("#s1").val() ){
                        $("#s1").val($("#s2").val());
                        $("#s2").val("");
                        $(this).css("background", "rgba(128, 128, 128,0.4)");
                      }else if($(this).text() == $("#s2").val()){                       
                        $("#s2").val("");
                        $(this).css("background" , "rgba(128, 128, 128,0.4)");
                      }
                    }            
            });
        });
  


             
</script>

</body>
</html>