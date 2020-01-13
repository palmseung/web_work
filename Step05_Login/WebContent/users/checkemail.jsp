<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	boolean isEligible=false;
	int index=0;	
	String inputEmail=request.getParameter("inputEmail");
	
	
	index=inputEmail.indexOf("@");
	
	if(index==-1){
		isEligible=false;
	}else{
		isEligible=true;
	}
	
	

%>
{"isEligible":<%=isEligible %>}