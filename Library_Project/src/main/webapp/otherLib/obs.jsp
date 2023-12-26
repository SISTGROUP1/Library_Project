<%--다른 도서관 책 관련 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	body div{
		font-family:NanumBarunGothic,sans-serif;
	}
	input{
		font-style: ;
	    font-variant-ligatures: ;
	    font-variant-caps: ;
	    font-variant-numeric: ;
	    font-variant-east-asian: ;
	    font-variant-alternates: ;
	    font-variant-position: ;
	    font-weight: ;
	    font-stretch: ;
	    font-size: ;
	    font-family: ;
	    font-optical-sizing: ;
	    font-kerning: ;
	    font-feature-settings: ;
	    font-variation-settings: ;
	    text-rendering: auto;
	    color: fieldtext;
	    letter-spacing: normal;
	    word-spacing: normal;
	    line-height: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    cursor: text;
	    background-color: field;
	    margin: 0em;
	    padding: 1px 0px;
	    border-width: 2px;
	    border-style: inset;
	    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	    border-image: initial;
	    padding-block: 1px;
	    padding-inline: 2px;
	}
	#SearchOtherLib{
		padding: 25px 0 10px;
	    border-top: 1px solid #e3e3e3;
	    border-bottom: 1px solid #e3e3e3;
	}
	#SearchOtherLib fieldset .excel{
		display: inline-block;
	    margin-top: 20px;
	    padding-left: 25px;
	    background: url("https://lib.seoul.go.kr/image/ko/solution/common/ico/excel.png") no-repeat 0 50%;
	    color: #085b2c;
	}
	#SearchOtherLib fieldset{
		border: none;
	    margin: 0;
	    padding: 0;
	    font: inherit;
	}
	#SearchOtherLib fieldset>ul{
		list-style:none;
	}
	#SearchOtherLib fieldset>ul li{
		list-style:none;
		margin-top: 10px;
	}
	#SearchOtherLib fieldset>ul li input[type="text"]{
		margin: 0;
    	padding: 0;
    	border: 1px solid #d1d0cf;
    	vertical-align: middle;
    	width: 188px;
    	height: 33px;
		padding-block: 1px;
    	padding-inline: 2px;
    	-webkit-box-shadow: none;
	    -webkit-appearance: none;
	    -webkit-border-radius: 0;
	    background:white;
	    display : unset !important;
	}
	#SearchOtherLib fieldset>ul li .SearchBtn{
		width: 89px;
	    margin-left: 5px;
	    border: 1px solid #f5c238;
	    background-color: #fece4c;
	    color: #383838 !important;
	    font-size: 14px !important;
	    height: 35px !important;
	    vertical-align: middle !important;
	    -webkit-appearance: none;
    	border-radius: 0;
    	margin: 0;
    	padding: 0;
    	white-space: pre;
	    padding-block: 1px !important;
	    padding-inline: 6px !important;
	    text-align: center !important;
	    box-sizing: border-box !important;
	    -webkit-text-size-adjust: none;
	    word-wrap: break-word !important;
	    line-height:0 !important;
	}
	#SearchOtherLib fieldset>ul li span{
		display: inline-block !important;
	    width: 64px;
	    margin-right: 15px !important;
	    color: #383838 !important;
	    font-family: NanumSquareR, sans-serif;
	    font-size: 10px;
	    text-align: right !important;
	    border: none;
	    margin: 0;
	    padding: 0;
	    font: inherit;
	}
	
</style>
</head>
<body>
	<section id="one" class="wrapper" style="padding:40px;">
		<div class="inner">
			<h4 style="color:black;font-weight: bold;">도서관 찾기</h4>
			<hr style="padding:2px;background: skyblue;">
			<div class="flex flex-3">
				<div class="col-md-5" style="border:1px solid black;">
					<form id="SearchOtherLib">
						<fieldset>
							<ul>
								<li>
									<span>도서관명</span>
									<input type="text" value="" >
									<input type="submit" value="검 색" class="SearchBtn">
								</li>
								<li>
									<span>서적명</span>
									<input type="text" value="">
									<input type="submit" value="검 색" class="SearchBtn">
								</li>
							</ul>
							<a href="#" class="excel">Excel</a>
							<span style="margin-top: 20px;padding-right: 5px;float: right;display:inline-block">총 0건</span>
						</fieldset>
					</form>
					<div style="height:650px;"></div>
				</div>
				<div class="col-md-7" style="border:1px solid black;padding:0 !important;">
					<jsp:include page="kakaomap.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</section>
</body>
</html>