<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1.삭제할 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	//세션의 아이디와 글 작성자를 비교해서 같을 때만 삭제한다.
	String id=(String)session.getAttribute("id");
	//글 작성자
	String writer=CafeDao.getInstance().getData(num).getWriter();
	
	//아이디와 글 작성자가 같은지 여부
	boolean isEqual=id.equals(writer);
	if(!isEqual){
		//에러를 응답하고
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 글 삭제하기 없기");
		//메소드를 종료한다.
		return;
	}
	
	//2.DB에서 삭제한다.
	boolean isSuccess=CafeDao.getInstance().delete(num);
	
	//3.응답한다.
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("<%=num %> 번 글을 삭제했습니다.");
		location.href="../list.jsp";
	</script>
<%}else{ %>
	<h1>alert</h1>
	<p class="alert alert-danger">
		글 삭제 실패
		<a class="alert=link" href="../detail.jsp?num=<%=num %>">돌아가기</a>
	</p>
	
<%} %>


</body>
</html>