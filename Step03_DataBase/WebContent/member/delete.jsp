<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//폼 전송되는 파라미터 추출하기
	String strNum=request.getParameter("num");
	//String name=request.getParameter("name");
	//String addr=request.getParameter("addr");
	int num=Integer.parseInt(strNum);
	
	
	//dto 객체 생성
	//MemberDto dto=new MemberDto(num, name, addr);
	
	
	//update 해주기
	boolean isSuccess=MemberDao.getInstance().delete(num);
	


	//전송된 내용을 콘솔창에 테스트로 출력해 보기
	System.out.println("strNum: "+num);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%if(isSuccess) {%>
	<script>
	//알림창 띄우기
	alert("<%=num%> 번 회원의 정보를 삭제했습니다.");
	//javascript 에서 페이지 이동
	location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패");
		location.href="list.jsp";
	</script>
<%} %>
</body>
</html>