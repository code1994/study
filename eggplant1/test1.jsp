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

<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">

.sp-container {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	z-index: 0;
}
.sp-content {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	z-index: 1000;
}
.sp-container h2 {
	position: absolute;
	top: 50%;
	line-height: 100px;
	height: 90px;
	margin-top: -50px;
	font-size: 90px;
	width: 100%;
	text-align: center;
	color: transparent;
	-webkit-animation: blurFadeInOut 3s ease-in backwards;
	-moz-animation: blurFadeInOut 3s ease-in backwards;
	-ms-animation: blurFadeInOut 3s ease-in backwards;
	animation: blurFadeInOut 3s ease-in backwards;
}
.sp-container h2.frame-1 {
	-webkit-animation-delay: 0s;
	-moz-animation-delay: 0s;
	-ms-animation-delay: 0s;
	animation-delay: 0s;
}
.sp-container h2.frame-2 {
	-webkit-animation-delay: 3s;
	-moz-animation-delay: 3s;
	-ms-animation-delay: 3s;
	animation-delay: 3s;
}
.sp-container h2.frame-3 {
	-webkit-animation-delay: 6s;
	-moz-animation-delay: 6s;
	-ms-animation-delay: 6s;
	animation-delay: 6s;
}
.sp-container h2.frame-4 {
	font-size: 200px;
	-webkit-animation-delay: 9s;
	-moz-animation-delay: 9s;
	-ms-animation-delay: 9s;
	animation-delay: 9s;
}
.sp-container h2.frame-5 {
	-webkit-animation: none;
	-moz-animation: none;
	-ms-animation: none;
	animation: none;
	color: transparent;
	text-shadow: 0px 0px 1px #fff;
}
.sp-container h2.frame-5 span {
	-webkit-animation: blurFadeIn 3s ease-in 12s backwards;
	-moz-animation: blurFadeIn 1s ease-in 12s backwards;
	-ms-animation: blurFadeIn 3s ease-in 12s backwards;
	animation: blurFadeIn 3s ease-in 12s backwards;
	color: transparent;
	text-shadow: 0px 0px 1px #fff;
}
.sp-container h2.frame-5 span:nth-child(2) {
	-webkit-animation-delay: 13s;
	-moz-animation-delay: 13s;
	-ms-animation-delay: 13s;
	animation-delay: 13s;
}
.sp-container h2.frame-5 span:nth-child(3) {
	-webkit-animation-delay: 14s;
	-moz-animation-delay: 14s;
	-ms-animation-delay: 14s;
	animation-delay: 14s;
}
.sp-globe {
	position: absolute;
	width: 282px;
	height: 273px;
	left: 50%;
	top: 50%;
	margin: -137px 0 0 -141px;
	background: transparent url(http://web-sonick.zz.mu/images/sl/globe.png) no-repeat top left;
	-webkit-animation: fadeInBack 3.6s linear 14s backwards;
	-moz-animation: fadeInBack 3.6s linear 14s backwards;
	-ms-animation: fadeInBack 3.6s linear 14s backwards;
	animation: fadeInBack 3.6s linear 14s backwards;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
	filter: alpha(opacity=30);
	opacity: 0.3;
	-webkit-transform: scale(5);
	-moz-transform: scale(5);
	-o-transform: scale(5);
	-ms-transform: scale(5);
	transform: scale(5);
}
/**/

@-webkit-keyframes blurFadeInOut {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-webkit-transform: scale(1.3);
	}
	20%, 75% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-webkit-transform: scale(1);
	}
	100% {
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		-webkit-transform: scale(0);
	}
}
@-webkit-keyframes blurFadeIn {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-webkit-transform: scale(1.3);
	}
	50% {
		opacity: 0.5;
		text-shadow: 0px 0px 10px #fff;
		-webkit-transform: scale(1.1);
	}
	100% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-webkit-transform: scale(1);
	}
}
@-webkit-keyframes fadeInBack {
	0% {
		opacity: 0;
		-webkit-transform: scale(0);
	}
	50% {
		opacity: 0.4;
		-webkit-transform: scale(2);
	}
	100% {
		opacity: 0.2;
		-webkit-transform: scale(5);
	}
}
@-webkit-keyframes fadeInRotate {
	0% {
		opacity: 0;
		-webkit-transform: scale(0) rotate(360deg);
	}
	100% {
		opacity: 1;
		-webkit-transform: scale(1) rotate(0deg);
	}
}
/**/

@-moz-keyframes blurFadeInOut {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-moz-transform: scale(1.3);
	}
	20%, 75% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-moz-transform: scale(1);
	}
	100% {
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		-moz-transform: scale(0);
	}
}
@-moz-keyframes blurFadeIn {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-moz-transform: scale(1.3);
	}
	100% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-moz-transform: scale(1);
	}
}
@-moz-keyframes fadeInBack {
	0% {
		opacity: 0;
		-moz-transform: scale(0);
	}
	50% {
		opacity: 0.4;
		-moz-transform: scale(2);
	}
	100% {
		opacity: 0.2;
		-moz-transform: scale(5);
	}
}
@-moz-keyframes fadeInRotate {
	0% {
		opacity: 0;
		-moz-transform: scale(0) rotate(360deg);
	}
	100% {
		opacity: 1;
		-moz-transform: scale(1) rotate(0deg);
	}
}
/**/

@keyframes blurFadeInOut {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		transform: scale(1.3);
	}
	20%, 75% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		transform: scale(1);
	}
	100% {
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		transform: scale(0);
	}
}
@keyframes blurFadeIn {
	0% {
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		transform: scale(1.3);
	}
	50% {
		opacity: 0.5;
		text-shadow: 0px 0px 10px #fff;
		transform: scale(1.1);
	}
	100% {
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		transform: scale(1);
	}
}
@keyframes fadeInBack {
	0% {
		opacity: 0;
		transform: scale(0);
	}
	50% {
		opacity: 0.4;
		transform: scale(2);
	}
	100% {
		opacity: 0.2;
		transform: scale(5);
	}
}
@keyframes fadeInRotate {
	0% {
		opacity: 0;
		transform: scale(0) rotate(360deg);
	}
	100% {
		opacity: 1;
		transform: scale(1) rotate(0deg);
	}
}

/* Services Section의 내용을 세로로 정렬 */
.contact-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-top: 40px;
}

.contact-item {
  position: relative;
  width: calc(50% - 10px); /* 4등분으로 바둑판 배열을 만들기 위해 25% 너비로 설정 */
  margin-bottom: 20px;
  border-radius: 5px;
  overflow: hidden;
}

.contact-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 5px;
  cursor: pointer;
  transition: transform 0.3s;
}

.contact-item:hover img {
  transform: scale(1.1);
}

.overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.7);
  padding: 10px;
  color: #fff;
  text-align: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.contact-item:hover .overlay {
  opacity: 1;
}


.services-content {
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 4등분 */
  height: 100vh; /* 화면의 높이를 차지하도록 설정 */
}

/* 각 서비스 아이템의 스타일 */
.services-content {
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* 가로로 4등분 */
  gap: 20px; /* 아이템 간격 설정 */
  height: 90vh; /* 화면의 높이를 차지하도록 설정 */
}

.services-item {
  position: relative;
  overflow: hidden;
  text-align: center;
  transition: transform 0.3s;
}

.services-item img {
  width: 100%;
  height: 80%;
  object-fit: cover;
  cursor: pointer;
}

.services-item:hover {
  transform: scale(1.1);
}

.overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.7);
  padding: 10px;
  color: #fff;
  text-align: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.services-item:hover .overlay {
  opacity: 1;
}

body {
    width: 100%;
    height: 100%;
}

html {
    width: 100%;
    height: 100%;
}

.navbar-transparent {
   background-color: transparent;
   background: transparent;
   border-color: transparent;
}

@media(min-width:767px) {
    .navbar {
    padding: 20px 0;
    -webkit-transition: background .5s ease-in-out,padding .5s ease-in-out;
    -moz-transition: background .5s ease-in-out,padding .5s ease-in-out;
    transition: background .5s ease-in-out,padding .5s ease-in-out;
}

    .top-nav-collapse {
        padding: 0;
    }
}



.intro-section {
    height: 100%;
    padding-top: 150px;
    text-align: center;
    background: #fff;
}

.about-section {
    height: 100%;
    padding-top: 150px;
    text-align: center;
    background: #eee;
}

.services-section {
    height: 100%;
    padding-top: 150px;
    text-align: center;
    background: #fff;
}

.contact-section {
    height: 100%;
    padding-top: 150px;
    text-align: center;
    background: #eee;
}

.jb-box { width: 100%; height: 100% overflow: hidden;margin: 0px auto; position: relative; }
      video { width: 100%; z-index: -10; }
      .jb-text { position: absolute; top: 50%; width: 100%; }
      .jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; }

</style>


</head>
<body id="id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<div class="sp-container">
					<div class="sp-content">
						<div class="sp-globe"></div>
						<h2 class="frame-1">놀라운</h2>
						<h2 class="frame-2">자금의 변화</h2>
						<h2 class="frame-3">BUILD WITH CSS3</h2>
						<h2 class="frame-4">TEST IT!</h2>
						<h2 class="frame-5">
							<span>FORK,</span>
							<span>CHANGE,</span>
							<span>EXPERIANCE.</span>
						</h2>
					</div>
				</div>

<video class="video-js vjs-default-skin" preload="auto" autoplay loop  muted>
    <source src="http://192.168.16.28:8080/study/eggplant1/videos/2.mp4" type="video/mp4" />
  </video>

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
                <a class="navbar-brand page-scroll" href="#page-top"><img src="<%=cp %>/image1/sideLogo.png" style="width: 150px; height: 50px; display: inline-block; position: relative;" /></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
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
                
                
                
                
                
                
                    <h1>One Page Website</h1>
                    <p>I like clean code and I cannot lie</p>
                    <a class="btn btn-default page-scroll" href="#about">Click Me to Scroll Down!</a>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
   

    <!-- Services Section -->
  
    <div class="services-content">
  <div class="services-item">
    <h3>Item 1</h3>
    <p>This is the content of Item 1</p>
    <img src="<%=cp %>/image1/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 2</h3>
    <p>This is the content of Item 2</p>
      <img src="<%=cp %>/image1/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 3</h3>
    <p>This is the content of Item 3</p>
      <img src="<%=cp %>/image1/aa.png" alt="Image 1">
  </div>
  <div class="services-item">
    <h3>Item 4</h3>
    <p>This is the content of Item 4</p>
      <img src="<%=cp %>/image1/aa.png" alt="Image 1">
  </div>
</div>


    <!-- Contact Section -->
<section id="contact" class="contact-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h1>Contact Section</h1>
      </div>
    </div>

    <!-- 추가: 이미지와 효과를 주기 위한 스타일 -->
    <div class="contact-content">
      <div class="contact-item">
        <img src="<%=cp %>/image1/aa.png" alt="Image 1">
        <div class="overlay">
          <h3>Image 1</h3>
          <p>Description for Image 1</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image1/aa.png" alt="Image 2">
        <div class="overlay">
          <h3>Image 2</h3>
          <p>Description for Image 2</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image1/aa.png" alt="Image 3">
        <div class="overlay">
          <h3>Image 3</h3>
          <p>Description for Image 3</p>
        </div>
      </div>
      <div class="contact-item">
        <img src="<%=cp %>/image1/aa.png" alt="Image 4">
        <div class="overlay">
          <h3>Image 4</h3>
          <p>Description for Image 4</p>
        </div>
      </div>
    </div>
   

  </div>
</section>



</body>
</html>
