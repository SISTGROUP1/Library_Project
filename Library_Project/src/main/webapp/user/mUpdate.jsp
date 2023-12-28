<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login to Everdwell</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="../etc/user/userjoinstyle.css">
<script type="text/javascript">
window.onload=function(){
	let btn=document.querySelector('#postBtn')
	btn.addEventListener('click',()=>{
		window.open('post.jsp','post','width=480,height=350,scrollbars=yes')
	})
}
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<form action="#" id="login-form">
  <div class="heading">회원가입</div>
  <div class="left">
    <input type="text" placeholder="아이디" style="float:left;width:53%;">
    <input type=button value="중복체크" id="check" style="cursor:pointer;width:16%;">
    <input type="password" placeholder="비밀번호">
    <input type="text" placeholder="이름">
    <input type="email" placeholder="이메일">
    
    <input type="text" placeholder="우편번호" name="post1" id="post1" style="float:left;width:45.7%;">
    <input type=button value="우편번호검색" id="postBtn" style="cursor:pointer;width:23%;">
    <input type="text" placeholder="주소" id="addr1">
    <input type="text" placeholder="상세주소">
    <input type="text" placeholder="전화번호">
    
	<div class="row">
      <div class="col-half1" style="width:284px">
        <h2 style="margin-left:36.5%">생년월일</h2>
          <div class="col-third">
            <input type="date" style="margin-left:36.5%;width:180px">
          </div>
      </div>
      <div class="col-half1" style="width:380px">
        <h2 style="margin-top:7%;margin-left:13%;">성별</h2>
        <br>
          <input id="gender-male" type="radio" name="gender" value="male">
          <label for="gender-male" id="male" style="cursor:pointer;">Male</label>
          <input id="gender-female" type="radio" name="gender" value="female">
          <label for="gender-female" id="female" style="cursor:pointer;">Female</label>
       </div>
      </div>
    <h2>비밀번호 찾기 QnA</h2>
     <select style="cursor:pointer;width:70%">
       <c:forEach var="vo" items="${list }">
         <option value="질문선택">${vo.hintQ }</option>
       </c:forEach>
     </select>
    <input type="text" placeholder="질문에 대한 답" id="a"> 
    <input type="button" onClick="location.href='./mUpdate.jsp'" value="가입" id="s1" style="cursor:pointer;float:left">
    <input type="button" onClick="location.href='../main/main.do'" value="취소" id="s2" style="cursor:pointer;">
    <br>
    <h2>이용 약관</h2>
      <input id="terms" type="checkbox"/>
      <label for="terms" style="cursor:pointer;">실명 인증된 아이디로 가입, 위치기반서비스 이용약관, 이벤트・혜택 정보 수신 동의를 포함합니다.</label>
  </div>
</form>
<!-- partial -->
  <script  src="../etc/user/user.js"></script>
</body>
</html>
