<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 페이지</title>
<style type="text/css">
	.invert-filter {
    	filter: invert(100%);
	}
	.thumbnail:hover {
		background: #8ed1de !important;
		transition : background 1s !important;
	}
	.caption{
		text-align: center;
		font-size: 12px;
		font-weight: bold;
		margin-top:15px !important;
		text-decoration: none !important;
		color:black !important;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
</head>
	<body>
		<section id="one" class="wrapper"><div class="inner">
			<h3>자료 탐색</h3>
			<hr>
			<div class="flex flex-3">	
				<c:forEach var="vo" items="${list }" >
					<div class="col-md-2">
					    <div class="thumbnail" style="background-color: #ececec;cursor:pointer;">
					      <a href="../searchBook/alqResult.do?cno=${vo.cno}&cate=${vo.cate}">
				        	<img src="${vo.icon}" style="width:40px;height:40px;padding-top:5px;opacity: 40%" class="invert-filter">
					        <div class="caption" style="padding:5px 0px 0px 0px;margin:0px;">
					          	${vo.cate }
					        </div>
					      </a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</section>
	</body>
</html>