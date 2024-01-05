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
	table tbody tr:nth-child(2n+1){
		background-color: white;
	}
	.table > tbody > tr > td,.table > tbody > tr > th{
		border-top: none;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#qnaCommentBtn').click(function() {
			$('#qnaCommentBtn').hide()
			$('#qnaComment').show()
		})
		$('#commentCancleBtn').click(function() {
			$('#qnaCommentBtn').show()
			$('#qnaComment').hide()
		})
	})
	function deleteBtn(no) {
		if(confirm('글을 삭제하시겠습니까?')){
			location.href='../Board/qna_delete.do?no='+no
		}else{
			return false
		}
	}
</script>
</head>
<body>
	<div>
		<h2>묻고답하기</h2>
		<hr>
	</div>
	<table class="table" style="border-collapse: unset;">
		<tr style="background-color: rgba(144, 144, 144, 0.075);">
			<th width="80%" rowspan="2" style="font-size: 18px;">${vo.title }</th>
			<td width="20%" class="text-right">${vo.dbday }</td>
		</tr>
		<tr style="border-bottom: 1px solid #dbdbdb;background-color: rgba(144, 144, 144, 0.075);">
			<td class="text-right">${fn:substring(vo.name,0,1)+='**' }</td>
		</tr>
		<tr>
			<td colspan="2">
				<%-- <textarea rows="10" cols="" readonly style="background-color: white;resize: none;border: none;outline: none;">${vo.content }</textarea> --%>
				<pre style="background-color: white;border: none;white-space: pre-wrap;">${vo.content }</pre>
			</td>
		</tr>
		<c:if test="${sessionScope.admin eq 'n' || sessionScope.admin eq null }">
			<tr>
				<td colspan="2" class="text-right">
					<c:if test="${vo.userid eq sessionScope.email }">
						<a href="../Board/qna_update.do?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
						<span onclick="deleteBtn(${vo.no})" class="btn btn-xs btn-warning">삭제</span>
					</c:if>
					<input type="button" value="목록" class="btn btn-xs btn-success" onclick="javascript:history.back()">
				</td>
			</tr>
		</c:if>
	</table>
	<c:if test="${sessionScope.admin eq 'y' }">
		<div style="height: 20px;"></div>
		<div class="text-center">
			<input type="button" class="btn btn-lg" value="답글작성" id="qnaCommentBtn">
		</div>
		<div id="qnaComment" style="display: none;">
			<form method="post" action="../Board/qna_insert_ok.do">
			<table class="table">
				<tr>
					<td colspan="2">
						<textarea rows="10" cols="" name="content" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" value="저장" class="btn btn-sm btn-info">
						<input type="button" value="취소" class="btn btn-sm btn-info" id="commentCancleBtn">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</c:if>
</body>
</html>