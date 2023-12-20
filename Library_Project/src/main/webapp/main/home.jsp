<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<header class="align-center"><h2>Nunc Dignissim</h2>
						<p>Aliquam erat volutpat nam dui </p>
					</header><div class="flex flex-2">
						<article><div class="image fit">
								<img src="../images/pic01.jpg" alt="Pic 01" width="576" height="196"></div>
							<header><h3>Praesent placerat magna</h3>
							</header><p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article><article><div class="image fit">
								<img src="../images/pic02.jpg" alt="Pic 02" width="576" height="196"></div>
							<header><h3>Fusce pellentesque tempus</h3>
							</header><p>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna non comodo sodales tempus.</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article></div>
				</div>
			</section>
</body>
</html>