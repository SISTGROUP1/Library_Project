<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	@media screen and (max-width:1190px){
		#aside{
			visibility: hidden;
		}
	}
	
	.table tr th{
		text-align:center;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
	let result = '30';
	let selectedBoxChange = function(value){
		result = value;
		let select_acq = document.querySelectorAll("select option");
		for(let acq of select_acq){
			if(acq.value===result){
				acq.selected = true;
				console.log(acq);
			}
		}
		return result;
	}
	function Change_data(direct){
		let pageTag;
		let page;
		if(direct==="1"){
			pageTag = document.querySelector("#start");
		}
		else if(direct==="2"){
			pageTag = document.querySelectorAll("#cur");
			for(let i = 0;i<pageTag.length;i++){
				pageTag[i].href = "../searchBook/newarrival.do?page="+pageTag[i].getAttribute('data-value')+'&acq='+result;
			}
			return ;
		}
		else if(direct==="3"){
			pageTag = document.querySelector("#end");
		}
		pageTag.href = "../searchBook/newarrival.do?page="+pageTag.getAttribute('data-value')+'&acq='+result;
		
	}
</script>
</head>
<body>
	<div class="col-md-2" id="aside">
		<div style="margin-top: 50px;">
			<div style="margin:0px auto;">
				<h6>총 <format:formatNumber value="${total }" type="number"/>건 중 <format:formatNumber value="${total }" type="number"/>건 출력</h6>
			</div>
			<jsp:include page="../etc/aside/aside.jsp"></jsp:include>
		</div>
	</div>
	<div class="col-md-8">
	<section id="one" class="wrapper"><div class="inner">
	 	<h4 style="color:black">새로 들어온 책</h4>
		<hr style="padding:2px;background: skyblue;">
		<div class="flex flex-3">
			<div class="text-right" style="width:100%;margin-bottom: 5px;">
				<select name="acq" style="width:10%;display:unset !important;" onchange="selectedBoxChange(this.value)">
					<option value="30">30일</option>
					<option value="60">60일</option>
					<option value="90">90일</option>
					<option value="120">120일</option>
				</select>
			</div>
			<table class="table">
				<tr>
					<th width=5% id="book_no">No.</th>
					<th width=45% id="book_title">제목</th>
					<th width=15% id="book_author">저자</th>
					<th width=15% id="book_publisher">발행처</th>
					<th width=10% id="book_date">발행년도</th>
					<th width=10% id="book_rDate">입수일</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr>
						<td  width=5% style="text-align: center;">${list.count }</td>
						<td  width=45%><a href="../searchBook/alqDetail.do?isbn=${list.isbn }" style="color:black"><p style="width:400px; text-overflow: ellipsis;white-space: nowrap;overflow: hidden;" title="${list.booktitle }">${list.booktitle }</p></a></td>
						<td  width=15% style="text-align: center;">${list.bookauthor }</td>
						<td  width=15% style="text-align: center;">${list.bookpublisher }</td>
						<td  width=10% style="text-align: center;">${list.bookdate }</td>
						<td  width=10% style="text-align: center;">${list.acquisition }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
		</section>
	</div>
	<div class="col-md-2">
	</div>
	<div class="text-center" style="clear:both;">
		<ul class="pagination">
			<c:if test="${startpage>1 }">
				<li><a id="start" data-value="${startpage-1 }" href="../searchBook/newarrival.do?page=${startpage-1}&acq=${acq}" onclick="Change_data('1')">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startpage }" end="${endpage }">
				<li ${curpage==i?"class=active":"" }><a id="cur" data-value="${i }" href="../searchBook/newarrival.do?page=${i }&acq=${acq}" onclick="Change_data('2')">${i }</a></li>
			</c:forEach>
			<c:if test="${endpage<totalpage }">
					<li><a id="end" data-value="${endpage+1 }" href="../searchBook/newarrival.do?page=${endpage+1}&acq=${acq}" onclick="Change_data('3')">&gt;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>