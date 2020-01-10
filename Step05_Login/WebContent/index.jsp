<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//session 에서 "id" 라는  키값으로 저장된 문자열이 있는지 읽어와 본다.
	//있으면 로그인 된 상태, null 이면 로그인 안 된 상태
	String id=(String)session.getAttribute("id");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="contaienr">
	<%if(id==null){ %>
		<ul>
			<li><a href="users/signup_form.jsp">회원가입</a></li>
			<li><a href="users/loginform.jsp">로그인</a></li>
		</ul>
	<%}else{ %>
		<p> <strong><%=id%></strong></p> 님 로그인 중...
		<a href="users/logout.jsp">로그아웃</a>
	<%} %>
	<h1>인덱스 페이지입니다.</h1>
	<ul>
		<li><a href="shop/buy.jsp?num=1&name=coffee">1번 상품 구입하기</a></li>
		<li><a href="shop/buy.jsp?num=2&name=sugar">2번 상품 구입하기</a></li>
	</ul>
	
</div>
</body>
</html>