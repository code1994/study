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
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/data/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/data/styleVideo.css"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.col-lg-12 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px
	width:100%
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}
.navbar-transparent {
	background-color: transparent;
	background: transparent;
	border-color: transparent;
}
</style>


</head>
<body onload="startMain();" id="page-body" data-spy="scroll" data-target=".navbar-fixed-top">
	<section id="main">
	<div class="sp-container">
		<div class="sp-content">
			<div class="sp-globe"></div>
			<h2 class="frame-1">힘들어</h2>
			<h2 class="frame-2">죽을 것 같아요</h2>
			<h2 class="frame-3">이제 그만</h2>
			<h2 class="frame-4">집가고싶다</h2>
			<h2 class="frame-5">
				<span>집,</span>
				<span>휴식,</span>
				<span>그리고 침대.</span>
			</h2>
		</div>
	</div>
	<div class="scroll-downs">
		<div class="mousey">
			<div class="scroller"><p class="scroller-text">scroll<p></div>
		</div>
	</div>
	<video id="video_p" class="video-js vjs-default-skin" preload="auto" autoplay loop muted> 
	<source src="<%=cp%>/eggPlantBank/videos/2.mp4" type="video/mp4" /> </video>
	</section>
	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-transparent navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
			
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
            <header id="header" class="menu hidden">
            <div class="hbody"> <img src="<%=cp%>/image/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" />
				<ul id="menu">
					<li class="menu_item1 title-li"><a href="<%=cp %>/eggplant/accountCheck.do" class="link">뱅킹</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/loan.do" class="link">상품서비스</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/" class="link">환율</a></li>
					<li class="menu_item1"><a href="<%=cp %>/eggplant/" class="link">고객센터</a></li>
					<c:if test="${empty customInfo}">
					<li class="menu_item2"><a href="<%=cp %>/eggplant/login.do" class="link">로그인</a></li>
					</c:if>
					<c:if test="${not empty customInfo}">
					<li class="menu_item3">${customInfo.userName}님 환영합니다.</li>
					</c:if>
				</ul>
				</div>
				</header>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Section -->
    <section id="intro" class="intro-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

				<div class="textContainer">
					<div class="moveText">

						<div class='console-container'>
							<span id='text'>안녕하십니까.</span>
							<div class='console-underscore' id='console'></div>
						</div>

					</div>
				</div>


			</div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="row">
                <div class="contact-text">
                    <h1>About Section</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
  <section id="service">
    <div class="services-content">
  <div class="services-item">
    <h3>Item 1</h3>
    <p>This is the content of Item 1</p>
    <img src="<%=cp %>/image/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 2</h3>
    <p>This is the content of Item 2</p>
      <img src="<%=cp %>/image/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 3</h3>
    <p>This is the content of Item 3</p>
      <img src="<%=cp %>/image/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 4</h3>
    <p>This is the content of Item 4</p>
      <img src="<%=cp %>/image/aa.png" alt="Image 1">
  </div>
</div>
</section>

    <!-- Contact Section -->
<section id="contact" class="contact-section">
    <div class="row">
      <div class="contact-text">
        <h1>Contact Section</h1>
      </div>
    </div>

    <!-- 추가: 이미지와 효과를 주기 위한 스타일 -->
    <div class="contact-content">
      <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 1">
        <div class="overlay">
          <h3>Image 1</h3>
          <p>Description for Image 1</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 2">
        <div class="overlay">
          <h3>Image 2</h3>
          <p>Description for Image 2</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 3">
        <div class="overlay">
          <h3>Image 3</h3>
          <p>Description for Image 3</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 4">
        <div class="overlay">
          <h3>Image 4</h3>
          <p>Description for Image 4</p>
        </div>
      </div>
       <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 4">
        <div class="overlay">
          <h3>Image 4</h3>
          <p>Description for Image 5</p>
        </div>
      </div>
       <div class="contact-item">
        <img src="<%=cp %>/image/aa.png" alt="Image 4">
        <div class="overlay">
          <h3>Image 4</h3>
          <p>Description for Image 6</p>
        </div>
      </div>
  </div>
</section>

<script src="http://vjs.zencdn.net/c/video.js"></script>
<script src="<%=cp%>/data/eggplant.js"></script>

<script type="text/javascript">

function startMain() {
	window.scrollTo(0, 0);
}

let wheelLocked = false;
let idx = 0;
let m = -100;
function moveIDx(m){
	let idLength = ['main', 'intro', 'about', 'service', 'contact'];
	  if (idLength.length - 1 < idx) {
	    idx = idLength.length - 1;
	  }
	  let targetPosition = document.querySelector('#' + idLength[idx]).offsetTop
		window.scrollTo({ top: (targetPosition), left: 0, behavior: 'smooth' });
		
	}

	window.addEventListener("wheel", function(e) {
		   // 휠 잠금 상태인 경우 이벤트를 무시
	      if (wheelLocked) {
	    	e.preventDefault();
	        return;
	      }
			
	      if (e.deltaY === -100) {
	    	  // 휠 위로 
	    	  wheelLocked = true;
	        idx--;
	    	m = 100;
	      } else if (e.deltaY === 100) {
	    	  // 휠 아래로
	    	  wheelLocked = true;
	        idx++;
	    	m = -100;
	      }

	      if (idx < 0) {
	        idx = 0;
	      }
	      // 예시로 moveIDx 함수를 호출하고 idx 값을 전달하는 로직을 넣습니다.
	      moveIDx(m);

	      // 휠 이벤트 핸들러에서 휠 동작을 잠시 잠금

	      setTimeout(() => {
	        wheelLocked = false;
	      }, 500);

	},{ passive: false });
	

</script>

</body>
</html>
