<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Responsive Side Bar Website</title>
  <link rel="stylesheet" href="./userstyle.css">

</head>
<body>
<!-- partial:index.partial.html -->
<aside>
  <a>
  <svg version="1.1" id="nav-btn" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
    <path id="list-view-icon" d="M462,108.857H50V50h412V108.857z M462,167.714H50v58.857h412V167.714z M462,285.429H50v58.857h412
   V285.429z M462,403.143H50V462h412V403.143z"/>
  </svg>
</a>
  <h1>로그인</h1>
  
  <section>
    <ul>
      <li><a href="./login.do">로그인</a></li>
      <li><a href="./userjoin.do">회원가입</a></li>
      <li><a href="./idPwd.do">아이디/비번 찾기</a></li>
    </ul>
  </section>
  
  <div class="vertical-line"></div>
</aside>

	<jsp:include page="${login_jsp }"></jsp:include>
	<jsp:include page="${userjoin_jsp}"></jsp:include>
	<jsp:include page="${idPwd_jsp}"></jsp:include>

</body>
</html>
