<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="one" class="wrapper"><div class="inner">
					<div class="flex flex-2">
						<article><header><h3>공지사항</h3>
							</header><p>공지사항 목록 출력</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article><article><header><h3>보도자료</h3>
							</header><p>보도자료 목록 출력</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article></div>
				</div>
			</section>
			<!-- slide include -->
			<jsp:include page="../etc/slide/slide.jsp"></jsp:include>
			<!-- Three --><section id="three" class="wrapper special"><div class="inner">
					<header class="align-center"><h2>Nunc Dignissim</h2>
						<p>Aliquam erat volutpat nam dui </p>
					</header><div class="flex flex-2">
						<article><div class="image fit">
								<img src="../images/pic01.jpg" alt="Pic 01" width="576" height="196"></div>
							<header><h3>Praesent placerat magna</h3>
							</header><p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article><article><div class="image fit">
								<img src="../images/pic02.jpg" alt="Pic 02" width="576" height="196"></div>
							<header><h3>Fusce pellentesque tempus</h3>
							</header><p>Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna non comodo sodales tempus.</p>
							<footer><a href="#" class="button special">More</a>
							</footer></article></div>
				</div>
			</section>
</body>
</html>