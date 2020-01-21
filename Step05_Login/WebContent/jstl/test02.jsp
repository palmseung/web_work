<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	// Model (data)
	List<String> names=new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	//request 영역에 담기
	request.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test02.jsp</title>
</head>
<body>
<h3>forEach 활용</h3>
<h4>친구 목록입니다.</h4>
	<ul>
		<c:forEach var="tmp" items="${requestScope.names }" varStatus="status">
			<li>
				status.index : ${status.index }
				status.count : ${status.count }
				status.first : ${status.first }
				status.last : ${status.last }
				${tmp }
			</li>
		</c:forEach>
	</ul>
<h4>친구목록입니다.</h4>
	<ul>
		<c:forEach var="tmp" items="${requestScope.names }">
				<li>${tmp }</li>
		</c:forEach>
	</ul>
</body>
</html>