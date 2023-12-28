<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 대출현황 -->
<!-- 도서대출정보 메뉴 include -->
	<div>
		<form method="post" action="#" id="searchForm">
		<div>
			<div style="padding: 15px;">
				<div>
					<select name="searchDate" class="input-lg" style="line-height: 0;margin-right: 10px;">
						<option value="">대출일</option>
						<option value="">반납예정일</option>
					</select><input type="date">&nbsp;~&nbsp;<input type="date">
				</div>
				<div style="margin-top: 10px;">
					<select id="searchOp" name="searchType" class="input-lg">
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
		대출현황 <font color="red">0</font>건
		<hr style="margin-top: 10px;">
	</div>
	<table class="table">
		<tr>
			<th width="5%" class="text-center">번호</th>
			<th width="10%" class="text-center">등록번호</th>
			<th width="35%" class="text-center">서명</th>
			<th width="15%" class="text-center">소장도서관</th>
			<th width="15%" class="text-center">대출일</th>
			<th width="15%" class="text-center">반납예정일</th>
			<th width="5%" class="text-center">상태</th>
		</tr>
		<tr>
			<td class="text-center" colspan="7">
				내역이 존재하지 않습니다.
			</td>
		</tr>
	</table>
</body>
</html>