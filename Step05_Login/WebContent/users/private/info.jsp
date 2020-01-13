<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.세션에서 로그인된 아이디 정보를 읽어온다.
	String id=(String)session.getAttribute("id");

	//2.DB에서 해당 아이디의 정보를 얻어온다. (id 를 이용해서 dto 리턴해주는 dao method 생성 필요)
	UsersDto dto=UsersDao.getInstance().getData(id);
	
	//3.개인 정보를 응답(출력)해 준다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
<div class="container">
	<h1>개인정보페이지</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp">개인정보 수정하기</a>
</div>
</body>
</html>