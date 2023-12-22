<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../mypage/libUse.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
		width: 25%;
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
				<li>
					<a href="../mypage/reserveHistory.do">
						예약이력
					</a>
				</li>
			</ul>
		</div>
		<div class="row">
			<jsp:include page="${loaninfo_select_jsp }"></jsp:include>		
		</div>
	</div>
</body>
</html>