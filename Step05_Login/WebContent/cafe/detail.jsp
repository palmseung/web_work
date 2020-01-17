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
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 글 내용을 출력할 부분 */
	.contents, table{
		width: 100%;
		overflow-y: auto;
		border: 1px dotted #cecece;
		box-shadow: 3px 3px 5px 6px #ccc;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/list.jsp">목록</a></li>
		<li>글 상세보기</li>
	</ol>
	
	<table class="table table-bordered table-condensed">
		<colgroup>
			<col class="col-xs-4" />
			<col class="col-xs-8" />
		</colgroup>
	
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
	<%
		//세션 영역의 아이디를 읽어온다. 만일 로그인 하지 않았으면 null이다.
		String id=(String)session.getAttribute("id");
	%>
	
	<%--
		글 작성자와 로그인 된 아이디가 같을 때만 기능을 제공해 준다.
		즉, 본인이 작성한 글만 수정할 수 있도록 하기 위해 
	--%>	
	<%if(dto.getWriter().equals(id)){ //id가 null일 수도 있으므로, dto의 메소드를 이용해서 비교해야 함. id의 메소드가 아니라 %>
		<a href="private/updateform.jsp?num=<%=dto.getNum() %>">수정</a>	
		<a href="javascript:deleteConfirm()">삭제</a>
	<%} %>
	
	
</div>
<script>
	function deleteConfirm(){
		let isDelete=confirm("글을 삭제하시겠습니까?")
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum() %>";
		}
		
	}
</script>
</body>
</html>





















