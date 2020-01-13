<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기*/
	.help-block, .form-control-feedback{
		display:none;
	}
	
	
</style>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>회원가입 페이지</h1>
	<form action="signup.jsp" method="post" id="signupForm">
		<!-- 초기 상태 -->
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control " type="text" id="id" name="id" />
			<p class="help-block" id="msg_unavailable">사용 불가능한 아이디입니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		
		
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd" />
			<p class="help-block" id="msg_mismatch">비밀번호가 일치하지 않습니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="text" id="email" name="email" />
			<p class="help-block" id="msg_mistype">이메일 형식이 올바르지 않습니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</div>
<script>
	//아이디 유효성 여부
	let isIdValid=false;
	
	//비밀번호 동일여부
	let isSame=false;
	
	//이메일 형식 여부
	let isEmail=false;
	
	//아이디를 입력할 때 실행할 함수 등록 (id를 입력할 때마다 ajax로 요청하겠다)
	$("#id").on("input", function(){
		//1. 입력한 아이디를 읽어온다.
		let inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부를 응답 받는다. (ajax 통신)
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.jsp",
			method: "GET",
			data: {inputId:inputId},
			success: function(responseData){
				
				//일단 초기화 시켜놓고
				$("#id")
				.parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback") //자손요소중에 클래스가 이런 걸 찾음
				.hide(); // 찾은 걸 숨겨버려라
				
				if(responseData.isExist){//아이디가 이미 존재하는 경우 (사용불가)
					//색상 빨간색으로
					$("#id").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에러메시지 보이게
					$("#msg_unavailable").show();
					isIdValid=false;
					
				}else{//아닌 경우 (사용가능)
					$("#id").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					$("#msg_notuse").hide();
					isIdValid=true;
				}
			}
		})
	});
	
	//두 번째 비밀번호 입력할 때 실행할 함수 등록 
	$("#pwd2").on("input", function(){
		//1. 입력한 비밀번호 두 개를 각각 읽어온다.
		let inputPwd=$("#pwd").val();
		let inputPwd2=$("#pwd2").val();
		
	
		//2. 서버에 보내서 일치 여부를 응답 받는다. (ajax 통신)
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkpwd.jsp",
			method: "GET",
			data: {inputPwd:inputPwd,inputPwd2:inputPwd2},
			success: function(responseData){
				
				//일단 초기화 시켜놓고
				$("#pwd")
				.parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback") //자손요소중에 클래스가 이런 걸 찾음
				.hide(); // 찾은 걸 숨겨버려라
				
				if(responseData.isSame){
					//색상 녹색으로
					$("#pwd").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					//에러 메시지 안 보이게
					$("#msg_mismatch").hide();
					isMatch=true;
					
				}else{//아닌 경우 (사용가능)
					
					
					
					$("#pwd").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에러메시지 보이게
					$("#msg_mismatch").show();
				
					isMatch=false;
					
				}
			}
		})
	});
	
	
	//이메일  입력할 때 실행할 함수 등록 
	$("#email").on("input", function(){
		//1. 입력한 이메일을 읽어온다.
		let inputEmail=$("#email").val();

		
	
		//2. 서버에 보내서 일치 여부를 응답 받는다. (ajax 통신)
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkemail.jsp",
			method: "GET",
			data: {inputEmail: inputEmail},
			success: function(responseData){
				
				//일단 초기화 시켜놓고
				$("#email")
				.parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback") //자손요소중에 클래스가 이런 걸 찾음
				.hide(); // 찾은 걸 숨겨버려라
				
				if(responseData.isEligible){
					//색상 녹색으로
					$("#email").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					//에러 메시지 안 보이게
					$("#msg_mistype").hide();
					isEmail=true;
					
				}else{//아닌 경우 (사용가능)
					$("#email").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에러메시지 보이게
					$("#msg_mistype").show();
					isEmail=false;
					
				}
			}
		})
	});
	
	
	
	
	
	//폼에 제출 이벤트가 발생했을 때 실행할 함수 등록
	$("#signupForm").on("submit", function(){
		//폼의 유효성 검증을 하고 만일 통과를 못하면 폼 제출을 막는다.
		
		
		//1.아이디 유효성 검증
		if(!isIdValid){
			alert("아이디 중복확인을 하세요");
			//잘못된 곳을 바로 입력할 수 있도록 포커스 주기
			$("#id").focus();
			return false; //폼 제출 막기
		}
		
		//2.비밀번호 유효성 검증
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		if(pwd != pwd2){
			alert("비밀번호를 확인하세요!");
			$("#pwd").focus();
			return false;
		}
		
		//3.이메일 유효성 검증
		let email=$("#email").val();
		// @ 가 포함되어 있는지 확인한다. 만일 포함되어 있지 않으면 null 이 리턴된다.
		let emailValid=email.match("@");
		if(emailValid==null){
			alert("이메일 형식에 맞게 입력하세요.");
			$("#email").focus();
			return false;
		}
		
		
	});
	
	

	
</script>
</body>
</html>