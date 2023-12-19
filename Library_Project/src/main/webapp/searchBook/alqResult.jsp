<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table>tbody>tr>td{
		background:white !important;
	}
	
	@media screen and (max-width:1190px){
		#aside{
			visibility: hidden;
		}
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="col-md-2" id="aside">
		<div style="margin-top: 50px;">
			<div style="margin:0px auto;">
				<h6>${cate }</h6>
			</div>
			<!-- <div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="glyphicon glyphicon-leaf"></i>
						<span>스토어 목록</span>
					</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="../store/all.do">전체 상품</a></li>
					<li class="list-group-item"><a href="../store/best.do">베스트 상품</a></li>
					<li class="list-group-item"><a href="../store/special.do">특가 상품</a></li>
					<li class="list-group-item"><a href="../store/new.do">신상품</a></li>
				</ul>
			</div> -->
			<jsp:include page="../etc/aside/aside.jsp"></jsp:include>
		</div>
	</div>
	<div class="col-md-8">
	<section id="one" class="wrapper"><div class="inner">
		<div class="flex flex-3">
			<c:forEach var="vo" items="${list }" >
				<table class="table table-condensed">
					<tr>
						<td width="15%" align="center" rowspan="8">
							<c:set var="data" value="../images/defaultImage.jpg"/>
					        <a href="../searchBook/alqResult.do?isbn=${vo.isbn }"><img src="${vo.image==null?data:vo.image }" style="width:100%;height:100%;"></a>
						</td>
						<td width="85%" align="left">
							<span id="title" style="font-weight: bold;">
								<a href="../searchBook/alqResult.do?isbn=${vo.isbn }" style="color:black;text-decoration: none;">${vo.booktitle }</a>
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="author" style="font-size:9px;">
								${vo.bookauthor }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="publisher" style="font-size:9px;">
								${vo.bookpublisher }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="bookcallnum" style="font-size:9px;">
								${vo.bookcallnum }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="Bookdate" style="font-size:9px;">
								${vo.bookdate }
							</span>
						</td>
					</tr>
					<td width=85%">
						<table>
							<thead>	
								<tr>
									<th style="text-align:center !important;">자료실/서가</th>
									<th style="text-align:center !important;">청구기호</th>
									<th style="text-align:center !important;">등록번호</th>
									<th style="text-align:center !important;">도서상태</th>
								</tr>
							</thead>
							<tbody>
								<tr style="background:white !important;">
									<td>테스트</td>
									<td><span id="bookcallnum">${vo.bookcallnum }</span></td>
									<td>테스트</td>
									<td>테스트</td>
								</tr>
							</tbody>
						</table>
					</td>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="../searchBook/alqResult.do?page=${startPage-1}&cno=${cno}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${curpage==i?"class=active":"" }><a href="../searchBook/alqResult.do?page=${i}&cno=${cno}">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
					<li><a href="../searchBook/alqResult.do?page=${endPage+1}&cno=${cno}">&gt;</a></li>
			</c:if>
		</ul>
	</div>
	</section>
	<div class="col-md-2">
	</div>
</body>
</html>