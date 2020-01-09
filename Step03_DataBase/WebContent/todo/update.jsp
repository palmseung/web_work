<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1.폼 전송되는 수정할 todo 번호와 내용을 읽어온다.
	String strNum=request.getParameter("num");
	String content=request.getParameter("content");
	int num=Integer.parseInt(strNum);
	
	//DB에 수정 반영
	ToDoDto dto=new ToDoDto();
	dto.setNum(num);
	dto.setContent(content);
	
	
	
	//update 해주기
	boolean isSuccess=ToDoDao.getInstance().update(dto);
	


	//전송된 내용을 콘솔창에 테스트로 출력해 보기
	System.out.println("content: "+content);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%if(isSuccess) {%>
	<script>
		alert("수정했습니다.");
		location.href="list.jsp";
	</script>
<%}else { %>
	<script>
		alert("수정 실패");
		<a href="updateform.jsp?num=<%=dto.getNum()%>">다시 시도하러 가기</a>
	</script>
<%} %>
</body>
</html>