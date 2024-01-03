<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
	.cancelBtn{
		border-radius: 10px;
		font-weight: 0;
		height: 1.5em;
		line-height: 0;
	}
</style> -->
</head>
<body>
<!-- 프로그램 신청 조회 -->
	<div>
		<form method="post" action="#" id="searchForm">
		<div>
			<div style="padding: 15px;">
				<div>
					강좌기간&nbsp;:&nbsp;<input type="date">&nbsp;~&nbsp;<input type="date">
				</div>
				<div style="margin-top: 10px;">
					<select id="searchOp" name="searchType" class="input-lg">
						<option value="">강좌명</option>
						<option value="">장소</option>
					</select>
					<input type="text" size="15" style="float: left;width: 60%;margin-left: 10px;margin-right: 10px;line-height: 0;" name="search" class="input-lg">
					<input type="submit" class="btn btn-sm btn-info" value="검색">
				</div>
			</div>
		</div>
		</form>
	</div>
	<div style="width: 100%;padding: 0;">
		프로그램신청 <font color="red">0</font>건
		<hr style="margin-top: 10px;">
	</div>
	<table class="table">
		<tr>
			<th width="5%" class="text-center">번호</th>
			<th width="45%" class="text-center">강좌명</th>
			<th width="15%" class="text-center">장소</th>
			<th width="15%" class="text-center">강좌기간</th>
			<th width="15%" class="text-center">상태</th>
			<th width="5%" class="text-center">취소</th>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
		<tr>
			<!-- <td class="text-center" colspan="6">
				내역이 존재하지 않습니다.
			</td> -->
			<td width="5%" class="text-center">1</td>
			<td width="40%">손기정어린이도서관 연말행사 크리스마스 매직쇼</td>
			<td width="20%" class="text-center">손기정어린이도서관 2층</td>
			<td width="20%" class="text-center">2023-12-24 ~ 2023-12-24</td>
			<td width="10%" class="text-center">신청중</td>
			<td width="5%" class="text-center"><input type="button" value="취소" style="border-radius: 10px;font-weight: normal;height: 1.5em;line-height: 0;"></td>
		</tr>
	</table>
</body>
</html>