<%@page import="test.todo.dao.ToDoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1.Get 방식 파라미터로 전달되는 삭제할 todo 번호 읽어오기
	String strNum=request.getParameter("num");
	int num=Integer.parseInt(strNum);
	
	
	//dto 객체 생성
	//MemberDto dto=new MemberDto(num, name, addr);
	
	
	//2.ToDoDao 를 이용해서 DB에서 삭제 
	boolean isSuccess=ToDoDao.getInstance().delete(num);
	
	
	//3.리다일렉트 응답 (요청을 다시 하라고 클라이언트에게 경로를 알려줌)
	response.sendRedirect("list.jsp");

%>
