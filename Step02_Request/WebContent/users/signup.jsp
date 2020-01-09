<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<%
	//한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//이메일 주소
	String email=request.getParameter("email");
	//비밀번호
	String pwd=request.getParameter("pwd");
	//성별 "man" 또는 "woman"
	String gender=request.getParameter("gender");
	/*
		취미
		request.getParameterValues() 메소드는 String[] 을 리턴한다.
		리턴된 배열에는 선택한 checkbox 의 value 가 순서대로 들어 있다.
		단, 아무것도 선택하지 않았을 때의 배열의 크기는 0이다.
	*/
	String[] hobby=request.getParameterValues("hobby");
	//좋아하는 것
	String like=request.getParameter("like");
	//하고 싶은 말은 엔터를 칠 때마다 \r\n 이 포함되어 있다. ex) "하나\r\n두울"
	String comment=request.getParameter("comment");
	System.out.println("email: "+email);
	System.out.println("pwd: "+pwd);
	System.out.println("gender: "+gender);
	System.out.println("[hobby]");
	if(hobby != null){ // 아무것도 선택하지 않으면 null이므로
		//null이 아닐 때 반복문이 수행되도록 한다.
		for(String tmp:hobby){
			System.out.println(tmp);
		}
	}
	System.out.println("like: "+like);
	System.out.println("comment: "+comment);
%>
<script>
	alert("<%=email %> 님의 가입이 완료되었습니다.");
</script>
</body>
</html>