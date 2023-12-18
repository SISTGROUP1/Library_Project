<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Slide Sign In/Sign Up form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="idpwdstyle.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container right-panel-active">
	<!-- Sign Up -->
	<div class="container__form container--signup">
		<form action="#" class="form" id="form1">
			<h2 class="form__title">아이디찾기</h2>
			<input type="text" placeholder="이름" class="input" />
			<input type="email" placeholder="이메일" class="input" />
			<button class="btn">아이디찾기</button>
		</form>
	</div>

	<!-- Sign In -->
	<div class="container__form container--signin">
		<form action="#" class="form" id="form2">
			<h2 class="form__title">비밀번호찾기</h2>
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
			<input type="password" placeholder="질문에 대한 답" class="input" />
			<button class="btn">비밀번호찾기</button>
		</form>
	</div>

	<!-- Overlay -->
	<div class="container__overlay">
		<div class="overlay">
			<div class="overlay__panel overlay--left">
				<button class="btn" id="signIn">비밀번호찾기</button>
			</div>
			<div class="overlay__panel overlay--right">
				<button class="btn" id="signUp">아이디찾기</button>
			</div>
		</div>
	</div>
</div>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
