<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datail.jsp</title>
<link rel='stylesheet' href='/Step01_Servlet/Resources/css/bootstrap.css'/>
</head>
<body>
<%
	
	String strNum=request.getParameter("num");
	int num=Integer.parseInt(strNum);
	
%>
<div class="container">
	<p><%=num %> 번 페이지입니다.</p>
	<a class="btn btn-primary" href="/Step02_Request/index.jsp">인덱스로 가기</a>
</div>
</body>
</html>