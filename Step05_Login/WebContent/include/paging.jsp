<%@page import="java.util.List"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	int startPageNum=Integer.parseInt(request.getParameter("startPageNum"));
	int endPageNum=Integer.parseInt(request.getParameter("endPageNum"));
	int totalPageCount=Integer.parseInt(request.getParameter("totalPageCount"));
%>

<div class="page-display">
	<ul class="pagination pagination-sm">
		<%if(startPageNum != 1){ %>
			<li>
				<a href="list.jsp?pageNum=<%=startPageNum-1 %>">&laquo;</a>
			</li>
		<%}else{ %>
			<li class="disabled">
				<a href="javascript:">&laquo;</a>
			</li>
		<%} %>
		<%for(int i=startPageNum; i<=endPageNum; i++){ %>
			<%if(i == pageNum){ %>
				<li class="active">
					<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%}else{ %>
				<li>
					<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
		<%} %>
		<%if(endPageNum < totalPageCount){ %>
			<li>
				<a href="list.jsp?pageNum=<%=endPageNum+1 %>">&raquo;</a>
			</li>
		<%}else{ %>
			<li class="disabled">
				<a href="javascript:">&raquo;</a>
			</li>
		<%} %>
	</ul>
</div>



