<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#dateControl{
		padding: 1em 0;
		background: whitesmoke;
	}
	div#dateControl span{
		font-size: 1.5em;
		margin-left: 20px;
	}
	div#dateControl span.controlBtn{
		padding: 0.2em 0.6em;
		cursor: pointer;
	}
	div#dateControl span.controlBtn:hover {
		color: orange;
	}
	div#dateControl span#curMonth{
		font-size: 1.2em;
		font-weight: bold;
		margin-left: 5px;
	}
	table#calendarTable tbody td{
		height: 125px;
		background: white;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let date=$('#date').text()
		let year=date.substring(0,4)
		let month=date.substring(6,date.length-1)
		$('#prevBtn').click(function() {
			if(Number(month)===1){
				month=12
				year=year-1
			}else{
				month=month-1	
			}
			location.href='../Board/calendar.do?year='+year+'&month='+month
		})
		$('#nextBtn').click(function() {
			if(Number(month)===12){
				month=1
				year=Number(year)+1
			}else{
				month=Number(month)+1
			}
			location.href='../Board/calendar.do?year='+year+'&month='+month
		})
		$('#curMonth').click(function() {
			location.href='../Board/calendar.do'
		})
	})
</script>
</head>
<body>
	<div>
		<div class="board_title">
			<h2>일정 및 행사</h2>
			<hr>
		</div>
		<div id="dateControl">
			<span class="controlBtn" id="prevBtn">&lt;</span>
			<span id="date">${year }년 ${month }월</span>
			<span class="controlBtn" id="nextBtn">&gt;</span>
			<span class="controlBtn" id="curMonth">이번달</span>
		</div>
		<table class="table" id="calendarTable">
			<thead>
				<tr>
					<th class="text-center">일</th>
					<th class="text-center">월</th>
					<th class="text-center">화</th>
					<th class="text-center">수</th>
					<th class="text-center">목</th>
					<th class="text-center">금</th>
					<th class="text-center">토</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="c_year" value="${year }"/>
				<c:set var="c_month" value="${month }"/>
				<c:forEach var="i" begin="1" end="${lastday }">
					<c:if test="${i==1 }">
						<tr>
							<c:forEach var="j" begin="1" end="${week }">
								<td style="border-right: 0.5px solid #EEEEEE"></td>
							</c:forEach>
					</c:if>
						<td ${week+1>6 ? "":"style='border-right: 0.5px solid #EEEEEE'" }>
							${i }
							<span id="calendarProgramList">
								<c:forEach var="vo" items="${list }">
									
								</c:forEach>
							</span>
						</td>
					<c:set var="week" value="${week+1 }"/>
					<c:if test="${week>6 }">
						<c:set var="week" value="0"/>
						</tr>
						<tr>
					</c:if>
				</c:forEach>
				<c:forEach var="i" begin="${week }" end="6">
					<c:if test="${i==6 }"><td></td></c:if>
					<c:if test="${i!=6 }">
						<td style="border-right: 0.5px solid #EEEEEE"></td>
					</c:if>
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>