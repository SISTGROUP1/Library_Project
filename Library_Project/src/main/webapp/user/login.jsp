<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login to Everdwell</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="../etc/user/loginstyle.css">

</head>
<body>
<!-- partial:index.partial.html -->
<form action="#" id="login-form">
  <div class="heading">서울 도서관</div>
  <div class="left">
    <label for="email">아이디</label>
    <input type="text" name="email" id="email" required>
    <label for="password">비밀번호</label>
    <input type="password" name="password" id="pass" required>
   </div>

  <div class="right">
    <div class="connect">다른 방법으로 로그인</div>
    <a href="" class="facebook">
<!--       <span class="fontawesome-facebook"></span> -->
      <i class="fa fa-facebook" aria-hidden="true"></i>
    </a> <br />
    <a href="" class="twitter">
<!--       <span class="fontawesome-twitter"></span> -->
      <i class="fa fa-twitter" aria-hidden="true"></i>
    </a> <br />
    <a href="" class="google-plus">
<!--       <span class="fontawesome-google-plus"></span> -->
      <i class="fa fa-google-plus" aria-hidden="true"></i>
    </a>
  </div>
  <input type="submit" value="로그인" />
</form>
<!-- partial -->
  <script  src="../etc/user/user.js"></script>

</body>
</html>
