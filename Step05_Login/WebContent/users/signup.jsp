<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.폼 전송되는 회원 가입 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	//2.DB에 저장하고
	UsersDto dto=new UsersDto(id, pwd, email, null);
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	
	
	//3.응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=id %></strong> 회원님 가입되었습니다.
			<a href="loginform.jsp">로그인 하러 가기</a>
		</p>
	<%}else{ %>
		<p>
			회원가입실패!
			<a href="signup_form.jsp">다시 가입하러 가기</a>
		</p>
	<%} %>
</div>
</body>
</html>