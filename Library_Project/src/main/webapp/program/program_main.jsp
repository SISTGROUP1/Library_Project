<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../etc/sidebar/dist/style.css">
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
<aside>
  <a>
  <svg version="1.1" id="nav-btn" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
    <path id="list-view-icon" d="M462,108.857H50V50h412V108.857z M462,167.714H50v58.857h412V167.714z M462,285.429H50v58.857h412
   V285.429z M462,403.143H50V462h412V403.143z"/>
  </svg>
</a>
  <h1 id="libname">도서관 이용</h1>
  
  <nav>
    <ul>
      <li><a href="../libUse/libTimeInfo.do">공지사항</a></li>
      <li><a href="#">보도자료</a></li>
      <li><a href="#">일정 및 행사</a></li>
      <li><a href="../program/programList.do">프로그램 신청</a></li>
    </ul>
  </nav>
  
  <div class="vertical-line"></div>  
</aside>

<jsp:include page="${program_jsp }"></jsp:include>

<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
	
</body>
</html>