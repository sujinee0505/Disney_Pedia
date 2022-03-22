<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
.align-center{
	text-align:center;
}
.align-right{
	text-align:right;
}
.modal-login {
	width: 320px;
	margin: 50px auto;
	text-align:center;font-size:12pt;
}

.modal-title{
font-size:12pt;margin: 0 auto;
}
#login_form input[type="text"]{
	font-size:10pt;
	 background-color:#e0e0e0;
}
#login_form input[type="password"]{
	font-size:10pt;
	 background-color:#f2f2f2;
}
.sign-btn{
color:#ffffff;
}
.alter{
font-size:10pt;
}
</style>
</head>
<body>
<!-- Modal contents(1) : 일반 폼 태그 버전 -->    
<!-- Modal Header -->
<div class="modal-header">
	<h4 class="modal-title align-center">로그인</h4>
	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
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
		<div id="alter">
			계정이 없으신가요?
			<a href='${pageContext.request.contextPath}/member/registerUser.do'>회원가입</a>
		</div>		
	</form>
</div>

<!-- Modal footer -->
<div class="modal-footer">
	footer
</div>
</body>
</html>