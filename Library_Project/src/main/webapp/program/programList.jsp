<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../program/libUse.css">
<style type="text/css">
	.pro_thumbnail{
		position: relative;
		margin-bottom: 25px;
	}
	.pro_thumbnail:hover {
		border: 1px solid gray;
	}
	.pro_thumbnail::before{
		content: '손기정어린이';
		position: absolute;
		top: -20px;
		left: 48px;
		width: 160px;
		padding: 10px;
		background-color: orange;
		color: white;
		border-radius: 20px;
		text-align: center;
		font-weight: bold;
	}
	#title{
		width: 230px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
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
	.caption p:last-child {
		margin-bottom: 0;
	}
	.caption p:nth-child(2),.caption p:nth-child(3) {
		margin-bottom: 5px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div id="box">
	<form method="post" action="../program/programList.do">
	<div id="searchBar">
		<div style="padding: 15px;">
		<div>
			<select name="target" style="margin-right: 10px;line-height: 0;" class="input-lg">
				<option value="0">대상</option>
				<option value="1">영유아</option>
				<option value="2">어린이</option>
				<option value="3">청소년</option>
				<option value="4">성인</option>
				<option value="5">누구나</option>
			</select>
			<select name="status" style="line-height: 0;" class="input-lg">
				<option value="0">접수상태</option>
				<option value="0">접수중</option>
				<option value="0">접수마감</option>
				<option value="0">종료</option>
			</select>
		</div>
		<div style="margin-top: 10px;">
			<select id="searchOp" name="searchType" style="line-height: 0;" class="input-lg">
				<option value="title">프로그램명</option>
				<option value="place">장소</option>
			</select>
			<input type="text" size="15" style="float: left;width: 70%;margin-left: 10px;margin-right: 10px;line-height: 0;" name="search" class="input-lg" value="${search }">
			<input type="submit" class="btn btn-sm btn-info" value="검색">
		</div>
		</div>
	</div>
	</form>
	<div style="width: 1100px;">
		검색 항목 <font color="red">${find_cnt }</font>건
		<hr style="margin-top: 10px;">
	</div>
	<div class="row" style="margin-top: 30px;">
		<c:forEach var="vo" items="${list }">
			<div class="col-md-3">
    			<div class="thumbnail pro_thumbnail">
	      			<a href="../program/programDetail_before.do?pno=${vo.pno }" style="text-decoration: none;">
	        			<img src="${vo.poster }" style="width:100%;height: 300px;">
	        			<div class="caption">
	          				<p style="font-size: 20px;font-weight: bold;" id="title">${vo.title }</p>
	          				<p class="text-center">${vo.target1 }</p>
	          				<c:if test="${vo.edu1_str eq vo.edu2_str }">
	          					<p class="text-center" style="font-size: 16px;">${vo.edu1_str }</p>
	          				</c:if>
	          				<c:if test="${vo.edu1_str ne vo.edu2_str }">
	          					<p class="text-center" style="font-size: 16px;">${vo.edu1_str } ~ ${vo.edu2_str }</p>
	          				</c:if>
	          				<p class="text-center" style="font-size: 16px;">모집정원 : ${vo.capacity }</p>
	        			</div>
	      			</a>
    			</div>
  			</div>
		</c:forEach>
	</div>
	<div style="height: 20px;"></div>
	<div>
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${startBlockNum>1 }">
					<li><a href="../program/programList.do?page=${curpage gt 1 ? startBlockNum-1 : curpage }&target=${target }&searchType=${searchType }&search=${search }">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startBlockNum }" end="${endBlockNum }">
					<li ${curpage eq i ? "class=active" : "" }><a href="../program/programList.do?page=${i }&target=${target }&searchType=${searchType }&search=${search }">${i }</a></li>
				</c:forEach>
				<c:if test="${endBlockNum<totalpage }">
					<li><a href="../program/programList.do?page=${curpage lt totalpage ? endBlockNum+1 : curpage }&target=${target }&searchType=${searchType }&search=${search }">&gt;</a></li>
				</c:if>
			</ul> 
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div>
		<h3 class="text-left">최근 방문</h3>
		<hr>
		<div style="width: 100%;height: 150px;" id="leastList">
		<c:if test="${cList_size eq 0 }">
			<h3>방문 기록이 없습니다</h3>
		</c:if>
		<c:if test="${cList_size gt 0 }">
			<c:set var="cnt" value="${cList_size-1 }"/>
			<c:forEach var="vo" items="${cList }" begin="0" end="8">
				<a href="../program/programDetail.do?pno=${vo.pno }">
				<ul style="list-style: none" id="least_${cnt }">
					<li style="float: left;">
						<img src="${vo.poster }" title="${vo.title }" style="max-width: 106px;height: 150px;">
					</li>
				</ul>
				</a>
				<c:set var="cnt" value="${cnt-1 }"/>
			</c:forEach>
		</c:if>
		</div>
	</div>
</div>
</body>
</html>