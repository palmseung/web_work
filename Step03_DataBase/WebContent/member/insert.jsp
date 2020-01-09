<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// post 방식 전송했을 때 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1.폼전송되는 이름과 주소를 추출해서
	//2.MemberDao 객체를 이용해서 DB에 저장하고
	//3.응답한다.
	
	//폼 전송되는 파라미터 추출하기
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//dto 객체 생성해서 name과 addr 값 삽입
	MemberDto dto=new MemberDto(0, name, addr);
	//dto.setName(name);
	dto.setAddr(addr);
	
	//어레이리스트에 dto 정보 넣어주고
	List<MemberDto> list=new ArrayList<>();
	list.add(dto);
	
	//insert 해주기
	MemberDao dao=MemberDao.getInstance();
	//dao.insert()는 boolean을 return 하므로, 작업의 성공여부 알고 싶을 때는 dao.insert(dto)를 변수에 담으면 된다.
	boolean isSuccess=dao.insert(dto);
	

	//전송된 내용을 콘솔창에 테스트로 출력해 보기
	System.out.println("name: "+name);
	System.out.println("addr: "+addr);
	//응답하기	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.container{
		padding-top: 50px;
	}
</style>
</head>
<body>
<div class="container">
	<%if(isSuccess) {%>
		<p class="alert alert-success"><%=name %>
			님의 정보를 추가했습니다.
			<a class="alert-link" href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			저장 실패 했습니다.
			<a class="alert-link" href="insertform.jsp">다시 시도</a>
		</p>
		
	<%} %>
</div>

</body>
</html>