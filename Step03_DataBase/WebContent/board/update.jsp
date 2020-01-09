<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	//1. 폼전송되는 수정 반영할 글정보를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
			
	//2. 저장된 비밀번호를 읽어온다.
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	
	//3.저장된 비밀번호와 전송된 비밀번호가 일치하면 수정반영한다.
	boolean isSuccess=false;
	BoardDto dto=null;
	if(pwd.equals(savedPwd)){
		dto=new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		//DB에 수정 반영하기
		isSuccess=BoardDao.getInstance().update(dto);
	}
	//4. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<%if(isSuccess){ %>
		<p><%=num %> 번 글을 수정했습니다.</p>
		<a href="list.jsp">확인</a>
	<%}else{ %>
		<p>수정 실패! 비밀번호를 확인하세요.</p>
		<a href="updateform.jsp?num=<%=dto.getNum() %>">다시 시도</a>
	<%} %>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>