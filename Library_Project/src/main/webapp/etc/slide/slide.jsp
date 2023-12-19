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
<style type="text/css">
	div.box.person{
		padding: 0;
	}
	div.image{
		width: 100%;
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
						<hr style="background: white;height: 1px;border: 0;opacity: 0.2;">
					</header><div class="flex flex-4">
						<c:forEach var="vo" items="${programList }">
							<div class="box person" style="background-color: rgb(213,213,213);padding-bottom: 15px;">
							<div class="image">
								<img src="${vo.poster }" alt="Person 1" width="168"></div>
							<h3 style="color: black;font-size: 16px;">${fn:length(vo.title) gt 13 ? fn:substring(vo.title,0,13)+='...' : vo.title }</h3>
							<%-- <h3>${vo.title }</h3> --%>
							<!-- <p>정보 출력</p> -->
						</div>
						</c:forEach>
						<!-- <div class="box person">
							<div class="image">
								<img src="../images/program_1.jpg" alt="Person 1" width="168"></div>
							<h3>제목</h3>
							<p>정보 출력</p>
						</div>
						<div class="box person">
							<div class="image">
								<img src="../images/program_1.jpg" alt="Person 2" width="168"></div>
							<h3>제목</h3>
							<p>정보 출력</p>
						</div>
						<div class="box person">
							<div class="image">
								<img src="../images/program_1.jpg" alt="Person 3" width="168"></div>
							<h3>제목</h3>
							<p>정보 출력</p>
						</div>
						<div class="box person">
							<div class="image">
								<img src="../images/program_1.jpg" alt="Person 4" width="168"></div>
							<h3>제목</h3>
							<p>정보 출력</p>
						</div> -->
					</div>
				</div>
			
                </div>
                <div class="slide slide-2">
                	<img src="https://images.unsplash.com/photo-1522204657746-fccce0824cfd?ixlib=rb-0.3.5&s=ddc8760689fba9224d60fc5a1b031506&auto=format&fit=crop&w=750&q=80" alt="">
                </div>
                <div class="slide slide-3">
                	<img src="https://images.unsplash.com/photo-1522204605090-c9a2ae146cb3?ixlib=rb-0.3.5&s=100f74b5889eb85b11e510c8e1a5df4a&auto=format&fit=crop&w=891&q=80" alt="">
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