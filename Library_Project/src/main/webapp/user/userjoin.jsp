<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - form</title>
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'><link rel="stylesheet" href="signupstyle.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
  <form>
    <div class="row">
      <h1>회원가입</h1>
      <div class="input-group">
        <input type="ID" placeholder="아이디"/>
      </div>
      <div class="input-group">
        <input type="password" placeholder="비밀번호"/>
      </div>
      <div class="input-group">
        <input type="text" placeholder="이름"/>
      </div>
      <div class="input-group">
        <input type="email" placeholder="이메일"/>
      </div>
      <div class="input-group">
        <input type="password" placeholder="주소"/>
      </div>
      <div class="input-group">
        <input type="password" placeholder="전화번호"/>
      </div>
    </div>
    <div class="row">
      <div class="col-half1">
        <h4>생년월일</h4>
        <div class="input-group">
          <div class="col-third">
            <input type="text" placeholder="DD"/>
          </div>
          <div class="col-third">
            <input type="text" placeholder="MM"/>
          </div>
          <div class="col-third">
            <input type="text" placeholder="YYYY"/>
          </div>
        </div>
      </div>
      <div class="col-half1">
        <h4>성별</h4>
        <div class="input-group">
          <input id="gender-male" type="radio" name="gender" value="male"/>
          <label for="gender-male">Male</label>
          <input id="gender-female" type="radio" name="gender" value="female"/>
          <label for="gender-female">Female</label>
        </div>
      </div>
    </div>
    <div class="row">
      <h4>비밀번호 찾기 QnA</h4>
      <div class="col-half">
        <div class="input-group">
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
        </div>
      </div>
      <div class="input-group">
        <input type="text" placeholder="질문에 대한 답"/>
      </div>
	  <table class="table">
		  <tr>
			  <td width="350px" align="center" rowspan="2">
			  	<input type="submit" value="완료" class="btn btn-sm btn-primary" >
			  </td>
			  <td width="350px" align="center">
		  	  	<input type="button" value="취소" onClick="location.href='../main/main.do'" class="btn btn-sm btn-primary">
		  	  </td>
		  </tr>
	  </table>
    </div>
    <div class="row">
      <h4>Terms and Conditions</h4>
      <div class="input-group">
        <input id="terms" type="checkbox"/>
        <label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
      </div>
    </div>
  </form>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
</body>
</html>
