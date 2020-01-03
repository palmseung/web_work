<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/login.jsp</title>
</head>
<body>
<%
	//POST 방식 전송되는 파라미터 추출하기
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//아이디와 비밀번호가 유효한 정보인지 DB에서 확인해 본다(여기선 아직 DB연동 안해서 간단히 살펴봄)
	boolean isValid=false;
	if(id.equals("gura")&& pwd.equals("1234")){
		//아이디: "gura", 비밀번호 "1234"가 유효한 정보라고 가정
		isValid=true;
	}
%>
<h1>로그인을 시도한 결과 페이지입니다.</h1>
<%if(isValid){%>
	<p><strong><%=id %></strong>회원님이 로그인 되었습니다.</p>
	<a href="/Step01_Servlet/index.html">홈으로</a>
<%}else{ %>
	<p>아이디 혹은 비밀번호가 틀렸습니다.</p>
	<a href="loginform.jsp">다시 로그인 하러 가기</a>
<%} %>
</body>
</html>


