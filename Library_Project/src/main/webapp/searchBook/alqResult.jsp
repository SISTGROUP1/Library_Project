<%@page import="java.net.URLDecoder"%>
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
		border-top:1px solid white !important;
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
				<h6><%=URLDecoder.decode(request.getParameter("cate")) %></h6>
			</div>
			<jsp:include page="../etc/aside/aside.jsp"></jsp:include>
		</div>
	</div>
	<div class="col-md-8">
	<section id="one" class="wrapper"><div class="inner">
	 	<h4 style="color:black">자료탐색</h4>
		<hr style="padding:2px;background: skyblue;">
		<div class="flex flex-3">
			<c:forEach var="vo" items="${list }" >
				<table class="table">
					<tr>
						<td width="15%" align="center" rowspan="8">
							<c:set var="data" value="../images/defaultImage.jpg"/>
					        <a href="../searchBook/alqDetail_before.do?isbn=${vo.isbn }"><img src="${vo.image==null?data:vo.image }" style="width:100%;height:100%;"></a>
						</td>
						<td width="85%" align="left">
							<span id="title" style="font-weight: bold;">
								<a href="../searchBook/alqDetail_before.do?isbn=${vo.isbn }" style="color:black;text-decoration: none;">${vo.booktitle }</a>
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="author" style="font-size:11px;">
								${vo.bookauthor }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="publisher" style="font-size:11px;">
								${vo.bookpublisher }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="bookcallnum" style="font-size:11px;">
								${vo.bookcallnum }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
							<span id="Bookdate" style="font-size:11px;">
								${vo.bookdate }
							</span>
						</td>
					</tr>
					<tr>
						<td width="85%">
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
										<td>${vo.booklocation }</td>
										<td><span id="bookcallnum">${vo.bookcallnum }</span></td>
										<td>${vo.bookaccessionno }</td>
										<td>테스트</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		</div>
		</section>
	</div>
	<div class="col-md-2">
		<h6>Cookies</h6>
		<c:forEach var="c" items="${cList_1 }">
			<div style="display: flex;">
				<p style="width:170px; text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"><a href="../searchBook/alqDetail.do?isbn=${c.isbn }" style="color:black;text-decoration: none;">${c.booktitle }</a></p>
				<form method="post" action="../searchBook/alqDetail_remove.do">
					<input type=hidden name="page" value="${curpage }">
					<input type=hidden name="cate" value="${cate}">
					<input type=hidden name="cno" value="${cno }">
					<input type=hidden name="isbn" value="${c.isbn }">
					<input type=submit value="X" style="background-color:white !important;color:black !important;padding:0px !important;line-height:0px !important;height:13px !important;padding-left: 5px !important;">
				</form>
			</div>
		</c:forEach>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="../searchBook/alqResult.do?page=${startPage-1}&cno=${cno}&cate=${cate}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${curpage==i?"class=active":"" }><a href="../searchBook/alqResult.do?page=${i}&cno=${cno}&cate=${cate}">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
					<li><a href="../searchBook/alqResult.do?page=${endPage+1}&cno=${cno}&cate=${cate}">&gt;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>