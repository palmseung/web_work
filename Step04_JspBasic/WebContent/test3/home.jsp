<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/home.jsp</title>
</head>
<body>
<%
	/*
		jsp에서 기본으로 제공해주는 객체 중에서 
		HttpServletRequest, HttpSession, ServletContext type 객체가 있다.
		해당 객체의 참조값은 
		request, session, application 이라는 이름의 지역변수에 들어있다.
		때로는 어떤 data를 각각의 객체에 저장하고 읽어낼 필요가 있다.
	*/
	// .setAttribute(key, value);
	request.setAttribute("myName", "김구라");
	session.setAttribute("yourName", "해골");
	application.setAttribute("ourName", "원숭이");
	
%>
<h1>scope 테스트 home</h1>
<ul>
	<li><a href="other.jsp">다른 페이지로 이동!</a></li>
</ul>
</body>
</html>