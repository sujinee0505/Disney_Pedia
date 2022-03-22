<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
<!-- Modal contents(1) : 일반 폼 태그 버전 -->    
<!-- Modal Header --><!--  class="modal-header" -->
<div>
	<img src="${pageContext.request.contextPath}/resources/images/logo.png" height="86px;" class="sign-logo">
	<h4 class="modal-title">로그인</h4>
</div>
<!-- Modal body -->
<div class="modal-body">
	<form action="${pageContext.request.contextPath}/member/login.do" method="post" class="form-horizontal"
		role="form" id="login_form">

		<!-- <label class="sr-only">아이디</label> -->
		<div class="form-group">
			<input type="text" id="id" name="id"
				class="form-control" placeholder="아이디" autofocus required>
		</div><p>
		<!-- <label class="sr-only">Password</label>  -->
		<div class="form-group">
			<input type="password" id="passwd" name="passwd" 
			class="form-control" placeholder="비밀번호" required>
		</div><p>	
		<div class="form-group">
			<button class="btn btn-info form-control sign-btn" type="submit"> <!--  btn-lg btn-primary btn-block  -->
			로그인
			</button>
		</div><p>
		<div class="alter">
			계정이 없으신가요?			
			<a href="#" data-bs-toggle="modal" data-bs-target="#myModal2" class="alter_text">
			회원가입</a>
		</div>	<p>
		<!-- <div class="form-group"> -->		
	</form>
</div> <!-- 모달바디끝 -->
<div class="modal-footer">
	<div class="social_login align-center">
			social login
	</div>
</div>

</body>
</html>