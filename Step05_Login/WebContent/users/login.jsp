
<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//목적지 정보
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/index.jsp";
	}
	//목적지 정보를 미리 인코딩 해 놓는다.
	String encondedUrl=URLEncoder.encode(url);

	//1.폼전송되는 아이디, 비밀번호 읽어와서
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	
	//2.DB에서 유효한 정보인지를 확인해서
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	
	//3.유효한 정보이면 로그인 처리를 하고, 유효한 정보가 아니면 다시 로그인을 할 수 있도록 한다.
	//로그인 처리라는 것은, session 영역에 setAttribute 해서 처리
	if(isValid){
		//로그인 되었다는 의미에서 session에 "id" 라는 키값으로 아이디를 저장한다.
		session.setAttribute("id", id);
		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<div class="container">
	<h1>Alert</h1>
	<%if(isValid){ %>
		<p>
			<strong><%=id %></strong> 회원님 로그인 되었습니다.
			<a href="<%=url %>">확인</a>
		</p>
	<%}else{ %>
		<p>
			아이디 혹은 비밀번호가 틀려요!
			<a href="loginform.jsp?url=<%=encondedUrl %>">다시 로그인하러 가기</a>
		</p>
	<%} %>
	
	
	
	</div>
</body>
</html>