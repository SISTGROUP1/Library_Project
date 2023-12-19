<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login to Everdwell</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="loginstyle.css">

</head>
<body>
<!-- partial:index.partial.html -->
<form action="#" id="login-form">
  <div class="heading">서울 도서관</div>
  <div class="left">
    <label for="email" required >아이디</label> <br />
    <input type="email" name="email" id="email" /> <br />
    <label for="password" required>이메일</label> <br />
    <input type="password" name="password" id="pass" /> <br />
    <input type="submit" value="아이디 찾기" />
   </div>

  <div class="right">
    <select>
			<option>질문 선택</option>
            <option>1. 가장 좋아하는 것은?</option>
            <option>2. 가장 감명깊게 읽은 책은?</option>
            <option>3. 가장 감명깊게 본 영화는?</option>
            <option>4. 가장 좋아하는 계절은?</option>
            <option>5. 가장 좋아하는 색깔은?</option>
            <option>6. 가장 아끼는 것은?</option>
            <option>7. 가장 기억에 남는 장소는?</option>
            <option>8. 가장 좋아하는 인물은?</option>
          </select>
    <input type="submit" value="비밀번호 찾기" />
</form>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
