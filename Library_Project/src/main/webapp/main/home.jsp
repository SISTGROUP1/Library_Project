<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/calendar.css">
<style type="text/css">
	/* 공지사항,보도자료 출력부분 */
	section#one {
		padding: 1.5em 0;
	}
	section#one #notice{
		width: 35%;
	}
	section#one #notice .tit p{
		margin-bottom: 0;
		display: inline-block;
		color: black;
		font-weight: bold;
		font-size: 20px;
		width: 85%;
	}
	section#one #notice .tit span{
		display: inline-block;
		padding-left: 10%;
		text-align: right;
	}
	section#one #notice .tit hr{
		border: 1.5px solid skyblue;
		margin: 3px 0;
	}
	section#one #notice ul{
		margin-bottom: 0;
	}
	section#one #notice .new_notice{
		background: url("../images/icon_noti.gif") no-repeat left top;
		padding-left: 60px;
		padding-bottom: 15px;
		margin-top: 15px;
		border-bottom: 1px solid lightgray;
	}
	section#one #notice .new_notice a{
		display: block;
		color: black;
		font-size: 20px;
		font-weight: bold;
		width: 95%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;		
	}
	section#one #notice .new_notice span{
		color: black;
	}
	section#one #notice .notice_list{
		list-style: none;
		padding: 0;
		padding-top: 15px;
	}
	section#one #notice .notice_list li{
		padding: 5px 0;
	}
	section#one #notice .notice_list li a{
		color: black;
		font-size: 16px;
		font-weight: bold;
		display: inline-block;
		width: 85%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	section#one #notice .notice_list li span{
		color: black;
		font-size: 16px;
		display: inline-block;
		width: 15%;
		text-align: right;
		vertical-align: top;
	}
	/* ------------------ */
	 a{
		text-decoration: none;
		color: black;
	}
	 div.inner{
		max-width: 90em;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<section id="one" class="wrapper" style="background-color: rgb(246,246,246);">
	<div class="inner">
		<div id="notice">
		<div class="tit">
				<p>공지사항</p><span><a href="#">
					<img src="../images/plus_on.png">
				</a></span>
			</div>
			<div class="new_notice">
				<a href="#">[목마교육도서관] 12월 8-9일 도서관 이용 자제 안내</a><span>23.12.08</span>
			</div>
			<ul class="notice_list">
				<li>
					<a href="#">[목마교육도서관] 12월 휴관일 안내</a><span>23.11.25</span>
				</li>
				<li>
					<a href="#">[목마교육도서관] 12월 휴관일 안내</a><span>23.11.25</span>
				</li>
				<li>
					<a href="#">[목마교육도서관] 12월 휴관일 안내</a><span>23.11.25</span>
				</li>
				<li>
					<a href="#">[목마교육도서관] 12월 휴관일 안내</a><span>23.11.25</span>
				</li>
				<li>
					<a href="#">[목마교육도서관] 12월 휴관일 안내</a><span>23.11.25</span>
				</li>
			</ul>
		</div>
	</div>
			</section>
			<!-- slide include -->
			<jsp:include page="../etc/slide/slide.jsp"></jsp:include>
			<!-- Three --><section id="three" class="wrapper special"><div class="inner">
					<header class="align-center"><h2>행사달력 및 도서관 현황</h2>
						<p>행사 정보를 이곳에서 확인하세요</p>
					</header><div class="flex flex-2">
						<!-- 달력 -->
						<article><div class="calendar">
  							<span>TODAY</span>				<!-- 서버날짜 들어가게 변경 예정 -->

  							<div class="calendarbox">
    							<span>수요일</span>
    							<span>12월 20일</span>
    							<span>2023</span>
  							</div>
 								</div>
							<!-- partial -->
  							<script  src="./script.js"></script>
  							<header>
  							<p class="calendar_id"><a href="#">+ 이달의 행사 정보 더보기</a></p>  <!-- # : 행사..? -->
  							<p class="calendar_id2"><a href="#">+ 이달의 휴관일 확인하기</a></p>	<!-- # : 달력 상세로 넘어가도록 -->
							</header>
						</article>
							
						<!-- 도서관 현황 -->
						<article>
							<table class="calendar_table">
								<tr>
									
									<td><img src="../images/direct01.gif">&nbsp;&nbsp;
									<a href="../libUse/libWayInfo.do">찾아오시는 길</a></td>
								</tr>
								<tr>
									<td><img src="../images/direct02.gif">&nbsp;&nbsp;
									<a href="">전화번호</a></td>
								</tr>
								<tr>
									<td><img src="../images/direct03.gif">&nbsp;&nbsp;
									<a href="https://lib.seoul.go.kr/apload/guide/libraryGuide_2023.pdf">이용 안내 리플릿</a></td>
								</tr>
								<tr>
									<td><img src="../images/direct04.gif">&nbsp;&nbsp;
									<a href="https://blog.naver.com/seoul_library">서울도서관 X 동네 책방</a></td>
								</tr>
							</table>
						</article></div>
				</div>
			</section>
</body>
</html>