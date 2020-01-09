<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	body{
		padding-top: 50px;
	}
</style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>
			<li><a href="">게임</a></li>
			<li><a href="">쇼핑</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">회원 목록</a></li>
		<li>회원 추가 폼</li>
	</ol>
	<h1>회원 추가 양식(form)입니다.</h1>
	<form action="insert.jsp" method="post" >
		<div class="form-group">
			<label for="name" >이름</label>
			<input class="form-control" type="text" id="name", name="name"/>
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" id="addr" name="addr" />
		</div>
		<button class="btn btn-primary"  type="submit">추가</button>
		<button class="btn btn-warning" type="reset">취소</button>		
	</form>
</div>
<script>
	let submitBtn=document.querySelector(".btn-primary");
	let input=document.querySelector(".form-control");
	submitBtn.addEventListener("click", function(event){
		if(input.value == null || input.value=="") {
			event.preventDefault();
			alert("값을 입력해 주세요.");
			input.focus();
		}
	});
</script>
</body>
</html>