<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.separator-line{
		margin:16px;
	}
	.like_star {
	filter:hue-rotate(90deg) !important;
	}
	.like_star:hover{
		filter:hue-rotate(0deg) !important;
		transition : filter 1s !important;
	}
	.col{
		width:130px;
	}
	.card{
		width:860px;
	}
	.table1 tr{
		background:white !important;
	}
</style>
</head>
<body>
	<section id="one" class="wrapper"><div class="inner">
			<h3>상세정보</h3>
			<hr>
			<div class="container mt-4" style="color:#0C243C;">
			<div class="back_page" style="background-color: #e2e2e2;text-align:left;padding-left:10px;">
				<a href="javascript:history.back()" style="text-decoration: none;"><font style="font-weight: bold;color:black;">&lt;</font><font style="font-weight: bold;color:#e72900;">검색 결과 돌아가기</font></a>
			</div>
			<div style="height:10px;">
			</div>
		<div class="row">
			<div class="col-md-3">
				<img src="${vo.image }" class="img-fluid" alt="Book Image" style="width:200px;height:300px;">
			</div>
			<div class="col-md-9">
				<div class="card">
					<div class="card-body" >
						<h1>${vo.booktitle }</h1>
						<p>${vo.bookauthor }</p>
			<table class="table1" style="border-collapse: unset;">
				<tr>
					<th>자료유형</th>
					<td style="text-align:left;">${vo.bookdtype }</td>
				</tr>
				<tr>
					<th>개인저자</th>
					<td style="text-align:left;">${vo.bookperson }</td>
				</tr>
				<tr>
					<th>서명/저자사항</th>
					<td style="text-align:left;">${vo.booksign }</td>
				</tr>
				<tr>
					<th>발행사항</th>
					<td style="text-align:left;">${vo.bookpublisher }</td>
				</tr>
			</table>
			<div style="text-align:right;">
                  <a class='btn btn-primary'>Add to Cart</a>
            </div>
            <hr class="separator-line">

			<div class="row text-center my-3" style="display:inline-block;">
                <div class="col">
                  <span class="like_star"><img src="https://cdn-icons-png.flaticon.com/128/1828/1828970.png" style="height:30px;">
                  </span>
                  <p>like count</p>
                </div>
                
                <div class="col">
                  <img src="https://cdn-icons-png.flaticon.com/128/2/2273.png" style="height:30px;">
                  <p>${vo.isbn }</p>
                </div>  
                <div class="col">
                  <img src="https://cdn-icons-png.flaticon.com/128/747/747310.png" style="height:30px;">
                  <p>${vo.bookdate }</p>
                </div>
                <div class="col">
                  <img src="https://cdn-icons-png.flaticon.com/128/814/814587.png" style="height:30px;">
                  <p>${vo.bookpublisher }</p>
                </div>
                <div class="col">
                  <img src="https://cdn-icons-png.flaticon.com/128/2702/2702134.png" style="height:30px;">
                  <p>${vo.bookdtype }</p>
                </div>
            </div>
					</div>
				</div>
      </div>
		</div>
		<hr class="separator-line">
		<table class="table">
			<tr>
				<th style="text-align:center">등록번호</th>
				<th style="text-align:center">청구기호</th>
				<th style="text-align:center">자료실/서가</th>
				<th style="text-align:center">도서상태</th>
				<th style="text-align:center">반납예정일</th>
				<th style="text-align:center">예약/신청</th>
			</tr>
			<tr>
				<td>${vo.bookaccessionno }</td>
				<td>${vo.bookcallnum }</td>
				<td>${vo.booklocation }</td>
				<td>테스트</td>
				<td>테스트</td>
				<td>테스트</td>
			</tr>
		</table>
	</div>
	</div>
	</section>
</body>
</html>