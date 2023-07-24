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
<title>대출 승인</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=PT+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/loan4.css" />

<script type="text/javascript">
	
	function sendIt() {
		
		var f = document.myForm;
		

		f.action = "<%=cp%>/eggplant/loan_ok2.do";
		f.submit();
	}
</script>



<style type="text/css">
   

    body {
      font-family: Arial, sans-serif;
      
     
      padding: 0;
    }

    .container {
     width: 1000px;
  height: 600px;
      max-width: 900px;
      margin: 50px auto;
     
      padding: 20px;
      border-radius: 8px;
      
    }

    .header {
     height: 100px;
      text-align: center;
      margin-bottom: 20px;
    }

    .header h1 {
   
      font-size: 32px;
      color: #000000;
      margin: 0;
    }

    .content {
      text-align: center;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 8px;
    }

    .result {
    
    height: 150px;
      font-size: 20px;
      margin-top:50px;
      color: #333333;
    }

    .result span {
   
      color: #ff0000;
      font-weight: bold;
    }

    .button-container {
      text-align: center;
      margin-top: 20px;
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
      width: 140px;
      margin-right: 10px;
      font-size: 16px;
      font-weight: bold;
      color: #ffffff;
    
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
<form action="" method="post" name="myForm" >

<div id="container">
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


<br/>
<h1 align="center">&nbsp;대출 승인 완료</h1>
<hr color="blue" width="200">
<br/>
<br/>
<br/>


<!-- CONTENT -->
<main id="l-content">
	<div id="l-constrained">
		<div class="credit-card__container">
			<div class="credit-card">
				<div class="credit-card__header">
					<img class="ship-card" src="https://xgjzloifyvgpbmyonaya.supabase.co/storage/v1/object/public/files/7cjpV_BXbz/original" alt="ship card">
					<img class="master-card" src="https://xgjzloifyvgpbmyonaya.supabase.co/storage/v1/object/public/files/wROkdug6ax/original" alt="ship card">
				</div>
				<div class="credit-card__form">
					<form action="">
						
			<div  style="font-size: 25px;color: white; ">
			 "${dto.userId}"님의 대출 진행 결과
			 <b><span style="color: red">"${loannum}"</span></b>(원)이
			 <br/> "${param.account}" 계좌에
   			 정상적으로 입금되었습니다.<br/> "${dto.userId}"님의 누적 대출 금액은
   			 <b><span style="color: red">"${loans}"</span></b>(원)입니다.
   			 </div>
						<div class="field">
							<label for="card-holder-name">행복한 하루 보내세요!</label>
							
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	<div class="button-container">
    <input type="button" value="메인 페이지" onclick="location='<%=cp %>';">
  </div>
</main>

  
  
  
  
  
  
  
  </div>
	</div>
	
  <br/><br/><br/><br/>
  <br/><br/><br/><br/>
  <br/><br/><br/><br/>
 


  
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