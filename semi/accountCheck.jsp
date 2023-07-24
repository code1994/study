<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/data/style.css" />
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<script type="text/javascript">

	function inputNumberWithComma(str) {
	
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, ",");
	}

</script>
<script type = "text/javascript" src="function.js"></script>  


</head>
<body>

	<form action="" name="myForm" method="post">
	
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


<div style="text-align: center;">

<table border="0" bordercolor="black" width="450" height="40" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td align="left" valign="bottom">
		<font color="#333D4B" style="font-size:25pt; font-family:'NanumSquareExtraBold';">계좌조회</font>
	</td>
</tr>
</table>

<table border="0" bordercolor="black" width="450" height="30" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td align="right" width="100">
		<font color="#BCA6F8" style="font-size:17pt; font-family: 'NanumSquareAcr';">${sessionScope.customInfo.userName }</font>
	</td>
	<td align="left">
		<font color="#8B95A1" style="font-size:17pt; font-family: 'NanumSquareAcr';">님</font>
	</td>
</tr>
</table>
<br/><br/><br/><br/>

<c:choose>

	<c:when test="${lists.size()==0 }">
		<font size="3pt" style="font-family:'NanumSquareAcr';">
		<br/><br/><br/><br/>등록된 계좌가 없습니다.</font>
	</c:when>
	
	<c:otherwise>
	<c:forEach var="dto" items="${lists }">
	
		<table border="0" bordercolor="black" width="450" height="80" cellpadding="0" cellspacing="0"
			style="margin: auto;">
		
		<tr>
			<td align="left" valign="bottom">
				<font color="#929DA7" style="font-size:11pt; font-family:'NanumSquareAcr';">${dto.account }</font>
			</td>
			<td align="right" valign="bottom">
			
			
			<input type="button" value="대출" class="custom-btn btn-1";
						onclick="location='<%=cp%>/eggplant/loan.do';"/>
			
				<input type="button" value="거래내역" class="custom-btn btn-1";
						onclick="location='<%=cp%>/eggplant/transactionHistory.do?account=${dto.account }';"/>
				<input type="button" value="이체" class="custom-btn btn-1";
						onclick="location='<%=cp%>/eggplant/accountTransfer.do';"/>
			</td>
		</tr>
		<tr>
			<td rowspan="2" align="left">
				<font color="#4E5968" style="font-size:16pt; font-family:'NanumSquareExtraBold';"><fmt:formatNumber value="${dto.savings }" />원</font>
			</td>
		</tr>
		</table>
		
		<br/>
		  
		
		<table width="450" border="0.5" cellspacing="0" cellpadding="0">
		<tr><td height="1" bgcolor="#B7C5D1" align="center"></td></tr>
		</table>
		
		<br/>
	
	</c:forEach>
	</c:otherwise>
	
</c:choose>
	
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
<input type="hidden" name="userId" value="${sessionScope.customInfo.userId }">
	</form>
<script src="../eggPlantBank/data/util.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
</body>
</html>