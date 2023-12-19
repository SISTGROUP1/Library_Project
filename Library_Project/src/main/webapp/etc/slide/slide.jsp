<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/slide.css">
<script type="text/javascript" src="../assets/js/slide.js"></script>
<script type="text/javascript">
	$(function() {
		$('#link').click(function() {
			$(location).attr('href','../program/programList.do');
		});
	});
</script>
<style type="text/css">
	div.box.person{
		padding: 0;
	}
	div.image{
		width: 100%;
	}
	header{
		position: relative;
	}
	#link{
		position: absolute;
		right: 0;
		bottom: 0;
		cursor: pointer;
		font-size: 50px;
		padding: 0;
	}
</style>
</head>
<body>
<section id="two" class="wrapper style1 special" style="height: 800px;padding-top: 0;">
			<div class="slider">
        <div class="slide-viewer" style="height: 800px;">
            <div class="slide-group">
                <div class="slide slide-1">
                	<div class="inner">
					<header><h2>독서 문화 프로그램</h2>
						<span id="link">+</span>
						<hr style="background: white;height: 1px;border: 0;opacity: 0.2;">
					</header><div class="flex flex-4">
						<c:forEach var="vo" items="${programList }">
							<div class="box person" style="background-color: rgb(213,213,213);padding-bottom: 15px;">
							<div class="image">
								<img src="${vo.poster }" alt="Person 1" width="168"></div>
							<h3 style="color: black;font-size: 16px;">${fn:length(vo.title) gt 13 ? fn:substring(vo.title,0,13)+='...' : vo.title }</h3>
						</div>
						</c:forEach>
					</div>
				</div>
                </div>
                <div class="slide slide-2">
                	<div class="inner">
					<header><h2>독서 문화 프로그램</h2>
						<span id="link">+</span>
						<hr style="background: white;height: 1px;border: 0;opacity: 0.2;">
					</header><div class="flex flex-4">
						<c:forEach var="vo" items="${programList }">
							<div class="box person" style="background-color: rgb(213,213,213);padding-bottom: 15px;">
							<div class="image">
								<img src="${vo.poster }" alt="Person 1" width="168"></div>
							<h3 style="color: black;font-size: 16px;">${fn:length(vo.title) gt 13 ? fn:substring(vo.title,0,13)+='...' : vo.title }</h3>
						</div>
						</c:forEach>
					</div>
				</div>
                </div>
                <div class="slide slide-3">
                	<div class="inner">
					<header><h2>독서 문화 프로그램</h2>
						<span id="link">+</span>
						<hr style="background: white;height: 1px;border: 0;opacity: 0.2;">
					</header><div class="flex flex-4">
						<c:forEach var="vo" items="${programList }">
							<div class="box person" style="background-color: rgb(213,213,213);padding-bottom: 15px;">
							<div class="image">
								<img src="${vo.poster }" alt="Person 1" width="168"></div>
							<h3 style="color: black;font-size: 16px;">${fn:length(vo.title) gt 13 ? fn:substring(vo.title,0,13)+='...' : vo.title }</h3>
						</div>
						</c:forEach>
					</div>
				</div>
                </div>
            </div>
        </div>
        <div class="slide-nav">
            <div class="prev"></div>
            <div class="next"></div>
        </div>
        <div class="slide-buttons"></div>
    </div>
    </section>
</body>
</html>
<!-- 
	
 -->