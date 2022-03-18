<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Simple Modal Login Modal Form</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 'Varela Round', sans-serif;
}

.modal-login {
	width: 320px;
	margin: 30px auto;
}

.modal-login .modal-content {
	border-radius: 1px;
	border: none;
}

.modal-login .modal-header {
	position: relative;
	justify-content: center;
	background: #f2f2f2;
}

.modal-login .modal-body {
	padding: 30px;
}

.modal-login .modal-footer {
	background: #f2f2f2;
}

.modal-login h4 {
	text-align: center;
	font-size: 26px;
}

.modal-login label {
	font-weight: normal;
	font-size: 13px;
}

.modal-login .form-control, .modal-login .btn {
	min-height: 38px;
	border-radius: 2px;
}

.modal-login .hint-text {
	text-align: center;
}

.modal-login .close {
	position: absolute;
	top: 15px;
	right: 15px;
}

.modal-login .checkbox-inline {
	margin-top: 12px;
}

.modal-login input[type="checkbox"] {
	margin-top: 2px;
}

.modal-login .btn {
	min-width: 100px;
	background: #3498db;
	border: none;
	line-height: normal;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #248bd0;
}

.modal-login .hint-text a {
	color: #999;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
</head>
<body>
	<!-- 모달창 띄우는 부분 -->
	<div class="text-center">
		<a href="#myModal" class="trigger-btn" data-toggle="modal">Click
			to Login</a>
	</div>

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">

				<form:form modelAttribute="memberVO" action="login.do"
					id="login_form">
					<div class="modal-header">
						<h4 class="modal-title">로그인</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">


						<div class="form-group">
							<%-- <form:label path="id">아이디</form:label> --%>
							<form:input placeholder="아이디" path="id" type="text"
								class="form-control" required="required" />
							<form:errors path="id" cssClass="error-color" />
						</div>


						<div class="form-group">
							<%-- 		<form:label path="passwd">비밀번호</form:label> --%>
							<form:password placeholder="비밀번호" path="passwd"
								class="form-control" required="required" />
						</div>

						<div class="form-group">
							<input type="submit" class="btn btn-primary form-control"
								value="로그인">
						</div>
						<p>
						<div class="clearfix">
							계정이 없으신가요? 
							<a href='${pageContext.request.contextPath}/member/registerUser.do'>회원가입</a>
						</div>
						<p>
					</div>
					<div class="modal-footer">
						<!-- <label class="checkbox-inline pull-left">
						<input type="checkbox"> Remember me</label>  -->
						<div class="form-group social">
							<input type="button" class="btn btn-primary form-control"
								value="소셜 로그인 들어갈부분">
						</div>
					</div>


				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
<!-- 기존 로그인 코드 -->
<%-- <div class="page-main">
	<h2>회원 로그인</h2>
	<form:form modelAttribute="memberVO" action="login.do" id="login_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="id">아이디</form:label>
				<form:input path="id"/>
				<form:errors path="id" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="passwd">비밀번호</form:label>
				<form:password path="passwd"/>
				<form:errors path="passwd" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>로그인</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div> --%>
<!-- 기존 로그인 코드 끝 -->
