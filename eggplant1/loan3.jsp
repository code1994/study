<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>대출약관 확인</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />


<script>
	function check() {
		var f = document.myForm;
		
		if (!f.ok.checked) {
			alert("약관에 동의해야 진행할 수 있습니다.");
			
			return;
		}
		
		if(!f.loannum.value){
			alert("대출 희망 금액을 입력 하세요");
			f.loannum.focus();
			return;
		}
		
		if(!f.account.value){
			alert("계좌번호를 입력 하세요");
			f.account.focus();
			return;
		}
		
		
		
		f.action = "<%=cp%>/eggplant/loan_ok3.do";
		f.submit();
	}
</script>

<style>
body {
  font-family: Arial, sans-serif;
  font-size: 14px;
  margin: 0;
  padding: 0;
  
}

.container {
  max-width: 800px;
  margin: 50px auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
}

.terms {
  margin-bottom: 20px;
  text-align: center;
  font-size: 15px;
}

.terms h2 {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
  text-align: center;
}

.scrollable-content {
  max-height: 300px;
  overflow-y: scroll;
  border: 1px solid #ccc;
  padding: 10px;
  margin: 0 auto; 
  text-align: center;
  width: 900pt;
}

.scrollable-content p {
  text-align: center; 
}

.checkbox {
  text-align: center;
  height:0px;
  font-size:18px;
  margin-bottom: 0px;
 
}

.checkbox label {
  display: block;
}

.submit-button {
  text-align: center;
  
}

.submit-button button {
  background-color: rgb(102, 51, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(102, 51, 255) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;

  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
  margin-bottom: 1px;
}

.submit-button button:last-child {
  margin-right: 0;
}

/* 스크롤바 스타일 변경 */
.scrollable-content::-webkit-scrollbar {
  width: 8px; /* 스크롤바 너비 설정 */
}

.scrollable-content::-webkit-scrollbar-thumb {
  background-color: #ccc; /* 스크롤바 색상 설정 */
  border-radius: 8px; /* 스크롤바 모서리를 둥글게 설정 */
}

/* 입력창 스타일 변경 */
input[type="text"],
input[type="password"],
textarea {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px; /* 입력창 모서리를 둥글게 설정 */
  width: 100%;
  font-size: 14px;
  transition: border-color 0.3s, box-shadow 0.3s; /* 입력창에 마우스 올렸을 때 스타일 변경 효과 설정 */
}

input[type="text"]:focus,
input[type="password"]:focus,
textarea:focus {
  outline: none;
  border-color: #5c5c5c;
  box-shadow: 0 0 5px rgba(92, 92, 92, 0.5); /* 입력창에 포커스가 있을 때 스타일 변경 효과 설정 */
}

/* 버튼 스타일 변경 */
.submit-button button {
  background-color: rgb(102, 51, 255);
  padding: 10px 20px;
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
  margin-bottom: 1px;
  transition: background-color 0.3s; /* 버튼에 마우스 올렸을 때 배경색 변경 효과 설정 */
}

.submit-button button:last-child {
  margin-right: 0;
}

.submit-button button:hover {
  background-color: rgb(92, 46, 230); /* 버튼에 마우스 올렸을 때 배경색 변경 */
}
</style>
</head>
<body>
<form action="" method="post" name="myForm">

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

			<div class="textContainer">
				<div class="moveText">
				
				
				
	
	<h1>대출약관 동의</h1>
	<hr color="blue" width="200">
	
	<div class="terms">
		<h2 >약관 내용</h2>
		<div class="scrollable-content">
		<p>1.<b><span style="color: blue;"> 대출 신청자는 대출 상환에 관련된 모든 조건을 이해하고 동의합니다.</span></b></p><br>
		<p>2. 대출 신청자는 대출금 상환을 위해 매월 정해진 날짜에 일정 금액을 <b>상환</b>해야 합니다.</p><br>
		<p>3. 대출 신청자는 대출금 상환을 위해 <b>연체료</b>를 부담해야 할 수 있습니다.</p><br>
		<p>4. 대출 신청자는 대출금 상환을 위해 <b>보증인</b>을 제공해야 할 수 있습니다.</p><br>
		<p>5. 대출 신청자는 대출금 상환을 위해 은행 계좌 <b>자동이체를 동의</b>해야 할 수 있습니다.</p><br>
		<p>6. 대출 신청자는 대출금 상환을 위해 <b>추가적인 보증물</b>을 제공해야 할 수 있습니다.</p><br>
		<p>7. 대출 신청자는 대출금 상환을 위해 <b>연체 시 신용 등급에 영향</b>을 받을 수 있습니다.</p><br>
		<p>8. 대출 신청자는 대출금 상환을 위해<b> 이자와 원금을 구분</b>하여 상환해야 합니다.</p><br>
		<p>9. 대출 신청자는 대출금 상환을 위해 <b>이자율 변동에 따른 추가 비용</b>을 부담해야 할 수 있습니다.</p><br>
		<p>10. 대출 신청자는 대출금 상환을 위해 상환 계획을 세우고 준수해야 합니다.</p><br>
		<p>11. 대출 신청자는 대출금 상환을 위해 상환 기간 내에 상환을 완료해야 합니다.</p><br>
		<p>12. 대출 신청자는 대출금 상환을 위해 <b>상환 일정 변경</b>을 요청할 수 있지만,추가 비용이 발생할 수 있습니다.</p><br>
		<p>13. 대출 신청자는 대출금 상환을 위해 상환 일정 변경 시 <b>신용 등급에 영향</b>을 받을 수 있습니다.</p><br>
		<p>14. 대출 신청자는 대출금 상환을 위해  일정 변경에 대한 <b>승</b>을 받아야 합니다.</p><br>
		<p>15. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 <b>추가 서류</b>를 제출해야 할 수 있습니다.</p><br>
		<p>16. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 <b>이자율 조정</b>을 받을 수 있습니다.</p><br>
		<p>17. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 <b>추가 이자</b>를 부담해야 할 수 있습니다.</p><br>
		<p>18. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 <b>추가 비용</b>을 이해하고 동의합니다.</p><br>
		<p>19. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 모든 <b>조건을 이해</b>하고 동의합니다.</p><br>
		<p>20. 대출 신청자는 대출금 상환을 위해  일정 변경에 따른 모든 <b>비용을 부담</b>해야 합니다.</p>
		
		
		
		
		</div>
	</div>

		

	<div class="checkbox" >
		<label> <input type="checkbox" name="ok" id="agree-checkbox"><b> 위의
			약관에 동의합니다.</b>
		</label>
	</div>



	<div style="text-align: center;" >
	<b><span style="color: red">${message }</span></b>
	</div>
	
	<div style="text-align: center;  background-color: #dddff;">
		<input type="text" placeholder="대출희망금액 입력 ' - '제외" name="loannum"
			style="height: 40px;  width: 200pt; font-size: 15px; " >
			<br/><br/>
			
			<input type="text" placeholder="계좌 번호 입력" name="account"
			style="height: 40px; width: 200pt; font-size: 15px; ">
			
			
	</div>
	
	<div class="submit-button">
		<button type="button" onclick="check();">대출 진행</button>
		<button type="button" onclick="location='<%=cp%>';">대출 취소</button>
	</div>
	
	  <input type="hidden" name="userId" value="${dto.userId }"/>
	
	<input type="hidden" name="loans" value="${dto.loans }"/>
	
	</div>
			</div>
			
			</div>

<div id="pageFooter">
			<div class="content_p">
			<p>5조 조장 정상명씨의 애착인형에서 영감을 얻은 EGGPLANT BANK 입니다</p>
			<p>주소 : 강남구 테헤란로 삼원타워 4층 ITWILL 6강의실 맨뒷자리<p>
			<p>TEL : 010-0000-0000</p>
			</div>
		</div>
</div>
	

</form>

</body>

</html>