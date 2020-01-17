<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
	//1.DB 에서 파일 목록을 얻어와서 
	
	List<FileDto> list=new ArrayList<FileDto>();
	
	//2.응답

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>

</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>

<div class="container">
	<h1>파일 목록입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>다운횟수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<%for(FileDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><%=tmp.getFileSize() %></td>
				<td><%=tmp.getOrgFileName() %></td>
				<td><%=tmp.getFileSize() %></td>
				<td></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">파일 업로드</a>
	
	


</div>


</body>
</html>
















