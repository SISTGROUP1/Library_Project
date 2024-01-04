<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 좋아요 도서 조회 -->
	<div>
		<form method="post" action="#" id="searchForm">
		<div>
			<div style="padding: 15px;">
				<div>
					<select id="searchOp" name="searchType" class="input-lg">
						<option value="">서명</option>
						<!-- <option value="">소장도서관</option> -->
						<option value="">저자</option>
						<option value="">출판사</option>
					</select>
					<input type="text" size="15" style="float: left;width: 60%;margin-left: 10px;margin-right: 10px;line-height: 0;" name="search" class="input-lg">
					<input type="submit" class="btn btn-sm btn-info" value="검색">
				</div>
			</div>
		</div>
		</form>
	</div>
	<div style="width: 100%;padding: 0;">
		좋아요 <font color="red">0</font>건
		<hr style="margin-top: 10px;">
	</div>
	<table class="table">
		<tr>
			<th width="5%" class="text-center">번호</th>
			<th width="10%" class="text-center">등록번호</th>
			<th width="50%" class="text-center">서명</th>
			<!-- <th width="15%" class="text-center">소장도서관</th> -->
			<th width="15%" class="text-center">저자</th>
			<th width="15%" class="text-center">출판사</th>
			<th width="5%" class="text-center">취소</th>
		</tr>
		<c:set var="count" value="${count }"/>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td width="5%" class="text-center">${count }</td>
				<td width="10%" class="text-center">${vo.bivo.bookaccessionno }</td>
				<td width="50%">${vo.bivo.booktitle }</td>
				<td width="15%" class="text-center">${vo.bivo.bookperson }</td>
				<td width="15%" class="text-center">${vo.bivo.bookpublisher }</td>
				<td width="5%" class="text-center">취소</td>
			</tr>
			<c:set var="count" value="${count-1 }"/>
		</c:forEach>
	</table>
</body>
</html>