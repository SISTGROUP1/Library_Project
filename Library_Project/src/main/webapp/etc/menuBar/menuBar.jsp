<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/menubar.css">
</head>
<body>
<div class="container">
		<div style="position:relative;z-index:1;margin:0;">
			<ul class="flexnav">
				<li><a href="#">Home</a></li>
				<li>
					<a href="main.jsp">도서관이용</a>
					<ul>
						<li><a href="../libUse/libReserveInfo">도서관 이용 시간</a></li>
						<li><a href="../libUse/libTimeInfo">대출.반납.연장.예약</a></li>
						<li><a href="../libUse/seatReservation">자리 예약</a></li>
						<li><a href="../libUse/libWayInfo">찾아오시는 길</a></li>
					</ul>
				</li>
				<li><a href="#">Blog1</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
	</div>
</body>
</html>