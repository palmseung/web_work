<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1.폼 전송되는 새글 정보 읽어와서
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	//2.DB에 저장하고
	BoardDto dto=new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setPwd(pwd);
	boolean isSuccess=BoardDao.getInstance().insert(dto);
	//3.응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insert.jsp</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<%if(isSuccess){ %>
	<script>
		alert("<%=writer%> 님이 작성한 글을 저장하였습니다.");
		location.href="list.jsp";
	</script>
<%}else{ %>
	alert("새글 저장에 실패했습니다.");
	<a href="insertform.jsp">다시 작성하러 가기</a>
<%} %>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>