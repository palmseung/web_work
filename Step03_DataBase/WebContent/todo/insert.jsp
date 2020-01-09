<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1.폼전송되는 이름과 주소를 추출해서
	//2.MemberDao 객체를 이용해서 DB에 저장하고
	//3.응답한다.
	
	//폼 전송되는 파라미터 추출하기
	String content=request.getParameter("content");

	
	//dto 객체 생성해서 content 삽입
	ToDoDto dto=new ToDoDto();
	dto.setContent(content);
	
	//어레이리스트에 dto 정보 넣어주고
	List<ToDoDto> list=new ArrayList<>();
	list.add(dto);
	
	//insert 해주기
	ToDoDao dao=ToDoDao.getInstance();
	//dao.insert()는 boolean을 return 하므로, 작업의 성공여부 알고 싶을 때는 dao.insert(dto)를 변수에 담으면 된다.
	boolean isSuccess=dao.insert(dto);
	

	//전송된 내용을 콘솔창에 테스트로 출력해 보기
	System.out.println("content: "+content);
	
	//응답하기	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.container{
		padding-top: 50px;
	}
</style>
</head>
<body>
<div class="container">
	<%if(isSuccess) {%>
		<script>
			alert("할 일을 저장했습니다.");
			location.href="${pageContext.request.contextPath }/todo/list.jsp";
		</script>
	<%}else{ %>
		<p>할 일 저장이 실패 했습니다.</p>
		<a href="insertform.jsp">다시 시도하러 가기</a>
		
	<%} %>
</div>

</body>
</html>