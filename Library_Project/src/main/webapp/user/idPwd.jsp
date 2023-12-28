<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login to Everdwell</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="../etc/user/idpwdstyle.css">
</head>
<body>
<!-- partial:index.partial.html -->
<form action="#" id="login-form">
  <div class="heading">아이디/비밀번호 찾기</div>
  <div class="left">
    <label for="email">이름</label>
    <input type="email" name="email" id="find_id" required>
    <label for="password">이메일</label>
    <input type="password" id="find_pwd" required>
    <input type="button" value="아이디 찾기" id="fi">
   </div>

  <div class="right">
    <label>비밀번호 찾기 질문</label>
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
    <label>질문에 대한 답</label>
    <input type="password" name="password" id="pass" required>
    <input type="button" value="비밀번호 찾기" id="fp">
  </div>
</form>
<!-- partial -->
  <script  src="../etc/user/script.js"></script>

</body>
</html>
