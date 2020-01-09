<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<!-- jquery + bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<style>
	body{
		padding-top: 50px;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="category"/>
</jsp:include>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">회원 목록</a></li>
		<li>회원 추가 폼</li>
	</ol>
	<h1>회원 추가 양식(form)입니다.</h1>
	<form action="insert.jsp" method="post" >
		<div class="form-group">
			<label for="content" >할 일 </label>
			<input class="form-control" type="text" id="content", name="content"/>
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