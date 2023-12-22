<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 예약현황 -->
<!-- 도서대출정보 메뉴 include -->
	<div class="row">
		<form method="post" action="#">
		<div id="searchBar">
			<div style="padding: 15px;">
				<div>
					<select name="searchDate" class="input-lg" style="line-height: 0;margin-right: 10px;">
						<option value="">예약일</option>
						<option value="">예약만기일</option>
					</select><input type="date">&nbsp;~&nbsp;<input type="date">
				</div>
				<div style="margin-top: 10px;">
					<select id="searchOp" name="searchType" style="line-height: 0;" class="input-lg">
						<option value="">서명</option>
						<option value="">소장도서관</option>
					</select>
					<input type="text" size="15" style="float: left;width: 60%;margin-left: 10px;margin-right: 10px;line-height: 0;" name="search" class="input-lg">
					<input type="submit" class="btn btn-sm btn-info" value="검색">
				</div>
			</div>
		</div>
		</form>
	</div>
	<div style="width: 100%;padding: 0;">
		예약현황 <font color="red">0</font>건
		<hr style="margin-top: 10px;">
	</div>
	<table class="table">
		<tr>
			<th width="5%">번호</th>
			<th width="10%">등록번호</th>
			<th width="35%">서명</th>
			<th width="15%">소장도서관</th>
			<th width="15%">예약일</th>
			<th width="15%">예약만기일</th>
			<th width="5%">순번</th>
		</tr>
		<tr>
			<td class="text-center" colspan="7">
				내역이 존재하지 않습니다.
			</td>
		</tr>
	</table>
</body>
</html>