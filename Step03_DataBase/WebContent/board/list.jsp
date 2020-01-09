<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<h1>게시글 목록입니다.</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<%
			//BoardDto 객체를 이용해서 글 목록 얻어오기
			List<BoardDto> list=BoardDao.getInstance().getList();
		%>
		<tbody>
		<%for(BoardDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>	
		</tbody>
	</table>
	<a href="insertform.jsp">새글 추가하러 가기</a>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>