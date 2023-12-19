<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../program/libUse.css">
</head>
<body>
<div id="box">
	<div class="row">
		<table class="table">
			<tr>
				<th width="100%" colspan="4" style="font-size: 20px;">${vo.title }</th>
			</tr>
			<tr>
				<th width="10%">운영일시</th>
				<td width="90%" colspan="3" class="text-left">${vo.edu1_str }&nbsp;~&nbsp;${vo.edu2_str }</td>
			</tr>
			<tr>
				<th width="10%">대상</th>
				<td width="40%" class="text-left">${vo.target1 } | ${vo.target2 }</td>
				<th width="10%">장소</th>
				<td width="40%" class="text-left">${vo.place }</td>
			</tr>
			<tr>
				<th width="10%">접수기간</th>
				<td width="90%" colspan="3" class="text-left">${vo.accept1_str }&nbsp;~&nbsp;${vo.accept2_str }</td>
			</tr>
			<tr>
				<th width="10%">신청현황</th>
				<td width="40%" class="text-left">${vo.capacity }명</td>
				<th width="10%">조회수</th>
				<td width="40%" class="text-left">${vo.hit }</td>
			</tr>
			<tr>
				<td width="100%" colspan="4">
					<img src="${vo.poster }" style="max-width: 855px;max-height: 1200px;">
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>