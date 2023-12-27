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
	.board .row{
		margin: 0 auto;
		width: 1100px;
		padding: 0;
	}
	.board .board_title{
		float: none;
		margin: 0;
		padding: 0;
	}
	.board .board_title h2{
		margin: 0;
	}
	.board form{
		float: none;
		padding: 0;
	}
	.board input[type="date"]{
		border: 1px solid #dbdbdb;
		background: rgba(144, 144, 144, 0.075);
		border-radius: 6px;
		padding: 0 16px;
	}
	.board hr{
		background:skyblue;
    	height:2px;
    	border:0;
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
	<%-- <div class="container">
		<div class="col-sm-3">
			<!-- 부메뉴 -->
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="glyphicon glyphicon-leaf"></i>
						<span>신청 및 소식</span>
					</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="#">공지사항</a></li>
					<li class="list-group-item"><a href="#">보도자료</a></li>
					<li class="list-group-item"><a href="#">일정 및 행사</a></li>
					<li class="list-group-item"><a href="../program/programList.do">프로그램 신청</a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-9">
			<!-- 화면 출력 -->
			<jsp:include page="${program_jsp }"></jsp:include>
		</div>
	</div> --%>
	<!-- partial:index.partial.html -->
<!-- <aside>
  <a>
  <svg version="1.1" id="nav-btn" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
    <path id="list-view-icon" d="M462,108.857H50V50h412V108.857z M462,167.714H50v58.857h412V167.714z M462,285.429H50v58.857h412
   V285.429z M462,403.143H50V462h412V403.143z"/>
  </svg>
</a>
  <h1 id="libname">신청 및 소식</h1>
  
  <nav>
    <ul>
      <li><a href="../Board/announcement.do">공지사항</a></li>
      <li><a href="../Board/news.do">보도자료</a></li>
      <li><a href="#">일정 및 행사</a></li>
      <li><a href="../program/programList.do">프로그램 신청</a></li>
    </ul>
  </nav>
  
  <div class="vertical-line"></div>  
</aside> -->
	<div class="col-md-3">
		<ul>
      		<li><a href="../Board/announcement.do">공지사항</a></li>
      		<li><a href="../Board/news.do">보도자료</a></li>
      		<li><a href="#">일정 및 행사</a></li>
      		<li><a href="../program/programList.do">프로그램 신청</a></li>
    	</ul>
    </div>
	<div class="col-md-9">
		<jsp:include page="${program_jsp }"></jsp:include>
	</div>

<!-- partial -->
  <!-- <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script> -->
	
</body>
</html>