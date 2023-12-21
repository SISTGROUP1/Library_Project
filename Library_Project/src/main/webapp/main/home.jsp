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
	 th,td{
		padding: 5px 10px 5px 10px !important;
		color: black;
	}
	 p.sub_hidden{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-bottom: 0;
	}
	 p.con_hidden{
		width: 300px;
		height: 125px;
		overflow-y: hidden;
		text-overflow: ellipsis;
		margin-bottom: 0;
	}
	 a{
		text-decoration: none;
		color: black;
	}
	 div.inner{
		max-width: 90em;
	}
	 #boardTable header{
		position: relative;
	}
	 span.link{
		position: absolute;
		right: 0;
		top: -25px;
		cursor: pointer;
		font-size: 50px;
		padding: 0;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.sub_hidden').mouseenter(function() {
			let sub=$(this).attr("data-sub");
			let con=$(this).attr("data-con");
			$('#sub_switch').text(sub);
			$('#con_switch').text(con);
		});
		$('#link1').click(function() {
			$(location).attr('href','../board/boardList.do');
		});
		$('#link2').click(function() {
			$(location).attr('href','../board/boardList.do');
		});
	});
</script>
</head>
<body>
<section id="one" class="wrapper" style="background-color: rgb(246,246,246);"><div class="inner">
					<div class="flex flex-2" id="boardTable">
						<article><header><h3>공지사항</h3>
							<span class="link" id="link1">+</span>
							</header>
							<table class="table">
								<c:forEach var="vo" items="${boardList }" varStatus="cnt">
									<c:if test="${cnt.first }">
										<tr>
											<th width="50%"><p class="sub_hidden" style="width: 300px;" id="sub_switch">${vo.subject }</p></th>
											<td width="35%">
												<a href="../board/boardDetail.do?no=${vo.no }">
													<p class="sub_hidden" style="width: 210px;" data-sub="${vo.subject }" data-con="${vo.content }">${vo.subject }</p>
												</a>
											</td>
											<td width="15%">${vo.dbday }</td>
										</tr>
										<tr>
											<td width="50%" rowspan="4"><p class="con_hidden" id="con_switch">${vo.content }</p></td>
									</c:if>
									<c:if test="${!cnt.first }">
										<td width="35%">
											<a href="../board/boardDetail.do?no=${vo.no }">
												<p class="sub_hidden" style="width: 210px;" data-sub="${vo.subject }" data-con="${vo.content }">${vo.subject }</p>
											</a>
										</td>
										<td width="15%">${vo.dbday }</td>
									</tr>
									</c:if>
								</c:forEach>
							</table></article>
							<article><header><h3>보도자료</h3>
							<span class="link" id="link2">+</span>
							</header>
							<table class="table">
								<c:forEach var="vo" items="${boardList }">
									<tr>
										<td width="85%"><p class="sub_hidden" style="width: 520px;">${vo.subject }</p></td>
										<td width="15%">${vo.dbday }</td>
									</tr>
								</c:forEach>
							</table></article>
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