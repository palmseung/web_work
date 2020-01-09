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
<!-- jquery + bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="category"/>
</jsp:include>
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
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">
						<!-- 스크린 리더기를 위한 기능 text 제공하기 -->
						<span class="sr-only">수정하러 가기</span>
						<span class="glyphicon glyphicon-pencil"></span>
					</a>
				</td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">
						<!-- 스크린 리더기를 위한 기능 text 제공하기 -->
						<span class="sr-only">수정하러 가기</span>
						<span class="glyphicon glyphicon-pencil"></span>
					</a>
				</td>
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