<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 신청 및 소식 => 공지사항 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../Board/libUse.css">
</head>
<body>
	<div class="board">
	<div class="row">
		<div class="board_title">
			<h2>공지사항</h2>
			<hr>
		</div>
		<form method="post" action="#">
		<div id="searchBar">
			<div style="padding: 15px;">
				<div>
					작성일&nbsp;:&nbsp;<input type="date">&nbsp;~&nbsp;<input type="date">
				</div>
				<div style="margin-top: 10px;">
					<select id="searchOp" name="searchType" style="line-height: 0;" class="input-lg">
						<option value="">제목</option>
						<option value="">내용</option>
					</select>
					<input type="text" size="15" style="float: left;width: 60%;margin-left: 10px;margin-right: 10px;line-height: 0;" name="search" class="input-lg">
					<input type="submit" class="btn btn-sm btn-info" value="검색">
				</div>
			</div>
		</div>
		</form>
	</div>
	<div style="width: 100%;padding: 0;">
		총 <font color="red">0</font>건,1/102페이지
		<hr style="margin-top: 10px;">
	</div>
	<table class="table">
		<tr>
			<th width="5%" class="text-center">번호</th>
			<th width="40%" class="text-center">제목</th>
			<th width="15%" class="text-center">작성자</th>
			<th width="15%" class="text-center">작성일</th>
			<th width="15%" class="text-center">조회수</th>
			<th width="10%" class="text-center">첨부파일</th>
		</tr>
		<tr>
			<td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td>
		</tr>
	</table>
	</div>
</body>
</html>