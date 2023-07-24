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
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/eggplant1/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/eggplant1/css/created.css"/>
<script type="text/javascript" src="<%=cp%>/eggplant1/js/util.js"></script>

<script type="text/javascript">

	function sendIt(){
	
		var f = document.myForm;
		
		str = f.userId.value;
		str = str.trim();
		if(!str){
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}	
		f.userId.value = str;
	
		str = f.userPassword.value;
		str = str.trim();
		if(!str){
			alert("패스워드를 입력하세요");
			f.userPassword.focus();
			return;
		}	
		f.userPassword.value = str;
	
		str = f.userName.value;
		str = str.trim();
		if(!str){
			alert("이름을 입력하세요");
			f.userName.focus();
			return;
		}	
		f.userName.value = str;
	
		str = f.userAddr.value;
		str = str.trim();
		if(!str){
			alert("주소를 입력하세요");
			f.userAddr.focus();
			return;
		}	
		f.userAddr.value = str;
		
		str = f.userPhoneNum.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요");
			f.userPhoneNum.focus();
			return;
		}	
		f.userPhoneNum.value = str;
		
		str = f.userEmail.value;
		str = str.trim();
		if(!str){
			alert("E-Mail주소를 입력하세요");
			f.userEmail.focus();
			return;
		}	
		f.userEmail.value = str;
		
		str = f.userBirth.value;
		str = str.trim();
		if(!str){
			alert("생년월일을 입력하세요");
			f.userBirth.focus();
			return;
		}	
		f.userBirth.value = str;
		
		
		str = f.account.value;
		str = str.trim();
		if(!str){
			alert("계좌번호를 입력하세요");
			f.account.focus();
			return;
		}	
		f.account.value = str;
		
		str = f.creditPassword.value;
		str = str.trim();
		if(!str){
			alert("계좌 비밀번호를 입력하세요");
			f.creditPassword.focus();
			return;
		}	
		f.creditPassword.value = str;
		
		alert(f.userId.value);
		
		f.action = "<%=cp %>/eggplant/created_ok.do";
		f.submit();
	}	
	
</script>
</head>
<body>

<br/><br/>

<div id="bbs">
	<div id="bbs_title">
	회원가입
	</div>

	<form action="" method="post" name="myForm">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>아&nbsp;이&nbsp;디</dt>
				<dd>
				<input type="text" name="userId" size="35" maxlength="20" class="boxTF">
				</dd>
			</dl>
		</div>
		
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
				<input type="text" name="userPassword" size="35" maxlength="20" class="boxTF">
				</dd>
			</dl>
		</div>
		
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
				<dd>
				<input type="text" name="userName" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</dt>
				<dd>
				<input type="text" name="userAddr" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화</dt>
				<dd>
				<input type="text" name="userPhoneNum" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>E-Mail주소</dt>
				<dd>
				<input type="text" name="userEmail" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>생년월일</dt>
				<dd>
				<input type="text" name="userBirth" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>계좌번호</dt>
				<dd>
				<input type="text" name="account" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
	
	<div class="bbsCreated_bottomLine">
			<dl>
				<dt>계좌비밀번호</dt>
				<dd>
				<input type="text" name="creditPassword" size="35" maxlength="50" class="boxTF">
				</dd>
			</dl>
	</div>
		
	</div>
	
	<div id="bbsCreated_footer">
	<input type="button" value=" 가입하기 " class="btn2" onclick="sendIt();"/>
	<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.userId.focus();"/>
	<input type="button" value=" 작성취소 " class="btn2" onclick="location='<%=cp%>/eggplantMain.jsp';">
	</div>	
	
	</form>

</div>

</body>
</html>
