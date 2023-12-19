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
	.thumbnail:hover {
		border: 1px solid gray;
	}
	#title{
		width: 230px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	select{
		display: inline-block;
		width: 100px;
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
	button:hover {
	
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let cnt=$('#leastList > ul').length;
		if(cnt>9){
			$('#leastList').css('overflow','hidden');	
		}
	});
</script>
</head>
<body>
<div id="box">
	<div id="searchBar">
		<div style="padding: 15px;">
		<div>
			<select style="margin-right: 10px;">
				<option>대상</option>
				<option>영유아</option>
				<option>어린이</option>
				<option>청소년</option>
				<option>성인</option>
				<option>누구나</option>
			</select>
			<select>
				<option>접수상태</option>
				<option>접수중</option>
				<option>접수마감</option>
				<option>종료</option>
			</select>
		</div>
		<div style="margin-top: 10px;">
			<select id="searchOp">
				<option>프로그램명</option>
				<option>장소</option>
			</select>
			<input type="text" size="15" style="float: left;width: 70%;margin-left: 10px;margin-right: 10px;">
			<button>검색</button>
		</div>
		</div>
	</div>
	<div class="row" style="margin-top: 30px;">
		<c:forEach var="vo" items="${list }">
			<div class="col-md-3">
    			<div class="thumbnail">
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
					<li><a href="../program/programList.do?page=${curpage gt 1 ? startBlockNum-1 : curpage }">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startBlockNum }" end="${endBlockNum }">
					<li ${curpage eq i ? "class=active" : "" }><a href="../program/programList.do?page=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${endBlockNum<totalpage }">
					<li><a href="../program/programList.do?page=${curpage lt totalpage ? endBlockNum+1 : curpage }">&gt;</a></li>
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
			<c:forEach var="vo" items="${cList }">
				<ul style="list-style: none">
					<li style="float: left;">
						<img src="${vo.poster }" title="${vo.title }" style="max-width: 106px;height: 150px;">
					</li>
				</ul>
			</c:forEach>
		</c:if>
		</div>
	</div>
</div>
</body>
</html>