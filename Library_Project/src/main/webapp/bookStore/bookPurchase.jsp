<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/storestyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략 가능
IMP.init("imp76004233");  // 예: imp00000000 (내 식별코드 쓰기)
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
       name : $('#gd_name').text(),
       amount :  parseInt($('#totalpay').text().replace(/[^0-9]/g, ''), 10), //$('#totalpay').text(), //.attr("data-price"), // 여기
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
// 총금액 계산
$(function(){
   $('#sel').change(function(){
      let count=$(this).val();
      let price=$('#saleprice').attr("data-price")
      let total=Number(count) * Number(price);
      $('#totalpay').text(total)
      console.log($('#totalpay').text());
      
      // 서버로 보낼 값 (id, name, admin), (booktitle, isbn, saleprice, (총액은 위에 있음))
      let userid=$('#buy').attr("data-value");
      let isbn=$('#bookisbn').text();
      
      // 총금액 서버로 전송
        $.ajax({
            type: "POST",
            url: "../bookStore/bookPurchase_ok.do",  // 보내지는 위치
            data: {"userid":userid, "isbn":isbn, sumprice:total}, //sumprice에 total값 저장
            success: function(response) {
                console.log("서버 전송 완료");
            },
            error: function(error) {
                console.error("서버 전송 오류");
            }
        });
   })
   
   // 총금액 결제
   $('#buy').click(function(){
      if(${sessionScope.email==null})
      {
         alert("로그인 후 이용해주세요.")
         return;
      }
      requestPay()
   })
   
})

// 스크롤
$(".pruchaseBtn").click(function(event){
   event.preventDefault();
   x=$(this).attr("href");
   $("html, body").stop().animate({scrollTop : $(x).offset().top-130}, 1000, "easeInOutExpo");
})
</script>
</head>
<body>
   <h2>도서 구매</h2>
   <hr>
   <div class="imgArea">
      <img src="${vo.image }" class="img-fluid" style="width:500px;height:620px;">
   </div>

   <div class="titleArea">
        <div class="titleArea_top">
           <span id="dtype" class="dtype">
            <span class="iconC_dtype"><em class="txt">${vo.bookdtype }</em></span></span>
           <div class="gd_titArea">
              <span id="gd_name">${vo.booktitle }</span>
              <span id="bookisbn">${vo.isbn }</span>
         </div>
         <ul id="purchaseUl">
            <span id="bookauthor">${vo.bookauthor }</span>
            <span id="divi">|</span>
            <span id="bookauthor">${vo.bookpublisher }</span>
            <span id="divi">|</span>
            <span id="bookdate">${vo.bookdate }</span>
         </ul>
         <span id="star">★★★★★</span>&nbsp;
         <span id="bold">4.5</span>
         <span id="count">(299)</span>
       </div>
    </div>
    
<div class="flex-container" id="bookpurchase_flex">
<div class="pricefullArea">
    <div class="priceArea">
      <ul id="priceUl">
        정가<del id="fixedprice">${vo.fixedprice }원</del>
        <br>
        판매가&nbsp;&nbsp;<span id="saleprice" data-price="${vo.saleprice }">${vo.saleprice }원</span>
       <span id="percent">(${100-(vo.saleprice/vo.fixedprice*100)}&nbsp;% 할인)</span>
     </ul>
    </div>
    
    <div class="bookinfoArea">
       <a class="purchasebtn" href="#bookinfo_scr"><span id="bookinfo">책소개</span></a>
       <a class="purchasebtn" href="#bookauthor_scr"><span id="bookinfo">저자소개</span></a>
       <a class="purchasebtn" href="#bookreview_scr"><span id="bookinfo">리뷰</span></a>
    </div>
    
    <table class="table" id="purchasetb">
      <tr>
              <td width="50%">
                 <select id="sel" class="input-sm">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                 </select>
                 전체금액<span id="totalpay"></span>&nbsp;&nbsp;원
            
              </td>
           </tr>
           <tr>
              <td width="50%">
                 <a href="../bookStore/shopCart.do"><input type="button" value="장바구니" id="cart"></a>

                 <input type="button" value="바로구매" id="buy" data-value="${sessionScope.email }">
                 <a href="javascript:history.back()"><input type="button" value="뒤로가기" id="backto"></a>
              </td>
           </tr>
        
   </table>
</div>

</div>
     
     <hr>
     <h2 id="bookinfo_scr">책소개</h2>
     <hr>
     <p>${vo.bookinfo}</p>
     <h2 id="bookauthor_scr">저자소개</h2>
     <hr>
     <p>${vo.authorinfo}</p>
   <div class="bookpurchase_review">
   <h2 id="bookreview_scr">도서리뷰</h2>
     <hr>
    
     
<!-- ##### 별점 그래프 영역 시작 ##### -->
<div class="star-rating space-x-4 mx-auto">
   <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
   <label for="5-stars" class="star pr-4">★</label>
   <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
   <label for="4-stars" class="star">★</label>
   <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
   <label for="3-stars" class="star">★</label>
   <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
   <label for="2-stars" class="star">★</label>
   <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
   <label for="1-star" class="star">★</label>
</div>
<div id="star_number">
   5.0/5.0
</div>

     <input type=submit value="리뷰쓰기 >" class="btn btn-xs btn-danger" id="reviewBtn">
      <table class="table">
        <tr>
         <td>
          <form method=post>
            <textarea rows="5" cols="40" id="reviewText"></textarea>
            
          </form>
         </td>
        </tr>
      </table>
      
   </div>
</body>
</html>