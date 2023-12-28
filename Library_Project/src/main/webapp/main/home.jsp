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
		background-color: white;
	}
	section#one .inner {
		float: left;
		margin-left: 15%;
		margin-bottom: 30px;
	}
	section#one .notice{
		width: 35%;
		float: left;
		margin-right: 3%;
	}
	section#one .notice .tit p{
		margin-bottom: 0;
		display: inline-block;
		color: black;
		font-weight: bold;
		font-size: 20px;
		width: 85%;
	}
	section#one .notice .tit span{
		display: inline-block;
		padding-left: 10%;
		text-align: right;
	}
	section#one .notice .tit hr{
		border: 1.5px solid skyblue;
		margin: 3px 0;
	}
	section#one .notice ul{
		margin-bottom: 0;
	}
	section#one .notice .new_notice{
		background: url("../images/icon_noti.gif") no-repeat left top;
		padding-left: 60px;
		padding-bottom: 15px;
		margin-top: 15px;
		border-bottom: 1px solid lightgray;
	}
	section#one .notice .new_notice a{
		display: block;
		color: black;
		font-size: 20px;
		font-weight: bold;
		width: 95%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;		
	}
	section#one .notice .new_notice span{
		color: black;
	}
	section#one .notice .notice_list{
		list-style: none;
		padding: 0;
		padding-top: 15px;
	}
	section#one .notice .notice_list li{
		padding: 5px 0;
	}
	section#one .notice .notice_list li a{
		color: black;
		font-size: 16px;
		font-weight: bold;
		display: inline-block;
		width: 80%;
		padding-right: 5%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	section#one .notice .notice_list li span{
		color: black;
		font-size: 16px;
		display: inline-block;
		width: 15%;
		text-align: right;
		vertical-align: top;
	}
	/* ------------------ */
	/* 요약정보출력 */
	section#one #lib_summary_info{
		width: 24%;
		height: 30%;
		float: left;
	}
	section#one #lib_summary_info table{
		margin: 0;
		border-collapse: unset;
		color: black;
	}
	section#one #lib_summary_info td{
		background-color: white;
		padding-top: 0.3em;
		padding-bottom: 0.3em;
		font-size: 14px;
	}
	section#one #lib_summary_info td[rowspan="2"]{
		background: url("../images/banner_icon06_off.png") no-repeat top center;
		background-size: 75px 60px;
		background-color: white;
	}
	section#one #lib_summary_info .summary_date{
		font-size: 17px;
		font-weight: bold;
	}
	/* ------------------ */
	/*  */
	section#one #small_slide{
		width: 24%;
		height: 210px;
		float: left;
		background: url("../images/banner_sm1.png") no-repeat top left;
		background-size: cover;
		/* background-position: -15px 0; */
		margin-top: 10px;
		border: 1px solid skyblue;
		border-radius: 10px;
	}
	/* ------------------ */
	 a{
		text-decoration: none;
		color: black;
	}
	 div.inner{
		/* max-width: 90em; */
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<section id="one" class="wrapper">
	<div class="inner">
		<div class="notice">
		<div class="tit">
				<p>공지사항</p><span><a href="#">
					<img src="../images/plus_on.png">
				</a></span>
			</div>
			<div class="new_notice">
				<a href="#">2023년 희망 및 긴급도서 구입 마감 안내</a><span>2023-12-11</span>
			</div>
			<ul class="notice_list">
				<li>
					<a href="#">2023년 희망 및 긴급도서 구입 마감 안내</a><span>2023-12-11</span>
				</li>
				<li>
					<a href="#">도서관은 핫하다: 끄고, 도서관으로(OFF&LIBRARY) 캠페인 안내</a><span>2023-02-14</span>
				</li>
				<li>
					<a href="#">서울시 북스타트: 엄마 북(Book)돋움 책상자를 신청하세요. </a><span>2023-02-14</span>
				</li>
				<li>
					<a href="#">서울시 북스타트: 엄마 북(Book)돋움 책상자를 신청하세요. </a><span>2023-02-14</span>
				</li>
				<li>
					<a href="#">서울시 북스타트: 엄마 북(Book)돋움 책상자를 신청하세요. </a><span>2023-02-14</span>
				</li>
			</ul>
		</div>
		<div class="notice">
		<div class="tit">
				<p>보도자료</p><span><a href="#">
					<img src="../images/plus_on.png">
				</a></span>
			</div>
			<div class="new_notice">
				<a href="#">서울시민이 꼽은 올해 최고 정책은 `책읽는 서울광장·광화문 책마당`</a><span>2023-12-21</span>
			</div>
			<ul class="notice_list">
				<li>
					<a href="#">서울시민이 꼽은 올해 최고 정책은 `책읽는 서울광장·광화문 책마당`</a><span>2023-12-21</span>
				</li>
				<li>
					<a href="#">서울도서관, 세계적인 그림책 작가 `바루` 초청 `그림책으로 보는 환경 토론회` 개최</a><span>2023-12-05</span>
				</li>
				<li>
					<a href="#">서울도서관, 세계적인 그림책 작가 `바루` 초청 `그림책으로 보는 환경 토론회` 개최</a><span>2023-12-05</span>
				</li>
				<li>
					<a href="#">서울도서관, 세계적인 그림책 작가 `바루` 초청 `그림책으로 보는 환경 토론회` 개최</a><span>2023-12-05</span>
				</li>
				<li>
					<a href="#">서울도서관, 세계적인 그림책 작가 `바루` 초청 `그림책으로 보는 환경 토론회` 개최</a><span>2023-12-05</span>
				</li>
			</ul>
		</div>
		<div id="lib_summary_info">
			<table class="table">
				<tr>
					<td rowspan="2"></td>
					<td class="summary_date">2023년 12월 22일</td>
				</tr>
				<tr>
					<td>09:00&nbsp;~&nbsp;21:00</td>
				</tr>
				<tr>
					<td>대출&nbsp;:&nbsp;856권</td>
					<td>반납&nbsp;:&nbsp;751권</td>
				</tr>
				<tr>
					<td>예약&nbsp;:&nbsp;116권</td>
					<td>새로들어온책&nbsp;:&nbsp;53권</td>
				</tr>
			</table>
		</div>
		<div id="small_slide"></div>
	</div>
			</section>
			<!-- slide include -->
			<jsp:include page="../etc/slide/slide.jsp"></jsp:include>
			<!-- Three --><section id="three" class="wrapper special"><div class="inner">
					<header class="align-center"><h2>행사달력 및 도서관 현황</h2>
						<p>행사 정보를 이곳에서 확인하세요</p>
					</header><div class="flex flex-3">
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
						</article>
						
						<article>
							<div class="homeinfo_banner">
  								<div class="homeinfo_slide">
            						<a href="https://web.seoul.flybookscreen.kr/"><img src="../images/homeinfo_banner_img1.jpg" width="470px" height="350px"></a>
        						</div>
        						<div class="homeinfo_slide">
            						<a href="http://culture.seoul.go.kr"><img src="../images/homeinfo_banner_img2.jpg" width="470px" height="350px"></a>
        						</div>
        						<div class="homeinfo_slide">
            						<a href="https://news.seoul.go.kr/gov/archives/511987"><img src="../images/homeinfo_banner_img3.jpg" width="470px" height="350px"></a>
        						</div>
 							</div>
 							<script>
						        let currentSlide = 0;
						        const slides = document.querySelectorAll('.homeinfo_slide');
						        const slideCount = slides.length;
						 
						        function showSlide(n) {
						            slides.forEach(slide => slide.style.display = 'none');
						            slides[n].style.display = 'block';
						        }
						 
						        function nextSlide() {
						            currentSlide = (currentSlide + 1) % slideCount;
						            showSlide(currentSlide);
						        }
						 
						        function prevSlide() {
						            currentSlide = (currentSlide - 1 + slideCount) % slideCount;
						            showSlide(currentSlide);
						        }
						 
						        document.addEventListener('DOMContentLoaded', () => {
						            showSlide(currentSlide);
						            setInterval(nextSlide, 3000); // 1초마다 자동 슬라이드
						        });
						    </script>
						</article>
						</div>
				</div>
			</section>
</body>
</html>