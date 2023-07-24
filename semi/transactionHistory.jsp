<%@page import="com.eggplant.EggplantDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래내역</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/data/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/data/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/semi/transactionHistorySearch.jsp"/>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<script type="text/javascript">

	function inputNumberWithComma(str) {
	
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, ",");
	}
	
</script>

<script>

    function toggleContent() {
      var contentDiv = document.getElementById("content");
      if (contentDiv.style.display === "none") {
        contentDiv.style.display = "block";
      } else {
        contentDiv.style.display = "none";
      }
    }
    
</script>

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
	<td align="left">
		<font color="#333D4B" style="font-size:25pt; font-family:'NanumSquareExtraBold';">계좌내역</font>
	</td>
</tr>
</table>

<table border="0" bordercolor="black" width="450" height="30" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td align="left" valign="top">
		<font color="#BCA6F8"  style="font-size:15pt; font-family:'NanumSquareAcr';">${account }</font>
	</td>
</tr>
</table>
<br/><br/><br/>


<table border="0" bordercolor="black" width="470" height="30" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td align="left">
		<img src="<%=cp %>/image/searchIcon.png" width="40" onclick="toggleContent()" style="cursor: pointer;">
	</td>
</tr>
<tr>
	<td>
		<div id="content" style="display: none;">

		<table border="1" cellpadding="0" cellspacing="0" width="400">
		<tr>
			<td>
				<font style="font-family:'NanumSquareAcr';">
				<input type="text" name="search" placeholder="검색할 내용을 입력해주세요."
					size="40" style="border: none;">
				</font>
			</td>
		</tr>
		</table>
		
		<br/>
		
		<input type="submit" value="검색" class="custom-btn2 btn-2";
						onclick="javascript: from.action='/semi/transactionHistorySearch.jsp';"/>

		</div>
	</td>
</tr>
</table>

<br/>

<c:choose>
	<c:when test="${lists2.size()==0 }">
		<font size="3pt" style="font-family:'NanumSquareAcr';">
		<br/><br/><br/><br/>거래내역이 없습니다.</font>
	</c:when>
	
	<c:otherwise>
	<c:forEach var="dto" items="${lists2 }">
	
	<table border="0" bordercolor="black" width="450" height="80" cellpadding="0" cellspacing="0"
			style="margin: auto;">
		
	<tr>
		<td align="left" colspan="2" valign="bottom">
			<font color="#929DA7" style="font-size:11pt; font-family:'NanumSquareAcr';">${dto.transactionsDate }</font>
		</td>
	</tr>
	<tr>
		<td align="left">
			<font color="#4E5968" style="font-size:16pt; font-family:'NanumSquareExtraBold';">${dto.whereuse }&nbsp;&nbsp;&nbsp;</font>
		</td>
		
		<c:if test="${dto.inout < 0}">
			<td align="right" width="200">
				<font color="#1841FF" style="font-size:16pt; font-family:'NanumSquareExtraBold';">
				<fmt:formatNumber value="${dto.inout}" />원
				</font> 
			</td>
		</c:if>
		<c:if test="${dto.inout >= 0}">
			<td align="right" width="200">
				<font color="#F50C4C" style="font-size:16pt; font-family:'NanumSquareExtraBold';">
				<fmt:formatNumber value="${dto.inout}" />원
				</font>
			</td>
		</c:if>
		
		
	</tr>
	<tr>
		<td colspan="2" align="right" valign="top">
			<font color="#929DA7" style="font-size:11pt; font-family:'NanumSquareAcr';"><fmt:formatNumber value="${dto.savings }" />원</font>
		</td>
	</tr>
	</table>
	
	<br/>
		
	<table width="450" border="0.5" cellspacing="0" cellpadding="0" style="margin-left: 10px">
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

	</form>
<script src="../eggPlantBank/data/util.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>

</body>
</html>