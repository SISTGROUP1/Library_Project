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