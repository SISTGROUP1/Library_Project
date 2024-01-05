<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/sideBar.css">
<link rel="stylesheet" href="../assets/css/seat.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.seat_show>li{
		display:block;
		float:left;
		border:1px solid black;
		width:50%;
		text-align:center;
		height:40px;
		line-height:40px;
		font-size: 1.1em;
    	font-weight: 700;
	}
</style>
</head>
<body>
	<div class="col-sm-2">
		<div style="margin-top: 50px;">
			<div class="panel">
				<div class="panel-heading">
					<h3 class="panel-title text-center">
						<p>도서관이용</p>
					</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="../libUse/libTimeInfo.do">도서관 이용 시간</a></li>
					<li class="list-group-item"><a href="../libUse/libReserveInfo.do">대출.반납.연장.예약</a></li>
					<li class="list-group-item"><a href="../seatReserve/main.do">자리예약</a></li>
					<li class="list-group-item"><a href="../libUse/libWayInfo.do">찾아오시는길</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<section id="one" class="wrapper" style="padding:3em 0;">
			<div class="inner">
				<h4 style="color:black">자리예약</h4>
				<hr style="padding:2px;background: skyblue;">
				<div style="height:40px;">
					<ul class="seat_show">
						<li>이용 가능 좌석 0</li>
						<li>사용 중인 좌석 0</li>
					</ul>
				</div>
				
				<div style="height:20px"></div>
				<div style="height:500px;">
					<div class="seat-arrangement">
						<c:forEach var="j" begin="1" end="6" step="1">
							<ol class="seat-line">
								<c:forEach var="i" begin="${(j*16)-15 }" end="${(j*16) }" step="1">
								    <li class="seat">
								       <input type="checkbox" id="${i }"/>
								       <label for="${i }" style="padding-left:0px !important;">${i }</label>
								    </li>
							    </c:forEach>
							</ol>
						</c:forEach>
					 </div>
				</div>
				<div>
					<h1>도서관 좌석 예약</h1>
				</div>
			</div>
		</section>
	</div>
	<div class="col-sm-2">
	</div>
	<div style="clear:both;"></div>
</body>
</html>