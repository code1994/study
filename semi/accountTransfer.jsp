<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계좌이체</title>

<script type="text/javascript">

function sendIt(){
	
	var f = document.myForm;
	
	if(!f.bank.value){
		alert("은행을 선택해주세요.");
		f.bank.focus();
		return;
	}
	
	if(!f.accountNum.value){
		alert("계좌번호를 입력해 주세요.");
		f.accountNum.focus();
		return;
	}
	
	f.action = "<%=cp %>/semi/accountTransfer_ok.jsp";
	f.submit();
	
}

function bankCheck(){
	
	var f = document.myForm;
	
	var clength = f.bankSelect.options.length;
	var cindex = f.bankSelect.selectedIndex;
	
	f.bank.value = "";
	
	if(cindex==clength){
		f.bank.readOnly = false;
	}else{
		f.bank.value = f.bankSelect.options[cindex].value;
		f.bank.readOnly = true;
	}
	
}

</script>

</head>
<body>

누구에게 보낼까요?

<br/><br/>

<form action="" method="post" name="myForm">

<input type="text" name="bank"
	placeholder ="은행선택" readonly="readonly" style="border: none; font-size: 14px"></font>
<select name="bankSelect" onchange="bankCheck();">
	<option> </option>
	<option value="카카오뱅크">카카오뱅크</option>
	<option value="신한은행">신한은행</option>
	<option value="국민은행">국민은행</option>
	<option value="기업은행">기업은행</option>
	<option value="우리은행">우리은행</option>
	<option value="하나은행">하나은행</option>
</select>

<input type="text" name="accountNum" placeholder = "계좌번호 ">

<br/><br/>

<input type="button" value=" 이체하기 " class="btn2"
		onclick="sendIt();"/>
<input type="button" value=" 취소 " class="btn2"
		onclick="location='<%=cp%>/eggplant/accountTransfer.do';"/>
<input type="button" value=" 이전으로 " class="btn2"
		onclick="location='<%=cp%>/eggplant/accountCheck.do';"/>

</form>

</body>
</html>