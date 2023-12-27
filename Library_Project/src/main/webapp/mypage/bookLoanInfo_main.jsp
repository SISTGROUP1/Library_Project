<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../mypage/libUse.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<!-- 도서대출정보메인 -->
	<div id="box" class="mypage">
		<div class="row" id="loaninfomenu_div">
			<ul>
				<li>
					<a href="../mypage/bookloaninfo_main.do" class="active">
						대출현황
					</a>
				</li>
				<li>
					<a href="../mypage/reserveStatus.do">
						예약현황
					</a>
				</li>
				<li>
					<a href="../mypage/loanHistory.do">
						대출이력
					</a>
				</li>
				<!-- <li>
					<a href="../mypage/reserveHistory.do">
						예약이력
					</a>
				</li> -->
			</ul>
		</div>
		<div class="row">
			<jsp:include page="${loaninfo_select_jsp }"></jsp:include>		
		</div>
	</div>
</body>
</html>