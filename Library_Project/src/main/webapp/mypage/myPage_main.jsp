<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../etc/sidebar/dist/style.css">
<style type="text/css">
	.mypage .row{
		margin: 0 auto;
		width: 950px;
		padding: 0;
	}
	.mypage form{
		float: none;
		padding: 0;
	}
	.mypage input[type="date"]{
		border: 1px solid #dbdbdb;
		background: rgba(144, 144, 144, 0.075);
		border-radius: 6px;
		padding: 0 16px;
	}
	.mypage hr{
		background:skyblue;
    	height:2px;
    	border:0;
	}
	#loaninfomenu_div ul{
		float: none;
		width: 100%;
		height: 50px;
		padding: 0;
	}
	#loaninfomenu_div ul li{
		float: left;
		width: 33%;
		height: 100%;
		padding: 0;
		border: 1px solid #EAEAEA;
	}
	#loaninfomenu_div ul li a{
		background-color: white;
		display: block;
		width: 100%;
		height: 48px;
		text-decoration: none;
		text-align: center;
		font-size: 16px;
		font-weight: 700;
		color: black;
		padding-top: 13px;
		padding-bottom: 13px;
	}
	#loaninfomenu_div ul li a:hover{
		background-color: #F3F3F3;
	}
	#loaninfomenu_div ul li a.active{
		background-color: #4374D9;
		color: white;
	}
	#searchBar select{
		display: inline-block;
		width: 150px;
	}
	#searchOp{
		width: 120px;
		float: left;
	}
	#searchBar{
		background: url("https://www.junggulib.or.kr/include/image/common/bg_pattern.png");
		padding: 15px;
	}
	#searchBar > div{
		background-color: white;
	}
	#searchBar input{
		height: 46px;
	}
	#searchBar input[type="submit"]{
		width: 90px;
		font-size: 18px;
		line-height: 0;
		padding: 0;
		font-weight: normal;
	}
</style>
</head>
<body>
<!-- 마이페이지 메인 -->
<!-- 메뉴바 include 부분 -->
<!-- 각 메뉴에 대한 jsp include 부분 -->
<aside>
  <a>
  <svg version="1.1" id="nav-btn" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
    <path id="list-view-icon" d="M462,108.857H50V50h412V108.857z M462,167.714H50v58.857h412V167.714z M462,285.429H50v58.857h412
   V285.429z M462,403.143H50V462h412V403.143z"/>
  </svg>
</a>
  <h1 id="libname">나만의도서관</h1>
  
  <nav>
    <ul>
      <li><a href="../mypage/mypage_main.do">기본정보</a></li>
      <li><a href="../mypage/bookloaninfo_main.do">도서대출정보</a></li>
      <li><a href="#">나의신청</a></li>
      <li><a href="#">회원정보수정</a></li>
    </ul>
  </nav>
  
  <div class="vertical-line"></div>  
</aside>
<jsp:include page="${mypage_jsp }"></jsp:include>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
</body>
</html>