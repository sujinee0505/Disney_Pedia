<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>   
<!-- Modal Header -->
<div>
	<img src="${pageContext.request.contextPath}/resources/images/logo.png" height="86px;" class="sign-logo">
	<h4 class="modal-title">회원가입</h4>
</div>
<!-- Modal body -->
<div class="modal-body">
	<form action="${pageContext.request.contextPath}/member/registerUser.do" method="post" class="form-horizontal"
		role="form" id="signUp_form">
		
			<div class="form-group">
			<input type="text" id="name" name="name" class="form-control" 
			placeholder="이름" autofocus required>
			</div><p>
			
			<div class="form-group">
			<input type="text" id="id" name="id" class="form-control" 
			placeholder="아이디"  required>
			</div><p>
			<!-- <input type="button" id="confirmId" value="중복체크" class="btn btn-danger btn-xs"><BR>
			중복체크 메시지 부분
			<span id="message_id"></span>	
			<p> -->
						
			<div class="form-group">
			<input type="password" id="passwd" name="passwd" 
			class="form-control" placeholder="비밀번호" required>
			</div><p>	
		
			<div class="form-group">
			<button class="btn btn-3 form-control sign-btn" type="submit">
			회원가입
			</button>
			</div><p>
	
			<div class="alter">
			이미 가입하셨나요? 		
			<a href="#" data-bs-toggle="modal" data-bs-target="#myModal" class="alter_text">
			회원가입</a>
			</div>	<p>		
		</form>
</div> <!-- 모달바디끝 -->
<div class="modal-footer">
	<div class="social_login align-center">
			social sign up
	</div>
</div>

</body>
</html>