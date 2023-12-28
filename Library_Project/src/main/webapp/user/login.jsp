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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#email').val();
		if(id.trim()==="")
		{
			$('#email').focus()
			return;
		}
		let pwd=$('#pass').val();
		if(pwd.trim()==="")
		{
			$('#pass').focus()
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../user/login_ok.do',
			data:{"email":id,"pass":pwd},
			success:function(result)
			{
				// NOID , NOPWD , OK
				if(result==='NOID')
				{
					alert("아이디가 존재하지 않습니다")
					$('#email').val("");
					$('#pass').val("");
					$('#email').focus()
				}
				else if(result==='NOPWD')
				{
					alert("비밀번호가 틀렸습니다")
					$('#pass').val("");
					$('#pass').focus()
				}
				else
				{
					location.href="../main/main.do"
				}
			}
		})
	})
});
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<form action="#" id="login-form">
  <div class="heading">서울 도서관</div>
  <div class="left">
    <label for="email" style="color:black">아이디</label>
    <input type="text" name="email" id="email">
    <label for="password" style="color:black">비밀번호</label>
    <input type="password" name="pass" id="pass">
   </div>

  <div class="right">
    <div class="connect" style="color:black;">다른 방법으로 로그인</div>
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
  <input type="button" value="로그인" id="logBtn">
</form>
<!-- partial -->
  <script  src="../etc/user/user.js"></script>

</body>
</html>
