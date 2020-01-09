<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1.파라미터로 넘어오는 글번호를 얻어온다
	int num=Integer.parseInt(request.getParameter("num"));
	
	
	//2.DB에서 글번호에 해당하는 글정보를 얻어온다
	BoardDto dto=BoardDao.getInstance().getData(num);
	
	
	//3.글 자세히 보기 페이지를 응답한다.
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1></h1>
	<table class="table table-bordered">
		<tr>
			<th>글번호</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="30" rows="10" disabled><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<!-- 삭제 기능을 수행할 폼 -->
	<form action="delete.jsp" method="post">
		<input class="form-group" type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input class="form-group" type="password" name="pwd" placeholder="비밀번호..."/>
		<button class="form-group" type="submit">삭제</button>
	</form>
	<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>