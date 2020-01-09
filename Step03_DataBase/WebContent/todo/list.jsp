<%@page import="java.util.List"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@page import="test.todo.dao.ToDoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ToDoDao dao=ToDoDao.getInstance();
	//회원 목록 얻어오기
	List<ToDoDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>
			<li class="active"><a href="${pageContext.request.contextPath }/todo/list.jsp">할 일 목록(todo table)</a></li>
			<li><a href="">쇼핑</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">할 일 목록</a></li>
	</ol>
	
	<h1>할 일 목록입니다.</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>할 일</th>
				<th>등록일(최종수정일)</th>
				<th>수정 하러 가기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(ToDoDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<!-- 상대경로 보단 절대경로로 써주는 것이 좋다
	<a href="insertform.jsp">할 일 추가 하러가기</a>
	 -->
	<a href="${pageContext.request.contextPath }/todo/insertform.jsp">할 일 추가 하러가기</a>
	<script>
		function deleteConfirm(num){
			const isDelete=confirm(num+" 번 todo를 삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
	</script>
	
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>