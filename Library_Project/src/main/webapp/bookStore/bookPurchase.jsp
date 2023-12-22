<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/storestyle.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략 가능
IMP.init("imp76004233"); // 예: imp00000000 (내 식별코드 쓰기)
function requestPay() {
	console.log('clicked');
  // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원. 
	        /*
	            'kakaopay':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	            'nice':나이스,
	            'jtnet':jtnet,
	            'uplus':LG유플러스
	        */
	    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $('#title').text(),
	    amount : $('#price').attr("data-price"),
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	});
}
</script>
</head>
<body>
	<h2>도서 구매</h2>
	<hr>
	<div class="row">
		  <table class="table" id="bookpurchase" background-color="white">
			  <tr>
				  <td width="35%" align="center" rowspan="8">
					  <img src="${vo.image }" class="img-fluid" style="width:400px;height:520px;">
				  </td>
				  <td width="65%">
					  <span id="booktitle">${vo.booktitle }</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  저자&nbsp;&nbsp;&nbsp;<span id="bookauthor">${vo.bookauthor }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  출판사&nbsp;&nbsp;&nbsp;<span id="bookauthor">${vo.bookpublisher }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  ISBN&nbsp;&nbsp;&nbsp;<span id="bookauthor">${vo.isbn }</span>
				  </td>
			  </tr>
			   <tr>
				  <td width="65%">
					  <span id="star">★★★★★</span>&nbsp;
					  <span id="bold">4.5</span>
					  <span id="count">(299)</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  정가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<del id="fixedprice">${vo.fixedprice }원</del>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  판매가&nbsp;&nbsp;&nbsp;<span id="saleprice">${vo.saleprice }원</span>
				  </td>
			  </tr>
			  <tr>
			  	<td width="65%">
					  <select id="sel">
						  <option>1</option>
						  <option>2</option>
						  <option>3</option>
					  </select>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <input type="button" value="장바구니" id="cart">
					  <input type="button" value="바로구매" id="buy" onclick="requestPay()">
				  </td>
			  </tr>
		  </table>
	  </div>
	  
	  <hr>
	  <h2>목차</h2>
	  <hr>
	  <p>${vo.contents }</p>
	  <h2>책소개</h2>
	  <hr>
	  <p>${vo.bookinfo}</p>
	  <h2>저자소개</h2>
	  <hr>
	  <p>${vo.authorinfo}</p>
	  <h2>리뷰</h2>
	  <hr>
	  <p>리뷰입니다.</p>
</body>
</html>