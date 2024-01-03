<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login to Everdwell</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="../etc/user/userjoinstyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../user/idcheck.do',
			player:'iframe',
			title:'아이디 중복체크',
			width:350,
			height:200
		})
	})
	
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../user/post.do',
			player:'iframe',
			title:'우편번호 검색',
			width:490,
			height:350
		})
	})
})
</script>
</head>
<body>
<form id="login-form" method="post" action="../user/join_ok.do" name="frm">
  <div class="heading">회원가입</div>
  <div class="left">
    <input type="text" placeholder="아이디" name="id1" id="id1" style="float:left;width:53%;margin-top:7%;" readonly>
    <input type=button value="중복체크" id="checkBtn" style="cursor:pointer;width:16%;margin-top:7%;">
    <input type="password" placeholder="비밀번호" name="pwd">
    <input type="text" placeholder="이름" name="name">
    <input type="email" placeholder="이메일" name="email">
    
    <input type="text" placeholder="우편번호" name="post1" id="post1" style="float:left;width:45.7%;" readonly>
    <input type=button value="우편번호검색" id="postBtn" style="cursor:pointer;width:23%;">
    <input type="text" placeholder="주소" id="addr1" name="addr1" readonly>
    <input type="text" placeholder="상세주소" name="addr2">
    <input type="text" placeholder="전화번호" name="phone">
    
	<div class="row">
      <div class="col-half1" style="width:284px">
        <h2 style="margin-left:36.5%;margin-top:13%;">생년월일</h2>
          <div class="col-third">
            <input type="date" name="birthday" style="margin-left:36.5%;width:180px;color:black">
          </div>
      </div>
      <div class="col-half1" style="width:380px">
        <h2 style="margin-top:9%;margin-left:13%;">성별</h2>
        <br>
          <input id="gender-male" type="radio" name="gender" value="남자">
          <label for="gender-male" id="male" style="cursor:pointer;color:black">Male</label>
          <input id="gender-female" type="radio" name="gender" value="여자">
          <label for="gender-female" id="female" style="cursor:pointer;color:black">Female</label>
       </div>
      </div>
    <h2 style="margin-left:14%;margin-top:6%">비밀번호 찾기 QnA</h2>
     <select style="cursor:pointer;width:70%;margin-left:14%" name="hint">
       <option selected>질문선택</option>
       <c:forEach var="vo" items="${hList}" varStatus="s">
         <option value="${s.index+1 }">${vo }</option>
       </c:forEach>
     </select>
    <input type="text" placeholder="질문에 대한 답" id="a" name="hintA">
      <input type="submit" value="가입" id="s1" style="cursor:pointer;float:left;margin-left:14%">
      <input type="button" onclick="javascript:history.back()" value="취소" id="s2" style="cursor:pointer;margin-left:30%">
    <br><br><br>
    <h2 style="margin-left:5%">이용 약관</h2>
      <input id="terms" type="checkbox">
      <label for="terms" style="cursor:pointer;margin-left:5%">실명 인증된 아이디로 가입, 위치기반서비스 이용약관, 이벤트・혜택 정보 수신 동의를 포함합니다.</label>
  </div>
</form>
<!-- partial -->
</body>
</html>
