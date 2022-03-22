<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
<!-- Modal contents(1) : 일반 폼 태그 버전 -->    
<!-- Modal Header -->
<div class="modal-header">
	<h4 class="modal-title">회원가입</h4>
	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>
<!-- Modal body -->
<div class="modal-body">
	<form action="${pageContext.request.contextPath}/member/registerUser.do" method="post" class="form-horizontal"
		role="form" id="register_form">
			<label class="sr-only">이름</label> 
			<input type="text" id="name"
				name="name" class="form-control" placeholder="이름" required autofocus><BR>
			
			<label class="sr-only">ID</label> 		
			<input type="text" id="id" name="id"
			class="form-control" placeholder="ID" required autofocus>
			<input type="button" id="confirmId" value="중복체크" class="btn btn-danger btn-xs"><BR>
			<!-- 중복체크 메시지 부분 -->
			<span id="message_id"></span>	
			<p>
			
			<label class="sr-only">Password</label> 
			<input type="password"
				id="passwd" name="passwd" class="form-control" placeholder="Password"
				required><br>

		<button class="btn btn-lg btn-primary btn-block" type="submit" id="signUp-btn">
			회원가입</button>
	</form>
</div>

<!-- Modal footer -->
<div class="modal-footer">
	footer
</div>
</body>
</html>