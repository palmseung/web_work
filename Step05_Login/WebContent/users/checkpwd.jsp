<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1.ajax 요청과 함께 inputPwd, inputPwd2 라는 파라미터명으로 전달되는 문자열 읽어오기

	String inputPwd=request.getParameter("inputPwd");
	String inputPwd2=request.getParameter("inputPwd2");
	
	boolean isSame=inputPwd.equals(inputPwd2);
	
	// 3.존재하는지 여부를 json 형식의 문자열로 응답한다.
%>

{"isSame": <%=isSame %>}