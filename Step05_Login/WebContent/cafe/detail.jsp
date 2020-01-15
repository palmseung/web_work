<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1.GET 방식 파라미터로 전달되는 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	//2.DB에서 해당 글 정보를 얻어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	
	//3.해당 글의 조회수를 1 증가 시킨다.
	CafeDao.getInstance().addViewCount(num);
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	
	//4.글 정보를 응답한다.

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<style>
	/* 글 내용을 출력할 부분 */
	.contents{
		width: 100%;
		overflow-y: auto;
		border: 1px dotted #cecece;
	}
</style>
</head>
<body>
<div class="container">
	<h1>글 상세 페이지</h1>
	<table>
		<tr>
			<th>글 번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<div class="contents"><%=dto.getContent() %></div>
	
	<a href="list.jsp">목록보기</a>
</div>
</body>
</html>





















