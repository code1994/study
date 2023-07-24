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
<link rel="stylesheet" type="text/css" href="<%=cp%>/eggplant1/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/eggplant1/css/created.css"/>
<script type="text/javascript" src="<%=cp%>/eggplant1/js/util.js"></script>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		str = f.userPassword.value;
		str = str.trim();
		if(!str){
			alert("패스워드를 입력하세요.");
			f.userPassword.focus();
			return;
		}
		
		f.userPassword.value = str;
		
		
		str = f.userBirth.value;
		str = str.trim();
		if(!str){
			alert("생일을 입력하세요.");
			f.userBirth.focus();
			return;
		}
		
		f.userBirth.value = str;
		
		str = f.userPhoneNum.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요.");
			f.userPhoneNum.focus();
			return;
		}		
		f.userPhoneNum.value = str;
		
		
		f.action = "<%=cp%>/eggplant/updated_ok.do";
		f.submit();		
	}

</script>
</head>
<body>

<br/><br/>

<div id="bbs">
	<div id="bbs_title">
	회원수정
	</div>
	
<form action="" method="post" name="myForm">
<div id="bbsCreated">

	<div class="bbsCreated_bottomLine">
		<dl>
			<dt>아&nbsp;이&nbsp;디</dt>
			<dd>
			<input type="hidden" value="${dto.userId }"  name="userId">
			${dto.userId }
			</dd>
		</dl>
	</div>
		
	<div class="bbsCreated_bottomLine">
		<dl>
			<dt>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
			<dd>
			${dto.userName }
			</dd>
		</dl>
	</div>	
				
	<div class="bbsCreated_bottomLine">
		<dl>
			<dt>패스워드</dt>
			<dd>
			<input type="text" name="userPassword" size="35" 
			maxlength="20" class="boxTF" value="${dto.userPassword }" />
			</dd>
		</dl>
	</div>	
	
	<div class="bbsCreated_bottomLine">
		<dl>
			<dt>생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
			<dd>
			<input type="text" name="userBirth" size="35" 
			maxlength="50" class="boxTF" value="${dto.userBirth }"/>[YYYY-MM-DD]
			</dd>
		</dl>
	</div>		
		
		
	<div class="bbsCreated_bottomLine">
		<dl>
			<dt>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화</dt>
			<dd>
			<input type="text" name="userPhoneNum" size="35" 
			maxlength="50" class="boxTF" value="${dto.userPhoneNum }"/>
			</dd>
		</dl>
	</div>			
</div>	
	<div id="bbsCreated_footer">
	<input type="button" value=" 수정하기 " class="btn2" onclick="sendIt();"/>
	<input type="button" value=" 수정취소 " class="btn2" 
	onclick="location='<%=cp%>';">	
	</div>	
</form>
 
</div>

</body>
</html>
