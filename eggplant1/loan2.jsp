<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대출 자격 평가</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />

<script type="text/javascript">
function sendIt() {
	
	var f = document.myForm;
	

	f.action = "<%=cp%>/eggplant/loan_ok2.do";
	f.submit();
}
	
</script>



<style type="text/css">

body{
  
  display:flex;
  justify-content: center;
  align-content: center;
  min-hight: 100vh;
}
.image-card {background-color: white;max-width: 1140px; display: flex;}

.image-card .graphic {  flex: 0 0 518px;  overflow: hidden;display: flex;}
.image-card .graphic img {  width: 380pt; height: 250pt;object-fit: cover;}

.image-card .content { width:550pt; flex-direction: column; padding: 57px;  background-color: white; }



.container {
  max-width: 800px;
  margin: 30px auto;
  padding: 1px;
 
  border: none;
  
}

.header {
  text-align: center;
  height:0px;
  margin-bottom: 0px;
}

.header h1 {
  font-size: 30px;
  margin-top: 1px;
  color: #000000;
}

.content {
border:none;
	margin-top: 1px;
  text-align: center;
}

.subtitle {
border:none;
  font-size: 13pt;
  margin-bottom: 1px;
 
}

.subtitle span {
  display: block;
  color: red;
}

.image-container {
  margin-bottom: 1px;
  margin-top: 1px;
}

.image-container img {

  width: 700px;
  height: 490px;
}

.button-container {
  text-align: center;
}

.button-container input[type="button"] {
  background-color: rgb(102, 51, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(102, 51, 255) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;

  height: 40px;
  width: 110px;
  margin-right: 10px;
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.button-container input[type="button"]:last-child {
  margin-right: 0;
}
</style>
</head>
<body>
<form action="" method="post" name="myForm">


<div id=pageHeader>
				<section class="hbody"> 
				<img src="<%=cp %>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" />
				<ul id="menu">
					<li class="menu_item1 title-li"><a href="#" class="link">뱅킹</a>
					<div class="hidden-div">
					<ul>
						<li>인출</li>
						<li>송금</li>
						<li>테스트</li>
					</ul>
					</div>
					</li>
					<li class="menu_item1">상품서비스</li>
					<li class="menu_item1">고객센터</li>
					<li class="menu_item_space"></li>
					<li class="menu_item2">로그인</li>
				</ul>
				</section>
			</div>

 

    
    <div id="mainArticle">
    
    <h1 align="center">EggPlant 대출 정보</h1>
    <hr color="blue" width="250">
    
    <div class="image-card">

${error }

<div class="content">
    
    <p>  <c:if test="${dto.grade ne '신용불량'}">
     <h2>"${dto.userId}"님 반갑습니다!</h2>
      <font size="5">  "${dto.userName}"님의 신용 등급 평가 결과는<br/><b><span style="color: red">"${dto.grade}"입니다.</span></b><br/><br/>
       대출 한도 및 이율은 오른쪽 표를<br/> 참고해 주신 후 하단 버튼을 통해<br/> 진행 하실 수 있습니다.</font>
         </c:if></p> 
         
         <c:if test="${dto.grade eq '신용불량'}">
         <h2>"${dto.userId}"님 반갑습니다!</h2>
        <font size="5">"${dto.userName}"님의 신용 등급 평가 결과는<br/>
       <b><span style="color: red">"${dto.grade}"</span></b>입니다.<br/>
     <b><span style="color: red"> 신용 불량 등급은 대출서비스를 이용하실 수 없습니다</span></b></font>
      </c:if>
         

  </div>
  <div class="graphic">
  <img src="../eggplant1/image/555.png" alt="이미지" class="img-card"> </div>
</div>
  

			
  
   
    
    
  
      	 <div class="button-container">
      
       <c:if test="${dto.grade ne '신용불량'}">
        <input type="button" value="대출 약관 확인" onclick="sendIt();">
        <input type="button" value="대출 취소" onclick="location='<%=cp %>';">
        </c:if>
        
         
        <c:if test="${dto.grade eq '신용불량'}">
         <input type="button" value="메인 페이지" onclick="location='<%=cp %>';">
          </c:if>
          
        <input type="hidden" name="userId" value="${dto.userId}">
        <input type="hidden" name="account" value="${dto.account}">
        <input type="hidden" name="loans" value="${dto.loans}">
      </div>
			</div>
		
			
      
      
  <div id="pageFooter">
			<div class="content_p">
			<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
			<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리<p>
			<p>TEL : 010-0000-0000</p>
			</div>
		</div>
  </form>
</body>
</html>