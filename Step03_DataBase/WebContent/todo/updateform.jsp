<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//폼 전송되는 파라미터 추출하기
	String strNum=request.getParameter("num");
	int num=Integer.parseInt(strNum);
	
	
	//dto 객체 생성
	//MemberDto dto=new MemberDto(num, name, addr);
	
	
	//getData 해주기
	ToDoDto dto=ToDoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
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
			<li class="active"><a href="${pageContext.request.contextPath }/todo/list.jsp">할 일 관리</a></li>
			<li><a href="">쇼핑</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">할 일 목록</a></li>
		<li>수정 폼</li>
	</ol>
	<h1>할 일 수정 양식(form)입니다.</h1>
	<form action="update.jsp" method="post">
	
		<div class="form-group">
			<label for="num" >번호</label>
			<input class="form-control" type="text" id="num", name="num" value="<%=num %>" readonly/>
		</div>
		
		<div class="form-group">
			<label for="content" >할 일</label>
			<input class="form-control" type="text" id="content" name="content" value="<%=dto.getContent() %>" />
		</div>
		<div class="form-group">
			<label for="regdate">등록일</label>
			<input class="form-control" type="text" id="regdate" name="regdate" value="<%=dto.getRegdate() %>" readonly/>
		</div>
		<button class="btn btn-primary" type="submit">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
</body>
</html>